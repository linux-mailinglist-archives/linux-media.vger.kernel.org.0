Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7450ABC4C4
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 11:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfIXJZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 05:25:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38449 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfIXJZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 05:25:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id h195so974201pfe.5
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dCVg/sBqGV0UDXNYzW0FdS/cXT84vMdoMpS4HfvWvSY=;
        b=t8WLIHdMBxxwzQVBrTFEMO6y+RLhqDTlpg9fGPvCxmJgCqHrdPs3tg5AeaNhvW7wke
         A0QkwNzDnu5wuskIpKMfX4+FRNyLWEcyVA6L872eo9FVn19fj8GN3mG2pgb1iN65NMwh
         n9ezz6DgmeqM5GaIR+ZnZ9EqYBLuO6UK6ZaB7awOOvssBDABWi64IrG+jSBaNaJu7c1a
         DkqXibm0oqTp08Zs/o9kg9ZUmX0pj973VwC1HbNeL170SiJWOnHJ/MfDLxfAP/k3TPVT
         BxM05VKvkqun+n4sMS3e1zu0VvKVtkwepls7cKKyo8zRklK+URYdP97oO65TAt/hHFtd
         Dq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dCVg/sBqGV0UDXNYzW0FdS/cXT84vMdoMpS4HfvWvSY=;
        b=KAwWg9558jiO0PX8dbVtOv84A1VrE643onZmRqW41qGv57U02+lU5FLucjI0oYVdjk
         eJCT3QWPle2yMv2Vr1Vaqs+M1cF0yuc7/RiazK3vlh/TdKWGazPZkBQkjQYU50OAMcZA
         T9phVdw70VnOQfTe4oc/gZ0fCSiF3+T5lrBnWb6AfJ2T7M/TMYTipOF1jH7fTK361h8o
         2A+ltsdfDJyn4RwfC7DA8gZvM1TrHvfXqLAJ2Y6vNALukXFCMZNzzArU31ZW2O7nxFT1
         7wt4A+MXNeBApwN+jydFykBan10JFIgLVEbuCwRUzMEvhoOdhph+nJD4D9sSWblyu83Z
         5X7w==
X-Gm-Message-State: APjAAAUy/qfMApHvKZY5uEMDDkTLMxvc2O1JM2nWo/vXsntkeCPBpQ35
        3QHL4ddkOc1DFw4S1ZN21kC9BFBD
X-Google-Smtp-Source: APXvYqyI8qHYcumKMxD8GSXprNJkopEBfri1bhMbQ8VprHolDWYJet7OlPDLGAwXR9JZmn09lTu9rw==
X-Received: by 2002:a65:6709:: with SMTP id u9mr2221292pgf.59.1569317138209;
        Tue, 24 Sep 2019 02:25:38 -0700 (PDT)
Received: from localhost.localdomain ([49.206.12.173])
        by smtp.gmail.com with ESMTPSA id y4sm1113767pjn.19.2019.09.24.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 02:25:37 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] v4l2-compliance: Verify metadata formats
Date:   Tue, 24 Sep 2019 14:55:30 +0530
Message-Id: <20190924092530.17749-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

changes to testEnumFormats() and testGetFormats() to verify METADATA type.
G_FMT sets node->valid_buftypes, so TRY/S_FMT does not get called for
other input types, hence did not modify them.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 525dfafa..604ea921 100644
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
+			/* Metadata formats need not be present for all input types */
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
+			if(ret && !node->buftype_pixfmts[type].empty())
+				return fail("%s Get_format failed, but %s formats defined\n",
+					buftype2s(type).c_str(), buftype2s(type).c_str());
+			if(!ret && node->buftype_pixfmts[type].empty())
+				return fail("%s Get_format success, but no  %s formats defined\n",
+					buftype2s(type).c_str(), buftype2s(type).c_str());
+			break;
 		default:
 			/* ENUMFMT doesn't support other buftypes */
 			break;
-- 
2.17.1

