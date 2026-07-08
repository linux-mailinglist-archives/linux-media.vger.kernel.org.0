Return-Path: <linux-media+bounces-67063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wa6yMEuSTmqxPgIAu9opvQ
	(envelope-from <linux-media+bounces-67063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 20:09:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69C7296C7
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 20:09:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ZYU/zUT5";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67063-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67063-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 770B430A0FA2
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 18:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49903C0624;
	Wed,  8 Jul 2026 18:05:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D026536E460
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 18:05:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533940; cv=none; b=ku/gMi/VBip0J4qVl27G/IBPzYbuLTf+99jjf7BUDAXC9W4ku46dTu8oHFKHYuh3/MVElbc0Zb3JGkUokApaNzt+PpGzBUFTAM7osXZXuN1oLmOIK+BZ7Y4f2LLZWHZLW/zeKhIQm4MLOHPlkW1USxOXqBft6sNOIydX00KU1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533940; c=relaxed/simple;
	bh=mSybehUJynHQTwbTGlJ174ILGlyT0yffKNrbTRCOEB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHgBAW3MXfMmnxGWLDPupyBX1Ozq6J9fXqwkjMkrhk9j2Cd+7QVN9/JAzMiS0VUcmSZJ+2B8/xgKQZTHfZD/uOCbWIxyEl3WJkyf74ihu2QbEvBY0QPrcBqUWxbVUU1Ib0rcKRrWfu2/dk0Ebrk47Gj3GdNzk+88sqUFGGjx7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYU/zUT5; arc=none smtp.client-ip=209.85.215.181
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso640257a12.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533938; x=1784138738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3pVcb1PF24XGDYrC38hDgnfb8Q0xDq9hExE3enlJ8A=;
        b=ZYU/zUT5XW6+kXwOvvx59vvaTu7a59VtdNutobRTLaO3D0o6l35vNz3lEwHGqiDzIb
         CGyNcIbHofTWo8cHqY/gJHZWc8YUBMmXySFxiLStrOPXZxnA0r4ZvaL5EA7JwCXjBG4L
         HQTa495lr1Gmx2b1TAtKkO3wB+VDfvRhCVADFAGZRPoop98ps47ex21myok5p8RnVILE
         YuTqTQ9YaNZJzJrZQ3U5JrsZXLJovRTMMTmZvscOOynOW3Ck1/UDs96u5yEEYNSjeZKY
         fKZ6eKPI/7Q95vz4HsQLYkLzbrZkZIkHEWZ3RGfpy8J4deRY5SY3a3Gcy9UpElGr85jX
         A2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533938; x=1784138738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3pVcb1PF24XGDYrC38hDgnfb8Q0xDq9hExE3enlJ8A=;
        b=e0rhKfco9/FwbXycAcr3UbqGAt/Wsij5jZ6ML/ADfGgk9BVt8OePbxHCDD/zOT2s/+
         gw677bQTkQHMPXYn6crLsERjQQKNwgaEOgS/GY6r8uE9e3NMeZziXlKqJeiegEbKTpQR
         BBe4X99P36sOU5Gu9sxHnu5QKeeeOcdqop99kxMUC+mTjUF3RqRAKunA+1zO3yz1N4PN
         sF2OheNxWls9ChQhWr55K5leBaA+jCISVc1/OKd9wbjesg9f53/vrtEMH6e93DAQr/3K
         Z3Hj7VIIymswV8153Qn2o+fuQ6kAsOzHEvYucC+XOe8xMNhNrBuFXcmnszihHwbSfZpN
         Irgg==
X-Forwarded-Encrypted: i=1; AHgh+RohYJZhqDbvXeYIrs0dIXMhIXggGtVgEvdh8sNI4bSqSOrlxqkQs+XA2Jo7/P8XyuuYtcVXQG/wVmcnzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp2IN7cl8p+STY4C2yolrefFAGc8RH987cXL9QXBO1AVluNGGl
	jSnBD9l9rr8dz2FM0PN+7G2jcbvviZqsbCz4fWIrAJSXjasznCvpERg7SYCKduS0
X-Gm-Gg: AfdE7cmEss5l/duhKE5zsWcDRyFdBprqQupdu7JykBMgnMv6CUOJHPF2v896PTVu2Xj
	mdxBNIWs3eCTLCYvpRyxfZ/DQM2exiZTQ/mfRTZJi80gx4n8otqqowU16KWr+iqReiYIhfqEb/F
	3DDUHW11h51nGKZxCgcg3FRtU+w92ZV1tKgrTX2jRBhud0tnUMxzNzyb2TXy+9r+QqB/rrJdQdl
	MoRyCWudbv4ie8+lpVVL7GF9PKw5nXxCB82Fu1Ig2zoPuJl7tu0QJKOIrQD3YJUbpTGg6h61lwb
	+kzcrHoZ4tB2/1/EhK0ai69P1p0M9HSpykPZgclsiuN/tObbobnER0ntRT59IW9fA+s8tFgmwBc
	QPMGKWWC+/Zua/1r7CMvYzeoJsUV4vSRkerwWLSna1DG7lgHDuUczlSF12eej7Vk3GOvfLhUM4j
	+MmG+Z9/IXsl0ACCv8YkUlz/LU6yNFOl+iDDndVOLBPIw=
X-Received: by 2002:a05:6a20:9151:b0:3c0:9c19:65a9 with SMTP id adf61e73a8af0-3c0bd32fd9amr4326445637.65.1783533938162;
        Wed, 08 Jul 2026 11:05:38 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm23721887c88.12.2026.07.08.11.05.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 11:05:37 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2] media: v4l2-subdev: fix use-after-free in v4l2_subdev_get_fwnode_pad_1_to_1
Date: Wed,  8 Jul 2026 23:35:29 +0530
Message-ID: <20260708180529.57414-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616092516.32617-1-birenpandya@gmail.com>
References: <20260616092516.32617-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67063-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iki.fi:email,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A69C7296C7

The fwnode reference returned by fwnode_graph_get_port_parent() is
currently dropped immediately via fwnode_handle_put(), but the pointer
is subsequently passed to device_match_fwnode(). This creates a
Use-After-Free vulnerability if the fwnode is freed before the match
completes.

Fix this by using the modern __free(fwnode_handle) macro to ensure the
reference is held for the duration of the function and automatically
dropped when it goes out of scope.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>

---

Changes in v2:

- Rebased on latest media_tree.

- Combined the two mutually exclusive v1 submissions into a single
  patch utilizing the modern scoped_guard/__free approach.

- Updated subsystem prefix to 'media: v4l2-subdev:' based on
  historical usage.
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8a..e6b133ef78504 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -7,7 +7,7 @@
  * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  *	    Sakari Ailus <sakari.ailus@iki.fi>
  */
-
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/ioctl.h>
 #include <linux/leds.h>
@@ -1243,7 +1243,7 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 				      struct fwnode_endpoint *endpoint)
 {
-	struct fwnode_handle *fwnode;
+	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
 	struct v4l2_subdev *sd;
 
 	if (!is_media_entity_v4l2_subdev(entity))
@@ -1252,7 +1252,6 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 	sd = media_entity_to_v4l2_subdev(entity);
 
 	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
-	fwnode_handle_put(fwnode);
 
 	if (device_match_fwnode(sd->dev, fwnode))
 		return endpoint->port;
-- 
2.50.1 (Apple Git-155)


