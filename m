Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E011F40B2D5
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 17:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234793AbhINPTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 11:19:32 -0400
Received: from gofer.mess.org ([88.97.38.141]:35469 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234879AbhINPT2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 11:19:28 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 460B8C6398; Tue, 14 Sep 2021 16:18:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631632689; bh=qeS/5imX9GLmIFY4E6hwoHSSrOLKVUvULn/KMQN2Ozc=;
        h=From:To:Cc:Subject:Date:From;
        b=lLw/CbK3FIjjpwYsHvj/nTa8oprwHd/CwV4VN5BC66grJeL3LwwIaxztH5e92UA1r
         0oOG6L/z25YALUHbCt8+qj8uvgShy3QRiqlXRZgw+nturEQFDZouaOxFYPX2eD7BoL
         jTPSD/y2RVZVI7k1CHPBmSzw+0DsveHJl0lT7akflobBXASog08xvx0046x6OH2gkt
         BPVWQzuHlOP/wmXLLZOWOpTbH6D+rBaGLxzQkZUKG4f7cMZlTgcTzjt6LSnzoNIyb6
         VVUFbwbdBKYtgn7il2y8tZcapIVwMDOWDCUyRkfQ9fZB8wlBUdhC9Lg3lWV7BWXdeX
         QPOD9A7C0VUXQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Georgi Bakalski <georgi.bakalski@gmail.com>
Subject: [PATCH 1/4] media: ir_toy: print firmwware version in correct format
Date:   Tue, 14 Sep 2021 16:18:06 +0100
Message-Id: <22eeae667aac9d5eaaae2f21904f238ebef0c05b.1631632442.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A value of 25 means firmware version 2.5.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir_toy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index b0dc19d36ac9..45d39b6e49c0 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -440,8 +440,9 @@ static int irtoy_probe(struct usb_interface *intf,
 	if (err)
 		goto free_rcdev;
 
-	dev_info(irtoy->dev, "version: hardware %u, firmware %u, protocol %u",
-		 irtoy->hw_version, irtoy->sw_version, irtoy->proto_version);
+	dev_info(irtoy->dev, "version: hardware %u, firmware %u.%u, protocol %u",
+		 irtoy->hw_version, irtoy->sw_version / 10,
+		 irtoy->sw_version % 10, irtoy->proto_version);
 
 	if (irtoy->sw_version < MIN_FW_VERSION) {
 		dev_err(irtoy->dev, "need firmware V%02u or higher",
-- 
2.31.1

