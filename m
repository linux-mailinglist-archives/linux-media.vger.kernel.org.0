Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACC1205277
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 14:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732488AbgFWM2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 08:28:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732439AbgFWM2L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 08:28:11 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A78712078A;
        Tue, 23 Jun 2020 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592915290;
        bh=smtMYS47KBrlK4I7X2yK2kjj8lEpBzTm18Pl31P5Erg=;
        h=From:To:Cc:Subject:Date:From;
        b=SWHwR3fG15GaNF+0KMQtGnqtPPJxItzZiYBm+yzyfGShaIoobJP/ru89FdDjxo5yc
         P65M/1H/XhC6/Q0Ceq70nqaeH77U9CIhK7W+ZEUi17ezYn9D8X2Lg/isTegZWHA0AV
         e8sbrTxZP0YKmNy3lKSWA44y19UWr6Wovs1VR7Mw=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jni24-006B8b-FK; Tue, 23 Jun 2020 14:28:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michael Tretter <m.tretter@pengutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: dev-encoder.rst: add GFDL-1-1+ to SPDX header
Date:   Tue, 23 Jun 2020 14:28:07 +0200
Message-Id: <921758bc9b2fd38abe8293c328beff3ed089b395.1592915281.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media documents under the uAPI should be GFDL compatible.

So, make this one dual-licensed GPL-2.0 or GFDL-1.1+ with
no-invariant sections.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/v4l/dev-encoder.rst   | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
index c3a21bfe0052..fb44f20924de 100644
--- a/Documentation/userspace-api/media/v4l/dev-encoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
@@ -1,4 +1,28 @@
-.. SPDX-License-Identifier: GPL-2.0
+.. This file is dual-licensed: you can use it either under the terms
+.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
+.. dual licensing only applies to this file, and not this project as a
+.. whole.
+..
+.. a) This file is free software; you can redistribute it and/or
+..    modify it under the terms of the GNU General Public License as
+..    published by the Free Software Foundation version 2 of
+..    the License.
+..
+..    This file is distributed in the hope that it will be useful,
+..    but WITHOUT ANY WARRANTY; without even the implied warranty of
+..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+..    GNU General Public License for more details.
+..
+.. Or, alternatively,
+..
+.. b) Permission is granted to copy, distribute and/or modify this
+..    document under the terms of the GNU Free Documentation License,
+..    Version 1.1 or any later version published by the Free Software
+..    Foundation, with no Invariant Sections, no Front-Cover Texts
+..    and no Back-Cover Texts. A copy of the license is included at
+..    Documentation/userspace-api/media/fdl-appendix.rst.
+..
+.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
 
 .. _encoder:
 
-- 
2.26.2

