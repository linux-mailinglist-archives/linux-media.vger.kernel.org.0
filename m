Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1324B8C453
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 00:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbfHMWgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 18:36:52 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:44731 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfHMWgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 18:36:52 -0400
Received: by mail-pf1-f178.google.com with SMTP id c81so3399571pfc.11;
        Tue, 13 Aug 2019 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mJjg+agyQMMusNhpHfXdEcabVsvoypkfvaemt2NLQGo=;
        b=Jrl2rgKgWlJkS1vJk1OKALCLNOonNZJAxKeI7jdn7W98mdiqekpWrA0+CnqN5MYMb5
         4D8Hza7sYoH1Idnp5AOdNC2Q1D5nU6Zn6nKG0sPbDvgsF3VN0YIb2fFD7eDOeo8fY867
         Wz3hkxO6OEoMX0yZk1hkas9zqBYJUrHL/ohCEQvcucWxcCHIQs824sPJRl4i2jxFYxmF
         Ypi7KJwhR2JkLFTlaySF4VEiS/wLvO98ppIiPHcJWIrhKUPV1m0TDnjzPUMiMtzPtLNH
         MojPvZbUSchxQ40Fabr4+HfMhusGXL33bTvzkEnN8eUV93ilAKweREBcoNdhbuUksaG0
         aNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mJjg+agyQMMusNhpHfXdEcabVsvoypkfvaemt2NLQGo=;
        b=ckjqPjUHUMj57MzbfoxAacL1bcZsUkMaYjftAe2OlOZlqo0oiXXW+5/H3V8ieN0Mbu
         PtIyzjp48ulFVUdoVIopNUIxkc7ynQigPaJ2DLFISJtre+fuPKZljCdCbLXLyw7A51am
         B/2kAjy/C3/FyOJ0J2fG24vPjcj8wtmXYsznX9xpu4sjayP+VxNqzbTcVgaQ4w12hq1z
         eq1EJkWlFoxA3R3Dahd/GcY3UdndNWrxoA31Q9X6A2SgnYNFKrSE3TIUK/mERmVbu+O+
         ivJqpWa7L7aRRiC1tJpe9foelUcmFFYabNBVezhkSqtgRPuZ8sj6ML7H/zaHONP5j1Ql
         ilzg==
X-Gm-Message-State: APjAAAVLndN9X8qGOZ6K05YFv6OMGdIHw967uJzn53TVoodhuiq/PNWu
        sdH/OOJ7UCFrsAS1uzPXxhzqlRv8
X-Google-Smtp-Source: APXvYqzJTQ/17lMvJG2ROjPMrO073k+f6FbvHqChuE9J9oEWUWFCstj/Q+SWMtGdrJnovHv7T3r1Jw==
X-Received: by 2002:a63:e10:: with SMTP id d16mr36605007pgl.444.1565735811417;
        Tue, 13 Aug 2019 15:36:51 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 16sm48393441pfc.66.2019.08.13.15.36.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 15:36:50 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
X-Google-Original-From: Steve Longerbeam <steve_longerbeam@mentor.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] media: docs-rst: Clarify duration of LP-11 mode
Date:   Tue, 13 Aug 2019 15:36:44 -0700
Message-Id: <20190813223645.13720-1-steve_longerbeam@mentor.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Steve Longerbeam <slongerbeam@gmail.com>

Add a sentence that makes it more clear when the CSI-2 transmitter
must, if possible, exit LP-11 mode. That is, maintain LP-11 mode
until stream on, at which point the transmitter activates the clock
lane and transition to HS mode.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v2:
- change wording "Only until stream on ..." to "Only at stream on ..."
---
 Documentation/media/kapi/csi2.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/media/kapi/csi2.rst b/Documentation/media/kapi/csi2.rst
index a7e75e2eba85..f87c413cd433 100644
--- a/Documentation/media/kapi/csi2.rst
+++ b/Documentation/media/kapi/csi2.rst
@@ -49,9 +49,13 @@ where
 
 The transmitter drivers must, if possible, configure the CSI-2
 transmitter to *LP-11 mode* whenever the transmitter is powered on but
-not active. Some transmitters do this automatically but some have to
-be explicitly programmed to do so, and some are unable to do so
-altogether due to hardware constraints.
+not active, and maintain *LP-11 mode* until stream on. Only at stream
+on should the transmitter activate the clock on the clock lane and
+transition to *HS mode*.
+
+Some transmitters do this automatically but some have to be explicitly
+programmed to do so, and some are unable to do so altogether due to
+hardware constraints.
 
 Stopping the transmitter
 ^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.17.1

