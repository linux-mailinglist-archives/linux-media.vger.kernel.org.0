Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CA0BDAB8
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 11:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389068AbfIYJOp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 05:14:45 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40387 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388828AbfIYJOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 05:14:44 -0400
Received: by mail-pl1-f195.google.com with SMTP id d22so2147674pll.7
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2019 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KCnlQGjWOLIDapHcpMI8S/mSnM8l6ASGOjZnx5oeNu4=;
        b=M3x/Qe/PVDV0hGiVy48MtFtLbVMt16U69Z/vRPeGC99NM8Elbnje8pzv3CMPS7ArkU
         f1F/KYpM0TNJo6dqIJel72TMJVNAJebVNtOzEmS9YQMLDai8K6CbjE7hGFl2OmnubgrM
         D9JmWKQt0cSTM7EuH5lKB1Oc0wXvvXkL+rA6nmTnO0ghaamhYm75IPlE5xkm77vzcQm9
         5FswFQT246RwUqQAZxOJUNu50UR/iyeMBMasVq2c74wBTieMNfQ9hm2e3pPw6KBiDtr4
         l1G0BpX2poXedjsExsNlyCDKK9PZLXizQMQRJqv5yUG6ZTnJkfuNVRTJiRLwDsilUg+I
         bmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KCnlQGjWOLIDapHcpMI8S/mSnM8l6ASGOjZnx5oeNu4=;
        b=ON1ZpIgkBFJWWt+Lw+8g44018yJyVyeMGkGbL4vfhtwDyeJgoyM4MpYiWcI7bdkpic
         BfY0LNd6T/bAvvwmXHMw3Gu21jgvfD5xteHqSXIDNqlauUu43levxUp5LUXmvovYXQAt
         q3aDAjqO6Ri91rmSLrmTsW85JYYJcdxla2ccu2llEtZ9ZUOnF/ln9ijYiC40MP0StiSy
         sszc4bAA+gjIgYeSpT65TLmerwCghrOdUJlt8rPBqxQ2ApAJj77eHI+EFtn/ELmy/Hii
         fw9FP3+433f68OnEBEMpmlFTLiDO3HRBtXIArMc14j/Rpob6AyjT+zMDfhU9GoYDVSj/
         eqZA==
X-Gm-Message-State: APjAAAUHcdWQzHn/RvuDR+w4wjiiTMYlFCvpGu0P5TpBmzOK/OX8Awk8
        P6mFYptX3ga3nn54PYgxhgTP7srn
X-Google-Smtp-Source: APXvYqyG8B7hb8LGTsrBUcWO5KNZZNok9a/2KggxnHY8Iz8Ktq8coxSwsiM1wk3ngCRSNl6MKJzJug==
X-Received: by 2002:a17:902:8b89:: with SMTP id ay9mr7926304plb.81.1569402883295;
        Wed, 25 Sep 2019 02:14:43 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.88])
        by smtp.gmail.com with ESMTPSA id n185sm3911736pga.16.2019.09.25.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 02:14:42 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] v4l2-compliance: Verify metadata formats
Date:   Wed, 25 Sep 2019 14:44:26 +0530
Message-Id: <20190925091426.17120-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <49ffdb33-39a7-aa44-fb0c-302e963972b1@xs4all.nl>
References: <49ffdb33-39a7-aa44-fb0c-302e963972b1@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Metadata formats may not be defined for a given input or output type.
This patch checks, if given input/output type enumerates metadata formats
and validates G_FMT accordingly.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 525dfafa..b60d9275 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -305,8 +305,6 @@ int testEnumFormats(struct node *node)
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		case V4L2_BUF_TYPE_SDR_CAPTURE:
 		case V4L2_BUF_TYPE_SDR_OUTPUT:
-		case V4L2_BUF_TYPE_META_CAPTURE:
-		case V4L2_BUF_TYPE_META_OUTPUT:
 			if (ret && (node->g_caps() & buftype2cap[type]))
 				return fail("%s cap set, but no %s formats defined\n",
 						buftype2s(type).c_str(), buftype2s(type).c_str());
@@ -314,6 +312,10 @@ int testEnumFormats(struct node *node)
 				return fail("%s cap not set, but %s formats defined\n",
 						buftype2s(type).c_str(), buftype2s(type).c_str());
 			break;
+		case V4L2_BUF_TYPE_META_CAPTURE:
+		case V4L2_BUF_TYPE_META_OUTPUT:
+			/* Metadata formats need not be present for the current input/output */
+			break;
 		default:
 			if (!ret)
 				return fail("Buffer type %s not allowed!\n", buftype2s(type).c_str());
@@ -599,8 +601,6 @@ int testGetFormats(struct node *node)
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		case V4L2_BUF_TYPE_SDR_CAPTURE:
 		case V4L2_BUF_TYPE_SDR_OUTPUT:
-		case V4L2_BUF_TYPE_META_CAPTURE:
-		case V4L2_BUF_TYPE_META_OUTPUT:
 			if (ret && (node->g_caps() & buftype2cap[type]))
 				return fail("%s cap set, but no %s formats defined\n",
 					buftype2s(type).c_str(), buftype2s(type).c_str());
@@ -608,6 +608,15 @@ int testGetFormats(struct node *node)
 				return fail("%s cap not set, but %s formats defined\n",
 					buftype2s(type).c_str(), buftype2s(type).c_str());
 			break;
+		case V4L2_BUF_TYPE_META_CAPTURE:
+		case V4L2_BUF_TYPE_META_OUTPUT:
+			if (ret && !node->buftype_pixfmts[type].empty())
+				return fail("%s G_FMT failed, but %s formats defined\n",
+					buftype2s(type).c_str(), buftype2s(type).c_str());
+			if (!ret && node->buftype_pixfmts[type].empty())
+				return fail("%s G_FMT success, but no %s formats defined\n",
+					buftype2s(type).c_str(), buftype2s(type).c_str());
+			break;
 		default:
 			/* ENUMFMT doesn't support other buftypes */
 			break;
-- 
2.17.1

