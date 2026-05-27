Return-Path: <linux-media+bounces-62895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPoCIALpFmruvgcAu9opvQ
	(envelope-from <linux-media+bounces-62895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:52:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD485E470F
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 177BA300736D
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32F24048A8;
	Wed, 27 May 2026 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMnoNqIk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38704402B87
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779885981; cv=none; b=FOv+H/A8WBWEM98hIhTFbs3LQH/RgJ4cocqgrFw2gXmhEDoI7f2WpshXlZ97Qfh1YE15qL6eZ6Ppkn2DNh9LgMQhgzpjknL+1CI445oeykLzq2crY5iXl3bY5moTQZ3XYtWyjVcY6fUTI/zGH5Pnl5DNGOVbNWfhYgPGNJ2BL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779885981; c=relaxed/simple;
	bh=xvgx2/ubLvj8V1fHXTIV61sVEuGf5eJ/cKDPMKcxfRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aLSxOA0wCOJTTgK4RtQKqy2P6JcgpScbQarhHsve9TmtvB/BVZA0x11UqHeX6oGbt8nr+DZmU8U0T4GNVqGVd7L2thXtMQM1MGgkUCymeh+FjLe6vix71DIrWHu4B6iey5B5qmEf3m5/zabc+EB44g90yiViV4XwWM5fR3mCofU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMnoNqIk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4906238c62eso31001185e9.3
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779885977; x=1780490777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGOXaw4Q58N9Z3gZvFI/sYtzJpUodLKIK7TomFRymZY=;
        b=cMnoNqIkRta7sLCwTwMURSXt5yKJ4lTPUuyQp4qdTZQcRg6iVbm1elHz4qRdn/Jdty
         Xa3Q/FHjd5CtBjLL+9KYgKi9CNJEhX48QrE+jaDs1Se1LgfgvCoF29QYswsGCh6qviOl
         NNqxGMAHgwK0C4+AtSUe2+dCWMVtCseJwGIk64ynrR5LPdZbzzrzCeJM4tpwhS7n2wOq
         tdzBhsTLSHpbmdVURRtPhPKra0HEuaR7LOLuv2D+GA+7n9Qp5VQpxInS3ve/KmCFMTF1
         hfp1zeVQd7M3B7EdPmaed0SkxfgYoqVcws8VxZ+/RjLQeO1PGfGVHaHpvqWPOSTXUQNa
         BU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779885977; x=1780490777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGOXaw4Q58N9Z3gZvFI/sYtzJpUodLKIK7TomFRymZY=;
        b=Sx5Wv9ZlR4OdJpgCn5VUi7OqoyqhC+C3UuAKEW1OR/55cHljuJ0JfHb7srJSAgEdOF
         KezQnRA4/AnFLmerauCwtGYsClRmD8dIPud+jKHEMrJqxnZjYCT91rAzOVh/WFc5wrda
         NsHF4rct6NPM8XZHDaQr7zcxKwk/0hrZCylUuAN7kq0WQ9GhY/Ov23YBDOflt+9LJW2g
         exn20DKgtLhveZTXhpy12rctG+/GMT31SAxC0t0FIObRQTSZ50uteQ/CK2n55oe+J9Ba
         sJHQcRdfT5ManEu+4CJEztnAFMF/4lczSl8FkuQFOti/HkayX2IEzjH/klL6JUKevmbm
         bTYg==
X-Gm-Message-State: AOJu0YytIECuW3ah1wNJRpidBdSstVvKCQ08JMVe7xHmRp94fgTU/UbU
	SrvALc+ahw3ObVRyXz6lWHdEoMCA60SPFBGCukReTkcHt8iadiolreVa
X-Gm-Gg: Acq92OHrsBNzGHTPSbH4Jm+NChuUrHSwbpXiiBhdxR51JZIi+KdsgCcHVt9B5AMJ0T4
	wzLJ0+x36+XnmWvU+tCxIE9Pdkbcoih24C10U/KdzqCxPKD69FrsiV+G37kUHLdB7kxFaw2mwt2
	ENecYnlhKswcqtRSRqIcoNc4NHmhBLTiclZ7+V2K6vy5JVXAodhbBjgfdb53WIClnD1xTHONOoq
	utjmEU10jfuYmxHrz18g0z9WidxopTrZ5IAP7LW7KBqSruT5bqE3H6I//d6bJOat3lGyYc9y1NZ
	VjxisI4Tzoyhf0XQ+k/+4ODlzuZsoNle0CJ0ws50opmCes/h7kN/Ti8PIVbz2QtPYKpLObQnjUn
	IbJjgKUjYzgBmLJnZqLL7t1G2pDQQ/Uv2vrdEGoggOL/afkClRsfS2TuySXMDelN1HPzdyPDpu4
	1Og2W2EA6la3g+g+d/PYwuaQjXdulR7fTwocMhiaA0Y24QP3bQbvoACqcdI/fOsFtDHaKm6U6mO
	I/zrqlI
X-Received: by 2002:a05:600c:4510:b0:48f:d5d7:df63 with SMTP id 5b1f17b1804b1-490428dfd36mr365405095e9.27.1779885976875;
        Wed, 27 May 2026 05:46:16 -0700 (PDT)
Received: from thinkpad ([46.164.76.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a198sm386092385e9.10.2026.05.27.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 05:46:16 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io,
	yong.deng@magewell.com,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format entries
Date: Wed, 27 May 2026 16:15:52 +0330
Message-Id: <20260527124552.33815-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62895-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sys-base.io,magewell.com,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.infradead.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CFD485E470F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
codes.

Remove the duplicated entries from sun6i_csi_bridge_formats[].

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d006d9dd0170..0bec0cd7620e 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
@@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_1X16,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_1X16,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-- 
2.34.1


