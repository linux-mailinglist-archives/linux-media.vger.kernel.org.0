Return-Path: <linux-media+bounces-53501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CFAM9lNoGnvhwQAu9opvQ
	(envelope-from <linux-media+bounces-53501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:42:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 326181A6D3D
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1F9030F9B48
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBF13644C9;
	Thu, 26 Feb 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRKTVPAV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE80311963
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113073; cv=none; b=gvVzyybBDB7WrzSJcfuBv4BJuRtnDHKD+Q2Q/mH/JCvsQX+zlvsca3nEUXeVZnCDoClipIxcMgnzIdL97ZMWF7Nd9+UPlE8CCMlfOQC4YEuOoqq/R9CVKNJ3B2mLb5IBsuyJl/IzWmxZhjtyasLEkQOjyKqzRNvlMEBALIf3wfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113073; c=relaxed/simple;
	bh=pNWpL/seGBzq8+7qJBazQVESkrMSQ7hddiWcr8IZ/gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4vDdv/8Q3ZK+ST8Ufg/R8mfX59WKDnyROw9618D3e62UIKzMmiPRAjAspOMMoZ3mOCpcS5upm/gIhJNkGg2+BPLgoCa35B/ogzwpDoYQxF/OEEB7TkDjZealmIiGoe0DaZ8HA45LjcYYST7gCO1cm39mgW67INWb8X+jE2AKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRKTVPAV; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-385bb44e1f6so358391fa.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 05:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772113070; x=1772717870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5svD2XU/oLsPty5287a6lAq3vE5cj9mRPI5cS46o5v4=;
        b=eRKTVPAVTxpsUlDlnsPHxxIXiK+SWd5dF+vc8dEnoB0w/xF7qJcX+jkbHoUgRK4rCf
         ceD9FawsuNeRRV9bds+Bp02Md6/06Buu4FtnhrpPHLi4jnMUk36CdlU87o0Qitba6OEu
         cbWY35/k0Qm+Js4iGCxGhDUrunscDsHYgl20chbmX5NhIvuy1sMoluti0X0orbZO3Bgg
         pmOQuoGFpmekUM+7CbUAYvDUQNeGcexHKZxKDv4+7caK6VGnRphUB8CM3FE2EYz1SMjv
         Wu66U+Q/rdr2f61ZHP73XiEsgtVUIz4K6Ni/GxXAAGPU1Ct9rE7Y0USSf0j7y00FNlKR
         61FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113070; x=1772717870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5svD2XU/oLsPty5287a6lAq3vE5cj9mRPI5cS46o5v4=;
        b=HRlZajumM4CU4uT8OidLxIjtQmjHulEuLhNXzvQnpoLoOcMj8aBd/PWzgxTjxJOk6k
         cPJoRBUwksyYAqM6BaRpgW/W9FbhOwF9fvsi93m+JU1yF9osk/plKdPxlqh6hhMV/7lX
         F+YtRDopIoYG42/J2YP2GYi9veqfAKTmJGNXzbbCDjJmPJExwv6qJZeeWfBW+4pBDc0n
         VzKPw8ISt33taSHBfFdRMaJipDuoZnQKHR9Af6MVhVwsIzueYp5T2/DWbaLF89s3KhSm
         vdQ/H47wfrVCL8EmYFL+CZX81p+XXfEetMkteKtNXtIiy1hxlKd7Sq/9gPOQH0htNX35
         Iveg==
X-Forwarded-Encrypted: i=1; AJvYcCVjF/6UT+WsJ5TmaobefuCLQAgu1+h7Dw64SZbWSB83MfJ8oFdYAjGyg4B9r20w5660uAxE20cAeSv2ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCxiswcKncoohQLqONoVMS5d7mG6IoeWOvRFWYqNK6znDANE2u
	bpKIjbmRtXKKlUPMuYkTXbMQ7Ay5Pge6WJq+fkJz5fWk0/d84fyIijHkbWgA9GPkVuk=
X-Gm-Gg: ATEYQzw9LEZA3DVWv253YEb902Goc6yCqj5AbKhrjllawlgS7GdQPKKOn97uTz0ZxED
	OZ85F/lOp0zADrGho/pZ9GXiy+5k61KxjeFhHIMfj6b/7ZUHxY7YbiyaoRBlD9N7uL2T3m8dYr3
	Q8bWhLQaczuyDhUSxQN5mBdOiGmCDSvrZQg2Txfo8A8rACrcaxSlCafqQ90NAKK10aTw2/oPa1V
	/K6gltXAHt66wpwml/sUdolBQhJ8xtCOTlYNyrQ7z+vNf8ZjNH1w494m9QAmWT4aPZDwRPGQ5Ly
	Ays4ytd7A/JV/U2M68W+KPrxbzlOcI77N1l5LmDXnfx8c88m+wYwUriTeWetWQx4wLTE+HKkY3Q
	xSI6E/de+dd43I8LIJNWKvr+vCAt8LI+zygcGLd00riRDST2lnG1m8/EhHE1+TeVJEGt7es1Avc
	hTdQqBpHD3Xe8lQv/h0vJC+Ft3j4y08Bd1AYRUeCQpzSTKhMXV1qq3c6R8o32Zuq2IZw==
X-Received: by 2002:a2e:a813:0:b0:385:c05a:4814 with SMTP id 38308e7fff4ca-389a5d0fad3mr34910461fa.4.1772113070151;
        Thu, 26 Feb 2026 05:37:50 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302292bsm6572041fa.45.2026.02.26.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:37:49 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 5/6] media: i2c: og01a1b: Use generic v4l2_subdev_get_fmt() to get format
Date: Thu, 26 Feb 2026 15:37:38 +0200
Message-ID: <20260226133739.4050870-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53501-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 326181A6D3D
X-Rspamd-Action: no action

The generic v4l2_subdev_get_fmt() helper function can be utilized to
get the setup device format instead of the custom one.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 537218f6fa62..58531ab8f87d 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -701,21 +701,6 @@ static int og01a1b_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int og01a1b_get_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *fmt)
-{
-	struct og01a1b *og01a1b = to_og01a1b(sd);
-
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_state_get_format(sd_state,
-							    fmt->pad);
-	else
-		og01a1b_update_pad_format(og01a1b->cur_mode, &fmt->format);
-
-	return 0;
-}
-
 static int og01a1b_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
@@ -771,7 +756,7 @@ static const struct v4l2_subdev_video_ops og01a1b_video_ops = {
 
 static const struct v4l2_subdev_pad_ops og01a1b_pad_ops = {
 	.set_fmt = og01a1b_set_format,
-	.get_fmt = og01a1b_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.enum_mbus_code = og01a1b_enum_mbus_code,
 	.enum_frame_size = og01a1b_enum_frame_size,
 	.enable_streams = og01a1b_enable_streams,
-- 
2.49.0


