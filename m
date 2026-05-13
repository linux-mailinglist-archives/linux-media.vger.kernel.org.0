Return-Path: <linux-media+bounces-61329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED7IIC8TBGoMDAIAu9opvQ
	(envelope-from <linux-media+bounces-61329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:59:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E895B52DE36
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C64AB30B3488
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 05:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5293B530A;
	Wed, 13 May 2026 05:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmJz9zxi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534383B841C
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651874; cv=none; b=dSSF/ADLw9szjm7yf2pFXTnm2+WT1ZiykcXUJjjgCcjXH9+s/OWidtHX4dyLdMvw0IIdO7ca8ECGAdWrltDHZKRfXaYUeHSvUlUIjGuj6lbWVChZGMhGZZHwltcuWRCwZF9D70kEglC+SFUU8JzEepM+L8XV8G4yl6n986nzMa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651874; c=relaxed/simple;
	bh=TDlNAtlCXiNocCZK6YySKkE/9f3Hcn33gL0f6Cl/y34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s7WD1EFbvUVd3j1zOP5WuGuCY1YWjVk7CLjLwd7v7lUF1akpDLjnSlPbO/K7BbXfsxxsfme6DjbGVM/IgeJIs3v0c8/KJw48AdjYChiIR/msf308b2RHUrxEgVfGm+a+cQBvaICO5/AQiziUlcP/nGQAVbJVIWUFQBqhR3TGjwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmJz9zxi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b150559bso49234305e9.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 22:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651869; x=1779256669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEQj27JotGwcy3B3913f7GCdMKTwi/C//9qHIUHYfrE=;
        b=MmJz9zxiERxMUA1EFaQ2sbYxl4akeB5L7TUAokzljRB7slZhKImKs09DPTatQLNz3U
         ET/U359gp9jJEgk8a80w97XF/4e4am96LxPJqxH/8TTLdYRymXwNp1pOsJPtsmn0rOXM
         rePEEAZY/RHOAsgMZErL1TG2tlrFeG3BJtfChOgtQkiTUkSYHSob9OUttESN6cAokAn5
         OX0iIsSDDnppHtW7ejlanvszqaDFmF3Jw3QYkD1AlrVkyPM1TbWXhNQg/FfK26k9inkp
         EFJ2LR3d31/c580seO4Hl7V0rCka3Uxu1uPHW73XBpv5nApepKPTfm4Br94onwbPfIC2
         8xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651869; x=1779256669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEQj27JotGwcy3B3913f7GCdMKTwi/C//9qHIUHYfrE=;
        b=hDgyt9UINALM/k/AneAqt/5yR9TUfOhl/kTeqT6VjgdBhrN1Y6y8D3j02UEnRT/iby
         rIED5l4Jdv23eZjrhcWLGM/5eJcEi2cU67VrzL0bIPwKu1AyLU+9UBE93hXqT6552oiV
         WqkVzsPR/xRbh+rkUxySsEDVCN8WjEz5GvHZwlRoOqeIum0dtWgw5S0DeAUfeBAFpvyq
         PhS+9uz/uF1bohIq0GgsMbhb/IN/hTTfA8U4d7orCzAIFArAsX0j2dSJv4PTFw9+3k/k
         xn00UmVe+fShezyOOETnJA+zWLoNQGVDmbzt+2z00Xbu4PUmTP5e/O7ZQcW5ZX/ATkHW
         ErsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Lm5wG53hCDeOu7Vi7Kp3n4b8JrISLVDzLmVZXuD4QCTewgF4fT54zRHXxMAvl/9W3gb15TyDswajLmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQUTDwL0GR/1ae0tU5lFP3BdkPdsYJXyMlh/m+pPAocmg+DKT+
	XSVlJ9zVUJdJ7HUfmCKtUM45qien+/5bVhHDzoly4/P5ZPBXE5isZ3B+
X-Gm-Gg: Acq92OErY9wf6qizRoZ+niX0mW9P3PVkwtsfuOrxn8RI9s3KFzY1dz+tTE+B8oPstfS
	0edLOCrvs7IF49FKev4nn2UvCTLDvuq9Wb2LRp9hNsklzawFb8IXFSUJiUTXBXvaFtMmvMUy2zV
	MXU+POJHn/0AMkoU28/IAe6x7UR9pwvnv4/p2BJvPtSd30lGEXpOXmJsd2Ji/IrncVjmgZZ5y3L
	+n8wtBhsNaw/bkidz2Ih2dx1pO5CeFu9STVRZPFrnxHkA53it5CgCEHWoZqCI+ZfcGzqDFuFjo7
	W6vUcFC8PSdvPbdefkrrt+Q1V2ndWT4MCJ5O+1iASOdOozvHaySAN9dbf/znYRjlR7hCv4KW4JS
	CxHR+i02z8QVVOzuVN2EE/r65C7AOghvFdMdxzJX+Don/0zGowuElKvKGVSxNVM4Gcg0QrZe2Ea
	M0sewh82g2e0mzvhkUyGBnxKbUX2zae0JMeDmUGcHHeuaFqT0+x2t/mneQ4pb9bLsua2k=
X-Received: by 2002:a05:600c:698d:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48fc9a31279mr24251685e9.14.1778651869210;
        Tue, 12 May 2026 22:57:49 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([31.7.57.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm59724455e9.2.2026.05.12.22.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:57:48 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: mchehab@kernel.org,
	crope@iki.fi,
	linux-media@vger.kernel.org
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH] media: rtl2832_sdr: free DMA stream buffers before clearing udev on remove
Date: Wed, 13 May 2026 08:57:45 +0300
Message-ID: <20260513055745.146998-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E895B52DE36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61329-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

rtl2832_sdr_remove() runs on USB disconnect and immediately clears
dev->udev to NULL before any pending streaming teardown can run. When
the user-space application later closes its file descriptor, vb2 calls
rtl2832_sdr_stop_streaming() which in turn calls
rtl2832_sdr_free_stream_bufs(). That helper releases each coherent
buffer with:

    usb_free_coherent(dev->udev, dev->buf_size,
                      dev->buf_list[dev->buf_num],
                      dev->dma_addr[dev->buf_num]);

usb_free_coherent() returns immediately when its dev argument is NULL,
so every DMA stream buffer that was live at disconnect is silently
leaked. The URBs allocated in rtl2832_sdr_alloc_urbs() outlive the
device for the same reason.

Tear down the streaming state in rtl2832_sdr_remove() while dev->udev
is still valid: call rtl2832_sdr_kill_urbs(), rtl2832_sdr_free_urbs()
and rtl2832_sdr_free_stream_bufs() before zeroing dev->udev. The
helpers are idempotent (they clear urbs_submitted, urbs_initialized
and the URB_BUF flag), so the subsequent stop_streaming() path from
the vb2 release sequence becomes a safe no-op.

Issue identified by automated review of the INV-003 series at
https://sashiko.dev/

Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 422d1a7b5456..817d91faa598 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -1470,6 +1470,14 @@ static void rtl2832_sdr_remove(struct platform_device *pdev)
 
 	mutex_lock(&dev->vb_queue_lock);
 	mutex_lock(&dev->v4l2_lock);
+	/*
+	 * Release URBs and coherent DMA stream buffers while dev->udev
+	 * is still valid; once it is cleared, usb_free_coherent() silently
+	 * returns and any later stop_streaming() leaks the DMA memory.
+	 */
+	rtl2832_sdr_kill_urbs(dev);
+	rtl2832_sdr_free_urbs(dev);
+	rtl2832_sdr_free_stream_bufs(dev);
 	/* No need to keep the urbs around after disconnection */
 	dev->udev = NULL;
 	v4l2_device_disconnect(&dev->v4l2_dev);
-- 
2.51.0


