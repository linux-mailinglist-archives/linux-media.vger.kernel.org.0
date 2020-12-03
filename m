Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07C12CD634
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 13:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730444AbgLCM5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 07:57:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:55166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729213AbgLCM5k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 07:57:40 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH] media: pixfmt-meta-rkisp1.rst: fix two build warnings
Date:   Thu,  3 Dec 2020 13:56:55 +0100
Message-Id: <38d8dfe0a9e16c2260d1325afd7465215e4fd278.1607000212.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With Sphinx 2.x: those two warnings are produced:

/devel/v4l/docs/sphinx2/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-meta-fmt-rk-isp1-params (if the link has no caption the label must precede a section header)
/devel/v4l/docs/sphinx2/Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-meta-fmt-rk-isp1-stat-3a (if the link has no caption the label must precede a section header)

The reason is that there's no blank line between the two
identifiers.

Fixes: 3f46cac6787f ("media: admin-guide/pixfmt-meta-rkisp1.rst: pixfmt reference conforming with macro")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
index 922fa1d59898..fa04f00bcd2e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. _v4l2-meta-fmt-rk-isp1-params:
+
 .. _v4l2-meta-fmt-rk-isp1-stat-3a:
 
 *****************************************************************************
-- 
2.28.0

