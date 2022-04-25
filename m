Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD7E50D8DF
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 07:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241298AbiDYFhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 01:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235393AbiDYFhK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 01:37:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BCC13F0B
        for <linux-media@vger.kernel.org>; Sun, 24 Apr 2022 22:34:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75284611A6
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 05:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB49C385A4;
        Mon, 25 Apr 2022 05:34:05 +0000 (UTC)
Message-ID: <2aac3514-5b8f-1b5d-da4a-5f6eebbf1d94@xs4all.nl>
Date:   Mon, 25 Apr 2022 07:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] media: coda: enable capture G_PARM for stateful
 encoder
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
 <20220404163533.707508-6-p.zabel@pengutronix.de>
 <bf945836-a7fb-a67f-1f89-e5cc85fec808@xs4all.nl>
 <f788dd2e580d01cb91bde968e8c5fba2035c264f.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <f788dd2e580d01cb91bde968e8c5fba2035c264f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2022 16:58, Philipp Zabel wrote:
> On Do, 2022-04-21 at 12:30 +0200, Hans Verkuil wrote:
> [...]
>> I think this is actually a v4l2-compliance bug, not a driver bug.
>>
>> G/S_PARM doesn't make sense for the capture queue of a stateful encoder, unless
>> V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL is set to reserve HW resources.
>>
>> See https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-enum-fmt.html#fmtdesc-flags
>>
>> That flags isn't used, so v4l2-compliance shouldn't complain.
>>
>> Try this v4l2-compliance patch to see if it resolved the fails for this patch
>> and the next patch (7/7).
>>
>> v4l2-compliance patch:
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
>> index 3761b1fa..269a3832 100644
>> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
>> @@ -1341,8 +1341,16 @@ static int testParmType(struct node *node, unsigned type)
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>>  		if (node->g_caps() & buftype2cap[type]) {
>> -			fail_on_test(ret && node->has_frmintervals);
>> -			fail_on_test(ret && node->has_enc_cap_frame_interval);
>> +			if (is_stateful_enc) {
>> +				if (V4L2_TYPE_IS_OUTPUT(type))
>> +					fail_on_test(ret && node->has_frmintervals);
>> +				else if (node->has_enc_cap_frame_interval)
>> +					fail_on_test(ret);
>> +				else
>> +					fail_on_test(!ret);
>> +			} else {
>> +				fail_on_test(ret && node->has_frmintervals);
>> +			}
>>  		}
>>  		break;
>>  	default:
> 
> You are right, this patch resolves the compliance failures addressed by
> patches 6 and 7.

Great! I've committed this change to v4l-utils.

Regards,

	Hans
