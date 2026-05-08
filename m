Return-Path: <linux-media+bounces-60933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N00Oe0M/mkOmgAAu9opvQ
	(envelope-from <linux-media+bounces-60933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:18:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 484944F954B
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1445A30421D6
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 16:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF2A37F8DF;
	Fri,  8 May 2026 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7MRMs98"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AA130F932
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257061; cv=none; b=a9PH2gsTUpfiBrktbUQ8tB6GNo0RXgp5t4BUxkXGbsnxPEKC95QoMZvGFwynQJ2YHYVI58Y9zGMR4D2To2fAtats0GHbRbpTWQWuRp/3nednzVN5zlrxu9AFYZkzsij0l9UXb3U7v/OZuZH8J1A6gXW5YSwbiaEz/lpyQvJ+h7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257061; c=relaxed/simple;
	bh=+71xsN0zGjFdKKLBXrHVpGMS3qy0PWP98xKw22FV+fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pDHBbjfY81RkGzlsis+VjX36zI9vz/c3Odl4y/RzEB0zqJgASm9eJ0RekCjCa9uhyoGemYi5e7V5XvdUjC231fjwn54UtD6gRT4IZvHHVl0MdfcgSuF0kLkQefe1hGjqHBW45AssdoFYEJ96/80ShLNZ8BiitgQz3vLI9NgSkMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7MRMs98; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d102471a4so22060355e9.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257058; x=1778861858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H78OCHplUUKVx5qcGH4uj9YH7je8ck6bUjvltlSmym4=;
        b=O7MRMs98ax9ECNR5NSlCKKSZyCnt68ljvQ7XvDDWmuV/vrWgqyS+dRdX8YKLixan5N
         fx7AD8u6DS/F0fEhHufmymBWb7jkvxBnyaxZxYwxdcZGMZkHz74DZ6Vi1OZr7Z9UPdwL
         eqem+jsPUyfG6j1lNiCDzLRdYlOp4pYWSPpb6aaA/8NkR+hgOSzMoQvJ94+jhSjGmskF
         wNLY3294Enz5mnkT2pMCxAz3tXXkWyo5M6Z0MgsL/s0FbI8Ast0oT/ehwLOM53YJmtRt
         MJdrEgozcwAaVhWI2R2DXpsEl42COTdJ4SWj7f5dgD3BxIIhu4mW08R5snzI5xVs27BX
         s4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257058; x=1778861858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H78OCHplUUKVx5qcGH4uj9YH7je8ck6bUjvltlSmym4=;
        b=nLhBrkOX7uJnPsxw6KQ2Xfsk+Mx5WQo627D97LkmMfAxw1Q0mOgP68ZIZ2e5m+wZyO
         E6lblt6lU6HpJ3RbMuA9/f+U3i77Nx5ynaNPnFuzKW3M30Nwz4LYw6Y8AZXIgf7Abkjs
         zqgyz6NwkwcPmEWBFYOcMbVBiUc6k0vBRojPIEM4/2hgzqaahLxeXRrUEzoHuZEKAqUv
         5WrhFtKnq8WRvw+om7hzJumwfeM3AmyrmCkIhvVAfReWIWmXQ7TAozRZBenftSCW4abI
         5CUQFs3yznCnw42lhQG3HOR2tmwxQtKc5pmVehrsZhcjYkKe1x2ylMh3rSHaX3nKhlVD
         nbrA==
X-Gm-Message-State: AOJu0YzJo50YRdf9XS1BcyVAegnNjt6xCPaXpBUKjemJApowLsPgWLza
	79pJtvTnGbDOJJn50OCOpYjaJY+MYLhU83St1yFs0ry9rMPlF3iapicT
X-Gm-Gg: AeBDiet0m7HcEuHkCBVPecF9ZZlz98RmczPpQLOfOaw3Y/5y7GD2+1B9DNf+mUfO5ea
	ffXu3OnuqrWpn0jGbVGH+2TeqgrqaaoD5HssGG2Uc9gx+C9NpLQO7G8rwFfMUvC2UUf9jjjHJQq
	zRY7cqUU4+IQhngrCSynJqLu5e0CvSPTTwp1xWpj+Y5c4hOHJqQtJpqNWVlojos2OjKPvLHuaVd
	mTiOmTbQ7pLwBqIjKP5szjBNjglgRErpcZUKr75Kh6Z11oFq6lElt+hJo7T8haZdGg0/ygs4sDz
	98O5uuzb3eHaJtmPl6eBqm9znnadQ0oxnl6kBdOfYX2YnCTrehtRv//hVLxXF4akyq6wAIWfqTq
	Il7Xes2FOlHgnTCpWD6hYL94zLyjtesyHE8yI7kYdGX3NxCOrIOhaUk/66KzFJfJwiIEpfdtXRc
	99cPM+xMnWPPmU40WF+G4Kya+ytmoMUBiVkGjqPZEb0rFHTt0P13Lo/CVjojOu+D/F4k7bwq0yW
	AAwwaDnq2Fs9oyGviG6
X-Received: by 2002:a05:600c:35d1:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-48e6767de04mr65948235e9.8.1778257057759;
        Fri, 08 May 2026 09:17:37 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm4946697f8f.4.2026.05.08.09.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:37 -0700 (PDT)
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
Subject: [PATCH v2 2/3] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Fri,  8 May 2026 19:47:20 +0330
Message-Id: <20260508161721.94285-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508161721.94285-1-arash.golgol@gmail.com>
References: <20260508161721.94285-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 484944F954B
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
	TAGGED_FROM(0.00)[bounces-60933-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,sys-base.io:email]
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
Changes in v2:
 - No change
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-3-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..375ea6745eed 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					     struct v4l2_frmsizeenum *fsize)
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


