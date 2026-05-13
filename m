Return-Path: <linux-media+bounces-61328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOGVENoSBGoMDAIAu9opvQ
	(envelope-from <linux-media+bounces-61328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:57:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0452DDCE
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46867303E240
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 05:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D537F3B7767;
	Wed, 13 May 2026 05:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOOCPeRI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC73B83FE
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651862; cv=none; b=JhP8j64yLJ+tzseY6dpUQyeS9/jyT9vBAS9tG7EKsh5llDibfiy2ZMLsJU5vuFmMC3WcfNV6V7xglvK9Cfm8LIJEj774084vZeE1ahu6XJ9fATI9bVrpVep7TJY1SvJwEUbWXQ4ZNLoEbL98zO88ebXNjkskdzJ7KlNT1VJQnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651862; c=relaxed/simple;
	bh=s6BfnkAql2MTDlPesu3S+RGrhsYSXwRQZEBa/vKhnW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nHJYKfi2iZcvJ/adWN/EGHrSXe77EEEjMJb81l2DGVKIcQ5CxElLqQFjvUgMTV1rFWha8tsdc7TaLB31vquSWk1Z22ABgSpiXNQoURXn5d10VsdPqICTiEw4TnoZvmVL6tnfXSmM0yWVvthQf56CPlGKDdmxbr8gT3i3+GF4P48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOOCPeRI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48d102471a4so62309215e9.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651858; x=1779256658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUFuofREYZSwb8K19QV9xCXORpxZYXHR7ZkCUNHTKDk=;
        b=YOOCPeRIlPCyljhgquYup6R2864qZ4Z4CKhL6i/DIZspLXlGE/Eaww7bHzsb31Kb9k
         ECV4DQPn2HZqtSuJEaof2FA2Fjafg6xgPgEb2iNyQqwKG0DnxWn2CcZ5IdPL8HiriYir
         EQPf2LQCPp3kHi9AiTNUTdX4n1AXOVCXepTZs92xHCR0ruS5X1Z0wXYADR9o/ax2PNNl
         xBA+Ilx6eQWLroi1PN2yJPVoOVd8QC9x+4b2ZGeoTplfrVnPDm3aT+Zrgvz/j3Mc9M6X
         C9omFhc5DpUWFLAEFFSzQZhNDuEayYlz3XMcXsCIZ6QTbAvaqZpwaT5DfS3NYy/OazS/
         4otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651858; x=1779256658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUFuofREYZSwb8K19QV9xCXORpxZYXHR7ZkCUNHTKDk=;
        b=jbc/IWYUstsInJ9Iulsv8sMmd0y82zRuUG6n0XQb17zclmg3gVK93/NqzXzVmdpYhY
         uyJHZFibGC3SvOdlRpsOFdzwzrlTGuX3zAp1sk9q1O7wHQijf9jsqb9P7opPd6EaN8xK
         jfnNC76k6NWd9cbONQ1LPiBWw59TbnF87YYLtJcHeGmxuG4NJP/Yl+nq+SeEb/R0gs2K
         r5mGrz6Y8ySZ6yUdTIfvZ9iX5IxSoscrCJOyYp+dG5n7n86nEKaqOnN43QnePChloSOl
         jNB+ryH5FKsTG3UZ8F37Om7DSeq1L4QIJ06eO/0Cw6fkmMr5Zg4OvC8qNoOkLkP9AHx5
         yBvA==
X-Forwarded-Encrypted: i=1; AFNElJ+0tqq78oJTzugXW5fKfItd+Xfsy9DcGxbmz9RvEJs6KbGc6nZLUgcEWDckPLGHDmX1H2nt8GwIpLn/fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hsE0LpQhsTRq0CTcrbBNC06PMaPtnIgKSIR3RSlw9p4HJHXN
	Fs/KbzOFzPEOqE4XC9t3du3WiN2+nzaMY+VV/did8EppH7iCGgQNvsYs
X-Gm-Gg: Acq92OHvxFgobBZt/0q21850U8PP4svPNFRQKAbFW88cWI6fX5SRw5oQAQMjT41axbe
	QTku0KztLSz/Ga0Bz3b6498jmFwrs5RwoJKgom/pUZIK13RPOB7ERTwBRQ0acsRSIgLd4sloFgg
	T03NSO0r64UJ2egovbexDS5UzPGBBwO8H3OzwqHx7qqfp0k2r+TFpfp9rXvhxpkgw0Zi1qiTWJa
	XBcrfEJfyAHzaTtCNI5OoHWFTKct/B3XKLh/f/sozZ76gppdDRjZ4Lt8q5oxKuCKR14/KZTNfUu
	0b20wvfMHzG5E8U2/t4nYp/JHEGsn+nPuBo/SX2Vw8OitkFdumDKammg8TRDsRIAg8EPNsEeVtr
	/9YvHE6DnIJojoaZjvbfb08LbVhWR+4iRXf1o3ZqVvuUUrNO+9sNbw1BruTvEEo+8Azu1vYTVVb
	VkwAKg1eKGJ2kUgs+kjlWRF0BuHvGmS35RjDCZ0bewvPJwz6QuJnXjpp02MLe9/O/59aM=
X-Received: by 2002:a05:600c:6096:b0:48a:592c:e63d with SMTP id 5b1f17b1804b1-48fc9a30d10mr22234605e9.14.1778651858485;
        Tue, 12 May 2026 22:57:38 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([31.7.57.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120f1f9sm38447271f8f.24.2026.05.12.22.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:57:38 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: mchehab@kernel.org,
	crope@iki.fi,
	linux-media@vger.kernel.org
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH] media: rtl2832_sdr: release URBs and stream buffers on start_streaming() failure
Date: Wed, 13 May 2026 08:57:33 +0300
Message-ID: <20260513055733.146905-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D3D0452DDCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61328-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

rtl2832_sdr_start_streaming() calls rtl2832_sdr_alloc_stream_bufs(),
rtl2832_sdr_alloc_urbs() and rtl2832_sdr_submit_urbs() in sequence and
shares a single err: label that only unlocks the mutex and returns.
When alloc_urbs() succeeds but submit_urbs() fails, or when alloc_urbs()
itself returns -ENOMEM after alloc_stream_bufs() has already succeeded,
the URBs and/or the coherent DMA stream buffers stay allocated while
streaming reports failure to vb2. Two latent defects follow on the next
VIDIOC_STREAMON:

1) rtl2832_sdr_alloc_stream_bufs() unconditionally resets dev->buf_num
   to 0 and overwrites dev->buf_list[]/dev->dma_addr[], permanently
   leaking the coherent DMA memory allocated by the previous attempt.

2) rtl2832_sdr_alloc_urbs() never resets dev->urbs_initialized and only
   increments it. After a second successful pass urbs_initialized can
   exceed MAX_BULK_BUFS, so the subsequent rtl2832_sdr_free_urbs() walks
   from urbs_initialized - 1 down to 0 and reads past the end of
   dev->urb_list[], passing garbage pointers to usb_free_urb().

Mirror the teardown that stop_streaming() already performs: on the error
path call rtl2832_sdr_free_urbs() and rtl2832_sdr_free_stream_bufs()
before unlocking. Both helpers are idempotent (free_urbs kills and zeros
urbs_initialized; free_stream_bufs is gated on URB_BUF and clears the
buf_num counter), so partial-failure paths and the no-allocation paths
remain safe.

Issue identified by automated review of the INV-003 series at
https://sashiko.dev/

Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 422d1a7b5456..efcef1317cf9 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -900,7 +900,13 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	mutex_unlock(&dev->v4l2_lock);
+
+	return 0;
+
 err:
+	rtl2832_sdr_free_urbs(dev);
+	rtl2832_sdr_free_stream_bufs(dev);
 	mutex_unlock(&dev->v4l2_lock);
 
 	return ret;
-- 
2.51.0


