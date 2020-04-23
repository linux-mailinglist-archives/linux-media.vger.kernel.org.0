Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BF01B5982
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 12:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgDWKqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 06:46:35 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51713 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725863AbgDWKqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 06:46:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RZNFjLthm7xncRZNIjQHAv; Thu, 23 Apr 2020 12:46:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587638792; bh=4Z9L3fveCgB/UVffyvJ0cbAFPHfM23fVKi3mF2tZbAU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uTIY26ojCZRblaU9PgqhgeRBmrMHMYau37foeoh/xzQdGJ9UbJuichV/ML1ywlMNM
         mf464BvY/lvtqv5hyazC2vWCA+UX5ID4BUmqqwxF8TfK2BvdirYxHZ2TnLsS9y7P1d
         9b8+xRFU9FeSO8zomf5jExLPt0dAZ0xZDYMiV3dWp7epMhOivIG5pP9pqHHxrQ4u5a
         /Mf9bJt97yYwTbAB1krD5ncza6MRJCrk1fv7YA4ZOUQMVFstrfhutUFTBZUHqj407Y
         btzWyl92gECpVuVAWVGOMoqwEAMr8sBRhd2ABSqIEo8gNXdtcush6SwGm2hhj1LhjE
         z4C6blZ1L4cUg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] v4l2-compliance: add tests for V4L2_CAP_IO_MC
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-ID: <a79f8f49-817a-1804-e88e-455f00d21006@xs4all.nl>
Date:   Thu, 23 Apr 2020 12:46:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLP0YRrVz5DMHmhBL5FBmGH6OWr9NJ0DayTkik5Ka4rRujGh8/yMleob9APVQAG2SsJ5VBLYbOHWXPYmf0LaC4bljk9VmO4qCFeFla36RPWdquE0UdFq
 Oqqi5M+59xTLMClsKxZ3qrpSzmoasemX1XkF9zAb5Vz5UQLo+a02hHqMe2izCaF3Gq0R+0L5OPrBBYhmWO9GRIjQAlBnneWE/06R2FA1+e8Dry0TrpRe0BsU
 IHbutS2LslH/uCW1aZxfCpcMyylmuMs8rmexPmStPNO7TlJOyyfL5TZP46bgXwuKTm6FxnqltJc7limkjLz2nGN/23iou4HBeJf7OliMHQVdXnPk2xUebaZE
 BJiz5QqV34Z94umBe7y4HgfDKFMaWwTUYKDuf4U6U2ONFlOQw/Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add tests to check the behavior of VIDIOC_ENUM{INPUT,OUTPUT},
VIDIOC_G_{INPUT,OUTPUT} and VIDIOC_S_{INPUT,OUTPUT} when the
V4L2_CAP_IO_MC is set.

And the old 'node->has_inputs || node->has_outputs' argument for testColorspace()
can now be replaced with !node->is_io_mc.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Supersedes https://patchwork.linuxtv.org/patch/62312.
---
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index b3a18492..7bd2e035 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1004,6 +1004,8 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		node.is_video = false;
 		node.is_meta = true;
 	}
+	if (node.g_caps() & V4L2_CAP_IO_MC)
+		node.is_io_mc = true;

 	/* Information Opts */

diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 07c7be29..6c3928fe 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -97,6 +97,7 @@ struct base_node {
 	bool is_meta;
 	bool is_touch;
 	bool is_m2m;
+	bool is_io_mc;
 	bool is_planar;
 	bool can_capture;
 	bool can_output;
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 824769b3..f38bc30a 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -447,7 +447,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 		fail_on_test(pix.bytesperline && pix.bytesperline < pix.width);
 		fail_on_test(!pix.sizeimage);
 		if (!node->is_m2m)
-			fail_on_test(testColorspace(node->has_inputs || node->has_outputs,
+			fail_on_test(testColorspace(!node->is_io_mc,
 						    pix.pixelformat, pix.colorspace,
 						    pix.ycbcr_enc, pix.quantization));
 		fail_on_test(pix.field == V4L2_FIELD_ANY);
@@ -463,7 +463,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 			return fail("pixelformat %08x (%s) for buftype %d not reported by ENUM_FMT\n",
 					pix_mp.pixelformat, fcc2s(pix_mp.pixelformat).c_str(), type);
 		if (!node->is_m2m)
-			fail_on_test(testColorspace(node->has_inputs || node->has_outputs,
+			fail_on_test(testColorspace(!node->is_io_mc,
 						    pix_mp.pixelformat, pix_mp.colorspace,
 						    pix_mp.ycbcr_enc, pix_mp.quantization));
 		fail_on_test(pix_mp.field == V4L2_FIELD_ANY);
diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
index fb8d12b1..80ecf75d 100644
--- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
+++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
@@ -466,6 +466,10 @@ int testInput(struct node *node)
 	if (!node->inputs && node->has_inputs)
 		return fail("no inputs found, but input capabilities set\n");
 	fail_on_test(node->is_m2m && node->inputs > 1);
+	if (node->is_io_mc) {
+		fail_on_test(!node->is_video && !node->is_meta);
+		fail_on_test(node->inputs != 1);
+	}
 	return 0;
 }

@@ -836,6 +840,10 @@ int testOutput(struct node *node)
 	if (!node->outputs && node->has_outputs)
 		return fail("no outputs found, but output capabilities set\n");
 	fail_on_test(node->is_m2m && node->outputs > 1);
+	if (node->is_io_mc) {
+		fail_on_test(!node->is_video && !node->is_meta);
+		fail_on_test(node->outputs != 1);
+	}
 	return 0;
 }

