Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65BB4FCCA
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2019 18:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfFWQmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jun 2019 12:42:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42074 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfFWQmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jun 2019 12:42:09 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 752AE2613D9;
        Sun, 23 Jun 2019 17:42:05 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 5/5] media: vimc.rst: add vimc-streamer source documentation
Date:   Sun, 23 Jun 2019 13:40:24 -0300
Message-Id: <20190623164024.9836-5-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190623164024.9836-1-andrealmeid@collabora.com>
References: <20190623164024.9836-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since vimc-streamer.{c, h} are fully documented and conforming with the
kernel-doc syntax, add those files to vimc.rst

Signed-off-by: André Almeida <andrealmeid@collabora.com>
Suggested-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/media/v4l-drivers/vimc.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index bece85867424..406417680db5 100644
--- a/Documentation/media/v4l-drivers/vimc.rst
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -96,3 +96,14 @@ those arguments to each subdevice, not to the vimc module. For example::
         Window size to calculate the mean. Note: the window size needs to be an
         odd number, as the main pixel stays in the center of the window,
         otherwise the next odd number is considered (the default value is 3).
+
+Source code documentation
+-------------------------
+
+vimc-streamer
+~~~~~~~~~~~~~
+
+.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.h
+   :internal:
+
+.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.c
-- 
2.22.0

