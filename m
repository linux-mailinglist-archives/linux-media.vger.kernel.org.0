Return-Path: <linux-media+bounces-62236-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLenGqqIDWpdygUAu9opvQ
	(envelope-from <linux-media+bounces-62236-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:10:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25D58B6C1
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 848FB3061EAD
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2A03D47DE;
	Wed, 20 May 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uji9iJmF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED67B3D4117;
	Wed, 20 May 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271583; cv=none; b=Rdm7M4e687smz0zRKwHor1OSklWZo4eqZnbRrR9oZpmHQeQnSWJlA0ZbRjs05B2DL/MkwTDomqcqNKRmGhnCEeMtk9+ZE+CdoJQ1QnMhpnuIQ2vEViKm0FB910Haoo8Hv/6VjQVGEQ7t4ZyfDEYm0q3n30wW/tr+7xEGCnAntFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271583; c=relaxed/simple;
	bh=7DrL6mvyAQc494j0Pu351HA4NFMoFhgFtS+EhbUq+AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHCAWF3TiFC6WjFZxOxyTQyRDSdhnK74RXm2Ut7J4BuQUyW7eYvK2kFiNEdgOW0YllBvOHrPJGdfRPLBmKBKwmethzCExUFgLdGt5kDzm22oJFFLvpJAiukb6GYqXp/b9oKuhyIXkgKotK4c1JZV82I6NWOkCIUG11y9wWcGWtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uji9iJmF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C501F00894;
	Wed, 20 May 2026 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271577;
	bh=2RPy3bZOecuXVY+I02YmM8MTDDvQormgDjM/U3lBnKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Uji9iJmFNrXmWJ20K/wqfiLb0GQaDPHT7G+4GbwFHVuGYv98g20AFtYuYuqbZmC7y
	 FfXZBVVGfbwKIQEW7LcJKbRG/Sy7UVT57TlqgCsq2US5j4cuWFrGfR5Hs+blbhKdKJ
	 crPRoB+SGaw2lLY6UopdNdHZT9b5t1bb+LCLQ7nVkPvOeZf5DK+focn1DWDozFGq9b
	 JsWBL+MKBINKctGdwygylicLp4cwBhiu6Pt2RMtVmplicGSpOaGxzf5erG9kW9egU4
	 01+FEQ87yF+0maIsb5f9vxlio42x9TskxeJu+n4kGkJE7XdayRZdrFdOCLJpwTFent
	 4AVXFrPdvvPmQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	stable@vger.kernel.org,
	syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 2/2] media: vivid: check for vb2_is_busy() when toggling caps
Date: Wed, 20 May 2026 10:36:22 +0200
Message-ID: <ba02852937616394e2f5de34ee2effa0944d7c88.1779266182.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779266182.git.hverkuil+cisco@kernel.org>
References: <cover.1779266182.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62236-lists,linux-media=lfdr.de,cisco];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dac8f5eaa46837e97b89,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Queue-Id: BE25D58B6C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vivid_update_format_cap/out() functions must only be called if the
capture/output queue are not busy. But for the controls that select
the CROP/COMPOSE/SCALE capability that is not checked.

Only when streaming starts will they be set to 'grabbed' and it is
impossible to change the control, but between REQBUFS and STREAMON you
are still allowed to set these controls. Since vivid_update_format_cap/out
will change the format, this can cause unexpected results.

Besides adding these checks, also add a WARN_ON in
vivid_update_format_cap/out() if the queue is busy.

I'm 90% certain that this is the cause of this syzbot bug:

https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89

But since we never have reproducers, it is hard to be certain. In any case,
these checks are needed regardless.

Fixes: 73c3f48230cd ("[media] vivid: add the control handling code")
Cc: stable@vger.kernel.org
Reported-by: syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c   | 12 ++++++++++++
 drivers/media/test-drivers/vivid/vivid-vid-cap.c |  6 ++++++
 drivers/media/test-drivers/vivid/vivid-vid-out.c |  6 ++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 1077445f5772..a8a134b36720 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -613,14 +613,20 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 			vivid_update_reduced_fps(dev);
 		break;
 	case VIVID_CID_HAS_CROP_CAP:
+		if (vb2_is_busy(&dev->vb_vid_cap_q))
+			return -EBUSY;
 		dev->has_crop_cap = ctrl->val;
 		vivid_update_format_cap(dev, true);
 		break;
 	case VIVID_CID_HAS_COMPOSE_CAP:
+		if (vb2_is_busy(&dev->vb_vid_cap_q))
+			return -EBUSY;
 		dev->has_compose_cap = ctrl->val;
 		vivid_update_format_cap(dev, true);
 		break;
 	case VIVID_CID_HAS_SCALER_CAP:
+		if (vb2_is_busy(&dev->vb_vid_cap_q))
+			return -EBUSY;
 		dev->has_scaler_cap = ctrl->val;
 		vivid_update_format_cap(dev, true);
 		break;
@@ -1117,14 +1123,20 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case VIVID_CID_HAS_CROP_OUT:
+		if (vb2_is_busy(&dev->vb_vid_out_q))
+			return -EBUSY;
 		dev->has_crop_out = ctrl->val;
 		vivid_update_format_out(dev);
 		break;
 	case VIVID_CID_HAS_COMPOSE_OUT:
+		if (vb2_is_busy(&dev->vb_vid_out_q))
+			return -EBUSY;
 		dev->has_compose_out = ctrl->val;
 		vivid_update_format_out(dev);
 		break;
 	case VIVID_CID_HAS_SCALER_OUT:
+		if (vb2_is_busy(&dev->vb_vid_out_q))
+			return -EBUSY;
 		dev->has_scaler_out = ctrl->val;
 		vivid_update_format_out(dev);
 		break;
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 76e0b161c049..e20449084709 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -391,6 +391,12 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
 	u32 dims[V4L2_CTRL_MAX_DIMS] = {};
 
+	/*
+	 * This resets the format, so must never be called while vb2_is_busy().
+	 */
+	if (WARN_ON(vb2_is_busy(&dev->vb_vid_cap_q)))
+		return;
+
 	switch (dev->input_type[dev->input]) {
 	case WEBCAM:
 	default:
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 8c037b90833e..23e1d5a189ee 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -214,6 +214,12 @@ void vivid_update_format_out(struct vivid_dev *dev)
 	unsigned size, p;
 	u64 pixelclock;
 
+	/*
+	 * This resets the format, so must never be called while vb2_is_busy().
+	 */
+	if (WARN_ON(vb2_is_busy(&dev->vb_vid_out_q)))
+		return;
+
 	switch (dev->output_type[dev->output]) {
 	case SVID:
 	default:
-- 
2.53.0


