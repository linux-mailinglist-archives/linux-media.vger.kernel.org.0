Return-Path: <linux-media+bounces-61196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACz8NtKGAmo6uAEAu9opvQ
	(envelope-from <linux-media+bounces-61196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 03:48:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C95186D1
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 03:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A18F9307955B
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3912DA76F;
	Tue, 12 May 2026 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCqX6Ogj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9181287263
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550319; cv=none; b=gMZnT+fvWk251uZQQdDe116fmzWnIqXjyjZr2LlFBGwzh/HV51BcteFoAXR08cm37mJTaT8zD0GaVwwo8mJD/T3CqXIjnugtVai+dgDbbhUP/6xolMZSBMA/onBQgdG+DEv3wbLLfDeHKZWyf7qrGWlXi81s++agiwNHoTRuR5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550319; c=relaxed/simple;
	bh=YxgDZVqMtyl56UCDKSwzuZdYVkyDLcSvULyv0SuvHI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnh3DAHnkzWXl6axyez6gQt9CRrrwe3lZp2XWr9qEtrw7lDRXUpFHpIbgnJja3u5z65JdoqxaJtxtW3wMdZMp3BecXShHDvql3QZnm5M/k0BCW0hdmdl8YYJYj5lQ3Q/R+cg3sSK/Z5ECqMcLqp8QB7jN5Ej1VbP5xe9Qr3n2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCqX6Ogj; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so13521853eec.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 18:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550317; x=1779155117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXCU/htQ+8Rp3JW/PnjUI+XPGJxr+8fcjyipcOXBdks=;
        b=KCqX6OgjHUrkeOUmqmV8y2pQ18x0WxQRCugpVPri5MjsKrkqhUbMnzdgbYxXjqT+MT
         2ecqjQSAfMBJ7rO7qv1g253RjcV2yDvA71SXtJjOc+riSQ5BME/oY4aMjGqB7Hu3aSd5
         X82y5YgjMIct0DNmzQfrWe9LVzw8+TgRDBImg2+xrWGkQQzuVreabvATDPefW90Dx2VU
         YbZGLgr5xzYRcSebmekC6tbtNpkWDDFANl7Pi62gwtgdaXPM3ZoqarDlHljfjohYGuSE
         PFFh6GtxrRP43MiWnVzv6NddjZO/UxZVYfhoxWHhU1AYb/friWoc+n8VLofZ0EjrVLK6
         5Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550317; x=1779155117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXCU/htQ+8Rp3JW/PnjUI+XPGJxr+8fcjyipcOXBdks=;
        b=h1WltKOQO8hXkokdkbLycDyjo8Xw5Wj7mpKqIc09m1d67ZzMlOYsGEBnVbW4sYTZc5
         CXSHCM2PVHgpO8niG2uHzryYMb066odx+KoxLexJDnExD42PvYGYb790zYI/Xaha8/zc
         ItlLWKx97lCf1Ic6pYc/n0ZS5KdXpQ5+zOUf/mFdFZhNSWjHYXPlRk4+lbI0waCbOGtg
         +6YNxGjBFVzGAJSN7bUAtQ9JfEA2lnV/H556emx9puN97IMHNNTjzy76qlcP918wmC/7
         PE00D1geyMAvtF/CASlKdrGCQuRVfzeY1SAqeUQ5Gag55v7zha1xwXSVmU9LQwlWsaYU
         P//w==
X-Forwarded-Encrypted: i=1; AFNElJ8J9U1kNNBgOgKYBQPubKh2ynx7GnhynVOyUsekAt1+84GblFdo4ORNvZFydnDsY7LeqfsEpUuXBUW1Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy90PH4L03Sa5OoNEFo38b91WoawtazICt54b8DuTLio724rzK5
	JBtbatDFJ6171z1YkrmVL2Wnr88RCPEbEdJECNKWV9qS3tcoF4DTb4pK
X-Gm-Gg: Acq92OGwtaUTkJvnDiOe0+qRLHyzu2od2O0KLL/K1JRqf7IkWjsiOkJF0yud1G/ynwr
	UKukcqkVDvdtLec78shzcDGKyuhNLJMTW1kpskYc2BfKzLmRV9l+YF4eeFmyeBK5DloTvnWaS9a
	75tl69V+3snvOoAX0lumiuhIaJMYKFwQ+LwTVvFyi4TY+HT4JYuxYlWIIpxcBtXxxveq0KSnvZf
	ePHlD6PngWHDj03w0PpGbuSp9QG9eJ4Su1twOlzPRE5iDBKMaL2ABRnux7DTdoK9rYlW4RMreyN
	RiY6TNF0p25nQDwiDJxIG4oD1p5/7QtNMXnA5NyV/0zTCLo361q+wZbHy1Fc4TflCWVbbKmonVT
	ENHzqsvebhLH1RKbPNj5AEd7BTWDcUtKiFnVZ5e6yMIpmqaviumJHBke/7Gz+zLAgOP2RGuAf3r
	+O9U6hYQWDD0OucqlV4PDKEt2jZg0tTxy+pV1XU1Z/9VFEQJ4SEvLnao40TMvetbzw69otPR2OB
	PVgKZo=
X-Received: by 2002:a05:7300:6da5:b0:2ed:e12:376e with SMTP id 5a478bee46e88-2f54d67a686mr13643905eec.30.1778550316712;
        Mon, 11 May 2026 18:45:16 -0700 (PDT)
Received: from localhost.localdomain ([50.231.3.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm20104427eec.6.2026.05.11.18.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:15 -0700 (PDT)
From: Shayaun Nejad <snejad123@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shayaun Nejad <snejad123@gmail.com>
Subject: [PATCH] staging: media: atomisp: bound DVS 6-axis config copy size against allocated grid
Date: Mon, 11 May 2026 18:45:14 -0700
Message-ID: <20260512014514.22856-1-snejad123@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 925C95186D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-61196-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[snejad123@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

atomisp_cp_dvs_6axis_config() copies user-provided coordinate arrays into
a 6-axis grid allocated from ISP dimensions.

The copy sizes are computed from the user width and height fields, so
mismatched or overflowing dimensions can copy past the allocated buffers.

Reject dimensions that do not match the allocated config and compute the
copy sizes with array3_size() before copying.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Cc: stable@vger.kernel.org
Signed-off-by: Shayaun Nejad <snejad123@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 84 ++++++++++++-------
 1 file changed, 52 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d..677037f1da 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
 #include <linux/pm_runtime.h>
+#include <linux/overflow.h>
 #include <linux/timer.h>
 
 #include <asm/iosf_mbi.h>
@@ -2570,6 +2571,29 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 	return 0;
 }
 
+static int atomisp_dvs_6axis_size(struct ia_css_dvs_6axis_config *config,
+				  u32 width_y, u32 height_y,
+				  u32 width_uv, u32 height_uv,
+				  size_t *y_size, size_t *uv_size)
+{
+	if (config->width_y != width_y ||
+	    config->height_y != height_y ||
+	    config->width_uv != width_uv ||
+	    config->height_uv != height_uv)
+		return -EINVAL;
+
+	*y_size = array3_size(width_y, height_y, sizeof(*config->xcoords_y));
+	if (*y_size == SIZE_MAX)
+		return -EINVAL;
+
+	*uv_size = array3_size(width_uv, height_uv,
+			       sizeof(*config->xcoords_uv));
+	if (*uv_size == SIZE_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
 int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 				struct atomisp_dvs_6axis_config *source_6axis_config,
 				struct atomisp_css_params *css_param,
@@ -2582,6 +2606,8 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 	struct ia_css_dvs_grid_info *dvs_grid_info =
 	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
 	int ret = -EFAULT;
+	size_t y_size;
+	size_t uv_size;
 
 	if (!stream) {
 		dev_err(asd->isp->dev, "%s: internal error!", __func__);
@@ -2628,35 +2654,32 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 				return -ENOMEM;
 		}
 
+		ret = atomisp_dvs_6axis_size(dvs_6axis_config,
+					     t_6axis_config.width_y,
+					     t_6axis_config.height_y,
+					     t_6axis_config.width_uv,
+					     t_6axis_config.height_uv,
+					     &y_size, &uv_size);
+		if (ret)
+			goto error;
+
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					t_6axis_config.xcoords_y,
-					t_6axis_config.width_y *
-					t_6axis_config.height_y *
-					sizeof(*dvs_6axis_config->xcoords_y),
-					from_user))
+					y_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
 					t_6axis_config.ycoords_y,
-					t_6axis_config.width_y *
-					t_6axis_config.height_y *
-					sizeof(*dvs_6axis_config->ycoords_y),
-					from_user))
+					y_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
 					t_6axis_config.xcoords_uv,
-					t_6axis_config.width_uv *
-					t_6axis_config.height_uv *
-					sizeof(*dvs_6axis_config->xcoords_uv),
-					from_user))
+					uv_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
 					t_6axis_config.ycoords_uv,
-					t_6axis_config.width_uv *
-					t_6axis_config.height_uv *
-					sizeof(*dvs_6axis_config->ycoords_uv),
-					from_user))
+					uv_size, from_user))
 			goto error;
 	} else {
 		if (old_6axis_config &&
@@ -2680,35 +2703,32 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 			}
 		}
 
+		ret = atomisp_dvs_6axis_size(dvs_6axis_config,
+					     source_6axis_config->width_y,
+					     source_6axis_config->height_y,
+					     source_6axis_config->width_uv,
+					     source_6axis_config->height_uv,
+					     &y_size, &uv_size);
+		if (ret)
+			goto error;
+
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					source_6axis_config->xcoords_y,
-					source_6axis_config->width_y *
-					source_6axis_config->height_y *
-					sizeof(*source_6axis_config->xcoords_y),
-					from_user))
+					y_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
 					source_6axis_config->ycoords_y,
-					source_6axis_config->width_y *
-					source_6axis_config->height_y *
-					sizeof(*source_6axis_config->ycoords_y),
-					from_user))
+					y_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
 					source_6axis_config->xcoords_uv,
-					source_6axis_config->width_uv *
-					source_6axis_config->height_uv *
-					sizeof(*source_6axis_config->xcoords_uv),
-					from_user))
+					uv_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
 					source_6axis_config->ycoords_uv,
-					source_6axis_config->width_uv *
-					source_6axis_config->height_uv *
-					sizeof(*source_6axis_config->ycoords_uv),
-					from_user))
+					uv_size, from_user))
 			goto error;
 	}
 	css_param->dvs_6axis = dvs_6axis_config;
-- 
2.43.0


