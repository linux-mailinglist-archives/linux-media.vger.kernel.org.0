Return-Path: <linux-media+bounces-67039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FBcFJS1yTmq5MwIAu9opvQ
	(envelope-from <linux-media+bounces-67039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:52:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F01107284C1
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:52:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=mLGtWp6h;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67039-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67039-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0DAE314732B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F833806BD;
	Wed,  8 Jul 2026 15:27:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AFC242D9D
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:27:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524460; cv=none; b=qxBWCJpCHCDgtM3eOvlsVbU5Sp3mqKibUDqPt126ck3RQPQZDCygjcNrvQV6JHTqpjIdR0aaSLCKyn++pCeEQlRlo5FD0GcleetOQK9s7bb8I4h5AqQcQKW6g9yLOaJAJ+MBwNepnfa0jTKFtJaduXN3JcqTSjYiZWF9wakNUTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524460; c=relaxed/simple;
	bh=UDvQV6rFRI3FIaxkx7xY2X+5+gK+CH9bz4CKRg0qTRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vC7BtgwCV/udsvyEcXqrlZK1aIlykquScflHArx66Nwmn++5cvVsKA/FxMuOIhKEHnTMdrfEuA9ZDTVcQWWHsDkEdYIpXBOg8ymz/NxRTt6q2lF3RplKYPSj8OIcWsofYuRC2hlLtknFO98HE+1oyDZ31PeqElGozuUfb4Ip+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mLGtWp6h; arc=none smtp.client-ip=209.85.208.173
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39957d210f4so9276421fa.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783524457; x=1784129257; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2nEGKNYfDM9Ah7oR4t0smWiebWNokw1qo2LnrhbkcPM=;
        b=mLGtWp6hHhbSSHEr8TIcfUfRzy+3EGrRDncOSfoGbi17lYvCvyFxmf15zTiZNgfc3q
         bb5KGgAER+zBZo737xgCarm32F7ixsIZeT0A0g+JVb69Q7jAoMTGDVctRAxNfz+I3kIO
         FGVGkwUgwE6flo4jBhpZ2cMsy9G83C5X6WQrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524457; x=1784129257;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2nEGKNYfDM9Ah7oR4t0smWiebWNokw1qo2LnrhbkcPM=;
        b=FtGQOcNut553AZ9Fu8IlcvkSbuX/aFOpx/peuuRE+rlLVydIgVEgUgNg6nr7c0TE5n
         z1ZBPLenEjflFn23HdKH9Bjx60EepfInMFIV8XzmTY3cYVLlFeD2nEQCh86bDhIiZh7y
         YvmA6UtUxbe9VF2cbvomWcMIp2bRFjQ2eOHSeNnMKPRuSi1qIwfUu3eSbLpQJIofW1Yo
         N6BtrZvv9c+SEEbNEstmOcislMUfubfDjr8wN664uuDTnO0PqlA6jKyFJnr/S+3aFIpr
         1LhAG9Qy4zNkKkJ1otiHchdTEly+PUvDUPOQoRGIv9filCajAGaoh+Y+QhrEgG7ZHp/6
         DpRg==
X-Gm-Message-State: AOJu0YxKUENg4OvzMoReu/zIa2lADLOce4cO4nYn1vMrCxJYyIDSorZX
	89yYt/XiXpj57trSQYITxBcGCilX6a4nq32fsZmKAdggik4W7HpIrxhq60zSjmSTIYPbWJQ9aYL
	AOkk/dQ==
X-Gm-Gg: AfdE7clKJBCJhqQltlGYTUQcc53NSkuMvHNB3BVdgLd1rcug/bNgrLqAMUGWS4Oglvt
	AW9Ns+r/NodL1zmio5o2ghB3OCuVhdxWHz4ZaPQAsDpsu17a86EpyBkqtUxXOKBQx9ZUzhU4gaJ
	Q5hKNgCsZNmkwQ35fkjU5qFezXTBYLWXF25wF98vEGBC3XifFxFRwUMbaEtEjzHrsOwfWcZFIUP
	fiRdvJ5f3e2e35ovF9LdkhTL0mgfc4+bY5d2FkaJfvHzdcIs7lcphU9OU2SwpP9YadfgPj/ROBw
	q7ii2cVvOMOJMo6XJMEmTxD9xdcF6Wl59nBvhPWKRoVGuuHczey6zDpCX9sT9jiJbTo7omC0vdM
	qAMyhGM4vev8QY154t5LBSpTdiRIypv8h3kB4HsVkbl7bdCegZhrGwnTng/LKky6cHQ/gIqPi70
	hvI89dSegQ1ryiJY9sW0EWkDNzkt48MzHImgPh2WvGkIOUVPYghsBN7NjMj8vWBm888Wy1
X-Received: by 2002:a2e:be94:0:b0:39b:2ff8:64ae with SMTP id 38308e7fff4ca-39c798056e0mr7267771fa.9.1783524457569;
        Wed, 08 Jul 2026 08:27:37 -0700 (PDT)
Received: from ribalda.c.googlers.com (151.214.88.34.bc.googleusercontent.com. [34.88.214.151])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7429c4c9sm6430751fa.35.2026.07.08.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:27:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 08 Jul 2026 15:27:34 +0000
Subject: [PATCH] media: uvcvideo: Explicitly return the metadata buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-uvc-flush-meta-v1-1-71b8b18191c8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAGZsTmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3dKyZN20nNLiDN3c1JJE3UTTpDQzYwMzEwMzQyWgpoKi1LTMCrC
 B0bG1tQCYtoAKYAAAAA==
X-Change-ID: 20260708-uvc-flush-meta-a5bf63064061
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67039-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:guennadi.liakhovetski@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F01107284C1

If we keep the metadata node open, while we close the video node, there
is some risk that after reopening the video node the next metadata frame
will contain data from two different runs.

Please note that although the URB callback will usually flush all the
queues when the urbs are poisoned during uvc_video_stop_transfer(),
there might be some situations where this is not triggered.

Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Cc: stable@vger.kernel.org
Reported-by: Hans de Goede <hansg@kernel.org>
Closes: https://lore.kernel.org/linux-media/CANiDSCuO5aEApqHxy6uqZheza7hgdOkH38sY5YhO_xAxSYAJbg@mail.gmail.com/T/#u
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442f..57397fd793c8 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -196,6 +196,7 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
 	struct uvc_streaming *stream = queue->stream;
+	struct uvc_video_queue *meta_queue = &stream->meta.queue;
 
 	lockdep_assert_irqs_enabled();
 
@@ -204,6 +205,15 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
 	uvc_pm_put(stream->dev);
 
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+
+	/*
+	 * The video node acts as the stream manager, if it stops streaming,
+	 * the metadata node also stops producing frames.
+	 * To avoid metadata buffers partially filled by two runs, we need to
+	 * also flush the metadata queue.
+	 */
+	if (video_is_registered(&meta_queue->vdev))
+		uvc_queue_return_buffers(meta_queue, UVC_BUF_STATE_ERROR);
 }
 
 static void uvc_stop_streaming_meta(struct vb2_queue *vq)

---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20260708-uvc-flush-meta-a5bf63064061

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


