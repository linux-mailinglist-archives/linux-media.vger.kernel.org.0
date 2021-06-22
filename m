Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E09C3B0441
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 14:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbhFVMZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 08:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbhFVMZm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 08:25:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386B6C061574;
        Tue, 22 Jun 2021 05:23:27 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:92ca:2af7:fb1:928] (unknown [IPv6:2a01:e0a:4cb:a870:92ca:2af7:fb1:928])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 63C7F1F4109B;
        Tue, 22 Jun 2021 13:23:18 +0100 (BST)
Subject: Re: [PATCH v3 1/8] media: hantro: Trace hevc hw cycles performance
 register
To:     Ezequiel Garcia <ezequiel@collabora.com>, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
 <20210618131526.566762-2-benjamin.gaignard@collabora.com>
 <418311dac48d3a29b4fe9e363f7d4e82c360f586.camel@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <41682f40-3b5e-e21c-d75e-f57f8f3310da@collabora.com>
Date:   Tue, 22 Jun 2021 14:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <418311dac48d3a29b4fe9e363f7d4e82c360f586.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 18/06/2021 à 20:58, Ezequiel Garcia a écrit :
> Hi Benjamin,
>
> On Fri, 2021-06-18 at 15:15 +0200, Benjamin Gaignard wrote:
>> After each hevc decoded frame trace the hardware performance.
>> It provides the number of hw cycles spend per decoded macroblock.
>>
> Please add some documentation about how these are supposed
> to be used. It will be easier to discuss after seeing
> things in actiion.
>
> A good place for the documentation would be:
>
> https://www.kernel.org/doc/html/latest/admin-guide/media/v4l-drivers.html

Ok that will be in v4

>
> [..]
>> @@ -22,6 +23,21 @@ static inline void hantro_write_addr(struct hantro_dev *vpu,
>>          vdpu_write(vpu, addr & 0xffffffff, offset);
>>   }
>>   
>> +void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx)
> I'm worried about the runtime cost this would have.
>
> I see other drivers (i915, panfrost) seem to have an ioctl
> to enable the perf counters.
>
> Perhaps we don't need an ioctl, but a module param would be enough
> for now.

You can be reassured the overhead of traces points is very low has explained
in this article: https://lwn.net/Articles/330402/

>
>> +{
>> +       const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
>> +       const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
>> +       struct hantro_dev *vpu = ctx->dev;
>> +       u32 hw_cycles = 0;
>> +       u32 mbs = (sps->pic_width_in_luma_samples *
>> +                  sps->pic_height_in_luma_samples) >> 8;
>> +
>> +       if (mbs)
>> +               hw_cycles = vdpu_read(vpu, G2_HW_PERFORMANCE) / mbs;
>> +
>> +       trace_hantro_hevc_perf(ctx, hw_cycles);
>> +}
>> +
>>
> [..]
>> +
>> +TRACE_EVENT(hantro_hevc_perf,
>> +       TP_PROTO(struct hantro_ctx *ctx, u32 hw_cycles),
>> +
>> +       TP_ARGS(ctx, hw_cycles),
>> +
>> +       TP_STRUCT__entry(
>> +               __field(int, minor)
>> +               __field(u32, hw_cycles)
>> +       ),
>> +
>> +       TP_fast_assign(
>> +               __entry->minor = ctx->fh.vdev->minor;
> Tracking performance per minor doesn't seem useful,
> we'd like to track per-fd (i.e. per context).

This part of the driver doesn't know for which fd the decoding job is done
so impossible to add it there.

Regards,
Benjamin

>
> Thanks,
> Ezequiel
>
