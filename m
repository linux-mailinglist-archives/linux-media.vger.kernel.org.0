Return-Path: <linux-media+bounces-60858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFW/NiD9/Gk9WQAAu9opvQ
	(envelope-from <linux-media+bounces-60858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:59:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A08124EF0F8
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FA08303E8FF
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 20:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B618344040;
	Thu,  7 May 2026 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sz5CdcuY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B7343D80
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187502; cv=none; b=ksbo7zmDBEjfxQXynfLS9WtUs5llr89PIc8P8sDcaFknQsivWUtXiJIYsAJAh5x0ZC7I9uLJ6cqRCRD/UfteWwJ32OoMOBShKzodkkcgVnS3V8ZbIm+u7uOYJGMDjdokffFGLHBcTLNlmSiudrHphZYNbVg5Tra8QagZkgnGyQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187502; c=relaxed/simple;
	bh=Kj70iDTzSgfkdpFGrFm7jqyxrLXQ8vQDqKV0w2y4QJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIl+PckbLXEqKlihtrDD2t8vAAEqUm3ldy0mOTDONycGBkWk47kpLqJwnQcZJeHn37H1IxCH8yvOidcyg4ewDhxidJZZbrIYsde9UBPz+52XUEiVVXRjDSlc5BM2sgc8gIinzoKwnvY01+ZRPsnuQXQSHoORF5ShaaN60+/sVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sz5CdcuY; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39397d63804so15177001fa.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187499; x=1778792299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEKESsFN6b/rn96AIqBdX/QKktD4/S30+ixOsI61EpA=;
        b=Sz5CdcuYUVI5WWP+/Nv/W2biFqGD8gdbTUQShAtPZoqZ3MGaWWM2KSIepNHBa2cYxq
         4U5Pz3airKv5RIVBdhvlU34s82wNiFb+scOYaOSn+bljcTA1h5GLLEfpXk0EySoWI7We
         D5dsEUjRFkbhJ7my+bz6bw9F8lDa2roM4pG7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187499; x=1778792299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BEKESsFN6b/rn96AIqBdX/QKktD4/S30+ixOsI61EpA=;
        b=YYx7LLf3FM584t4of9wEuWBHgVL/T8W+tS92xyYg91XyfKoG4cUbHm+I0dssWJOzLD
         OZjor+liJQi9gISjgKsKplFLV6/3SeSQ+HGTEfNvMHq3d2IlKYpfFB+rwIXGcy3P161u
         Otb6+25nxzxMVq4ON7Dw0gxlzkHfNUEuKANiWKW2fL9DNcYDR5aSTQpAJNpHLM9a8up9
         mXsHLTAP2fXtzNMCdsNCpCb5bhlqPPq4EQhvi2FnGn4n11OqfjJTbKw78RJsgO8aWnzu
         xfoHKUuCA/aJ4F1VhNaPqrngVcWa2B10tEeiQP77plsvLh7SEf4v96HUKq24bI9O+qSh
         cUPg==
X-Gm-Message-State: AOJu0Yx3TIsMRZO+LxhyPshVbZXA11XJmNDD8X9up0FbKj/q2hX/QzJD
	kORbwhKVQOsb+LYxbQM4Nh2VFSXyWeQku4iLNgH/ihdEVWiNXHQn7rjVr5JVV09j/A==
X-Gm-Gg: AeBDieuIpe/bzRBqsXEnHfM4BXv6hSeGHfQf4BDqrT+RSpFlYovug4t81d1OMWKcw+R
	lvpj59d4sRsc2fEjXpvptFMvFcTa/gEuNW5Ga8g1ZI8z5mmGDOj37w3wXQ1k7v7MDIk8mJ9K05W
	zg+Adoz6WKRkA6RzQEnCabLm7ctsoOMDWrCtQN8NRKhGGRRj2OldaXWZkbtMBMf6ieJppxgqp86
	bZAbm5B8LRxNA7CNa6ZlT6EO4oV7lcTMTs2NDKJMt+9p7YHp2/hQVJ8GQVB+zR/RRHhJ4oYhUEg
	zfJpRaXol5KSw2KpTOC3bNfoCCJSpHOaACyS2B/k8rV0O7wi+cogN5Fm9tjl/3Irgd6JXJnI8ia
	lf2nq0KKgvrJVDUYl15sdUwNrHZAcRPzIp8iZRXKOHPyYl7btIOWuimOZF+vKtyRuUrWd73O//I
	ZNCpKiKsR7QPm+nf6HPzq77ouK5aLfDyql2KRnbijD9i1rivQxnsxj8e3P6aNCBWQ3bXvV5ZcKY
	uPH4eY=
X-Received: by 2002:a2e:b8cd:0:b0:393:b365:6e28 with SMTP id 38308e7fff4ca-393f4fc95e1mr148531fa.31.1778187499396;
        Thu, 07 May 2026 13:58:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:10 +0000
Subject: [PATCH v4 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-5-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
In-Reply-To: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: A08124EF0F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-60858-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

If the driver's stripe information is invalid it can result in an integer
underflow. Add a range check to avoid this kind of error.

This patch fixes the following smatch error:
drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'

Cc: stable@vger.kernel.org
Fixes: e11110a5b744 ("media: staging/intel-ipu3: css: Compute and program ccs")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 2c48d57a3180..92cce31e35c5 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -1770,6 +1770,8 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
 		acc->stripe.bds_out_stripes[0].width =
 			ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width, f);
 	} else {
+		u32 offset;
+
 		/* Image processing is divided into two stripes */
 		acc->stripe.bds_out_stripes[0].width =
 			acc->stripe.bds_out_stripes[1].width =
@@ -1788,8 +1790,10 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
 			acc->stripe.bds_out_stripes[1].width += f;
 		}
 		/* Overlap between stripes is IPU3_UAPI_ISP_VEC_ELEMS * 4 */
-		acc->stripe.bds_out_stripes[1].offset =
-			acc->stripe.bds_out_stripes[0].width - 2 * f;
+		offset = acc->stripe.bds_out_stripes[0].width - 2 * f;
+		if (offset > 65535)
+			return -EINVAL;
+		acc->stripe.bds_out_stripes[1].offset = offset;
 	}
 
 	acc->stripe.effective_stripes[0].height =

-- 
2.54.0.563.g4f69b47b94-goog


