Return-Path: <linux-media+bounces-66229-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D/xRBQ0mRWpQ7woAu9opvQ
	(envelope-from <linux-media+bounces-66229-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 16:37:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A446EED45
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 16:37:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ovS+y22N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66229-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66229-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C55D30F143D
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 14:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFBB345729;
	Wed,  1 Jul 2026 14:25:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E752475D0
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 14:25:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915906; cv=none; b=sUeP0ofrKbUSlvNhwnyK/ablpelvlkMkkdOS3+wMNdQDOEWFvQsTVNAVsXyQno+4bXsde1GL/LJGDq9DGv2ffV2uBKFOsT6paYmf03EEKWIAkbS2AfxmyolYOsZSwQiXkwP49hDDheDWCXcBOLX7xmi4LEYvmjfMnxibXItZpFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915906; c=relaxed/simple;
	bh=LKGPjADtpWQ6d27vaS6e0Qznkr48KUNr5mdPr4jcS0k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=Wi1qQnyhiWvJDwhciAoEMBuxLrKdEH+g6XOSFk/LSY5UTqtqYNLbwjkUEO6/AHbjmgYtAp7apW4kHFJxqFDNR1QWHPvnU1si0G2ZxL/c8Yjn3cvlvrLO/18waFalM44t6VElxm5t7Qb22PxNxBq+nvTH2VqSn7BvOPmV9rgfujU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovS+y22N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085DF1F000E9
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782915905;
	bh=l18msAJT4DY5NOFrtxNDdumudhSI3oFRdRLaoXb17v4=;
	h=Date:From:Subject:To;
	b=ovS+y22NYKzJ517LdVPLu+fNlY6j1WLsxoXYm/iXFYAQKi+HGbWY8upwCDDyzts/a
	 SN1mWiZ8D8h01p2gwCrazhxn9lqnhJ2DgkBsSLNcgvpFLZrxoHDo8UzTYyWPIkBGXd
	 gbk/avRaULq3xdE9wgDg873N0DQCY2y0Mq41tbm6YOWBS0Hx/rFlGGhfRaf6e02O+7
	 cvGFulxIOMyqNWm7fUyWAcxWT5zBucVwNxpka9s/mrutUbzxAzWocnCNhDkaHP4oa1
	 fyXgaJl/tJfIGtf/1GfzPluEL4kEYLo1lzKpqr4Y4ABe9SlmXJ2RgcF5Tf0yuwz2eN
	 mg6wnD74Ivppg==
Message-ID: <48124a09-873d-4f24-a6ad-523aba7cfa98@kernel.org>
Date: Wed, 1 Jul 2026 16:25:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] media: vivid: always allow meta output streaming
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66229-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4A446EED45

The vivid metadata output emulation only works if the
video input is configured for a webcam. That makes no sense,
and it is in fact a copy-and-paste from the metadata capture
support.

Always allow metadata output, just make sure that when the
metadata is processed it only sets the brightness/saturation/
hue/contrast controls if they have been defined: if vivid was
instantiation without video capture support, then those controls
are missing.

This change ensures that the test-media regression script correctly
tests metadata output streaming.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/test-drivers/vivid/vivid-meta-out.c | 23 +++++--------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
index 55e5e5dec2f2..ca913b808225 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
@@ -17,12 +17,8 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 				unsigned int *nplanes, unsigned int sizes[],
 				struct device *alloc_devs[])
 {
-	struct vivid_dev *dev = vb2_get_drv_priv(vq);
 	unsigned int size =  sizeof(struct vivid_meta_out_buf);

-	if (!vivid_is_webcam(dev))
-		return -EINVAL;
-
 	if (*nplanes) {
 		if (sizes[0] < size)
 			return -EINVAL;
@@ -127,11 +123,6 @@ const struct vb2_ops vivid_meta_out_qops = {
 int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
 			     struct v4l2_fmtdesc *f)
 {
-	struct vivid_dev *dev = video_drvdata(file);
-
-	if (!vivid_is_webcam(dev))
-		return -EINVAL;
-
 	if (f->index > 0)
 		return -EINVAL;

@@ -143,12 +134,8 @@ int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
 int vidioc_g_fmt_meta_out(struct file *file, void *priv,
 			  struct v4l2_format *f)
 {
-	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_meta_format *meta = &f->fmt.meta;

-	if (!vivid_is_webcam(dev) || !dev->has_meta_out)
-		return -EINVAL;
-
 	meta->dataformat = V4L2_META_FMT_VIVID;
 	meta->buffersize = sizeof(struct vivid_meta_out_buf);
 	return 0;
@@ -159,10 +146,12 @@ void vivid_meta_out_process(struct vivid_dev *dev,
 {
 	struct vivid_meta_out_buf *meta = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);

-	v4l2_ctrl_s_ctrl(dev->brightness, meta->brightness);
-	v4l2_ctrl_s_ctrl(dev->contrast, meta->contrast);
-	v4l2_ctrl_s_ctrl(dev->saturation, meta->saturation);
-	v4l2_ctrl_s_ctrl(dev->hue, meta->hue);
+	if (dev->brightness) {
+		v4l2_ctrl_s_ctrl(dev->brightness, meta->brightness);
+		v4l2_ctrl_s_ctrl(dev->contrast, meta->contrast);
+		v4l2_ctrl_s_ctrl(dev->saturation, meta->saturation);
+		v4l2_ctrl_s_ctrl(dev->hue, meta->hue);
+	}

 	dprintk(dev, 2, " %s brightness %u contrast %u saturation %u hue %d\n",
 		__func__, meta->brightness, meta->contrast,
-- 
2.53.0


