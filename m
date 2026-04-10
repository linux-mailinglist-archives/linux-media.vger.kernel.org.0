Return-Path: <linux-media+bounces-58480-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHBhFLuW2GkgfggAu9opvQ
	(envelope-from <linux-media+bounces-58480-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:20:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 088CF3D2AF0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EF143031B25
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697C135B659;
	Fri, 10 Apr 2026 06:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTbhpsoH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64922359A8E
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 06:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802004; cv=none; b=LbRFzRM4cmhv1GzxbVn4vz3NFgTssqSNw62Hy4FLsj4WX7XLrB6BUxfOWj6xeWQC1xmtYMerO1GjXkHzRy/z0KoV4PBRuoinE3j2lP4OMEnkgLCPw/WkwQ6i39jNs3Jc6Wtk51L6Ziy8uwKWz8SdUW+tWQYmP7qTe6kZgxYknMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802004; c=relaxed/simple;
	bh=fZEdyIipC09EVWyHM+Y8CQMdkfksTWKh79/knXjcZqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0XKd+t41EFrz908YNdmZo3v3+zPnZbCjOa3evAJLRTXmCJDoXG58q/36QtWSCEFCig+KNwWZQgr3chGHRZsBsM0SMQ9GDO2QISzeIxraXtjqjfzwlW6loN4Cp6bhYGmxqHLn1h/++2cN0/Ivu2WueSQExxtwivQDOcj9z5U55o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTbhpsoH; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so1814642e87.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 23:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775802001; x=1776406801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6XkZdBEwbDtX80rMSfDNL9NS8/rSIirD+HWoigJrb0=;
        b=PTbhpsoHzXYD+pnQBB+TQRzTo57pwQE+Ewl+YOTmiFbusynsNwTDLs1BmjtG5zUrSh
         5WPh7x8sarUfVfBoBGDRm2q1V2TgObcSs0gCPa6IarAIxPlCMaEr6WWVEjWKH5Wa1Thi
         79C2xBK0BRj3vJa3Ma6bo4N0CGZbw/vvGHHRqMPEQpc41Gqgw4TyafEeowIadrXv0SYY
         kdAYuFyZxpdXmF4nBD/cIF/zEWTvG2pU1EO8Tg1Ql5kORI7fWo/Wpg1srpULaDLRpeg4
         MkO+0cmQ6oa7p0mRFi8BT4syVBrvyN/yR3ldEJ2VIZIL0CwL5iOlwXO2KlQea2xtPZ/Q
         dOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775802001; x=1776406801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6XkZdBEwbDtX80rMSfDNL9NS8/rSIirD+HWoigJrb0=;
        b=LyeCKZSngA7KIbcwwfVjIB6N61dMhcYlPyuzgi9TSgjlswB4R3cmsxgHOaFa10t/y5
         O2D2MTJXBZxTUVYKWrMzsaZAZY5KuxolXrawVG8/N7J9G1C/Vy/IV0g/JuSZJDwhP2Fv
         2RWdEeD3FQG12SenJppR+JVGxlmhp9+aCCppuF2O1FUW+QJpHzsV17OkYTTYbf08Ds7k
         aeFd7T+CTFiDjypsyIzpzYJaixhubdp6rFcLGasL3QiOebLRwuhjzFtDcTPZMo+UFqGZ
         /a2iwypHg2b4VuomMQc8wYjQWnsQtuLFFQO4mp9tNeB61C9totnDfH9/aSUDEFJ2MOtw
         K0pA==
X-Gm-Message-State: AOJu0YxStv765f2SR0qt8gKYidjjI2OP6GO0TlYGPikxjzSQEcjJrlBj
	ThSxXtSr2EKs89BeykPGNsTVE6NrZjnTnSJlprLU3I//rCjDwZW6qxdEUni7392tzNYNJw==
X-Gm-Gg: AeBDieuUw5VsdOO1fi88Xnzyk8TGywhK/KMqSmJ49UmRpgEyxXrjGkFQudHVXKqO6jk
	dBg9jSd4zNlpwihHAB/YtZHUrlu8ZEEAaftPXjFgXArIHAUL6gOvtQrfe9wA5OAKTK/uJLVCuJI
	tK3qamyrkbOXGTqwydkK1Ve/nNUlmFyAldMrsxnVBsYVJFB3Jj6XXnTbdnhWtqqZMg1uQsMZE9m
	zQbVfeOfi4nlKsK7nlohwQBTuMsj7o9KVe9VIdjgaQilYLasWjt6VBvyi7/QZQrVqyPTVxjgAe5
	UDBg/Lv5AGD6rJ6WhsC2zQQ49yfHby8hOWONDw9YwJngFth1j7uqUzCMCIf00SwDt9cdgXy6B9z
	sOXgU1r8GlHGv9nS6czHaLP5f6IITKa8opt8fEYX9qdQma8wzuKqka8Zqfi2sf0vQrgcoA1OWFL
	qjFghd1nowO1aDD8RjXApg1qq5xtfyco9Jg0vphGQ=
X-Received: by 2002:a05:6512:401f:b0:5a2:bcc3:2c04 with SMTP id 2adb3069b0e04-5a3efb2d724mr703882e87.24.1775802000967;
        Thu, 09 Apr 2026 23:20:00 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8673dsm490506e87.15.2026.04.09.23.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:19:59 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 5/5] media: i2c: imx415: Cluster horizontal and vertical flip controls
Date: Fri, 10 Apr 2026 09:19:44 +0300
Message-ID: <20260410061944.241480-6-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410061944.241480-1-eagle.alexander923@gmail.com>
References: <20260410061944.241480-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58480-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,wolfvision.net,raspberrypi.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 088CF3D2AF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wrap the hflip and vflip control pointers in an anonymous struct
and add a v4l2_ctrl_cluster(2, &sensor->hflip) call.
Clustering ensures that both controls are handled together by the
control framework, which is appropriate because changing one flip
setting does not invalidate the other, but they may need to be
applied atomically. This also prevents potential inconsistencies
when the control handler updates them.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index ec0239ccf5fc..d72d2cd2fd6d 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -668,8 +668,10 @@ struct imx415 {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
-	struct v4l2_ctrl *hflip;
-	struct v4l2_ctrl *vflip;
+	struct {
+		struct v4l2_ctrl *hflip;
+		struct v4l2_ctrl *vflip;
+	};
 	struct v4l2_ctrl *exposure;
 
 	unsigned int cur_mode;
@@ -949,6 +951,7 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
 	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_cluster(2, &sensor->hflip);
 
 	v4l2_ctrl_new_std_menu_items(&sensor->ctrls, &imx415_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.52.0


