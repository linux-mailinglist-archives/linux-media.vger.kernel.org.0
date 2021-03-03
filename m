Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8098432C771
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355600AbhCDAcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:38108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345192AbhCCRRK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 12:17:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36D4964EDB;
        Wed,  3 Mar 2021 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614791789;
        bh=pAzzsrvfkPuDPcdjNc0WIcIU59AumtPPeTcVEC0LuTs=;
        h=From:To:Cc:Subject:Date:From;
        b=lnlAUq7YjdeGqylTSArYX4ZrAeohLH2tkVDk69MJqXuym2JOmgR1hyBoIlOgydt3f
         gOobLCWVH7Snatwm/nIZHZ8rwg9XCX41amRXvN7IlqNuxzt1Wp6n6dkjbtMxLMludK
         wwx3EenASU6/1l6eb/KlbnsMi75Dux/f8aZQfHupVcsH36o9InR6WyIKAi1nEGTMmb
         JqdHeA+HhWICqpmWHg029aZmS8hypTXlsNFGlc76dyewaqien/DlxAUo54k6S2zIL4
         4zx+n//eAFF17LWV/PuOPbGCpaaUh6C29ZW4e6qGyjTT+141NrKQ7d7wOQrWZce1Sj
         SeyoMtE8gxX4Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lHV6k-001lT6-L8; Wed, 03 Mar 2021 18:16:22 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: dev-overlay.rst: cleanup the xvideo example
Date:   Wed,  3 Mar 2021 18:16:19 +0100
Message-Id: <e572b82eabca853728f2dd6ce9087bacfb5d5a5b.1614791758.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It makes more sense to place the xvideo example at the body,
keeping the footnote only to justify the design decision.

While this makes the text better, it also fixes the PDF
output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/dev-overlay.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-overlay.rst b/Documentation/userspace-api/media/v4l/dev-overlay.rst
index 07cc92564c16..4f4b23b95b9b 100644
--- a/Documentation/userspace-api/media/v4l/dev-overlay.rst
+++ b/Documentation/userspace-api/media/v4l/dev-overlay.rst
@@ -37,6 +37,10 @@ capturing and overlay. Optionally these drivers may also permit
 capturing and overlay with a single file descriptor for compatibility
 with V4L and earlier versions of V4L2. [#f1]_
 
+A common application of two file descriptors is the X11
+:ref:`Xv/V4L <xvideo>` interface driver and a V4L2 application.
+While the X server controls video overlay, the application can take
+advantage of memory mapping and DMA.
 
 Querying Capabilities
 =====================
@@ -289,11 +293,6 @@ To start or stop the frame buffer overlay applications call the
 :ref:`VIDIOC_OVERLAY` ioctl.
 
 .. [#f1]
-   A common application of two file descriptors is the XFree86
-   :ref:`Xv/V4L <xvideo>` interface driver and a V4L2 application.
-   While the X server controls video overlay, the application can take
-   advantage of memory mapping and DMA.
-
    In the opinion of the designers of this API, no driver writer taking
    the efforts to support simultaneous capturing and overlay will
    restrict this ability by requiring a single file descriptor, as in
-- 
2.29.2

