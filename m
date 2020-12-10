Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6C72D58E1
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389190AbgLJK46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:56:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:56186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389133AbgLJK4g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:56:36 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] media: ext-ctrls-codec.rst: add a missing profile description
Date:   Thu, 10 Dec 2020 11:55:45 +0100
Message-Id: <729accb9978a128143fdb7afe02a3ec26c0571a0.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One of the MPEG-4 profiles has a missing description. Add it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 454ecd9a0f83..08c317ae0910 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -972,7 +972,7 @@ enum v4l2_mpeg_video_mpeg4_profile -
     * - ``V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE``
       - Simple Scalable profile
     * - ``V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY``
-      -
+      - Advanced Coding Efficiency profile
 
 
 
-- 
2.29.2

