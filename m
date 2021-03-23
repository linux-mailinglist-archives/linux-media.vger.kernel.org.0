Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED8A34649B
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 17:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbhCWQMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 12:12:50 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51653 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232995AbhCWQMs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 12:12:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Oje6lrwdyCAEGOjeAlXi6z; Tue, 23 Mar 2021 17:12:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616515966; bh=YG6LshkAlh6GTQrdYXdCLe1pXeh5FVZGS2ghk3Dyg9w=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tjeMMHXxjzMsoYFlD6KTxKfJWEQk1M9dDo5hkREMV/kDQ56qIVWBtPJmgN+54jprK
         fezEO/zL7WL89TfAswEchRnLiSBQWq0UWckiVCb+myesUbXLdZpU5B9M0zJSakc50r
         4k/vNRGyfG6BZgL1Tcvts1bqgeQVigLPFGLgQAgqadE9mhKp/A13d0JOgzpjM5ZIez
         JtEJRGOEHO4K5d+J3tiATagwLbL94RCUyoejbmm4jpQEdaqwh+x6xTP5l60cALtQfg
         YTcZjeyPveqMsIcO1GG9BD7bZRYL6BRLhWUziC1DC6+T65VSMPULN8z1jACCNbul18
         0B6+nij+oQTcg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cobalt: fix initial EDID
Message-ID: <c17a877b-2ed4-36ea-509f-db451732ab0f@xs4all.nl>
Date:   Tue, 23 Mar 2021 17:12:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF/59wpVWJcUtraSqlWUgaINs9cIq7x25fpnI4S0uLweDxGPkPHe3vHvQEO/CEK7bLiUO7jJ6gYC5s8aBN9KBb2P8tAiSn4er4cRUKOzzT3eK+qWnJIb
 tsIjiF5/qD2esJXkjbSKvae1dJZLfKtvmmoItGGxwzl5U6yOStvOP5LRi1bxNSLa56gJAqsQMRLNTul9MTz3HmrTx08gbS2lTmQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The EDID failed with two edid-decode warnings:

Block 1, CTA-861 Extension Block:
  Video Data Block: VIC 16 is the preferred timing, overriding the first detailed timings. Is this intended?
  Video Capability Data Block: S_PT is equal to S_IT and S_CE, so should be set to 0 instead.

In addition, the first DTD had a wrong vsync value (6 instead of 5).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 0695078ef812..9c754e01c186 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -56,19 +56,19 @@ static u8 edid[256] = {
 	0x45, 0x59, 0x61, 0x59, 0x81, 0x99, 0x01, 0x01,
 	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a,
 	0x80, 0x18, 0x71, 0x38, 0x2d, 0x40, 0x58, 0x2c,
-	0x46, 0x00, 0xe0, 0x0e, 0x11, 0x00, 0x00, 0x1e,
+	0x45, 0x00, 0xe0, 0x0e, 0x11, 0x00, 0x00, 0x1e,
 	0x00, 0x00, 0x00, 0xfd, 0x00, 0x18, 0x55, 0x18,
 	0x5e, 0x11, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20,
 	0x20, 0x20, 0x00, 0x00, 0x00, 0xfc, 0x00, 0x63,
 	0x6f, 0x62, 0x61, 0x6c, 0x74, 0x0a, 0x20, 0x20,
 	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x10,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x9c,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x9d,

-	0x02, 0x03, 0x1f, 0xf0, 0x4a, 0x90, 0x1f, 0x04,
+	0x02, 0x03, 0x1f, 0xf1, 0x4a, 0x10, 0x1f, 0x04,
 	0x13, 0x22, 0x21, 0x20, 0x02, 0x11, 0x01, 0x23,
 	0x09, 0x07, 0x07, 0x68, 0x03, 0x0c, 0x00, 0x10,
-	0x00, 0x00, 0x22, 0x0f, 0xe2, 0x00, 0xea, 0x00,
+	0x00, 0x00, 0x22, 0x0f, 0xe2, 0x00, 0xca, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -80,7 +80,7 @@ static u8 edid[256] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa7,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46,
 };

 static void cobalt_set_interrupt(struct cobalt *cobalt, bool enable)
