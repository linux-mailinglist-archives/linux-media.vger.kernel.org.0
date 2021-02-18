Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E84A31ECA7
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbhBRQ5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:57:47 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40248 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhBROws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 09:52:48 -0500
Received: from [IPv6:2a01:e0a:4cb:a870:851a:1dfb:a143:80e] (unknown [IPv6:2a01:e0a:4cb:a870:851a:1dfb:a143:80e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 786EB1F45CD3;
        Thu, 18 Feb 2021 14:52:00 +0000 (GMT)
Subject: Re: [PATCH v1 11/18] media: hantro: Add helper function for auxiliary
 buffers allocation
To:     Ezequiel Garcia <ezequiel@collabora.com>, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <20210217080306.157876-12-benjamin.gaignard@collabora.com>
 <c10b0612d6d624c37750b16d611e3554dc41f151.camel@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <9646b54e-786f-1f0b-9110-8e7b9b6cab93@collabora.com>
Date:   Thu, 18 Feb 2021 15:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c10b0612d6d624c37750b16d611e3554dc41f151.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 17/02/2021 à 21:42, Ezequiel Garcia a écrit :
> Hi Benjamin,
>
> On Wed, 2021-02-17 at 09:02 +0100, Benjamin Gaignard wrote:
>> Add helper functions to allocate and free auxiliary buffers.
>> These buffers aren't for frames but are needed by the hardware
>> to store scaling matrix, tiles size, border filters etc...
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
>> ---
>>   drivers/staging/media/hantro/hantro.h | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
>> index a9b80b2c9124..7f842edbc341 100644
>> --- a/drivers/staging/media/hantro/hantro.h
>> +++ b/drivers/staging/media/hantro/hantro.h
>> @@ -446,6 +446,30 @@ hantro_get_dec_buf(struct hantro_ctx *ctx, struct vb2_buffer *vb)
>>          return vb2_plane_vaddr(vb, 0);
>>   }
>>   
>> +static inline int
>> +hantro_aux_buf_alloc(struct hantro_dev *vpu,
>> +                    struct hantro_aux_buf *buf, size_t size)
>> +{
> Can you add convert the dma_alloc_ calls in the driver,
> and squash it in this patch?
>
> I.e. hantro_h264_dec_init, hantro_vp8_dec_init, etc.

Sure I will that in v2.
Benjamin

>
> Thanks!
> Ezequiel
>
>> +       buf->cpu = dma_alloc_coherent(vpu->dev, size, &buf->dma, GFP_KERNEL);
>> +       if (!buf->cpu)
>> +               return -ENOMEM;
>> +
>> +       buf->size = size;
>> +       return 0;
>> +}
>> +
>> +static inline void
>> +hantro_aux_buf_free(struct hantro_dev *vpu,
>> +                   struct hantro_aux_buf *buf)
>> +{
>> +       if (buf->cpu)
>> +               dma_free_coherent(vpu->dev, buf->size, buf->cpu, buf->dma);
>> +
>> +       buf->cpu = NULL;
>> +       buf->dma = 0;
>> +       buf->size = 0;
>> +}
>> +
>>   void hantro_postproc_disable(struct hantro_ctx *ctx);
>>   void hantro_postproc_enable(struct hantro_ctx *ctx);
>>   void hantro_postproc_free(struct hantro_ctx *ctx);
>
>
