Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5048B4BA31A
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 15:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241903AbiBQOfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 09:35:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235817AbiBQOfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 09:35:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87299C1141
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 06:34:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B6BAB82077
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 14:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80682C340EC;
        Thu, 17 Feb 2022 14:34:52 +0000 (UTC)
Message-ID: <fff5d698-99b3-3d92-5fc3-23e217554a79@xs4all.nl>
Date:   Thu, 17 Feb 2022 15:34:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: Venus v4l2-compliance failures
Content-Language: en-US
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <b5c170e2-dbdf-fc08-31e2-112d2973017f@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <b5c170e2-dbdf-fc08-31e2-112d2973017f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/02/2022 15:12, Stanimir Varbanov wrote:
> Hi Hans,
> 
> Presently we have two failures while running v4l2-compliance on venus
> stateful decoder:
> 
> 1. fail: v4l2-compliance.cpp(753): !ok
>         test for unlimited opens: FAIL
> 
> 2. fail: v4l2-test-formats.cpp(1668): IS_DECODER(node)
>         test Cropping: FAIL
>    fail: v4l2-test-codecs.cpp(104): node->function !=
> MEDIA_ENT_F_PROC_VIDEO_DECODER
>         test VIDIOC_(TRY_)DECODER_CMD: FAIL
> 
> Failure #1 is related to the limitation we made in decoder open(). The
> maximum parallel decoding sessions is limited to 16 and the check
> for this maximum is made in decoder open() because the clients wanted to
> know that earlier. For example, Chromium browser can open 16 hw
> accelerated decoder sessions (in separate Tabs) and from 17 and upward
> it will fallback to sw decoder. I wonder how that failure can be fixed.

I'm wondering if this isn't better done via a read-only control that
reports the max number of parallel sessions.

I really hate artificial open() limitations, it's very much against the
v4l2 philosophy.

Reporting it with a standard control makes it also much easier for software
to anticipate when it needs to switch to SW en/decoding.

> 
> 
> Failure #2 is related to a commit [1] which add checks for
> MEDIA_ENT_F_PROC_VIDEO_ENCODER, I think this entity flag is applicable
> for stateless encoders (Request API) but Venus driver has no use of
> media-controller API. Did I miss something?

For item 2, can you try the patch below?

Regards,

	Hans

-----------------------------------------------------------------------

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
index 22175eef..3f06070f 100644
--- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
@@ -29,9 +29,10 @@ int testEncoder(struct node *node)
 {
 	struct v4l2_encoder_cmd cmd;
 	bool is_encoder = node->codec_mask & (STATEFUL_ENCODER | JPEG_ENCODER);
+	bool is_stateless_encoder = node->codec_mask & STATELESS_ENCODER;
 	int ret;

-	if (IS_ENCODER(node))
+	if (is_stateless_encoder)
 		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER);
 	memset(&cmd, 0xff, sizeof(cmd));
 	memset(&cmd.raw, 0, sizeof(cmd.raw));
@@ -98,9 +99,10 @@ int testDecoder(struct node *node)
 {
 	struct v4l2_decoder_cmd cmd;
 	bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
+	bool is_stateless_decoder = node->codec_mask & STATELESS_DECODER;
 	int ret;

-	if (IS_DECODER(node))
+	if (is_stateless_decoder)
 		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_DECODER);
 	memset(&cmd, 0xff, sizeof(cmd));
 	memset(&cmd.raw, 0, sizeof(cmd.raw));
