Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77CA554E32
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 14:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfFYMDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 08:03:51 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42515 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfFYMDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 08:03:51 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2D3A324000D;
        Tue, 25 Jun 2019 12:03:49 +0000 (UTC)
Message-ID: <5532a0801c40c8aaa40557947a43bd159cdff80d.camel@hadess.net>
Subject: [PATCH] [media] doc-rst: Fix typos
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org
Date:   Tue, 25 Jun 2019 14:03:48 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Not sure how codespell thinks "sroweam" is a real word.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 Documentation/media/uapi/rc/rc-tables.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/media/uapi/rc/rc-tables.rst
b/Documentation/media/uapi/rc/rc-tables.rst
index 468d8aa3849b..20d7c686922b 100644
--- a/Documentation/media/uapi/rc/rc-tables.rst
+++ b/Documentation/media/uapi/rc/rc-tables.rst
@@ -196,7 +196,7 @@ the remote via /dev/input/event devices.
 
        -  ``KEY_PAUSE``
 
-       -  Pause sroweam
+       -  Pause stream
 
        -  PAUSE / FREEZE
 
@@ -220,7 +220,7 @@ the remote via /dev/input/event devices.
 
        -  ``KEY_STOP``
 
-       -  Stop sroweam
+       -  Stop stream
 
        -  STOP
 
@@ -228,7 +228,7 @@ the remote via /dev/input/event devices.
 
        -  ``KEY_RECORD``
 
-       -  Start/stop recording sroweam
+       -  Start/stop recording stream
 
        -  CAPTURE / REC / RECORD/PAUSE
 
@@ -577,7 +577,7 @@ the remote via /dev/input/event devices.
 
        -  ``KEY_CLEAR``
 
-       -  Stop sroweam and return to default input video/audio
+       -  Stop stream and return to default input video/audio
 
        -  CLEAR / RESET / BOSS KEY
 
@@ -593,7 +593,7 @@ the remote via /dev/input/event devices.
 
        -  ``KEY_FAVORITES``
 
-       -  Open the favorites sroweam window
+       -  Open the favorites stream window
 
        -  TV WALL / Favorites
 

