Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8312D58B6
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 11:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389260AbgLJK5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:57:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:56394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389222AbgLJK5V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:57:21 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] media: ext-ctrls-codec-stateless.rst: change a FWHT flag description
Date:   Thu, 10 Dec 2020 11:55:44 +0100
Message-Id: <f85e13b9ecf0a68457f9f88919995f130272df08.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using "- 1", use "minus one".

The reason is that, if the table is split like:

  V4L2_FWHT_FL_COMPONENTS_NUM_MSK  0x00070000  The number of color components
                                               - 1.

One might not realize the meaning of the second line.

As a side effect, using text instead of arabic numbers is
more appropriate for formal documents like this spec.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 01e3b1a3fb99..e1537ffc6eaa 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -778,7 +778,7 @@ FWHT Flags
       - Set if this is an I-frame.
     * - ``V4L2_FWHT_FL_COMPONENTS_NUM_MSK``
       - 0x00070000
-      - The number of color components - 1.
+      - The number of color components minus one.
     * - ``V4L2_FWHT_FL_PIXENC_MSK``
       - 0x00180000
       - The mask for the pixel encoding.
-- 
2.29.2

