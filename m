Return-Path: <linux-media+bounces-59848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGhtIG+18GlwXgEAu9opvQ
	(envelope-from <linux-media+bounces-59848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:26:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C7B485CDC
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0E1E3205325
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6679A44B694;
	Tue, 28 Apr 2026 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b1ZcT20v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E840627F
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380105; cv=none; b=bQnxLldeEZS87QVEDLDxwnjuZ0lnj+E/zvREEXBsxHT8PRbRVstY0JAcu6uUvsA+BYVFDsQu8yoejUXzv4vsJ0TLYsQRrDraqRjI2CzDgCeJgINcI81jbKFg+HbQpSLh56PJnq8OAt9hMXGg3CJiqp2fRh+60NR5Xo29YE94NEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380105; c=relaxed/simple;
	bh=hCPBwrO7oEPx4oAfnxuwrKTDAkZAjcnkILOS9aX1IJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfhbHGpMXE3jRubX+UcmW2vx0HAUgt02yUyTeLvC0XRqhsIeKGb6RLfkVR9sZONFuDE4qCqJBZ80hlsmrJFKjmZ4KBGtbtLWMcGRJUw3lQBL5abmvlK8/m0mdjKdikadELAgB5FEnXUF/F+IAFiqKRtmG2UjPdasKJGaIdXOGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b1ZcT20v; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a413f83226so11242540e87.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380086; x=1777984886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJpnDr7u/wKl3rrXJo90bPq9ktWJpQktU2t3Cy7i01Y=;
        b=b1ZcT20vy5OLr9QrXkY/DwH/VnLXp+8ZHulAnnQ9nP8l2ipUjFjgwpEE9l8vcGDDxK
         oSkKUL1IRvXdLGRSHxhfcwIjiT3hybI2y5dph7XxAyEKwrdmgJBkeQ9sHBUD4LthC+6/
         isXJ3lzwP4rakZeZjg+KEJpfjD1crokb8Bkxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380086; x=1777984886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJpnDr7u/wKl3rrXJo90bPq9ktWJpQktU2t3Cy7i01Y=;
        b=Y+5tY74U4vyvhF+6Ueog7QTzCM+kqNR2VnaK1HohAQSH0ctpwtA3HFmyhxv3bGI7KA
         lbukZ8YESSMDl0WfjNk3XQuCSQVrt4K8Bks0pRtYE0m1bG+voCkLBwp9palxFNi9Fda6
         KsBgI0NKCwCURwwh0qd2J8uAozB4TEHHlrzqb6MCihUwDlAFr7TEsM5SjaEczZEOFnRG
         9NbVNXj4Na8UASqa4gXkr6xcOiWo8dc+baVWuwxlfwlqxzDs9FWVLZgWYlkMYLssdUYC
         s+xjIGVcYo68Q+Pdy6/dK1jJ+DSFw/XlwOAJtR9mIz2cwfc38xgKMQhI3Y8IgUxUKI7/
         pZKQ==
X-Gm-Message-State: AOJu0YzmR29jorjWbfJYDzlDTDbr4pSHUenL8iqYopSMxmiEoQokPrjs
	FTmxor9MmTre2T0+I7nSEQ2TaM3aqeR5MuRaQKyTCssumYI0I7ohM4N+lY2VBrzTCw==
X-Gm-Gg: AeBDieuBGPVnShuKeICRMB0oSb/K0CDCBspLcF9nbuEjbjqr2ql3X3nBfiI+0wwEYi7
	za0pV+lZ6Cl5x3q23c5sCzvyyO2WmLqKfATnsgOJdaK6Em8ke6K2JbGt0BUm9XriJuQgmoLJR64
	eUdpmNj8Rc/9Epd+H5wTy+4Uyn2k0CfzMk0m4mhR6njKCP2XMorqD/3Q6uy0MC/c+vQR2MadJED
	kju6t9W1+GKd/KaSg0ZGDbxPg+QvV4Xxk2pGhT1SZlGDOY0S8DHhjolNXSOI8XHyr9D+17xmN6F
	JaSymDx5Ax5GPeg8FDvXN2Yc/sR3+r1uS+FnYeOKp3+zKOBmvFIJvvzVhjxRFxE971XbD3cZ++6
	Pq18zP8X3WXVT7CL1Xu6V1iAHvDDc2cLp4WGdwQnu1nfvks85GjywQm4E2As0XzWz2pBhccRd1F
	aQ+layxQnNHHA7FN1H0kzm+h79q8Gfhk2HxASu8l8Esp4l/B673fyomJfpD4DZEvyBXTzR32Ytu
	2lIQu8FmZlCItNXbeRTQXS58JCj
X-Received: by 2002:a05:6512:1323:b0:5a2:b86b:56c2 with SMTP id 2adb3069b0e04-5a7466896f5mr950419e87.21.1777380085786;
        Tue, 28 Apr 2026 05:41:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:11 +0000
Subject: [PATCH 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-5-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 78C7B485CDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-59848-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]

If the driver's stripe information is invalid it can result in an integer
overflow. Add a range check with a WARN_ON to expose this kind of
error.

This patch fixes the following smatch error:
drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 2c48d57a3180..6ed23c7a0c3f 100644
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
+		if (WARN_ON(offset > 65535))
+			return -EINVAL;
+		acc->stripe.bds_out_stripes[1].offset = offset;
 	}
 
 	acc->stripe.effective_stripes[0].height =

-- 
2.54.0.545.g6539524ca2-goog


