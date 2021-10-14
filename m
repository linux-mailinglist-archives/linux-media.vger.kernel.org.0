Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E63B42D30F
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 08:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhJNG7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 02:59:39 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:55127 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229834AbhJNG7i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 02:59:38 -0400
Received: from [192.168.0.2] (ip5f5ae921.dynamic.kabel-deutschland.de [95.90.233.33])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 782BA61E64760;
        Thu, 14 Oct 2021 08:57:33 +0200 (CEST)
Subject: Re: [PATCH 6/6] media: aspeed: richer debugfs
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Jammy Huang <jammy_huang@aspeedtech.com>
Cc:     linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
        openbmc@lists.ozlabs.org, eajames@linux.ibm.com,
        linux-kernel@vger.kernel.org, mchehab@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
 <20211014034819.2283-7-jammy_huang@aspeedtech.com>
 <f7d3900f-9e1c-1c2b-f14a-a3828852eadc@molgen.mpg.de>
Message-ID: <53fa3d1a-d75b-2fb1-a315-c6406f33289c@molgen.mpg.de>
Date:   Thu, 14 Oct 2021 08:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f7d3900f-9e1c-1c2b-f14a-a3828852eadc@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Jammy,


Am 14.10.21 um 08:54 schrieb Paul Menzel:

> Am 14.10.21 um 05:48 schrieb Jammy Huang:

> media: aspeed: richer debugfs

It’d be great if you used a statement by adding a verb in imperative 
mood [1]. Maybe:

> Extend debug message

or

> Add more debug log messages

>> updated as below:
>>
>> Caputre:
> 
> Capture
> 
>>    Mode                : Direct fetch
>>    VGA bpp mode        : 32
>>    Signal              : Unlock
>>    Width               : 1920
>>    Height              : 1080
>>    FRC                 : 30
>>
>> Compression:
>>    Format              : JPEG
>>    Subsampling         : 444
>>    Quality             : 0
>>    HQ Mode             : N/A
>>    HQ Quality          : 0
>>    Mode                : N/A
>>
>> Performance:
>>    Frame#              : 0
>>    Frame Duration(ms)  :
>>      Now               : 0
>>      Min               : 0
>>      Max               : 0
>>    FPS                 : 0
> 
> Do you have output with non-zero values? ;-)
> 
> On what device did you test this?
> 
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 41 +++++++++++++++++++++++++--
>>   1 file changed, 38 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c 
>> b/drivers/media/platform/aspeed-video.c
>> index e1031fd09ac6..f2e5c49ee906 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -464,6 +464,9 @@ static const struct v4l2_dv_timings_cap 
>> aspeed_video_timings_cap = {
>>       },
>>   };
>> +static const char * const compress_mode_str[] = {"DCT Only",
>> +    "DCT VQ mix 2-color", "DCT VQ mix 4-color"};
>> +
>>   static unsigned int debug;
>>   static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
>> @@ -1077,8 +1080,6 @@ static void aspeed_video_set_resolution(struct 
>> aspeed_video *video)
>>   static void aspeed_video_update_regs(struct aspeed_video *video)
>>   {
>> -    static const char * const compress_mode_str[] = {"DCT Only",
>> -        "DCT VQ mix 2-color", "DCT VQ mix 4-color"};
>>       u32 comp_ctrl =    FIELD_PREP(VE_COMP_CTRL_DCT_LUM, 
>> video->jpeg_quality) |
>>           FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
>>           FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
>> @@ -1795,9 +1796,29 @@ static const struct vb2_ops 
>> aspeed_video_vb2_ops = {
>>   static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
>>   {
>>       struct aspeed_video *v = s->private;
>> +    u32 val08;
> 
> Why does `08` refer to?
> 
>>       seq_puts(s, "\n");
>> +    val08 = aspeed_video_read(v, VE_CTRL);
>> +    seq_puts(s, "Caputre:\n");
>> +    if (FIELD_GET(VE_CTRL_DIRECT_FETCH, val08)) {
>> +        seq_printf(s, "  %-20s:\tDirect fetch\n", "Mode");
>> +        seq_printf(s, "  %-20s:\t%s\n", "VGA bpp mode",
>> +               FIELD_GET(VE_CTRL_INT_DE, val08) ? "16" : "32");
>> +    } else {
>> +        seq_printf(s, "  %-20s:\tSync\n", "Mode");
>> +        seq_printf(s, "  %-20s:\t%s\n", "Video source",
>> +               FIELD_GET(VE_CTRL_SOURCE, val08) ?
>> +               "external" : "internal");
>> +        seq_printf(s, "  %-20s:\t%s\n", "DE source",
>> +               FIELD_GET(VE_CTRL_INT_DE, val08) ?
>> +               "internal" : "external");
>> +        seq_printf(s, "  %-20s:\t%s\n", "Cursor overlay",
>> +               FIELD_GET(VE_CTRL_AUTO_OR_CURSOR, val08) ?
>> +               "Without" : "With");
>> +    }
>> +
>>       seq_printf(s, "  %-20s:\t%s\n", "Signal",
>>              v->v4l2_input_status ? "Unlock" : "Lock");
>>       seq_printf(s, "  %-20s:\t%d\n", "Width", v->pix_fmt.width);
>> @@ -1806,6 +1827,21 @@ static int aspeed_video_debugfs_show(struct 
>> seq_file *s, void *data)
>>       seq_puts(s, "\n");
>> +    seq_puts(s, "Compression:\n");
>> +    seq_printf(s, "  %-20s:\t%s\n", "Format",
>> +           v->partial_jpeg ? "Aspeed" : "JPEG");
>> +    seq_printf(s, "  %-20s:\t%s\n", "Subsampling",
>> +           v->yuv420 ? "420" : "444");
>> +    seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
>> +    seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
>> +           v->partial_jpeg ? (v->hq_mode ? "on" : "off") : "N/A");
>> +    seq_printf(s, "  %-20s:\t%d\n", "HQ Quality", v->jpeg_hq_quality);
>> +    seq_printf(s, "  %-20s:\t%s\n", "Mode",
>> +           v->partial_jpeg ? compress_mode_str[v->compression_mode]
>> +                   : "N/A");
>> +
>> +    seq_puts(s, "\n");
>> +
>>       seq_puts(s, "Performance:\n");
>>       seq_printf(s, "  %-20s:\t%d\n", "Frame#", v->sequence);
>>       seq_printf(s, "  %-20s:\n", "Frame Duration(ms)");
> 
> Remove the colon, and add a space before (?
> 
>> @@ -1814,7 +1850,6 @@ static int aspeed_video_debugfs_show(struct 
>> seq_file *s, void *data)
>>       seq_printf(s, "    %-18s:\t%d\n", "Max", v->perf.duration_max);
>>       seq_printf(s, "  %-20s:\t%d\n", "FPS", 
>> 1000/(v->perf.totaltime/v->sequence));
>> -
>>       return 0;
>>   }


Kind regards,

Paul


[1]: https://chris.beams.io/posts/git-commit/
