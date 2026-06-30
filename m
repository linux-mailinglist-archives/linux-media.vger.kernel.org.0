Return-Path: <linux-media+bounces-66099-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hJpKB/O/Q2oAggoAu9opvQ
	(envelope-from <linux-media+bounces-66099-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:09:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A66E4A29
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:09:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tL+lQ+dk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66099-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66099-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8290E30A7427
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7071C413D8E;
	Tue, 30 Jun 2026 13:08:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A368439B97E
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 13:08:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824891; cv=none; b=mBb8jweUaz57GoZ/oHD4s1ZP6Y9C05Q5XCxwtFv33Hi+JKMWTM8bYZDsHEDuLygAKDAkc/+ll31Y/LHFhi2ZsUyeMNcfcdd5alLXa5ypGlXDv9PVxT9/aZY7ItyLwculOzCYCu4LzxEnhA26jRnNVtRIvvUKecdQw//xWOo88lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824891; c=relaxed/simple;
	bh=v90WNkUJaI76E3J1bgXlk2sMkqnYwKRFGAk2rrarAXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rt96/asNgmTaO3uspRnN6SclY3LEwVEmik07TSW79r1Alvi8Y7QGWwOQfpQ3+YPjaIzBsGe7YIIf6UXF3p/BVjTdoOGs48PVxkOTS0GRyESbzWCWlDatjirTn51ng6NRQSrLOVSwVkSbxEE8VQumFuhDmt7AcSG7IdERiJYzGEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tL+lQ+dk; arc=none smtp.client-ip=209.85.210.177
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847a483e344so385323b3a.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 06:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782824890; x=1783429690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6j0F+xqCQECDY9wnaqI3d2SI54fqdn+nhFSDa4vOUo=;
        b=tL+lQ+dkfMqIuoo+x8MzB1Mea6sJxlu68YiTCP+pAg3U95nMnugCgZ7YTVf1aOdXLa
         McpMiQLldWGCvDN/M+646ckcqekVVUv+kGwsPStJN7hKTFVLEOpF20NSQqKJjOIGNNxk
         WT/+pnLrt+InWMuMVy2vH0t5eJnuNEsf1pxaA8KIIbhmxGsuDHR9CnmSgZ7+cud47Pqt
         hgvyQkP9jYOSkVJVXZGyp/BwLNh4e/wIi0mMs56mWWKTJNqibv56k+YWZNPsKJTcFh/P
         At+9xio2X1qUgn/05BvjDKIfgvXK6muU3Z9bQIVgmVVI5iHqFZt/V2tytxxiBxdEU5z8
         6+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824890; x=1783429690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6j0F+xqCQECDY9wnaqI3d2SI54fqdn+nhFSDa4vOUo=;
        b=LU6oT6og8rzGjPI5RMWdJ4J7d/qjrmeEQXP3EaUyeyjzWXCYvXPoRYxYZmO22397LR
         Y1vDHzBjDP5+rmsroeBqdY+XgPMS2pADec6jqgT58A9+4oEX8I9UEWroOuEWBGR4Lgdb
         SCZFSQYl9azWZpYhtcc1l0zNEUGPtB5bqgfB06hGpBXXdJB5F63MpUMottv3T91PzilT
         dTsjDb8KNat3QeD21fXAMXXXOv0xnerb9TLrqw6CaMvZBlyBDm6P8ZTHWUz4NQ7toQ7Y
         2rg8cY9kqsuy3Wjw/HZdgHK9qbjn1A1f80uPi8LqQd6ECtm4xtDeFj0owmlYlxBCcdXT
         HjeA==
X-Forwarded-Encrypted: i=1; AHgh+RpHtPCb40cY3W58TzFJAr+hf3CFNbiRTL5oe59YajSsdLzaAQMdtx6P/rTFTYKz8+mR2tcHuRmYxkz5XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/61eXFDIUhYreQukmDnv3Sm+KmLrltOqJ0tJSYQ0YLXFek3xs
	fOm758jBPstJHX1U9KmMHGLCJ5ugdLIo6FwXWqmGsuWLyLCaiL4aBEyX7P/gUOud
X-Gm-Gg: AfdE7cnbvvdle3+w4Q+YwjW+ElqZNbYuUDgVxTEsfDNnfzWCyWBtK8y0ncLoAko5Wqc
	k2E8raaVx3yImcPbwaJKUKvuf8SauM7FEVFraL17myyYJ5aU9D0J+qZ6BVvNp1sBS6pxznANLNg
	fNVyLofVFGltYVl6FL2K3hL03G9O6MNyWlGS8VFGC25l1BU/WBlSC+kIw3gKxgXEIcaQ5NE1Dfc
	uKq5RlpEs5cw9sJDOZx1ztP8O6OOdzESuBLOLL8QU36scUMeHg7qef0muoSalfN0CegsR2e/PrA
	5NdsFiy/h9O2fRZSsXKUc42189iyWBUbp86Ve/FoYn2cnU8vPYopXL+35L4YLq3zbD/osYUJtSg
	QTfHd/YMz5WwnFYVZGZUQrTqvOmL63SGNMFrlQaeEeN66sfkH31oicetJretCecS2/KJN81bKS5
	+GWvqhLkHjQx3zzgtOXYNYEG1P+iExhIkYob7TPg==
X-Received: by 2002:a05:6a00:85a3:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847a7ed202dmr1140309b3a.0.1782824889921;
        Tue, 30 Jun 2026 06:08:09 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:1b46:470e:6375:45a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03a6fd5sm1991541b3a.57.2026.06.30.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:08:09 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: tomi.valkeinen@ideasonboard.com,
	kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: raspberrypi: rp1-cfe: acquire state_lock in cfe_start_streaming()
Date: Tue, 30 Jun 2026 20:07:56 +0700
Message-ID: <20260630130756.28744-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.infradead.org,vger.kernel.org,linuxfoundation.org,lists.linux.dev,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66099-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,m:tharitt97@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 816A66E4A29

cfe_start_streaming() modifies shared device state without holding
state_lock. The driver exposes multiple video nodes backed by
a single cfe_device. While one node runs cfe_start_streaming(),
another node's cfe_buffer_queue() may read the node state via
test_all_nodes() under state_lock to decide whether to schedule a job.
Another case is when node->fs_count is read by the interrupt handler
in cfe_sof_isr().  Modifying this state without state_lock races
against those readers.

The counterpart cfe_stop_streaming() already takes state_lock around its
state modification. Fix cfe_start_streaming() to do the same.

Found by code inspection.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e9..d8ea71830 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1151,6 +1151,7 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct v4l2_subdev_state *state;
 	struct v4l2_subdev_route *route;
 	s64 link_freq;
+	unsigned long flags;
 	int ret;
 
 	cfe_dbg(cfe, "%s: [%s]\n", __func__, node_desc[node->id].name);
@@ -1184,9 +1185,11 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	state = v4l2_subdev_lock_and_get_active_state(&cfe->csi2.sd);
 
+	spin_lock_irqsave(&cfe->state_lock, flags);
 	clear_state(cfe, FS_INT | FE_INT, node->id);
 	set_state(cfe, NODE_STREAMING, node->id);
 	node->fs_count = 0;
+	spin_unlock_irqrestore(&cfe->state_lock, flags);
 
 	ret = cfe_start_channel(node);
 	if (ret)

base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
prerequisite-patch-id: 4c010e20cdeb611d14546bc729b513f959e25afd
-- 
2.53.0


