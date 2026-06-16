Return-Path: <linux-media+bounces-65026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jHIODa9MMWoVgQUAu9opvQ
	(envelope-from <linux-media+bounces-65026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:16:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B586868FD07
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:16:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=G2vdNDjW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65026-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65026-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF964300E319
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F942D8370;
	Tue, 16 Jun 2026 13:16:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ABF2D978C
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:16:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615775; cv=none; b=tvKtYyQtNRT88GJdYuid+PiL132J8thYPO30gSrWhAaKtjKGmHLWtFAyp0LzGLtiI0maQGcnvxuA02usXfRZhfQVWPlzXvmw9q5qxsSnBPk1w8EcCejsG0WMPw4nGRFRlac4Hk45PzBpkWnT4j8PQU7S+hfaItVPStYco8VcrCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615775; c=relaxed/simple;
	bh=hsZf0EtgdsY+tWmPn+scM9xPWdp5oFjg082oWGMeWQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGmrzRXgx0hPjOvRCs55/qDtYUmKgh+gTHLGlXD0Ob5ev208eW1FC16XDH5DIDvQtIwGrguhxnXUZ2qmTvIA1HI1YdCD1LLxD8VtTfdNzoTsB0dNUjSCHLTEoFDHGVe2dPwLmcX7/o1ZeRsvrZNN9IJRl55ykEOIQTZtICVCIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2vdNDjW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277061F000E9;
	Tue, 16 Jun 2026 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615774;
	bh=gANALSEiqY4rRDTNTvQxyErofkii+swW5WUvk8t6Gys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G2vdNDjWsHylxzlEhnGcMUtrwaILQw1FMlHgCkb5lmGxqKK90wNLCbDtHoEpa/3YV
	 otlPZ5zCkidWtJPYIDXQmLYOSVZ+mf5SCMoT6XPSK0+h7wGrRw3KvJMF89TE7O3B2S
	 j+/IU7hRR8Q0m/u8CKeGRl8t1OoBY+4nGS4hqQygSjIIW/yv6gHsLm9pTaMKtu4WXk
	 0DhLMz5Lx0Bji6PeJf5HU5DuJyvCslRP3iBJ8zI090O4ZmdnXQFiyLAkpgX5fIyqyY
	 IPUf0aHFn2/LIJbPcbwvp5RtR4I0WlIHsInwJd6AfJRca3OEWxjYDGluE3aiV61uTD
	 UXTSUfWgysAhg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 6/6] media: em28xx: requeue buffers if start_streaming fails
Date: Tue, 16 Jun 2026 15:10:32 +0200
Message-ID: <141d43a4860c6007269e9725cc717a556d22d2a4.1781615432.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781615432.git.hverkuil+cisco@kernel.org>
References: <cover.1781615432.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65026-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B586868FD07

If start_streaming fails, then all queued buffers must be
returned to vb2 in state QUEUED.

Otherwise it will trigger a WARN_ON.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-video.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index e4554d015944..c418add65bb5 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1213,6 +1213,9 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct em28xx *dev = vb2_get_drv_priv(vq);
 	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+	struct em28xx_dmaqueue *dmaq = vq->type == V4L2_BUF_TYPE_VBI_CAPTURE ?
+		&dev->vbiq : &dev->vidq;
+	unsigned long flags = 0;
 	struct v4l2_frequency f;
 	struct v4l2_fh *owner;
 	int rc = 0;
@@ -1227,7 +1230,7 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 	 */
 	rc = res_get(dev, vq->type);
 	if (rc)
-		return rc;
+		goto exit;
 
 	if (v4l2->streaming_users == 0) {
 		/* First active streaming user, so allocate all the URBs */
@@ -1250,7 +1253,7 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 					  em28xx_urb_data_copy);
 		if (rc < 0) {
 			res_free(dev, vq->type);
-			return rc;
+			goto exit;
 		}
 
 		/*
@@ -1275,7 +1278,18 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	v4l2->streaming_users++;
+	return 0;
 
+exit:
+	spin_lock_irqsave(&dev->slock, flags);
+	while (!list_empty(&dmaq->active)) {
+		struct em28xx_buffer *buf;
+
+		buf = list_entry(dmaq->active.next, struct em28xx_buffer, list);
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+	spin_unlock_irqrestore(&dev->slock, flags);
 	return rc;
 }
 
-- 
2.53.0


