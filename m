Return-Path: <linux-media+bounces-60240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL1LNBpD+Gn9rwIAu9opvQ
	(envelope-from <linux-media+bounces-60240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:56:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D76EB4B911B
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34C2E300D759
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E192FF15B;
	Mon,  4 May 2026 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMfghY/w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431F12F290E
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877660; cv=none; b=FpkW3CFZPIXSX/3ZCRD9xQRiiKpjwhH5F3NU5dOFyUA2vE/PvX2moLYy8ccdKVOS5iXWGSpwbFIh5zW36r5hOUXLzmC52dG0QN/KGtPypfF6P8LD2vB68GkxcaH+/Tqda/OSwqh2RT1U1PbKOXx+4aLn/k9rCVoTJ8v0om/sqMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877660; c=relaxed/simple;
	bh=1hqe5xk6q8A/JJ7IgDYxkmD8c7CkAOuEyy57fGoNOLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/3hYWrV6mlpOT+areEFxeJMtECOG7uKqm3cSzaDAHz8oim8oz2ZMDB1g7NTio5VEe6obdu0/ANWCTPIcj7BSI8uATSUFVzCZpFHSs0WkA9Cht8TxsxXC9JLGtCK6iuYEMJTKxKHZfcM6sdAZfPxEjdf3WyOD1fofbEHOK3XwjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMfghY/w; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7d983f79so37189171fa.0
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877657; x=1778482457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84cmq9M5CJzu1gj8OcFfHRDpQSy+05+lbM8dfJHx98c=;
        b=nMfghY/wkxLJw9I8Y+mea44qibD1UKaUCIyowg1pF3FCLjHdOB2e2bWXwO7d9nZmSs
         BNxdjJZtZr7KidsEGBKLKaF/3ps5TKCQ4I2kXhE2B6Jn4BtW4bp9oTcbxUy4tnOleFmk
         VwcnS88az2vzB6Q0CqbOg1Kc6n0X7I64/ZjXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877657; x=1778482457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=84cmq9M5CJzu1gj8OcFfHRDpQSy+05+lbM8dfJHx98c=;
        b=KjIT7CCKE3ZQ3jkZp3OuXfkZ2ZFHgiyfrRLLO8xtXO+UdpPWSX9gUzkIAK0fnRbIsB
         bQeIrgmRVtRj6xGJBKivIhTzoKLZ9IE6zsQWSDcOr//w1nBX/q+p0noYd4zQZJBHisag
         EPc8ZnUOiMpEkpNMaRfC/XrkY+3i5QvMxCkMB8z92bBtKZmrZ281xoxw7na475AugXqq
         mlsSUI14oVXXGSqXU4C5qE8HoPPIvyAtBaLCSxOWs4LBoMdWmlNT5t36vK2m5XuM6qHo
         SsZ76pcle24By68M5L+3376SGyyp4zdWJvUSC1E7F1hdrTfzIrHm4EhE2BUrTUbo8L17
         VVEw==
X-Gm-Message-State: AOJu0Yw64Q+5H0qYxuvw0157jMDIoe45ZzMmjoF43R6/r5McbAqvqDSX
	CSkaqNT3dsiSx+81Y+5lkCJkGcC8Hl0XgoyuSxw3Z40PuvZ4WlDQp9/DPSXvIKjrPA==
X-Gm-Gg: AeBDiev/+t6Jw65yaMnqc1yqWXXmdq0Pgpnc7+kNbuViYzbPHcsaWfoIaY3PUjy9D7w
	qCnK44yhjv2GAj8IPIhO4seSkWtl809EsBvbw427ExTbkrW6qQYtyZqsp7hafFySbVa6ieSo9/8
	xyY8HZ0/1nqV4rqOoyB0YbqPPNUjmIv5kiDLooKPPQiU1PIFRj25EOr+XHb6oR1GV79wzX4x6Hk
	vyvO8YdDGJaMXFv9mVLxopEtlx/UM40fCqbXfvylhbSbCZ/ls5oNyhb8biuY76KFIGAOhMPuSdS
	3VjPg9uWkMj1pSHQTx8+nJXCCV/l92ccQkRY8woA/0fBFNHkGOZHaH6er+Q7N1hqIon/elZuUZy
	zGUoRIDa8Ews4/xvSIpWd+DcxwxO/N8HreHz6M4672/oOuH1150NxvhRJmmnmgT3iX+HL1LgVdf
	fWSQ9LcecHBCScafnXZVRzn/jeAq5h9RT8xBDVzwAA9azHn6fTVHJXNdMa5JwJ0Gk/j7CZT6i1t
	dNEkSxogdAC+BKU2Q==
X-Received: by 2002:ac2:5599:0:b0:5a8:6b4b:bea0 with SMTP id 2adb3069b0e04-5a86b4bbf45mr1130311e87.41.1777877657467;
        Sun, 03 May 2026 23:54:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:08 +0000
Subject: [PATCH v3 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-5-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
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
X-Rspamd-Queue-Id: D76EB4B911B
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
	TAGGED_FROM(0.00)[bounces-60240-lists,linux-media=lfdr.de];
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


