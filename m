Return-Path: <linux-media+bounces-66014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xGp1AWS5QmrmAAoAu9opvQ
	(envelope-from <linux-media+bounces-66014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:28:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136D6DE0B6
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:28:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="h0akbw/t";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66014-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66014-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB48E30786C8
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE96B38837E;
	Mon, 29 Jun 2026 18:26:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4F438CFFA
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 18:26:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757618; cv=none; b=ls0YOHynVL/6NYmPZhn8TRCTYlQsyly1wm2rwNaCRsa7sjicKVLF0XmnwERjBxDwjQskv+WvmI5/agN/Q24eDzDEvml0WYEi1VgIpjSJmheQ9kQrvEtnoL7cKfmHB7t41tc14Hgm7ptfLeIGrKQog11WjTFfvFg2A9UG22KHWLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757618; c=relaxed/simple;
	bh=0ebHC/hstyj0wjlj0kskEFoFGwitye8PL1EXS8McsA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsqoQbbfBA4UyrbSvmif2JThBfhKD4vQ0Mziw+a4OjLERhZtm3B6MuuLfQc5aomlNl44AkItJFLJpzOu37eyrCXEkrUFhSPQNL87C/OrEK/CiGgHBVdrav/KVAiDwAFO3MPzUv4R/b7N6PIFKkmsDytFCRosu5p27tcHE+M33HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0akbw/t; arc=none smtp.client-ip=209.85.161.47
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a0ddedcd00so1247219eaf.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757615; x=1783362415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AQTpsVzRpC+zf26L7LUyWJjE/Coy2QLQWcnuwrjCys=;
        b=h0akbw/tTg+X19znVcmcHtgsGsc5tuv1/QJxd8KMjhvaDpQ28Aioz8bLk+i8H3nZY/
         QVfQvcDV+MXA6O7VfBANcXrzeOBUmL22IGzgY/2v5OD97dKbo4gUTBjQi5bConOhdeuW
         agPAcvQoAWdRnUlP3lPxuxPIgSZqZWoJP50KSWQyFqdseZowAJ9uI1Mfy3gPF3+oGxTh
         jCGm7KdAkj9n+vWmOn/oczVtUuqaZaHhLM/cGHx588gPx7KHZwq1qD9bDyCI6BHZaFqk
         f+c2hRRKpKRHIe2qEX64gfGeeUK7V2ClcNiDodGbSiCD6bCBdjhS9Z/PZeLaz5AsAv7w
         xYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757615; x=1783362415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/AQTpsVzRpC+zf26L7LUyWJjE/Coy2QLQWcnuwrjCys=;
        b=BRpEiTNrxnq0ws+3FvIGHiZ4FOzcgjzYrdCb979A0V4HEmmHlD5iUDtbo7DCPpEcq5
         ImeHvryz83JgxU64ZVOIMd89IsUlZf8iPCQlXhY4Xc8Y1PsOxeQ4Hgm+G93nCB924j8q
         6qhwuettNNDRj8Prw0VAu9A8g/uPLgO09e6/oI4SQmrgnp8eG14Mzxr36JwRzhfuFKCR
         9tnE/0FWMlOqvLYWt7r7+ukOyNkZ1xXfXEIru8fB6wyhRVZvTlTCCDBvj+/BRODtJTjs
         4Ua/eR0HB61MUI+4HvsBKdz+zOQKSBc278jHIWZ6kVoHUPKnttN4Uf+6V6CNwNOeCSZE
         vWRg==
X-Forwarded-Encrypted: i=1; AFNElJ/W1CXSjlJdzIuBXZgWdDVppGqziApaY8gNGP8mkYB+aeGQqgzUPNAUNbhtNXVv/z4DgVEqvQD2fKoAXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLAzjoP1ucIXIT3bVNnJ++TDf0tObCKdU/Y6iSqRQeK/uHY2RN
	Bu+Czqcpbnor2h9mX3R3OGTxSgBdhj+wdb0pS6PnqyoCYYSWHIO9+jeo
X-Gm-Gg: AfdE7cmosxPVRHbgfTFY7CZyj2yjc+Ko+AVPzY5iL1h7sN4fASMKTDwV7xPxiufXIqb
	hs67NfVmp+iXCkE20CkRJTN05OCj7s4MDk0WkemAqLQJbcrO9poH/jHCOHpHRQrFhcNA467b6RJ
	E8wWSuMW/e4s1F6h8jO3tuGYMdDWAyyNLRsNEOYXkhDJHDDr/u7vRRgV5zP1jdB5PSPiIiX7eGi
	cRCgEDttGPdpcG9OPGUMyPcz229pqjyAzbURKbYZQ2ZMnPPRRs1y6C1PnrjKWbtQR+sHgARoPwh
	J13QDDmFSC1MP6BwIICWkSE568tRb5WCYahnlyjU3b1hksvpibCbpUvn52FLQnQfx1A0xT2TCqx
	p9v47Sq1uNsnXmGBcs/coJrtlKYiqJojls5CQPkUzGw9HhVxwaHCccTPFGNFakSpa34G6xmXCSv
	lmvMy7xu3GNoxAO9eXe/TASCxKIhw2/aTs9vT7aX3N/SwfE+f6i1lehdOmcmoZmA==
X-Received: by 2002:a05:6820:e0e1:b0:6a1:76d1:a14 with SMTP id 006d021491bc7-6a1892dc348mr464856eaf.69.1782757614942;
        Mon, 29 Jun 2026 11:26:54 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2ba18esm396875a34.16.2026.06.29.11.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 11:26:54 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 4/5] media: hws: harden video DMA queue ownership
Date: Mon, 29 Jun 2026 14:26:48 -0400
Message-ID: <20260629182649.247879-5-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629182649.247879-1-hoff.benjamin.k@gmail.com>
References: <20260629182649.247879-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66014-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6136D6DE0B6

From: Ben Hoff <hoff.benjamin.k@gmail.com>

Keep no-signal completion on the same queue ownership path as normal
video completion. Program a newly selected buffer before publishing it as
active, restore it to the capture queue if programming fails, and report
the failure without leaving stale active or prepared-buffer state behind.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws_video.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 3a7b2abda502..58bcc2e7030d 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -330,8 +330,8 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	struct hws_pcie_dev *hws;
 	unsigned long flags;
 	struct hwsvideo_buffer *buf = NULL, *next = NULL;
-	bool have_next = false;
 	bool programmed = false;
+	int ret = 0;
 
 	if (!v)
 		return false;
@@ -354,22 +354,31 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	if (v->next_prepared) {
 		next = v->next_prepared;
 		v->next_prepared = NULL;
-		next->slot = HWS_VIDEO_DIRECT_SLOT;
 		v->active = next;
-		have_next = true;
+		programmed = true;
 	} else if (!list_empty(&v->capture_queue)) {
 		next = list_first_entry(&v->capture_queue,
 					struct hwsvideo_buffer, list);
 		list_del_init(&next->list);
 		if (v->queued_count)
 			v->queued_count--;
-		next->slot = HWS_VIDEO_DIRECT_SLOT;
-		v->active = next;
-		have_next = true;
+		ret = hws_program_dma_for_buffer(hws, v->channel_index, next);
+		if (ret) {
+			list_add(&next->list, &v->capture_queue);
+			v->queued_count++;
+			next = NULL;
+		} else {
+			v->active = next;
+			programmed = true;
+		}
 	} else {
 		v->active = NULL;
 	}
 	spin_unlock_irqrestore(&v->irq_lock, flags);
+	if (ret)
+		dev_warn_ratelimited(&hws->pdev->dev,
+				     "%s: failed to arm no-signal buffer ch=%u ret=%d\n",
+				     tag, v->channel_index, ret);
 	if (!buf)
 		return false;
 	/* Complete buffer with a neutral frame so dequeuers keep running. */
@@ -385,10 +394,6 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 		vb2v->vb2_buf.timestamp = ktime_get_ns();
 		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
 	}
-	if (have_next && next) {
-		if (!hws_program_dma_for_buffer(hws, v->channel_index, next))
-			programmed = true;
-	}
 	if (programmed) {
 		wmb(); /* ensure descriptors visible before enabling capture */
 		hws_enable_video_capture(hws, v->channel_index, true);
-- 
2.54.0



