Return-Path: <linux-media+bounces-59348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SARPI0Ah6Wn2UgIAu9opvQ
	(envelope-from <linux-media+bounces-59348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 21:28:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063E44A24D
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 21:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B21330B52D1
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 19:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FCB3F1660;
	Wed, 22 Apr 2026 19:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMWeIei/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F237F759
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886020; cv=none; b=L4W+PEuhTVK3BwKNG/9v6dUaYlHMStNz7SXgSGXv5DDhfmeav/uhLnllNoKqfdHNDKEmXYj7bmNJPGhEIG/e7TEvzTBUdiqvpw58CUyDmumFHm9whWqBH0piRfxSAm+p8gA3yitBsXsFWmprMPglLLp1M/cxSXAmj/ZZGgjJW20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886020; c=relaxed/simple;
	bh=Cprsstibdn9hXiJNjjZMMGCndcSykhi/5ewadyB1c7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFruG4ar1+dYHDJBmzIL31ieOOufvQ1vrtD0s8rxGyOiFzHzmKZDw2/mh9eJ4q7wnbvHxg/Wy4T+1J/Cj2B+frGblsz4i2f4Ln/tIltpROsTQvA6AirWvFXcC9LilKqVQIN2Im2XRbmi1gjanznGRXkUOcsVOsvCi6ScPAB0Ssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMWeIei/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0046078so52859725e9.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776886014; x=1777490814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6uDdzl1S+Uv4+b9FyCrrZfU5BEzOjiHUJyKHJY/818=;
        b=rMWeIei/Svzuh7UZjSvZL/eFPX1AKaJXG3D0ZBKLsXbsfPU1VxtpfwblIh6463gpIK
         WP+OJwtUDNBQBihPbWQV3JpL7tf2VEQ0XGE/Zw1ESi+NJnQtwpdMLF4J2E0mNdnmIfgV
         aaPTi9E0cnQKrQKJelEpbzKQJZbaRzS0fuWHH+2O++X1k6y6U2AE3LCK+orJBg0ONp1r
         n/K1m1LszZG16NUyxjEObxkDRKJnS9VnsQ/PRwCTy7zdW5kmorOihI6wrZ29r2qnqGJN
         04gH2AkxO2ceNJ/ArNxa1yMLNPW2XA2x7iqudjSE0b2wlL3BMhvG9YJuSXcgqqT5E+r4
         h6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886014; x=1777490814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U6uDdzl1S+Uv4+b9FyCrrZfU5BEzOjiHUJyKHJY/818=;
        b=tYUgllLsYZHU/hFhK2kdZsZUAz+hNBMy8XAfxs8CZOEodEWsEDM14y5ACp9YrJHMvV
         WY/kGrDJA5+94w85y+6uaqN/da78Rnds7ylBXV2aOe9Urct+PSusJ61nl389ZqLQP4fm
         HQDadvC8K0aDNaDZ0X46sI0WfIRGS2Zy926Dga7x/2Mdudn0gNKF12e8UKTO5E4aDAvT
         wyJt4TVJKYmJneHBPg6awU3k+KVif338fM4vuIyhgF5uIAJZPEMsRt+PPxjg0ekupcH9
         DYXrsVA7FY17aJ0Duj7Nh1Hh6lX3lrKaNEfwr7BfOZS+fScQOH90M8O0dLggvVA+Jxe8
         e/Tg==
X-Gm-Message-State: AOJu0YzFVavoSoYxmBXauCA17JhRZ+gusnTde919st5HJC8vSSQh7//e
	W4zfM90lVXQRcP0jt5mG7yaUy+uonIdscm/QVgon8yv9n4+zt6FUZcFL8R2dSUg=
X-Gm-Gg: AeBDietH+SmehiQ8dNt6P+J/DP02EflfEPOI5SfzYPDaR25FazJrX9SBqbFcL/bm7Is
	J279epa3Z5CXXdW1Zfw/e6/i6hRoUqgTGQuGD21cc8gJPaDYkkz1uuEwBWACfkqMvW90kgRgH3y
	JTwV5y2ek2h5gEhNFN/aF0L9Z0cVB+BAmOxzYdQQ+AmXft8etSUPnciD60hoJ+gkD0guf+OTKXy
	6W2rOIj54HNiVLpOrUyalr/A7ml5KuerPgQW2KuKq+jGjYw7Kofhtcz4TMLkI0t9/ueO+O1rjfG
	5WGyEAYpdWg3YhbxEsyrB3GyPuL2S2KY6PH2FniKo0YZ/2I46mlxBaXNbNMeVxdIxWy0mXEjGhc
	zbaUja90H7tPHilOhfHeN8ICA+FHufC+PtWJtM8SjQ/24SsKfPQRwojGNrbczixEcAuRJHejufY
	HBf2NGrzpJ0PGdDWi30SJybPpivEfvBJLBIS6Dd2AlRyZaQ8hGGG+N1RSKrcybGvyyyB4GNzu6O
	d6bcH/Xn2ToN7Xl9YULydA6Ucn0Nluh/QDu1l8oAaA3EZTibPpaZ+Co3rR2ABZMh/BYR9x9Xco=
X-Received: by 2002:a05:600c:5299:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48a54514646mr139907495e9.21.1776886013330;
        Wed, 22 Apr 2026 12:26:53 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-17.broadband.mtnet.hr. [92.242.248.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm50429463f8f.7.2026.04.22.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:26:53 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Palosaari <crope@iki.fi>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>,
	syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com
Subject: [PATCH 1/1] media: dvb-usb-v2: ce6230: fix bug when sending usb_control_msg of size 0
Date: Wed, 22 Apr 2026 21:26:44 +0200
Message-ID: <20260422192644.21814-2-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422192644.21814-1-jakovnovak30@gmail.com>
References: <20260422192644.21814-1-jakovnovak30@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,iki.fi,linuxfoundation.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59348-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jakovnovak30@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,427909a2e3b2f83d78cb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Queue-Id: 1063E44A24D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function ce6230_ctrl_msg, didn't check the size of the message that
was supposed to be read/written, which in turn caused the error at the
usb core function usb_submit_urb after calling usb_control_msg in the
driver code. This patch fixes the issue by returning an error code if
the req->data_len == 0.

Fixes: eebb876b0b8f ("V4L/DVB (11216): Add driver for Intel CE6230 DVB-T USB2.0")
Reported-and-tested-by: syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=427909a2e3b2f83d78cb
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/ce6230.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/ce6230.c b/drivers/media/usb/dvb-usb-v2/ce6230.c
index 7ebaf3ee4491..dd3aa45b56a3 100644
--- a/drivers/media/usb/dvb-usb-v2/ce6230.c
+++ b/drivers/media/usb/dvb-usb-v2/ce6230.c
@@ -23,6 +23,13 @@ static int ce6230_ctrl_msg(struct dvb_usb_device *d, struct usb_req *req)
 	value = req->value;
 	index = req->index;
 
+	if (!req->data_len) {
+		dev_err(&d->udev->dev,
+				"%s: cannot send crtl_msg of size 0",
+				KBUILD_MODNAME);
+		return -ENOBUFS;
+	}
+
 	switch (req->cmd) {
 	case I2C_READ:
 	case DEMOD_READ:
-- 
2.53.0


