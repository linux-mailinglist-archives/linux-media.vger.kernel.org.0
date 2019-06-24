Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2347A50ADD
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 14:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730355AbfFXMjr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 08:39:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48234 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730243AbfFXMjq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 08:39:46 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:d719:dd85:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 430D82656C4;
        Mon, 24 Jun 2019 13:39:42 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH v2 4/5] media: vimc.rst: Add a proper alt attribute to vimc.dot
Date:   Mon, 24 Jun 2019 09:37:28 -0300
Message-Id: <20190624123729.5847-4-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624123729.5847-1-andrealmeid@collabora.com>
References: <20190624123729.5847-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to W3C, "the content of the alt attribute is: use text that
fulfills the same function as the image". While it's hard to describe
the whole content of this image, replace the actual alt to something
more useful to people with slow connection or that uses screen readers.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---

Changes in v2: none

 Documentation/media/v4l-drivers/vimc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index 4628b12d417f..bece85867424 100644
--- a/Documentation/media/v4l-drivers/vimc.rst
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -15,7 +15,7 @@ recompile the driver to achieve your own topology. This is the default topology:
 .. _vimc_topology_graph:
 
 .. kernel-figure:: vimc.dot
-    :alt:   vimc.dot
+    :alt:   Diagram of the default media pipeline topology
     :align: center
 
     Media pipeline graph on vimc
-- 
2.22.0

