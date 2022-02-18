Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB87D4BB3E7
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 09:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbiBRIJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 03:09:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiBRIJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 03:09:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E94534644
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 00:09:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E2292B820E8
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 08:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB76C340E9;
        Fri, 18 Feb 2022 08:09:27 +0000 (UTC)
Message-ID: <b6bc652a-9e6e-0e82-5a86-2bd0f2df51f1@xs4all.nl>
Date:   Fri, 18 Feb 2022 09:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] v4l2-compliance: only check function if an MC is present
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The codec tests checked if the function of the device as reported
by the media controller is that of an de/encoder. But that test
was also done for codecs without a MC, and then it fails.

So only do this test if an MC was found.

Also test that stateless codecs always have a MC since it is
required for such codecs.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Nicolas, Stanimir, can you test? This is an improved version of the
patch fixing the function test for codecs.
---
 utils/v4l2-compliance/v4l2-compliance.cpp  | 1 +
 utils/v4l2-compliance/v4l2-compliance.h    | 1 +
 utils/v4l2-compliance/v4l2-test-codecs.cpp | 6 ++++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index c53a55ba..8d0e94e9 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -998,6 +998,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 			if (!node.is_v4l2())
 				driver = mdinfo.driver;
 			node.media_bus_info = mdinfo.bus_info;
+			node.has_media = true;
 		}
 	}

diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 7255161f..507187eb 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -120,6 +120,7 @@ struct base_node {
 	struct node *node2;	/* second open filehandle */
 	bool has_outputs;
 	bool has_inputs;
+	bool has_media;
 	unsigned tuners;
 	unsigned modulators;
 	unsigned inputs;
diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
index 22175eef..1d76a17c 100644
--- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
@@ -31,7 +31,8 @@ int testEncoder(struct node *node)
 	bool is_encoder = node->codec_mask & (STATEFUL_ENCODER | JPEG_ENCODER);
 	int ret;

-	if (IS_ENCODER(node))
+	fail_on_test((node->codec_mask & STATELESS_ENCODER) && !node->has_media);
+	if (IS_ENCODER(node) && node->has_media)
 		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER);
 	memset(&cmd, 0xff, sizeof(cmd));
 	memset(&cmd.raw, 0, sizeof(cmd.raw));
@@ -100,7 +101,8 @@ int testDecoder(struct node *node)
 	bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
 	int ret;

-	if (IS_DECODER(node))
+	fail_on_test((node->codec_mask & STATELESS_DECODER) && !node->has_media);
+	if (IS_DECODER(node) && node->has_media)
 		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_DECODER);
 	memset(&cmd, 0xff, sizeof(cmd));
 	memset(&cmd.raw, 0, sizeof(cmd.raw));
-- 
2.34.1

