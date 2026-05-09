Return-Path: <linux-media+bounces-60988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBgMGYrB/mn/vwAAu9opvQ
	(envelope-from <linux-media+bounces-60988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:09:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E894FE186
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C27BA3012C78
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 05:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB4B37AA6A;
	Sat,  9 May 2026 05:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUnzOsy7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E01DB13A
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 05:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303357; cv=none; b=ixFoZp+KREHEXVuZekyVaX5sQqCpWFiq858nkLYwOeyO7Yt457SG9FuK3caqWjwad2aLYsBv1//Xn/hOliMeti/Wl1P8inr2fDwgZerca4pOtOVUjkSeiSOinpZWv/w03HRO11uYeTWn6rwPxnuKoXsK66HGKlKCMEtydRGnwss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303357; c=relaxed/simple;
	bh=nt6OxSmmCFCp2plgNXKiUV8ZCLQgCwiBJoQCG+R7L9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SRRwyL+rJd8S9GpKFMe8FUs7y8HX+bk3rTjKKvjVN7SEScQpN6f2Mz4XEC9j+PIiGh2gtX4vgv+JNqE6cSbTgV51wdHcPahHqMrTRp92LEnGFlMYRmsvJ/zQ2/xX20sZ01VhAirYRIYExKD0Fg/mpPqYQKkmAA3DvJUy0vmcB+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUnzOsy7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44b052142e1so1505960f8f.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 22:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303354; x=1778908154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSXVZuQbVTBhNqf5XUUF1Kdmejk+jpH4iBZZY4c/Ed0=;
        b=VUnzOsy7AXVtHeeCbxOuQXQkC62EMzbg5AzcJZSmZ0puB/28wUvh4gL+X/CWvDyFAh
         /0aYPhVf0LiwzfFVgkXuW9Ol8a2fLIki8vWMX3Occ3tRDA9h0pdaGDi2dT90IDXETCS5
         14CxwIVml94O/4sCxcmI9YFsR2mU0nddLcsgm5GJD5JXCMoXo+G12h528uWyuLWnifGz
         XKcd/hoe1qOmeHhPtrPDiXp2P7E2opTNzLA7Ohd+mJi+3yo5AMcahjVWx7Au1KgOqLTt
         xrRELXi0JlQVEiaMs9mVQZLcsAwxapDS7ODY1K2fYWdBUD63vwCyyrYzJqRbqKTHAuX/
         54lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303354; x=1778908154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSXVZuQbVTBhNqf5XUUF1Kdmejk+jpH4iBZZY4c/Ed0=;
        b=qkyXf6FqluW7DjAaNoqxlyzhfMGx4DIZ/yYjwEQZ4YWWDZlCw6CxLwIJCUOMraMWVq
         GZzyt9SVD6Qj3aUPuvSlYH58YLP782n7fKUMhJlg62EYzi/8Pm377ApRqC+jH3BXNv8X
         5ZGSazTAyka32GkPAyQouuNIDpbFL2SssacPeKRjl3Qv8zEBuj4ptAIILa7LFHi9QXuh
         uoa4No0c+Ec7KOhOjwPWzjfcJjDQsLtwCZEZcGAzD5Qn3xP2UIjtftVnZRl5QdPrNrm7
         nLQrJ4c5sABolkJINHNFk/ubB9mVruXpsabZUGnHAtoS5sHiyH8WsjdvXjiMWZqwXPoq
         ypyg==
X-Gm-Message-State: AOJu0YzXcq1r/FxOgcoOcpVtzvYiSwbEm8dvG5dimjbGv13pgPiGOzyh
	Osr6apoEuIHT/VugKco9N0gRdV8gjdVEy0UyRC6Loby18xu4VxWIdrwh
X-Gm-Gg: Acq92OFDF3GghA7g2+upVVZhnKduGCIsfM9quylKdg0tQqM4Cph2K3jEDj0c8jh5u4k
	L6L7CihB2L3qi3w4B1HytHUv7e31lxhphwBupm0fTCHjRp/xNkdrpaqJQq+4Nt+BSlmpGN8KOr5
	iadtVatchnaTbHR4LwcirRg2uG3rKgsgEVRFItw+QWHR3hFzB5rZ5kpf7aeSngJaeJ1qulwPRhH
	LTk1d2juf8CT6m50Rga+dB4/Kz6Y53eqIfE/PO0bViicbKsLuCvfomfAaLkMgLjtB9xxVRjJmUM
	VIKWWEMe3L5tO+AOOnDmvkjTtOEWTlBfljEKALNvUfC0xDF3eMB+7NBdyBkUMuBU29yeU3QUEkH
	xQ307lCKOz4BDEouacwf7oraevg8GiI/dlR8pXi7VBy/Cx/CBuH3gFLSQ8wP9QDlUG1maI2TlV9
	S60+K+TIJ5EWo5lKbcNJZJNLSJo3RswWIeSp5t4zPCq4A0IVLDu+lCaR3936pZFg2dFEbE8TPco
	Wghp8f0nbgrvsrg6ewS
X-Received: by 2002:a05:6000:4007:b0:44f:f454:8a4d with SMTP id ffacd0b85a97d-4568c19b209mr1557183f8f.23.1778303354571;
        Fri, 08 May 2026 22:09:14 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm9500871f8f.8.2026.05.08.22.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:14 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 2/3] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Sat,  9 May 2026 08:39:20 +0330
Message-Id: <20260509050921.22158-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509050921.22158-1-arash.golgol@gmail.com>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B4E894FE186
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60988-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pages.freedesktop.org:url]
X-Rspamd-Action: no action

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
 - Fix Media CI robot warnings about open parenthesis
 - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
 - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260508161721.94285-3-arash.golgol@gmail.com/

Changes in v2:
 - No change
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-3-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f788b4234673 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					    struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1


