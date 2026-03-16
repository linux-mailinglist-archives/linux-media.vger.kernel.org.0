Return-Path: <linux-media+bounces-55917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJQSJ5gHuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:37:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA6629A915
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00202303C3A1
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF06439B941;
	Mon, 16 Mar 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RIguvXTx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32523988E1
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668091; cv=none; b=tLLgG0T63QIzixMZniBGkhvb/XfyRXdCPUpMlp2aCz7AsGsIyrt235gOUXs9WLngJ0tdafIO2dx0hPsfxXySPHNnaYhyEK84q/hQmdcH9ZtOWsmA1NGqabKynCvO2Equ5+iauNhBd0hP23yb343EqKs+fRInbpVexk2r+aETraY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668091; c=relaxed/simple;
	bh=980emBb3/yN2Du8H038v0fkSEDBFS2aUJO1xAU2v8cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dErP0So3lPWIsYnLICyhW9r2cZz8fzQo8dmEICHpL+BCrP8mFB94nsXA46BaoddcQd7izkAlB6odC59UFwZ1jSZcWhSd2glAGpQxdCBR5MWYu1/pYWQt7yT9lApsJTysf6Sixz8/2yZgp+UBTmAIR4IRn+25QEva3GLrjlieruA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RIguvXTx; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a5584e31fso45500311fa.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773668088; x=1774272888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRxqb7jp+TCy3hg1xHflJENuVb/8wn/xUKsac5LhXZU=;
        b=RIguvXTxOrj/U4FQTfrn182eChPRoLxaOWkxfnPIaL810xw1CeniUSKBFvSb/syXqA
         Z1YPcwm0dGl6lRxqTpHuVYxoMJZlTa1sYa5a3thU9TyVXptIZXKipY61v/05KXqGNupp
         pw8Rs/hc+g0hLgDV9bl52VwjFKI4npAEu0NI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668088; x=1774272888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zRxqb7jp+TCy3hg1xHflJENuVb/8wn/xUKsac5LhXZU=;
        b=mk828UJej6yXhGMpciiZX/xHL7pX6Qa1qMzVjuDdP8nzC97oIlnhmrqCXI+VxBWBpH
         vK9WJ1wJNrS4FEj6IUG5sTkOl9wUh90pKd1utzfF9hn+A/WtSDcpqXP4q4ygheOWC+DN
         hsaSVKpSE0PLIoVOBl4fXibpXXTiZOgfVcKMzrfWt9/5/9kfi0xKh9W2sX+LMw9+aeGE
         4xkv26wuNL+B2verTvyglrrYQ0vvdoxI9vu2M6qsTK92BtN2tB82jFtP3icctiWVC2G0
         qYauG0tJzmpGvNSugGZgSPoi7LU6M9TVEAgu6SmKrm7E2U2qiqNeM8GjARHB37EG+MAe
         tukA==
X-Gm-Message-State: AOJu0Yz2BSLb9mWfpVnq+BFXZYJr9YZy476JRtBr4ndC+bC0L4N0hprm
	vGEe+jVgyVZuVygYLn3V3aFf2va60GrSiLUzjWtftoUcVe21r2ZWHS8ekM8cN2OuUA==
X-Gm-Gg: ATEYQzxjgUXZ/o/9reuJCP+tjwOWCLCINmlVgkTRU9p/S/pXUFSxnwFbQRyAggvIAGN
	7jv8zyq3/VrvQ/+6cOhk/Mb0HKJXiCPYwtErISSqNXDeJpitfJSdg02nhwaM8i7GM7vFDq6hfrV
	n290tMEZ4ntv9CP/cJFTwfBrQC4RPylylInZBY4N4Sju/5tjt6pHUMKnHuplt6Uv0+D9gKCYwlh
	NK/LtpV7IrL/aRtScFQaBBwG/pha+Z02UiktpRnRdj5/Id2OOeHqY9PFqftrkbLyMkTmNg+p98j
	KovvgMGOjMa+LSSyqXgKhs1IaOOg8drTqfsCe/NAMryJsmmvS28V8FhpxIUru05YkVH6+sc2RR5
	OZkE90Lj3BlpRcQPKJYPc5YdI0AmwHUpIXj0BOfZeuR83Xbua/fK+sGZqr1ck6LlUl2ig2uJpYm
	IzrZKrInZ/rUxfH1eXeTq+G3OTQKtuZgkT6Fu0UBhnDytMkYqBaEpe8kwN6zF7OHWaR7voFP17Y
	w==
X-Received: by 2002:a05:6512:3c87:b0:5a1:26c:7fb4 with SMTP id 2adb3069b0e04-5a15a4cda88mr6195149e87.21.1773668087880;
        Mon, 16 Mar 2026 06:34:47 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm3481473e87.76.2026.03.16.06.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:34:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:34:45 +0000
Subject: [PATCH v3 2/4] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-uvcdynctrl-v3-2-19cd4657e1f3@chromium.org>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
In-Reply-To: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55917-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 3DA6629A915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
control.

This mapping is usually created by the uvcdynctrl userspace utility. We
would like to get the mappings into the driver instead.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
 drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index dbb30ad389ae..b09d2f8ba66e 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -109,6 +109,8 @@ IOCTL reference
 UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+**This IOCTL is deprecated and will be eventually removed**
+
 Argument: struct uvc_xu_control_mapping
 
 **Description**:
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index d5860661c115..f9049e9c0d3a 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1046,6 +1046,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
 	switch (cmd) {
 	/* Dynamic controls. */
 	case UVCIOC_CTRL_MAP:
+		pr_warn_once("uvcvideo: " DEPRECATED
+			     "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
 		return uvc_ioctl_xu_ctrl_map(chain, arg);
 
 	case UVCIOC_CTRL_QUERY:
@@ -1160,6 +1162,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
+		pr_warn_once("uvcvideo: " DEPRECATED
+			     "UVCIOC_CTRL_MAP32 ioctl will be eventually removed.\n");
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
 		if (ret)
 			break;

-- 
2.53.0.851.ga537e3e6e9-goog


