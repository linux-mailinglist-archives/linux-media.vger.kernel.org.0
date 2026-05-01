Return-Path: <linux-media+bounces-60131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLSKKZSP9Gn/CAIAu9opvQ
	(envelope-from <linux-media+bounces-60131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:33:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF1B4AC0E7
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48C0E300D77E
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 11:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8D2374721;
	Fri,  1 May 2026 11:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F7deDkVs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5D2EC09F
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635187; cv=none; b=RAnlfaMX7DPUlenVI7UZcH5ID4B7ZO2E3qjLORqe06Qg0NGpOyBYxMHIiE0wsfVx1B/E6vrcflj5pvAtFn48eXfCKHs/mG7P88bUBQo7AePr/jCek1e2SG2HtHk0bsS2WhvgfMkwl2KJLKRueyFMsO4rBa37PKe6l59r9Ymdtco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635187; c=relaxed/simple;
	bh=1hqe5xk6q8A/JJ7IgDYxkmD8c7CkAOuEyy57fGoNOLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxsR3baK5C39IpKoEJQgqmxqLVuYlgcYJ4Y4aaak4NCuPbc6xH0+Q9E5Ax7b0juPnMaP03QiqNL/LA7UDgep3MuLNLvpqNCFQ8BCE12gw/TlhM3WAvL3agcu/xjphGokdrW5xa0kfT6/xWv5OjUmszhO3FjxssWAnK1hPqD2+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F7deDkVs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so2069920e87.2
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635184; x=1778239984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84cmq9M5CJzu1gj8OcFfHRDpQSy+05+lbM8dfJHx98c=;
        b=F7deDkVsXqiV7VzVL9yQgZPjyOxsgZoMzoZKevlFDi1TcZpvBUp3CX23UcMcu/aCip
         WEbWJQJIcfpylAcKpPQH0hr07dQfKKqOCbdB3k07XobCDRvOdN1rSBdA/mcuURpwgt0+
         ISNECkOGqoXwwpSrWsqe9AWtx0iwDaZ7rJM4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635184; x=1778239984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=84cmq9M5CJzu1gj8OcFfHRDpQSy+05+lbM8dfJHx98c=;
        b=SrR6vCA/Nf6P0fkJ+DlF3Rbb4aw4hTwaPWqPz/F4fzNl/ol7Rl6ggNd38P1WqZ4RMN
         Uqe2WwMmNM83UPFA/kbbjfJ57ltfQF4ccXI230G2xScIqzRMd+EzUyy3ZOmNyNDP1xny
         2smOzJ3AaCLDyhnv1SgiaA8zr0MkTGh/TTolwbsZXFfxKwF/QbSIRmXZxGRGKdzFjgq0
         AGSGAcMnYevsgPQerhcPlE+mJndCpTEim7+PlNu/2u2DI89UUxVy7zC4xd6UrVDhBN54
         +N0YBGwwC4VkNiKNJJeDI/WrChgiggswgjCBnZusRpukOHblmJsngcH4FhhL0Nh1F/rW
         r6CQ==
X-Gm-Message-State: AOJu0Yy3tQWRy9QLyBq1G/LhHjLnKJCy4l6cQv6jXdr0L9xT29NGnbg6
	E58J51qsk++/58CAkWmfIOTjjiKfj0ziFL/jBLP29QwSf6h2bdOu0NSD1Q2KtdBg/g==
X-Gm-Gg: AeBDiev5G4ekKV0mHBOxC9a9P+PDV9UQZPJkVl3nrq6NLTnyvBGnbQ6OxEkWECzgEWq
	/N7lTmdB2/n/xrBgQ3NQRgV53VCFSQnFQZozz3JNTCMFaUcRRqLD/R6j0myt+eyeG1RwaV8njzi
	1Yp/a4P6gtN+Ir9pe3hqlcOw4P/ChZUr35sLHG4bjEYxdfpyoSO5cA7g9ZTZ0gI0d67mfGSZZ+g
	oT/236OXjSqmpUdtLOdoudU2uxGdn97n9+N309yOUz4WW/oTQb3o6qbNiNavVjReBqBiNt+IqiO
	aOdB74e805uTp/XCe5Z10niI4SKPPb8bG6vu7AuWlXE2dr0tL9Hx8rpUNoAo0TkXbAgfXk0Oa/o
	pWohOiv+KddALETEjnbCgR5YtsFM4egu0Dj9NiPbdrOjFSGwKPrcWZ1m54lDWizwUNawUAatzuN
	h9o71jAef3oYuy8lj7zMz6SNwQ9KC8Hyc9YFJnVJhfIv31LeEXT3HWenqcu/A0uzn+OOp/7YCe4
	EQWqk/DN+TO7ugUjwRjbuzOhuc7
X-Received: by 2002:a05:6512:1288:b0:5a7:46e6:74c4 with SMTP id 2adb3069b0e04-5a8522bbeb8mr2381457e87.9.1777635183776;
        Fri, 01 May 2026 04:33:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:33:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:50 +0000
Subject: [PATCH v2 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-5-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 9FF1B4AC0E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60131-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

If the driver's stripe information is invalid it can result in an integer
overflow. Add a range check with a WARN_ON to expose this kind of
error.

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
2.54.0.545.g6539524ca2-goog


