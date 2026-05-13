Return-Path: <linux-media+bounces-61364-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBdtKGo8BGoqFgIAu9opvQ
	(envelope-from <linux-media+bounces-61364-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:55:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5AE53001F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E73030DFB86
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 08:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572803E3D9D;
	Wed, 13 May 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sN4EVJj6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3373D75B6
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778662361; cv=none; b=joxVPHyCXlFscTMF8G9OBViPdH9BtLKkAZLeY6jnTJqeKq4Ml6LcdSX6ibiaiVgnEhLfppbRlXvnj59zx0TcKh2F9bMW4SrK8sorbyz9yyXRMwkDDzlOwNS+QWNkT2rZ4wXdYMUwAiEMy2JY1mjfyBCe/ww/dHsh13hpjcUHBAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778662361; c=relaxed/simple;
	bh=1+i0e5dyp5VVQu0mDRDzIqCF+QKUyKPxnyyR9U4TFyc=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=iByxUbaeKOWi5vt2WI/+39fXQXW0w4Q9v9ToSaj0vclXPRBCu6i09F1mUhCoyl54PKVECvdLBpuKuTs253htzB8+vkl/B9TLPtDB0oyh2aCY26tFB3r/PBxnCvqTVD3Vykxx4CYqKUhkTBYpw0j4HXkpuVJLABebn8h4rxk4Xdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sN4EVJj6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC16C2BCB7
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778662361;
	bh=1+i0e5dyp5VVQu0mDRDzIqCF+QKUyKPxnyyR9U4TFyc=;
	h=Date:From:To:Subject:From;
	b=sN4EVJj6N+0A3rODPocwXM9pK6tgrdmf9oUKAEJIuWq7rwPQy9KWq32Swv01dSNDr
	 qTXcMwDpZAbHcQRxC+m4PG6t9tmYvKsJ70oa+Y4eAvNeid2nrCiqaYKy4WmjVSAnSs
	 lI2Af7fo2aChhSCYbwVI/c39BbZHl4mr5rpY+iRUsQN69utfrfoY25s/k+b7dNmxrO
	 C4+6k61m2Tq5LakZAaB3Qfxo2t9y2hkXPi4JxMVuMJ71Y8Hcc6XIX90VCFGuanmarF
	 W/ghs8frLjGGfIx7iLkFBfwOwaTqW0Sqc9OoqCY1YVVQma0cAZhenotzX07gQuQmRx
	 3ikd5rf267mcg==
Message-ID: <3016ee7c-9a4f-4fcf-b17f-0dce5bbc9260@kernel.org>
Date: Wed, 13 May 2026 10:52:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH] media: vivid: check vb2_is_busy before calling
 vivid_update_format_cap/out
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EF5AE53001F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-61364-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,appspotmail.com:email,xs4all.nl:email]
X-Rspamd-Action: no action

The vivid_update_format_cap/out() functions must only be called if the
capture/output queue are not busy. But for several controls that is not
checked.

Only when streaming starts will they be set to 'grabbed' and it is
impossible to change the control, but between REQBUFS and STREAMON you
are still allowed to set these controls. Since vivid_update_format_cap/out
will change the format, this can cause unexpected results.

I suspect that this is the cause of this syzbot bug:

https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89

But since we never have reproducers, it is hard to be certain. In any case,
these checks are needed regardless.

Reported-by: syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f94c15ff84f7..e40ff999cad8 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -608,18 +608,26 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		tpg_s_vflip(&dev->tpg, dev->sensor_vflip ^ dev->vflip);
 		break;
 	case VIVID_CID_REDUCED_FPS:
+		if (vb2_is_busy(&dev->vb_vid_cap_q))
+			return -EBUSY;
 		dev->reduced_fps = ctrl->val;
 		vivid_update_format_cap(dev, true);
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
@@ -1116,14 +1124,20 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)

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

