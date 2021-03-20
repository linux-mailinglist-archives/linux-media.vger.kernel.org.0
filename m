Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9407342CB2
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 13:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhCTML6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 08:11:58 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:54427 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229506AbhCTML2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 08:11:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NaRvlS5W4GEYcNaRylTQuT; Sat, 20 Mar 2021 13:11:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616242287; bh=tVE4x7279dulrhPJlk2nIQ2U9IDNNoihp+Za84buqWM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=q2TIwjTKXaWIMETWCKQKh8tjGmdgPdigQwcqbbYrJC9BsDjXWeK+ZKFDkttQBSQBc
         NpgSGeXvnKqP5jXHo/9Tu2QfkwTLhGD1sHyYcK+c4rXbXj7Ln2V2MybRJpqJ7bkhw0
         G48HihQHuJQAZl6F/9arzuEGIrl03dDvpPxTFyumiG6nzUe1Q/wqhgZXfUX8hGcMGJ
         w2qvi6lX9LkqLGtzyZv0RxGEVNZ4iPYIItUhBXTlL377nfyc5N1Jv8+5r7qCE6kVbV
         e29fomuTLI58siPaJWxgZsXklRxA3I6nJCUcZ9VvlSXJTt9Dv8NBR32K5LQSECE4Vz
         MrH6PJyper73g==
Subject: Re: [PATCH] v4l2-ctrls: Fix h264 hierarchical coding type menu ctrl
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210302224206.3680649-1-stanimir.varbanov@linaro.org>
 <c8d448f1-bbe2-eb21-987a-877251d7aead@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b2e3999a-0854-50e7-b3c6-a2048666ff08@xs4all.nl>
Date:   Sat, 20 Mar 2021 13:11:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c8d448f1-bbe2-eb21-987a-877251d7aead@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPeJJHPGPPuUFlDOD9F+6eYtBXoZSZtc/69Xlcr1sCxYgikikxS8HUH03yFl8nRIN2mWJuWdhTrHZNc2WqkG17E9V+6BRvgseJeuTCgVZ+iNarjDAALD
 haxidnokkQG1lVMhEgK1wf7fRaQJL26hj2mh0SDErvxyqN2OFenxE8nK5iciHFg9vnfbnvRTgqWGXB2pk6taKq+jF8BadK+rugvoCnd/bFg5+zeiWDlUauRW
 zJWGIunV0/O3fpyhINC4m+XoqTSvxPoomYe0gCAKMsx6hVA4/4SibpHXXbnpULVOJb9XP0SNpmkGoke3DTUPtmD1uyqjzFGN1XsvI5rs8iKw8Hp0YNwi+I6O
 8LFWAEsZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/03/2021 12:53, Stanimir Varbanov wrote:
> Kindly ping for review.

Weird, it was marked as 'Under Review' in patchwork, but it wasn't delegated
to anyone.

I've changed it to 'New' and delegated it to myself.

It looks good and I'll pick it up next time I collect 'various fixes' in a PR.
Probably next week.

Regards,

	Hans

> 
> On 3/3/21 12:42 AM, Stanimir Varbanov wrote:
>> Add a name of the menu and fill control type.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 016cf6204cbb..5d99e2294335 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -421,6 +421,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		"Annex B Start Code",
>>  		NULL,
>>  	};
>> +	static const char * const h264_hierarchical_coding_type[] = {
>> +		"Hier Coding B",
>> +		"Hier Coding P",
>> +		NULL,
>> +	};
>>  	static const char * const mpeg_mpeg2_level[] = {
>>  		"Low",
>>  		"Main",
>> @@ -697,6 +702,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		return h264_decode_mode;
>>  	case V4L2_CID_STATELESS_H264_START_CODE:
>>  		return h264_start_code;
>> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
>> +		return h264_hierarchical_coding_type;
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>>  		return mpeg_mpeg2_level;
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>> @@ -1326,6 +1333,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
>>  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
>>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
>> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>>  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
>>
> 

