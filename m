Return-Path: <linux-media+bounces-65784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eYFqHlJwP2qYTQkAu9opvQ
	(envelope-from <linux-media+bounces-65784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:40:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DC6D156A
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=CPBjPvfe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65784-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65784-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7F5C304291D
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B11392838;
	Sat, 27 Jun 2026 06:39:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B161390CAD
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:39:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542373; cv=none; b=c0p4p5JurGe7ucWw3W/lP6jdtWxdWLU1wwarf2R8nP2GKm9nBiko+jYr4KCCGwfi+lNxPGcBAJ8m2sp3E5JPs7aGXdNM/3yiU+mgU31LRkZs7yxwFK4Re81GqftArCREFxw0ewj8feblNayGwUiA/IUJLq2uqJ7krlkpdbdHeJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542373; c=relaxed/simple;
	bh=zqrtoIgxqlPm1yGRfDaaOKs8e4n9g6P9Nhu6aDp1pAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cp04Ufi3T9JCRiD4q+oPBute7K2hNWCrMVxI+GgsI1fraRsQ9xi0P2+9OT6JwUniZ6tO13FRXKxq+3GkIcpaeg/Roh4/V4kFBUoUWnaBb9PBGrMnUzuYBqXxT/3tTE+fjNH3GRrgKZndhI6VYuviwDmNGo3m+utuoACw6MfvjXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=CPBjPvfe; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so11579875e9.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542370; x=1783147170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3B6M5EhMpzjG7Zmkrc3EdtRy3lRAN9WZO0zjTSLhxM=;
        b=CPBjPvfendMppXOuycOwR9TPQz3JQ0ZX7/YdZ4AQDHLAWfoBwxwwPxSW0qbf66cBtO
         DhuQHzrrdR3FsJYgI3btIq7twFUsiXyqppL8DyE6SlAYI0v5VIWLLlWPLtRn235FxhKv
         z6mkvy+/mwWNaUV3yq6Ps29j+XnIOGVlPFZ20XUcdSn5CGcrwhIBFNzDFLXO197B8D7f
         kyZ8h2O5TTmSRbiRU6tQ81tNRTiaGK/Hh6M6YscLb+dPv0UPrdqLAvRcthX+u5nNZw/P
         udnIKH6c7i3XdiPg2jNDqVxEVHlLWWJ+i9KOn9P7ju6/iW34nKlR6eAlhJrdyOunB9di
         BSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542370; x=1783147170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3B6M5EhMpzjG7Zmkrc3EdtRy3lRAN9WZO0zjTSLhxM=;
        b=JuB9D4Kv2rqUqe4zf+vPRIBAwXPFH0gDr33s5R2HobeRP3IgH75s32iC5tCWZJcjXP
         mTy8CgQP9o3B3XW95d3m+Zf44Qs2VySyqjb3IpnTauhVGh860dgKCfw0jRJPRSZyUsML
         zh2bGsnXW5VeedC93064R3dCLHJS2F2Pr9rhjRZD4DFd3CCNdfOOeKCp3xLdLJF0iqgs
         +kAY0Qe4N/KhXaI2rFbxwhU+mk82mdPkJO4THjKGAe08BHWWYZiU2IWzb/Y8pdffxFN8
         ZvyHgFMJB5FVbXD9EKMfah9V6YijsLOFBoMJfsP5/tSNOqndTxdEv2mLrQZEWUgRnHag
         mEWA==
X-Forwarded-Encrypted: i=1; AFNElJ/83hEafrQIfLX+pbS6VY2qZ6XwJd64co6Ck+uz9ch6Eg/7X0GuzJbuE6UChaC9O3yB2MiMYOySj0C7kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDPqywYUr4k25G12iV5Esl7fcmYS/x8aZbOt6jwPOpVZ04F0R
	W5nrq8qiYPIVcTiH9Et1fxCOvDKsAbdLfj2H2ce8LC2W1rrv/1QnEdYvfap3xywYqXPr
X-Gm-Gg: AfdE7cmc9nGW/DtYRReNsvuInhqNciHunoAm7kw1fOyv2cI45R8qZssounQ0HPx2Xng
	8zrrnbq7sNkYH6YPqwz4w+CIXK7QFjrT8qJtWmst/zcYN5/8ft0IWJdVxbBZmVUQWE83xuNnTaC
	VGE74GeKiesRIV9+l8uTmEVYuYkOBYaIOhizHsVxrssykzXptR0WPSDNDIoj1McH8Y2cT8B4PJw
	qmB6SmbovJVkbEdNbRBtyTJza3o1Kb2kLLQtQyn/2fs1kWQde8JC44IARXcFDjn8+8rawNojQY2
	nLjHp8oiRpK6BK/VVZX41T8IqfqdFv/7R47juEEMR5AxxTDQupfB17u0yaraxv5pKGWrpAraHxM
	V+yUuqpVHR52t26OZK34uC/qqyIz5EPvx2O/POh7P2RBZsb//0Rq3KrW5kGL50kHaSu/WAXUnP3
	Gg2bhdQwY9SKraKmW4qojon/wvZODKWqiuGpAH80IoNdt/Qx7tQm9+sWurm83TboKK/N3BVgxqX
	SpjVKqHIMtf8r5Nn1D+FBh8Vo+9XRqyUrY=
X-Received: by 2002:a05:600c:3f0c:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-492667e9b5dmr131450645e9.0.1782542369935;
        Fri, 26 Jun 2026 23:39:29 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm79198785e9.1.2026.06.26.23.39.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:29 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2 2/2] media: atomisp: bound DVS 6-axis table dimensions to the allocated config
Date: Sat, 27 Jun 2026 08:39:23 +0200
Message-ID: <20260627063924.79491-3-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627063924.79491-1-doruk@0sec.ai>
References: <20260627063924.79491-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev,0sec.ai];
	TAGGED_FROM(0.00)[bounces-65784-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[0sec.ai];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA4DC6D156A

atomisp_cp_dvs_6axis_config() allocates the DVS 6-axis coordinate arrays
from the stream grid via ia_css_dvs2_6axis_config_allocate(), but then
uses the user-supplied width_y/height_y/width_uv/height_uv as the
copy_from_compatible() length. The reallocate-on-mismatch path also
re-allocates from the stream grid, so the destination is always
stream-sized while the copy length is user-sized. User dimensions larger
than the allocated grid produce a heap out-of-bounds write with
attacker-controlled length and contents, reachable from
ATOMISP_IOC_S_DIS_VECTOR.

Reject user dimensions that exceed the allocated config in both the
ISP2401 (t_6axis_config) and ISP2400/else (source_6axis_config) branches
before the first copy.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel
Baytrail/Cherrytrail ISP hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5046a0ec8bba..9338aa009923 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2630,6 +2630,20 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
+		/*
+		 * The destination coordinate arrays are sized from the stream
+		 * grid by ia_css_dvs2_6axis_config_allocate(); the copy length
+		 * below uses the user-supplied dimensions. Reject user dims that
+		 * exceed the allocation to avoid a heap out-of-bounds write.
+		 */
+		if (t_6axis_config.width_y > dvs_6axis_config->width_y ||
+		    t_6axis_config.height_y > dvs_6axis_config->height_y ||
+		    t_6axis_config.width_uv > dvs_6axis_config->width_uv ||
+		    t_6axis_config.height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					t_6axis_config.xcoords_y,
 					t_6axis_config.width_y *
@@ -2682,6 +2696,20 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
+		/*
+		 * The destination coordinate arrays are sized from the stream
+		 * grid by ia_css_dvs2_6axis_config_allocate(); the copy length
+		 * below uses the user-supplied dimensions. Reject user dims that
+		 * exceed the allocation to avoid a heap out-of-bounds write.
+		 */
+		if (source_6axis_config->width_y > dvs_6axis_config->width_y ||
+		    source_6axis_config->height_y > dvs_6axis_config->height_y ||
+		    source_6axis_config->width_uv > dvs_6axis_config->width_uv ||
+		    source_6axis_config->height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					source_6axis_config->xcoords_y,
 					source_6axis_config->width_y *
-- 
2.53.0


