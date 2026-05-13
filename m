Return-Path: <linux-media+bounces-61327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L0SLWMPBGoMDAIAu9opvQ
	(envelope-from <linux-media+bounces-61327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:42:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C30052DA7C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3F403034E33
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 05:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C57A3A6EE2;
	Wed, 13 May 2026 05:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9ZSlOdZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B733A6EF5
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778650973; cv=none; b=EGWqr1OnKXQ7Tp0G2QugcYpmEibpHReFg6dif6ZyXMfWQcALpb4A+cY7r4J9siQ3+IkN1d5Jdx+KTXJJwZdTJ9uByrCxo3W40rJ27CjUD+JSyyMXvzDi7XYuOpvZM4wlVt0aISudhvpMm66SXDVzesmoW5vTfna3azxxdPfyu+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778650973; c=relaxed/simple;
	bh=AUFheTiaIdq9G2k4NVJD81/GQk2hPB7b+FIJOQIso9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5EkOTfySxYxI4ZR+oRkQ6LzCr9SGWhPbxoxyqpNVRr1tXzfQSg1ozts/I1/slaT0wSo8sq5NSOxiBis/GsMZZNAuQx38Af1K5ZutB77vqNcoajwIvaC18tHG6qUKPj1lntACIyEAiAZk8WcqGO3rM243MvP/urjLHyrD8NapYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9ZSlOdZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so39848845e9.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778650970; x=1779255770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYBEv39uEgMy3N++VlBuBjtbHkIyYso+pXEc18UPlvk=;
        b=i9ZSlOdZg4mmOpjerXieSv0dag7k37jcmPIvfypYeERjNpfVzKPcsE1HgHxo0OuFiX
         rlYOAVxpLmalWozT+7vL0yBF5S5GFPlY1KqXgSsMHR8igRadrX2gUa17w4jEjjYQImyz
         GUMN9cKMKJZ1p/iudPC6WP5MewRM5ddKXgQ186o7DBOjpxCEOOSVkstNDmnfUMU54/2H
         v7xXFmKA49viGnQ0B8FMwYGRErVDX6NAAlsbBX0FPfuBlgUIJqzRtpd30wyESG4bIopc
         fn/I9+utPJFb2z3MdQgIH9piM0tOGvky/Nx1ROzsYm5vWy5wdVfqNTAYUoBdohFVtVxC
         W9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778650970; x=1779255770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYBEv39uEgMy3N++VlBuBjtbHkIyYso+pXEc18UPlvk=;
        b=nM3mHKGXA5rweSLvqBjEjBKe+LYct6fsuwdeqoNOvlaTAhP/T2Jh7hBFvn6x/sAace
         JJgHfLZOfanvhqxuCD8WHeX3Zk5nE/UT/X7feMSHW5LJvzLatH0ndOP/S5ebhlRFI4GU
         wdT6hJ7uwPkRQOe+/05MHRjnprjQweDp5jvRBgBvCdUjWt/p/wjHgvFLORPM3nNf8zbH
         5ww5Rm1YaUYrmwjGqhipFzgcAin7gzIkTnwVab0E9Lcc49SCfJL2NNL4ESB3veKWMypi
         BOvMZn199+XFkwKW4RQEfc6N8v8B4tylPdJgwHDnNpL4xFpdnWuy2gX1HZwnK2j4rfWr
         YlSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+b8Mx0JuXE9G/ZijKuXiB0rgIqSj9WomV2R9uDha5ydMhF4xm9vSLX9Pyyr/pdnmDJuwH8K2v7QgkZFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGqk036CLcVdya3wqCy8DFcrztWDW0rRyz1pzL78asLvf8Ctb0
	RcugF/a1nZKwuD4aY9TuzH3C1YQLriFnibKwxLgej/AffQMWRdMQswbBOhemB4WPbbjtyT2D
X-Gm-Gg: Acq92OH+/TbawA0KHENUlqlAi2u53mF9mQy8DqA/JgMKIGtglbZVWXb/iNu7ErIOEX1
	Rem4aF6onHQK5BJc9ar2PZuuAlaMvywNMEAe9OCbB2LmE8i5P1NHnP+TCxQCMTQuU6kv/nQEPDt
	c+jEQcQwjMlbiaw1ZHYYfOT/tf052YP/LMvuha1ExbrQPSOhE2lJUE0y6/PQV7Fpv7vi+5usu44
	bxSPglr/TYt+TrQuvVLhYHT7rcj+5h3O03nLj7b1DBMVXkBpwNP0lDupQ4u3vhfavO/0nJmPJJ/
	5EG5mhGGfyMixWvZP1mYlsuCPEkiLEOcinrILyBIO268IyjzHvQjWuwt0MHBi9wdQowI6hLt/bc
	WcssnxJrD0/tGHzhql2VsjJEOYCFpRBmRuaj5OQaw7WY/86HHC6kSv8syend1tEThrehxSBgh5n
	AdGIHLTDKYhwKENmjtTyXSvdDPbwRTXKTeuhxWTuf+24FcK2TLTFqSMtN3
X-Received: by 2002:a05:600c:3f0c:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48fc9a0ead2mr20611005e9.9.1778650969796;
        Tue, 12 May 2026 22:42:49 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([31.7.57.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce37b182sm38558085e9.9.2026.05.12.22.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:42:49 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org,
	hansg@kernel.org,
	linux-media@vger.kernel.org
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH] media: pwc: Drain fill_buf on start_streaming() failure
Date: Wed, 13 May 2026 08:42:44 +0300
Message-ID: <20260513054244.143866-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1C30052DA7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61327-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

pwc_isoc_init() submits its isochronous URBs with
usb_submit_urb(.., GFP_KERNEL) in a loop. After the first URB is
submitted, its completion handler pwc_isoc_handler() can run on another
CPU before the loop finishes:

  start_streaming()
    pwc_isoc_init()
      usb_submit_urb(urbs[0], GFP_KERNEL)
                                  pwc_isoc_handler(urbs[0])
                                    pdev->fill_buf =
                                      pwc_get_next_fill_buf(pdev)
      usb_submit_urb(urbs[i>0], ..)  -> fails
      pwc_isoc_cleanup(pdev)           /* kills URBs */
      return ret;
    pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED)

pwc_get_next_fill_buf() detaches a buffer from pdev->queued_bufs and
stores it in pdev->fill_buf. The error path in start_streaming() only
drains pdev->queued_bufs, so the buffer parked in pdev->fill_buf is
leaked. vb2_start_streaming() then triggers
WARN_ON(owned_by_drv_count).

stop_streaming() already handles this since commit 80b0963e1698
("[media] pwc: fix WARN_ON"), which added the fill_buf drain in the
teardown path but not in the start_streaming() error path. Mirror that
handling on failure so start_streaming() returns with no buffer owned
by the driver.

Issue identified by automated review of the INV-003 series at
https://sashiko.dev/

Fixes: 885fe18f5542 ("[media] pwc: Replace private buffer management code with videobuf2")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/pwc/pwc-if.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index c416e2fc5754..26ce7106ae30 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -726,6 +726,11 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 		pwc_camera_power(pdev, 0);
 		/* And cleanup any queued bufs!! */
 		pwc_cleanup_queued_bufs(pdev, VB2_BUF_STATE_QUEUED);
+		if (pdev->fill_buf) {
+			vb2_buffer_done(&pdev->fill_buf->vb.vb2_buf,
+					VB2_BUF_STATE_QUEUED);
+			pdev->fill_buf = NULL;
+		}
 	}
 	mutex_unlock(&pdev->v4l2_lock);
 
-- 
2.51.0


