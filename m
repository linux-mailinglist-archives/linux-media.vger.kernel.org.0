Return-Path: <linux-media+bounces-57469-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKoCNDwsyGlWhgUAu9opvQ
	(envelope-from <linux-media+bounces-57469-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 20:30:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 345BA34FD17
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 20:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62AE230479EA
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 19:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2E2346797;
	Sat, 28 Mar 2026 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oN/1ui3u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5EB343D63
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774726065; cv=none; b=J9KBntLBv0gII0zoIliazJq9sJSvKsdtazuAeTSdOWGkI+kbFS8oj3WM0Y0FwOzCzXslvC9fPM90AoVtVQ0tyjsQGWRYIJZhbSLvrdM7S8IiQgmZdElnDxhmFBdlRavJ9lKjxppv30BxKmnZ+cxJEo19gvo/cbhHaCtmnQcTP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774726065; c=relaxed/simple;
	bh=bC0DKDjrQLAjjJkrfj+dG8LmOIgjlk2HJJxcYl7Mhe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCEf01XtBFmhSrXcCOQwo/Nr1SemP5OjMHWcTZ20rkHlm/qbsRrqRIdaMzggpwRaKyEU67Mv+GOkpjopNLBPTlhgHjLG8FxHI920mMnRJL/awSOo4ywoQc8wZcCfeYaLqDgb0IU8nOycMtyCn/4ejeBM30V9tUfb+CGC1tMaxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oN/1ui3u; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66aed966c7eso5139990a12.3
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 12:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774726062; x=1775330862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iKU/akDxfnh1nRLdbpAkE2AClT7RbbA3fVQinl+Nh0=;
        b=oN/1ui3ucAERExGI1uD1oNk37i51iwKXA73ro1i9wAeQoSHH1ocekC2fO89JCx2LXa
         dPYpUt6PnN36HMkUtxOoM4zzqEVyFsApSED0rDsYcAUH1f6c3Lcy9BPzK8YP/HhX8yjw
         Bs3INSgTqDS3HCun4oPsT/0LVajl+DjpUeQeVYsPDCt64oyD7eNaqF1GsrdM8aXDGBrh
         tkfyyDzwjtzJFfXgS3Ez4OUNSd1dRPVGuIXP1OLxzmHKNNLxMMFrhqf4XdNok/FkeSfJ
         m23cbf2fR8YCGXzGOWvpRBpvb2R1l8bGGjnpwKcLTJ58DsAnMGhs7JAo8AWQZjo7h4qV
         fhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774726062; x=1775330862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2iKU/akDxfnh1nRLdbpAkE2AClT7RbbA3fVQinl+Nh0=;
        b=KPoQGM0raQ31XroP1DQB1c4QkQISQABsuUZkb4wvy+qvF+2vl0hI813sfcD94URlGL
         qRsfBDvmgTQC+ijtuiXqmdsQ6E1saOFJFmr1pfZcy8MLlKfVhr4PSFm2I/wkdP5TulN2
         8Atm7JtlEqYHCsXcUIVr20uDda+AZLzaEag8c5dz/ysMuMdQ2WVLq41ugRjXlI2XLpja
         MIaWwyz16Ri7yjimrnEJPJwKCrKCnN8dw0RV8AncpAAIQnvv3V+dv34eoKIJRKs735zt
         W9SWhLZgDweO7BBN6ZK/79B3dK/moYzEptxhqfV9I01k6IJXjaolKe2UiJclSqKFcwnA
         WKTg==
X-Forwarded-Encrypted: i=1; AJvYcCX2RcwcYiujQCUPO5c0trv/pcn1EgygLYZJQpLON/s1GUesUbYt2WKlnwqpox7/hfpwSluNLILc2XAxUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVntxgjSxURBMClUAUOEpRoDoIEsUAIhnF2GDGg5vJw8jL9LH7
	3kkqihrx1uRoqusCv2/sYtkhuX1GZvMpGIpn8Ew9lIMlgOuBcvWo9NHt
X-Gm-Gg: ATEYQzyZbhvapIAhhcfV+QdnhMYqJIDp7m2QYENkPFuBWAOgBwk8SmVZLoEnLf6OGoc
	YnYmnSV2pbjJF825+4OG20DYcMYoilrHRrXAiyuCce8Ga5Hec1hC4nwXR5pIPOp3qsqrdIffnLT
	wYcVAqlKk+15+U+LB6/PtNf07dhg7OARRkapmbx3Fy/Epv+dAIqk3Els5+VhEidUoCjvKHndAJ9
	bqTkrnzRvaBp/JAgSUGFuXMdeu4AxKoP/wsR+b9VuvlUK59JmNZiHhF9K5v8ckd9oXW4nAHkI1w
	dec1yAEFo97q8SIvzy0Vb96f7Bc1Hl1MAF0m5GnA/LJvyoNhaD5ENzdIiPtqm2KE6wRNJYY6KVo
	MnnxNGwwGeCz8Q466QEG3iosHUus6/c7xNe6fhuYZ+dJGZh0J/fGELhGdt14AzUN3p0tAEVcE4B
	R681COj2pTNSMqQKwLuNQXXFrEOy50o2dy8fdwhxH0zOIOWA==
X-Received: by 2002:a05:6402:3583:b0:66b:8f61:a928 with SMTP id 4fb4d7f45d1cf-66b8f61ab75mr1285103a12.8.1774726062148;
        Sat, 28 Mar 2026 12:27:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18b7:e580:68f0:a6ff:fe88:bed7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081af8sm857420a12.27.2026.03.28.12.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 12:27:41 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer dereference in configure_isp_from_args()
Date: Sat, 28 Mar 2026 20:21:37 +0100
Message-ID: <20260328192721.255493-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328192721.255493-1-azpijr@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57469-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 345BA34FD17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function configure_isp_from_args() incorrectly dereferences
args->delay_frames[0] to configure cropping without checking if the
pointer is valid. However, as noted in a FIXME comment later in the
same function, delay_frames can be NULL in certain pipeline
configurations.

Add defensive checks for both delay_frames and tnr_frames before passing
them to their respective configuration functions. This ensures that
optional frames are only processed if they were actually allocated,
preventing a kernel NULL pointer dereference.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 44 ++++++++++++-------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a873..2904455b35f7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -775,9 +775,17 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	ret = ia_css_fpn_configure(binary,  &binary->in_frame_info);
 	if (ret)
 		return ret;
-	ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
-	if (ret)
-		return ret;
+
+	/*
+	 * Only configure crop if delay_frames are present. Accessing
+	 * delay_frames[0] without this check would result in a NULL deference.
+	 */
+	if (args->delay_frames[0]) {
+		ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
+		if (ret)
+			return ret;
+	}
+
 	ret = ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
 	if (ret)
 		return ret;
@@ -808,21 +816,23 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 		return ret;
 
 	/*
-	 * FIXME: args->delay_frames can be NULL here
-	 *
-	 * Somehow, the driver at the Intel Atom Yocto tree doesn't seem to
-	 * suffer from the same issue.
-	 *
-	 * Anyway, the function below should now handle a NULL delay_frames
-	 * without crashing, but the pipeline should likely be built without
-	 * adding it at the first place (or there are a hidden bug somewhere)
+	 * Safely handle pipelines built without delay_frames
 	 */
-	ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
-	if (ret)
-		return ret;
-	ret = ia_css_tnr_configure(binary, args->tnr_frames);
-	if (ret)
-		return ret;
+	if (args->delay_frames[0]) {
+		ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Safely handle TNR frames as well
+	 */
+	if (args->tnr_frames[0]) {
+		ret = ia_css_tnr_configure(binary, args->tnr_frames);
+		if (ret)
+			return ret;
+	}
+
 	return ia_css_bayer_io_config(binary, args);
 }
 
-- 
2.53.0


