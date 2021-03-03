Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DCD32C775
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhCDAcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345187AbhCCRRK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 12:17:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3418664ED9;
        Wed,  3 Mar 2021 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614791789;
        bh=F7LE/YuOqqepsFUCxJ+sS9En86WWIf4uotMsozJ8N60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pDlk1aWJroR2Y7qgnOqen43O8WLn/Wh73wmme7A9V7Q2m1uQU+mmOl8OPVnixDb6K
         5SwRTxgKzJPepIm6vI5RZJEX1jFSpeIWBg53k531ePbLteUWNTxaBiwLlQdGXeZeaQ
         hNZ6Cwnq8QjI1Kb+E/ibqQeP/dqkDWrEAPR9yYAPZ1tujtBeW2lsyI1+bx1n2qlV0j
         gs2b1V33P4rjijxr+Kr8IpNOCZ8bpHlJZVI6kCaSmpZC10rqbEyhl36QWUTPPfyCES
         R9NZ+I1TucJ+QsD1VKT1hmy2UKB8SlqIivuTqAHGNAjgJeJEA5UrUOiiBgRFaQzG9R
         Iec3S2HOhvI9Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lHV6k-001lT8-Lu; Wed, 03 Mar 2021 18:16:22 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: vbi_hsync.svg: fix the viewports
Date:   Wed,  3 Mar 2021 18:16:20 +0100
Message-Id: <f3ea6a19f413cd983e4372da8af3f99de12f94de.1614791758.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e572b82eabca853728f2dd6ce9087bacfb5d5a5b.1614791758.git.mchehab+huawei@kernel.org>
References: <e572b82eabca853728f2dd6ce9087bacfb5d5a5b.1614791758.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At least at pdf output, part of the VBI drawings are not visible.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/vbi_525.svg   | 4 ++--
 Documentation/userspace-api/media/v4l/vbi_625.svg   | 4 ++--
 Documentation/userspace-api/media/v4l/vbi_hsync.svg | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vbi_525.svg b/Documentation/userspace-api/media/v4l/vbi_525.svg
index b01086d466a6..1951de29a111 100644
--- a/Documentation/userspace-api/media/v4l/vbi_525.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_525.svg
@@ -14,7 +14,7 @@
    xml:space="preserve"
    width="208.73068mm"
    height="51.395489mm"
-   viewBox="0 0 739.59691 182.11"
+   viewBox="0 0 788.90338 194.25067"
    sodipodi:docname="vbi_525.svg"><sodipodi:namedview
      pagecolor="#ffffff"
      bordercolor="#666666"
@@ -25,7 +25,7 @@
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
      inkscape:window-width="1920"
-     inkscape:window-height="997"
+     inkscape:window-height="1000"
      id="namedview4"
      showgrid="false"
      fit-margin-top="0"
diff --git a/Documentation/userspace-api/media/v4l/vbi_625.svg b/Documentation/userspace-api/media/v4l/vbi_625.svg
index 41c1ce920d14..21f524de3aed 100644
--- a/Documentation/userspace-api/media/v4l/vbi_625.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_625.svg
@@ -14,7 +14,7 @@
    xml:space="preserve"
    width="209.46608mm"
    height="51.576824mm"
-   viewBox="0 0 742.20265 182.75252"
+   viewBox="0 0 791.6828 194.93604"
    sodipodi:docname="vbi_625.svg"><sodipodi:namedview
      pagecolor="#ffffff"
      bordercolor="#666666"
@@ -25,7 +25,7 @@
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
      inkscape:window-width="1920"
-     inkscape:window-height="997"
+     inkscape:window-height="1000"
      id="namedview4"
      showgrid="false"
      fit-margin-top="0"
diff --git a/Documentation/userspace-api/media/v4l/vbi_hsync.svg b/Documentation/userspace-api/media/v4l/vbi_hsync.svg
index 7fcf12a7ece0..d360251e5f20 100644
--- a/Documentation/userspace-api/media/v4l/vbi_hsync.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_hsync.svg
@@ -14,7 +14,7 @@
    xml:space="preserve"
    width="192.39857mm"
    height="146.83536mm"
-   viewBox="0 0 681.72724 520.28277"
+   viewBox="0 0 727.17572 554.96826"
    sodipodi:docname="vbi_hsync.svg"><sodipodi:namedview
      pagecolor="#ffffff"
      bordercolor="#666666"
@@ -25,7 +25,7 @@
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
      inkscape:window-width="1920"
-     inkscape:window-height="997"
+     inkscape:window-height="1000"
      id="namedview4"
      showgrid="false"
      inkscape:zoom="1.5350601"
-- 
2.29.2

