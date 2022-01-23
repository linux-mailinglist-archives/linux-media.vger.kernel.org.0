Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A3C4970CF
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 10:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbiAWJub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 04:50:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33348 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbiAWJua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 04:50:30 -0500
Received: from [IPv6:2a00:c281:1137:e00:a5d3:cad8:aea5:8082] (unknown [IPv6:2a00:c281:1137:e00:a5d3:cad8:aea5:8082])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D5A8C1F40AC5;
        Sun, 23 Jan 2022 09:50:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1642931429;
        bh=+eQA0k87rkrro6eXxggh6SN73i8YssjGx7BFERBAy3Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jeaTKRdqmGRpw6CMPpecqzrEqUJGMb3CC0Y5XwIOgNEGSA+oGJnSaZYApygx4ix6d
         B/qKzGRtVTBuErJkqgVjM3fEKxH4A8rof83BzTHPQyi4iyXDDnQo0jkaLrgYhaD26I
         C5IeZW7SRnPJPb4Tlce5FdJo5eBvQxhgIEGwq6zD+ddpPgJ42gtZu2Vaxstzmv4tWm
         ptwQOx1vVbOe4kBTvw3VkTaSjgtKbw6xSFmVKDswN4in7UIpdqIPj13zuFt24n+IVa
         7A+DA2iKeZ4zRN2ALqlXlelBg4DcfX/jQwPe65tfqohlnWyz3nVJQ/MpVaiv9uXF3y
         JzJMx2SIaSj1w==
Subject: Re: [PATCH v2] media: rkisp1: fix grey format iommu page faults
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     nicolas.dufresne@collabora.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20211207115923.13639-1-dafna.hirschfeld@collabora.com>
 <164241927947.10801.12217816997308426483@Monstersaurus>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <1f8350f4-a2dc-5405-b48b-e657124f119d@collabora.com>
Date:   Sun, 23 Jan 2022 11:50:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164241927947.10801.12217816997308426483@Monstersaurus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 17.01.22 13:34, Kieran Bingham wrote:
> Hi Dafna,
> 
> Quoting Dafna Hirschfeld (2021-12-07 11:59:23)
>> Currently capturing grey format produces page faults
>> on both selfpath and mainpath. To support greyscale
>> we can capture YUV422 planar format and configure the U, V
>> buffers to the dummy buffer.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>> This is v2 of the patch "media: rkisp1: remove support for V4L2_PIX_FMT_GREY"
>> In v1 I removed the grey format. In this version it is 'fixed'
>>
>>   .../platform/rockchip/rkisp1/rkisp1-capture.c | 28 ++++++++++++++-----
>>   1 file changed, 21 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> index 768987d5f2dd..8e982dd0c740 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> @@ -249,7 +249,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>                  .fourcc = V4L2_PIX_FMT_GREY,
>>                  .uv_swap = 0,
>>                  .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>> -               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
>> +               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>                  .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>          },
>>          /* rgb */
>> @@ -631,12 +631,26 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>>                  rkisp1_write(cap->rkisp1,
>>                               buff_addr[RKISP1_PLANE_Y],
>>                               cap->config->mi.y_base_ad_init);
>> -               rkisp1_write(cap->rkisp1,
>> -                            buff_addr[RKISP1_PLANE_CB],
>> -                            cap->config->mi.cb_base_ad_init);
>> -               rkisp1_write(cap->rkisp1,
>> -                            buff_addr[RKISP1_PLANE_CR],
>> -                            cap->config->mi.cr_base_ad_init);
>> +               /*
>> +                * In order to support grey format we capture
>> +                * YUV422 planar format from the camera and
>> +                * set the U and V planes to the dummy buffer
>> +                */
>> +               if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
>> +                       rkisp1_write(cap->rkisp1,
>> +                                    cap->buf.dummy.dma_addr,
>> +                                    cap->config->mi.cb_base_ad_init);
>> +                       rkisp1_write(cap->rkisp1,
>> +                                    cap->buf.dummy.dma_addr,
>> +                                    cap->config->mi.cr_base_ad_init);
>> +               } else {
>> +                       rkisp1_write(cap->rkisp1,
>> +                                    buff_addr[RKISP1_PLANE_CB],
>> +                                    cap->config->mi.cb_base_ad_init);
>> +                       rkisp1_write(cap->rkisp1,
>> +                                    buff_addr[RKISP1_PLANE_CR],
>> +                                    cap->config->mi.cr_base_ad_init);
>> +               }
>>          } else {
> 
> Looking at this function, I think I would have initialised a local array
> of addresses (either to zero, or to the dummy address?) to then set
> values when appropriate, and reduce the number of calls to
> rkisp1_write() to a single set of three after the processing.
> 
> It might make the function simpler, and more readable, but it's more
> effort, and this does look like it will solve the greyscale format issue
> as discussed in earlier threads so I'd leave it up to you if you want to
> refactor.

Hi,
Yes, I'll do that.
Interestingly I found out that the patch causing the iommu page fault is

https://www.spinics.net/lists/linux-media/msg176089.html

Before that patch there are no iommu page faults but the video is corrupted.

I can't explain how I didn't find it before, I clearly remember testing the grey format.

Thanks,
Dafna




> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> 
>>                  /*
>>                   * Use the dummy space allocated by dma_alloc_coherent to
>> -- 
>> 2.17.1
>>
