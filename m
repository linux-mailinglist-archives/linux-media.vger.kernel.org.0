Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5548834778E
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 12:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhCXLkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 07:40:16 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:52077 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231426AbhCXLkG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 07:40:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id P1rllxbCICAEGP1rolZlyg; Wed, 24 Mar 2021 12:40:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616586004; bh=+MzWn99I4gddES0IMD23u/jTiutwZ8+61JnfW7n0Fqc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qBDJx5wkZWeVS5mG5WKCtl1aGSz6Ux8sSWkZecdmA3desHR9FBAvo1OdFingrZYne
         bs1jVXUyvm0ZBciYvdUGXo0yr0/Bhj0gsqL4J2W/VOFdzxFU66v8GBBpjT+uU35Hpy
         ci9mRyrn+xJB/GJ1SLAR9Bp/h9dpPV8wwTwXn8RjL5iQA6amCped6rTC3mRrMO/Nae
         annTn1YAQ3vBWdUvNJaar6xe0qV7O7y2ouIEhi8bQpIUmROZcaapRIyiVSl5H3tHMX
         tYGYFE6UjoTeScdhoQ2XfJN+u0jeHfRin19+dHn6thsTA2ckhQ+0xANdJ48B9pia+G
         I+rWE0t0+evVg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vivid: update EDID
Message-ID: <a9780fba-3375-61a3-010a-495094172fdc@xs4all.nl>
Date:   Wed, 24 Mar 2021 12:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIu5nWhaIdOIgF7b8eqFajbxK9QsFkGTIGjRwKQ6KJyfd5YeovWavaTqxNfVk+KvfGHs0jOmyrWX6DMI1LoW0BhcbU35bKY2QMjPqEMl6ujmW2bQTJzg
 8XG60JJIa3JFxHhg0vjDQNwkkliyPxVsUHHmrqgv1uCD3elWlsg50xXcCugDy3r1mxDkSA9jI5OpBWFizmrvMmgzfGHOuhzLZRE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The EDID had a few mistakes as reported by edid-decode:

Block 1, CTA-861 Extension Block:
  Video Data Block: For improved preferred timing interoperability, set 'Native detailed modes' to 1.
  Video Capability Data Block: S_PT is equal to S_IT and S_CE, so should be set to 0 instead.

Fixed those.

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
