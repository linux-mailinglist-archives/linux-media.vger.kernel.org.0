Return-Path: <linux-media+bounces-47780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E922C8B832
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 20:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD2CE359A5E
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 19:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E519314B72;
	Wed, 26 Nov 2025 19:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFqwOaoW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680DB2641D8
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 19:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183658; cv=none; b=lSBxrRr533g7p+LQWxGHqKNpUnZGNhEktfzntCIcolw2bLPGe8jR4ZremJ2+GMauSqGSz0auW3PsDdZ6jeU9LhlFL68PsDNGgVtf/OpUQ4cg9hoVYM9o2BZbkgz2dqDkoYz+v+adwizw5m9J/1a+5fydkC31P9ZSj5H2GI19FpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183658; c=relaxed/simple;
	bh=BGo71SitEPWVhYqtjLnWis5t1q4AdHwCwZUqh2i5jSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qrtDFM++z5hl9+Oa2zFmkPl2HlRDQKwv21iXNY2UXGzSwpCBVNvwekirm5qFgzrZ4uqTLQ5sxfx8/20yRh8M0YaiuZSivGkw7CIExPetXrJ38yGAHQeR8eyw7tBafc5Do8ukD4ShWnQVZNmn3Xp+8GE63hszA6I1dnsutjtw5mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFqwOaoW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b90db89b09so6521b3a.0
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 11:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764183657; x=1764788457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdAfofPkZqBP7fas8//QaNlK+QG5oYJgN4CCWeJps6o=;
        b=UFqwOaoW1Wxtaz201C9W7eoxEIMBQ9SqcLC9oRq1PVzLco3dV2Sne1zx8Mj64LRR0x
         mecmLE7de9TErE5V5HQKUUrUPx3SGXCOyOknHvtv9WT3zWOffxJWuR74CzWuGBSVwLGv
         DDd6p5zdDyqZLm712ZZ76IQIl7ww0Bda62lDeg657I0iq+tilfGtfFYhAPQa2IpGmfh4
         l/o0gakDEMhKfib2E20gcXn1jZkcOC/fmhjkcX4F726vq40vQw9R4MQBP9yUlNKTFW+h
         0u0HVYgky1eLzLhMFRtlNXHAvRP4L+NTn0v5i1AWzc5oIxAYVBVcIqlXIes3jCTmG6vF
         z6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183657; x=1764788457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdAfofPkZqBP7fas8//QaNlK+QG5oYJgN4CCWeJps6o=;
        b=qk77qtpEETYrF5HBOUge2zbXBlwdeQMeGc83iBymw/L+2X8qKvGKDaWYcm4Vh25UzB
         JZoCM3Mm/pHNE0XeEDB71LCRKlKKrBv1VlwWf2JaN1spRAfOmW3W6B2yEnEeH6AXW3wx
         DpvxAWELhAVFRJPxYQrtSLLGvOsVcjZ3Z1lMo8BK+8srrhMeYtTDajrpPcspIi3n07Uq
         b+BZ2rpP6EigKkUTdtv3wsZLEukzEepXdm4GG2O5qihyKng5lTD2aOgXTlCTaytQb19B
         cny8mOjcJOWIKT6OY/ug6dBdwj52L+ACejJSCuWOXw2trw7m8lbOPQjxNlGJALkvThOB
         lHOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWueYq837875f9MC18kwaLIJ78Ob7Kpm1COT8KMM74tLd+kYXFKSESMuOWgnHrDHhir3SxyjGloJOAdXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfkO1VpymtWqm1UYyxFuzFZ86w3HWZXnV4cZS1HnO9zG7Ut5k
	3/MKymq0XG4ArFbbQBMHFJNikOymGmNdrEbon5GepfoQvOf4mS3mO9pO
X-Gm-Gg: ASbGnctugLAtHNCyrD23mb3DvovNrBqoPD3DSZf7H8MYJl6iZB/3KYwAhnwajGDCr0z
	4wThGGrWPHrgqsgqClcM/Hq01eFjUF76tSu+/8h+oVY64/qB4uILMaGpsS7437CUtjAhkZBvTh/
	vTsQdQUzvn52bWwNbtbdwAsYXEFV962iHXv3tLwZcWtA6COlgG1VYFe+kctUmvm4Cg7AKKIKvkx
	tgAM+V2c45IBEcLn2ptBpcdmG5fz3WT6DRh0jWI1Mp2aMDSBkfy7i5B7DVp/m15ShgHn8lLh9dd
	7s4qF3xTWsN5KrBIhUTNcYbVBz//wMFvwW1IDdpKg6szSNSksKV2GPzU+uYq1g9rtLcmbtNa4yo
	+Kxio1tt3yav3DPSi9qShtxfljGk3RKnot4JYSRWGVJgCmD2OXBpfDGrPoaCLkaXMTATY4Ctdro
	UA2+sr7Hj0t7sfvQ==
X-Google-Smtp-Source: AGHT+IHU+aXAA0q0Iz7Eeb8GCZpYyoyccizXCz9DRoBSI+UPrt3ldISBrusLfd+O3KCjNgSZPWLuyg==
X-Received: by 2002:a05:6a20:9184:b0:342:8c38:ec2 with SMTP id adf61e73a8af0-36153f618f1mr12615631637.1.1764183656362;
        Wed, 26 Nov 2025 11:00:56 -0800 (PST)
Received: from Kai.localdomain ([106.222.235.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd76129de4dsm19925972a12.36.2025.11.26.11.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 11:00:55 -0800 (PST)
From: Ayush Kumar <ayushkr0s@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	ribalda@chromium.org,
	abdelrahmanfekry375@gmail.com,
	santiagorr@riseup.net,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel-newbies@vger.kernel.org,
	Ayush Kumar <ayushkr0s@gmail.com>
Subject: [PATCH] media: atomisp: coding style: Move trailing statements to next line
Date: Wed, 26 Nov 2025 19:00:26 +0000
Message-ID: <20251126190026.37436-1-ayushkr0s@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).

Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 11d62313c908..5ead15dd7f84 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -875,7 +875,8 @@ ia_css_process_kernel(struct ia_css_stream *stream,
 
 		/* update the other buffers to the pipe specific copies */
 		for (stage = pipeline->stages; stage; stage = stage->next) {
-			if (!stage || !stage->binary) continue;
+			if (!stage || !stage->binary)
+				continue;
 			process(pipeline->pipe_id, stage, params);
 		}
 	}
@@ -3045,7 +3046,8 @@ process_kernel_parameters(unsigned int pipe_id,
 	/* Call parameter process functions for all kernels */
 	/* Skip SC, since that is called on a temp sc table */
 	for (param_id = 0; param_id < IA_CSS_NUM_PARAMETER_IDS; param_id++) {
-		if (param_id == IA_CSS_SC_ID) continue;
+		if (param_id == IA_CSS_SC_ID)
+			continue;
 		if (params->config_changed[param_id])
 			ia_css_kernel_process_param[param_id](pipe_id, stage, params);
 	}
@@ -3600,7 +3602,8 @@ sh_css_params_write_to_ddr_internal(
 						    IA_CSS_PARAM_CLASS_PARAM, mem);
 		size_t size = isp_data->size;
 
-		if (!size) continue;
+		if (!size)
+			continue;
 		buff_realloced = reallocate_buffer(&ddr_map->isp_mem_param[stage_num][mem],
 						&ddr_map_size->isp_mem_param[stage_num][mem],
 						size,
-- 
2.43.0


