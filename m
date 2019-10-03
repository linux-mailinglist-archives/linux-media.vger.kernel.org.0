Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB48CA0D8
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 17:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfJCPCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 11:02:23 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49199 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725874AbfJCPCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 11:02:23 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id G2cTi3U1Eop0AG2cWi8jqb; Thu, 03 Oct 2019 17:02:21 +0200
Subject: Re: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Johan Korsnes <jkorsnes@cisco.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20191003071549.31272-1-jkorsnes@cisco.com>
 <20191003134417.GF1208@intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <52313559-8b8f-1f4d-a341-a2f1ff10bc0f@xs4all.nl>
Date:   Thu, 3 Oct 2019 17:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003134417.GF1208@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfD8+jPTyj6pY1Rh0zJlS6TiPAOwM/O2lNxzABDT/71Zq+Ewyc7XarVFgKo9lfw3LNkCGxe15VZtNxD6BnSOf+nqpCIWg6U9qKoD154km1f8zAcSJHpYv
 2mpE31GXMulfahAeh1iSwiWxWM4rDj2Pf3Ji2YpfaF49nbtq+R9dWzhSvKB/9kEwttmgjmoeFIsdImiocTaZJPwZFr6stQkEYsQ6h46MWsINNXnhlClMZr+K
 HasxgFj9fcwPZRkTslV8QkYPxsAIt8OHe0biMZZvIB+/1LNvjXygUlDN4YszJiEHi/sRlKHusicAXs2ZoYKqJQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/3/19 3:44 PM, Ville Syrjälä wrote:
> On Thu, Oct 03, 2019 at 09:15:49AM +0200, Johan Korsnes wrote:
>> When logging the AVI InfoFrame, clearly indicate whether or not the
>> extended colorimetry attribute is active. This is only the case when
>> the AVI InfoFrame colorimetry attribute is set to extended. [0]
>>
>> [0] CTA-861-G section 6.4 page 57
>>
>> Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
>> ---
>>  drivers/video/hdmi.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
>> index f29db728ff29..a709e38a53ca 100644
>> --- a/drivers/video/hdmi.c
>> +++ b/drivers/video/hdmi.c
>> @@ -682,8 +682,14 @@ static void hdmi_avi_infoframe_log(const char *level,
>>  	hdmi_log("    active aspect: %s\n",
>>  			hdmi_active_aspect_get_name(frame->active_aspect));
>>  	hdmi_log("    itc: %s\n", frame->itc ? "IT Content" : "No Data");
>> -	hdmi_log("    extended colorimetry: %s\n",
>> +
>> +	if (frame->colorimetry == HDMI_COLORIMETRY_EXTENDED)
>> +		hdmi_log("    extended colorimetry: %s\n",
>>  			hdmi_extended_colorimetry_get_name(frame->extended_colorimetry));
>> +	else
>> +		hdmi_log("    extended colorimetry: N/A (0x%x)\n",
>> +			frame->extended_colorimetry);
> 
> Yeah, seems fine. Might make the logs a bit less confusing at least.
> 
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> PS. would be nice it someone were to extend this code to deal with the
> ACE bits too. Do you have plans/interest in doing that?

If we tackle this, then it would be part of a larger effort in updating
this code. There are more fields missing in other InfoFrames as well.

So yes, we have interest in this, but no, there are no plans :-)

Regards,

	Hans

> 
>> +
>>  	hdmi_log("    quantization range: %s\n",
>>  			hdmi_quantization_range_get_name(frame->quantization_range));
>>  	hdmi_log("    nups: %s\n", hdmi_nups_get_name(frame->nups));
>> -- 
>> 2.20.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

