Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503E55D373
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfGBPtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:49:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58396 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727217AbfGBPtT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 11:49:19 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:c7f4:61e7:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BF8C128A323;
        Tue,  2 Jul 2019 16:49:15 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 6/7] media: vimc.dot: Update default topology diagram
Date:   Tue,  2 Jul 2019 12:47:51 -0300
Message-Id: <20190702154752.14939-7-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702154752.14939-1-andrealmeid@collabora.com>
References: <20190702154752.14939-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the default topology diagram to reflect the current state of the
driver.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 Documentation/media/v4l-drivers/vimc.dot | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/v4l-drivers/vimc.dot b/Documentation/media/v4l-drivers/vimc.dot
index 57863a13fa39..b40c151ff790 100644
--- a/Documentation/media/v4l-drivers/vimc.dot
+++ b/Documentation/media/v4l-drivers/vimc.dot
@@ -9,13 +9,13 @@ digraph board {
 	n00000003:port0 -> n00000008:port0 [style=bold]
 	n00000003:port0 -> n0000000f [style=bold]
 	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000005:port1 -> n00000017:port0
+	n00000005:port1 -> n00000017:port0 [style=dashed]
 	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
 	n00000008:port1 -> n00000017:port0 [style=dashed]
 	n0000000b [label="Raw Capture 0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
 	n0000000f [label="Raw Capture 1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
 	n00000013 [label="RGB/YUV Input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
-	n00000013 -> n00000017:port0 [style=dashed]
+	n00000013 -> n00000017:port0 [style=bold]
 	n00000017 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
 	n00000017:port1 -> n0000001a [style=bold]
 	n0000001a [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
-- 
2.22.0

