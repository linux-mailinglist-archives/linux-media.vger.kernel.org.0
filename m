Return-Path: <linux-media+bounces-64939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ncI2BuGNMGqFUQUAu9opvQ
	(envelope-from <linux-media+bounces-64939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 01:42:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1F68AA13
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 01:42:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=jzcLk3qA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64939-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64939-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AF2E30B50A7
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEA134889F;
	Mon, 15 Jun 2026 23:40:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6E2E2EEE;
	Mon, 15 Jun 2026 23:40:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781566850; cv=none; b=Ni9P1PauBXB1nlEZ5TbRgsKLjrI63GiFSSqB48OK2EqrBqXRWBOVk5F35iuW23sy2K6/5phFdvG1696AKd0OpQM2ch7H9JYjzmIFO0U2BIjc8Xz3qZwlW5VsiyqDTColszAlbvUyP2TzRFJC7DQ5k/MMdAzuB/p6xgYpFM381D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781566850; c=relaxed/simple;
	bh=jxUKGIA0ruhTopJBED49sy7Z2LqYoh1XG9Qe1S/C5n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m00el3RGBT88HgjgbKnV5scFcwBT+cxbZn7mhq6xrr5OVKKWzYxm1j2mfXh6l1AnF5mCbXL4NF/ukJSAN2rDIGAuV+grqzAzUT+dGOgHn51n6PWhiY5UFA8CZI80Twjkht5soFVCgRkhxyp9YVXjRs7csaDCtaHByBTdST2l51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzcLk3qA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA2DBC2BCB4;
	Mon, 15 Jun 2026 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781566850;
	bh=jxUKGIA0ruhTopJBED49sy7Z2LqYoh1XG9Qe1S/C5n8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jzcLk3qAxOzmAyY+ES2AcUuuTVFAvMmNdPilqEfYMCgpDEy8gZNenVAIjuiuEvp3O
	 FulgtEYxjnglU4mXXxaj5byKgwd3O6XSOZKp5B2nPiy0dokRzQTVN/kdPb2SSLYF0r
	 Tc6zoApJ6xXyQeNSnSWqvMNfkZ9k9jLtED3gYjOHDcVIfhqwhPs2GeJWoC+p1pc7wf
	 w/pRC36QrHN5KynNL4eTi0DmyTjYMs8sEsgH7eT7c/hRxJfJ9ws7LkF++NiMb42TMB
	 KJwDyi1GO8tUypKDGdpoaSXJgxL6xZKDF6/DeBek1yd9Dzv+HvfvjAksYZ+JQVTBwN
	 sjC4i+gIp+2BA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A2CD98DA;
	Mon, 15 Jun 2026 23:40:49 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Mon, 15 Jun 2026 18:40:48 -0500
Subject: [PATCH] media: cx231xx: reject geometry changes while the VBI
 queue is busy
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-b4-disp-2d1d9abc-v1-1-64d91be4c2c8@proton.me>
X-B4-Tracking: v=1; b=H4sIAICNMGoC/x3MQQqAIBBA0avErBtQKcOuEi3UmWo2FgoRSHdPW
 r7F/xUKZ+ECc1ch8y1FztSg+w7i4dPOKNQMRhmrrB4xDEhSLjSkyfkQcXIh2G30NDgHLbsyb/L
 8y2V93w+3RRjbYgAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781566848; l=5155;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=BiygEoe8YJssSGqpdUOkvK4ARdwu4WWt7h57wNi/cIQ=;
 b=l8VtmqaYfWm/tb5Z48q/lYym8sE31BFs/dVwkyWk+1ncq0UDPd5w2/oBtXzdGJv+z1Viwkbu8
 wGJmrrVQHJTBeR0MrIpOl7rvSARUXJ0mvxRXjRjiC0yz618EOiIoWYX
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
Reply-To: hexlabsecurity@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64939-lists,linux-media=lfdr.de,hexlabsecurity.proton.me];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[hexlabsecurity@proton.me];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,proton.me:replyto,proton.me:email,proton.me:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ED1F68AA13

From: Bryam Vargas <hexlabsecurity@proton.me>

vidioc_s_fmt_vid_cap() and vidioc_s_std() change the device-wide
dev->width / dev->norm but only refuse the change when the *video* queue
(dev->vidq) is busy. The VBI queue (dev->vbiq) shares that same geometry:
cx231xx_init_vbi_isoc() latches dma_q->lines_per_field from dev->norm,
the VBI videobuf2 plane is sized from dev->width / dev->norm in
vbi_queue_setup() and vbi_buf_prepare(), and cx231xx_do_vbi_copy() then
recomputes the destination offset from the *live* dev->width and the
latched lines_per_field on every URB completion:

	offset = lines_completed * (dev->width << 1) + ...;
	if (dma_q->current_field == 2)
		offset += dev->width * 2 * dma_q->lines_per_field;
	memcpy(plane + offset, p_buffer, lencopy);

Because the VBI node shares video_ioctl_ops with the video node, an
application can size a small VBI plane (REQBUFS/QBUF with a small width,
or with the NTSC standard), then enlarge dev->width (or switch dev->norm
to PAL) through the video node while the VBI stream is running -- the
change is allowed because only dev->vidq is checked -- and let the device
deliver a field-2 VBI payload. cx231xx_do_vbi_copy() now computes the
offset with the larger geometry and memcpy()s past the end of the smaller
plane that was already allocated, a heap out-of-bounds write whose offset
is attacker-chosen and whose contents come from the device. The
per-field guard in cx231xx_copy_vbi_line() does not help: it bounds the
copy against the latched lines_per_field, not the plane's real capacity,
and vb2 does not re-run buf_prepare() for an already prepared buffer.

Refuse the format/standard change when the VBI queue is busy as well, so
the geometry cannot change underneath an allocated VBI buffer.

Fixes: 7c617138b825 ("media: cx231xx: convert to the vb2 framework")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
Reproducer (one cx231xx device; both /dev/videoN and /dev/vbiN are bound
to the same struct cx231xx):

  1. ioctl(video_fd, VIDIOC_S_FMT, &fmt);   /* fmt.fmt.pix.width = 48  */
  2. ioctl(vbi_fd,   VIDIOC_REQBUFS, &rb);   /* allocs the VBI plane at
                                                width=48 -> ~2.3 KB     */
  3. ioctl(vbi_fd,   VIDIOC_QBUF, &buf);     /* buf->prepared = 1       */
  4. ioctl(video_fd, VIDIOC_S_FMT, &fmt);    /* fmt.fmt.pix.width = 720;
                                                vidq idle -> accepted   */
  5. ioctl(vbi_fd,   VIDIOC_STREAMON, ...);  /* lines_per_field latched */
  6. device delivers a SAV_VBI_FIELD2 line -> cx231xx_do_vbi_copy()
     writes at offset 720*2*12 = 17280 into the ~2.3 KB plane.
  (Equivalent norm trigger: S_STD NTSC -> VBI REQBUFS -> S_STD PAL on the
   video fd -> VBI STREAMON, lines_per_field latched at 18.)

Verification (faithful in-kernel reproduction of the cx231xx_do_vbi_copy
arithmetic against a separately allocated plane; x86_64, KASAN, booted
kasan.fault=report kasan_multi_shot):

  A (unpatched, diverged geometry): plane sized for width=716, copy uses
     the live width=720 at field-2 line 11:
       BUG: KASAN: slab-out-of-bounds in cx_vbi_init
       Write of size 1440 at addr ffff888115478160
       __asan_memcpy / shadow 00 .. fe fe   (192 B into the redzone)
     A norm variant (plane sized NTSC lines_per_field=12, copy latched
     PAL lines_per_field=18) reproduces the same slab-out-of-bounds write.
  B (this patch's bound applied -- clamp the copy against the plane size):
     no KASAN report, clean.
  C (control, consistent geometry): no KASAN report, clean.
  A userspace AddressSanitizer model of the same arithmetic reports a
  heap-buffer-overflow WRITE of up to ~16 KB (width=48 -> width=720) under
  both -m32 and -m64; B and C clean.

(cx231xx_s_video_encoding()/cx231xx_initialize_codec() in cx231xx-417.c)
without a queue-busy check; maintainers may want to audit that sibling for
the same shared-geometry hazard. It was not exercised here.

Note: dev->norm is also written by the cx231xx-417 MPEG encoder path
---
 drivers/media/usb/cx231xx/cx231xx-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 2cd4e333bc4b..70aa99fead27 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -898,7 +898,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	if (rc)
 		return rc;
 
-	if (vb2_is_busy(&dev->vidq)) {
+	if (vb2_is_busy(&dev->vidq) || vb2_is_busy(&dev->vbiq)) {
 		dev_err(dev->dev, "%s: queue busy\n", __func__);
 		return -EBUSY;
 	}
@@ -933,7 +933,7 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 	if (dev->norm == norm)
 		return 0;
 
-	if (vb2_is_busy(&dev->vidq))
+	if (vb2_is_busy(&dev->vidq) || vb2_is_busy(&dev->vbiq))
 		return -EBUSY;
 
 	dev->norm = norm;

---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260615-b4-disp-2d1d9abc-79bb6f5ad499

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>



