Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C6B1F58C3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 18:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgFJQLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 12:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJQLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 12:11:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15112C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 09:11:12 -0700 (PDT)
Received: from [IPv6:2003:cb:871f:5b00:9cc4:c525:7ca2:283] (p200300cb871f5b009cc4c5257ca20283.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:9cc4:c525:7ca2:283])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1FE762A07BF;
        Wed, 10 Jun 2020 17:11:09 +0100 (BST)
Subject: Re: [PATCH v2 1/4] media: staging: rkisp1: cap: change RGB24 format
 to XBGR32
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-2-dafna.hirschfeld@collabora.com>
 <CAHD77H=LhYV31Jw_-cTvXPh0K2ocr6o97ymJ2KkmCdkH_DE7gg@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <b70dfcd2-6623-d1c9-78eb-d22b38434c73@collabora.com>
Date:   Wed, 10 Jun 2020 18:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHD77H=LhYV31Jw_-cTvXPh0K2ocr6o97ymJ2KkmCdkH_DE7gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 27.05.20 01:04, Tomasz Figa wrote:
> Hi Dafna,
> 
> On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> According to the TRM, the YUV->RGB conversion outputs
>> "24 bit word". What it means is that 4 bytes are used with
>> 24bit for the RGB and the last byte is ignored.
> 
> I don't see this mentioned in the datasheets I have. On the other
> hand, XBGR32 indeed makes much more sense, as the 3-byte RGB isn't a
> very popular format. Have you validated that the hardware behavior
> indeed matches that?

Hi, yes I validated it, I also found it mentioned here:

http://rockchip.fr/RK3288%20TRM/rk3288-chapter-31-image-signal-processing-(isp).pdf

under section "31.3.9 YCbCr to RGB Conversion"

Thanks,
Dafna
> 
> Best regards,
> Tomasz
> 
>> This matches format V4L2_PIX_FMT_XBGR32.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index f69235f82c45..61b9ebe577b2 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -276,7 +276,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>          },
>>          /* rgb */
>>          {
>> -               .fourcc = V4L2_PIX_FMT_RGB24,
>> +               .fourcc = V4L2_PIX_FMT_XBGR32,
>>                  .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>>                  .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
>>          }, {
>> --
>> 2.17.1
>>
