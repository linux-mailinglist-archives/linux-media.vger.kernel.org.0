Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C37E2935AD
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 09:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404962AbgJTHXi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 03:23:38 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59511 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731209AbgJTHXi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 03:23:38 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id UlzYkj2Z9ghRkUlzcktHT7; Tue, 20 Oct 2020 09:23:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603178616; bh=CXMdVXVJM7gru4N4v4dn2yLK49cNnh6qbNS6C5QCSM8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MM1PMt3l71n12pJ1g+kHIXyj47taY0N3ABE4yoceuN6UWh4zMo9ONfnn4HQIk7KfY
         dRLDRmheqyF9kc4/OxcH5h/Q+KyO+9U7jb1Q1vuYgVPlge5zy3wKWrX5D3U33E8lRR
         y+GWYBGjmhFCP5uRRAOxPYveop3qcsWZsLuICTYfOZ7gph2Q2DWfHsv0Kacn+g/JBV
         7TuAbC3Jffr9hsDgQIZ57wzkirh17/+s1H3ScYf1giTJoTeVn2F5MAqGe/PRnAKXpr
         8qwKYy6l/qEl0/Zx8KBvSkOhzADQY25wKGfangpT2BRRCsDWKWgaCbwR0pVj6WEBHo
         1et/MeNhNxmUQ==
Subject: Re: [PATCH] v4l2-compliance: skip dimentions tests for media bus
 format MEDIA_BUS_FMT_METADATA_FIXED
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200922171933.3830-1-dafna.hirschfeld@collabora.com>
 <ee3c92ea-8f1f-477e-4f16-d8a6b8c5918f@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3b6ce2b2-5ce7-5184-25ae-0583026c214e@xs4all.nl>
Date:   Tue, 20 Oct 2020 09:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ee3c92ea-8f1f-477e-4f16-d8a6b8c5918f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfK5aoagLPuAhEIHj9XcS5zzXK2LiHvDj2rSItGtlQODj6dzLypLiyZHuLi6tzgLU6Hnph6y4Aehqgmb0PdCh0uDJyJPZfzIipvjdaDiOWf0qfvIzWYzB
 0cmKZUWOBCkjOQ2av5nz30PTcMeyDVTPeK7Jxnq0oFZPet4Cl+XBHwR8Jv961BwiMGJtlXjvUJP2/LdGo9nwSO0PY6jI+/3S6bXYtLk3PAZxvLJkzrE16j46
 3AbxMLfajfr79sqvh++rhQNHpX4YGRVjPE7JNzb10rnsGqHJOJlxVceclUlxJy1n8vtoQ0qWq/wF8u3EUDo2I8PrSOQ4usG+6W9ukq7QGJY3myPsowu6bA89
 9U+y0FNg7A3JPDrDlmQjEFG78nGwLgcZYT461Xt0726fVYo2jZqs97CE3zGs9nfAsrZASFAis9Qg22VnM17SMTiSjVwg9dKp7rh3XwCruS21DZWPyL4KkbrN
 sHqdMzmieUigxrtrxChyDpBXr0maytPYPzXxLdIpDFPSHR+yvM3ybSKyCQvp/bqV3X1+hBYp6g8ZDaz/+1pZf8YS59mEZpEOg7kN1Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/10/2020 22:41, Helen Koike wrote:
> 
> 
> On 9/22/20 2:19 PM, Dafna Hirschfeld wrote:
>> The media bus format code MEDIA_BUS_FMT_METADATA_FIXED
>> is used for metadata formats that are not configurable
>> from userspace and therefore may have any value for
>> width and height. So skip width and height tests for
>> this format.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> lgtm
> 
> Reviewed-by: Helen Koike <helen.koike@collabora.com>
> 
> Thanks
> Helen
> 
>> ---
>> note, this patch should be applied after updating the header
>> include/linux/media-bus-format.h to include that new format.
>> ---
>>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>> index ec3ef169..f60853e3 100644
>> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
>> @@ -300,8 +300,10 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
>>  static int checkMBusFrameFmt(struct node *node, struct v4l2_mbus_framefmt &fmt)
>>  {
>>  	fail_on_test(check_0(fmt.reserved, sizeof(fmt.reserved)));
>> -	fail_on_test(fmt.width == 0 || fmt.width > 65536);
>> -	fail_on_test(fmt.height == 0 || fmt.height > 65536);
>> +	if (fmt.code != MEDIA_BUS_FMT_METADATA_FIXED) {
>> +		fail_on_test(fmt.width == 0 || fmt.width > 65536);
>> +		fail_on_test(fmt.height == 0 || fmt.height > 65536);
>> +	}

I would always fail if width or height != 0 for this format.

Regards,

	Hans

>>  	fail_on_test(fmt.code == 0 || fmt.code == ~0U);
>>  	fail_on_test(fmt.field == ~0U);
>>  	if (!node->is_passthrough_subdev) {
>>

