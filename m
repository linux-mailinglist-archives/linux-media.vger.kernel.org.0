Return-Path: <linux-media+bounces-61326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFJyO5oLBGoWCwIAu9opvQ
	(envelope-from <linux-media+bounces-61326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:26:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4E52D85B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5C40305788F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 05:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAEA3A4F2D;
	Wed, 13 May 2026 05:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLwY1zB3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3303A48D1
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649985; cv=none; b=UXXLz6++uxbeA8/PuTIXgBLQrwMpkOoJnRK139YuXCNUrnQxl7uZx4be3hvQBdO6vS2aaVn8NkE4ghRTySvQi0NA2URb8t5OaVlwTzQramkfuOHQoELgGFqUFXrIidEUd9fCFQJUX+r2xp+iwtaTS1LwwoHJXS7c4/TSYO2CYoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649985; c=relaxed/simple;
	bh=0h6TEAz0bXh3QxqRR5NEOAou4uU85YPhh8lLus2WFTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HMYl9v1IlPWYXEZfmYLGe7VCk5S8WcA8IuuSVm73IGte9A51GXclXb7ZDSI0NlG3kQ4niy9bFyPVH2iA5vxx1Ogd6IALrvpMuqnyjN6SDoVLT5ZWwGHvlwtl0AO2+F+NrFwYLvD1s2xNgtX4BCMplam7hWV37JnnaICuoUye9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLwY1zB3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso72050905e9.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 22:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778649982; x=1779254782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=426SbMLkPYdeGvdzy70ZIE65WsPyaPVfmpdak1PcYqM=;
        b=eLwY1zB3kScY/Xn75epXhqUPYTGikeSvtoZQrsu2X+RBKc/UAtAjDLqf2nbb1Ev8mt
         vvtIY+6YhqoZP26pcgX6PoEPfjGstUSkCvnWGb9+Lup9C+ozsTPRZQeLj2LK7sxw/96H
         KxsZbcOh1+mf/wHY+OjSKMk6UQrt2kyernWIF3cE1C39y8dKqep1vI1+NKel4gOqjDVi
         sFAgKJGLRL952RhrfTtwlYc7Kkk+hwm+145lL4G0GHeFqbrRP1+VEdtIAr9ivRutjFle
         0LaJTqLu/yxUSY6QRbr+DHsV2oqwX+CEmFWqq3XBntf7bLqrL6hG/LzJJPFjKDbJJjy4
         hqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778649982; x=1779254782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=426SbMLkPYdeGvdzy70ZIE65WsPyaPVfmpdak1PcYqM=;
        b=C/yuIu+hPNvUSS6HEdw3dND4NB5oyp+QtBOw6jVVTK02u1wPuXdWAcLYyUtPtDwePo
         TwyMKQBxz9716J62V6HWOXSyYGxMp0gMPtahhGRxybk6mSwvV0u6Z3n9eZc3soR+4YsP
         /RWnFLGgw9t0O2/iG1JjOjbSyg9K6IYKDegYO4OK+ts9euEMLcyPR1a7r5owQ3jZUdVX
         UxjtB5OZAXHtL8jPI4Twe3HhvLeCqhkUB9a86WXVNMfrbI5XGOPLabDJSuKwJv91CIV2
         WGp/AOaUGpHcEhwLiCrCnEocRcB5tCeKoR41qtINU0SgU39faTjUR6nUEMCiZgSNXpC8
         Qy4Q==
X-Gm-Message-State: AOJu0Yw1LIQutWR5D9s7GIdwqUEspO3NufJn+5zdBpSy6p4EOYpgb1XX
	LWwGIWaBWEAKUDP6jYVVA+fUu230/d/kIWFqHRMouKKvqjk+DGTpqGdyCvyJk/WS/nElH+S4
X-Gm-Gg: Acq92OEaKIPFY/MCH1Zkz4gIC3/e+s5CsMM8YLFzmAgcGbkTF1yVYGMFW7YqgzStrsY
	1uEKcxr+s9A0A8ZTFrDaWq61hp+AeRBRwT16uGowBvhqXpgnwrLLUDK29ECnyhGroeCIQUGz32k
	HWd+QWqEZJrei87WWExtnLwvapOFZ4wZIxnqUchps6BE2r8ObXAPmdFxcq4/EInlpPzFIeKSYHa
	/xzmH/S6DAfkjj9oi/TCp7M5skT1eg++HDi74UsZVcnkfm/a7Pdq3/WWmlxWIFGzHe8VHePBOBo
	tLK99a4SJZNZXkzCbepiHJC+iXgba3YODz3Ax4FX57TDCHLKOS33s4GmT3wFoI7ajwgNhJhX+Ns
	3Ixj7VjIGWC9s8FoC2GDM5vW7LQ0TtMuufLkZfFFFgA/RwDMw73VZDh8NdKNzZ8O4pmU2e2VWDh
	qkNqS8p4Uj0ax0UBGvosWSfYcAZB63TMlS4EOP0vOX0Tv4Sw9Bx2yoMwa8
X-Received: by 2002:a05:600c:458a:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48fcea00708mr12819255e9.27.1778649982055;
        Tue, 12 May 2026 22:26:22 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([31.7.57.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm50775435e9.11.2026.05.12.22.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:26:21 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH] media: airspy: Guard stop_streaming() against disconnected device
Date: Wed, 13 May 2026 08:26:17 +0300
Message-ID: <20260513052617.140688-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 91F4E52D85B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61326-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

airspy_disconnect() clears s->udev under v4l2_lock, but
airspy_stop_streaming() unconditionally calls airspy_ctrl_msg() and
airspy_free_stream_bufs() afterwards. If a streaming user closes the
device after disconnect, stop_streaming() runs and dereferences the
NULL s->udev:

  airspy_stop_streaming()
    airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0)
      usb_sndctrlpipe(s->udev, 0)         /* NULL deref */
    airspy_free_stream_bufs(s)
      usb_free_coherent(s->udev, ...)     /* NULL deref */

Mirror the precedent set by sibling SDR drivers msi2500 and pwc, which
already guard their hardware teardown block with an "if (udev)" check.
The queued-buffer drain via airspy_cleanup_queued_bufs() must still
run unconditionally so vb2 sees its buffers returned.

Issue identified by automated review of the INV-003 series at
https://sashiko.dev/

Fixes: 634fe5033951 ("[media] airspy: AirSpy SDR driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/airspy/airspy.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 8f6b721ba107..50db02d35213 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -584,12 +584,14 @@ static void airspy_stop_streaming(struct vb2_queue *vq)
 
 	mutex_lock(&s->v4l2_lock);
 
-	/* stop hardware streaming */
-	airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0);
+	if (s->udev) {
+		/* stop hardware streaming */
+		airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0);
 
-	airspy_kill_urbs(s);
-	airspy_free_urbs(s);
-	airspy_free_stream_bufs(s);
+		airspy_kill_urbs(s);
+		airspy_free_urbs(s);
+		airspy_free_stream_bufs(s);
+	}
 
 	airspy_cleanup_queued_bufs(s);
 
-- 
2.51.0


