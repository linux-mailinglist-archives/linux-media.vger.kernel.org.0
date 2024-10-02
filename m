Return-Path: <linux-media+bounces-19004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C45598DF2E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 17:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76B5DB264D4
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 15:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1041D0DF5;
	Wed,  2 Oct 2024 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMRKLQdr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC861D043E;
	Wed,  2 Oct 2024 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882562; cv=none; b=H0jgnVtNpxBUpZ2sC4j+WEMmq7VcwcLsDkWPGbtc9QzxNuF08NA1ppZxus0I/Vw7a4z+Mi1E2Cg2SjGqSLzxQ6wTuLqu8jl0IOpYfFN7Q6raMhgX/ZUOATl5mAehtZF6PoDOF57O6bdon1ieZ8pqyJNGeAgkZBe1qp1a9Ilh1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882562; c=relaxed/simple;
	bh=KWlEYMnNtViJ6HKjG866GxkIvqI1RzsaLptCzFPZh5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=doZVVP6bQ/Ffe6hVpX5ABH7eHmWVmeCk2pzJsZdzu3GZRSLTW4IAxG45kAqyCRtCV6+pzXOAs5iR6HDUtaVB460dfAWCAsIeErlO28Igj76jppYtCCAyRte5crMpkA3d1ag/dvCxZKMS5E4rP2/yWqfMEE6jgK9LhK5Kg0nr/Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMRKLQdr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20b58f2e1f4so30497405ad.2;
        Wed, 02 Oct 2024 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727882560; x=1728487360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCayeGfa66KPfvOFkBt9XeMoES9Vo9lnbpSOjOMdTpM=;
        b=CMRKLQdrhmlcq/9UbFp8SidU/AFjmmvnXvKhTD/8rAOGpjwz3utAl2emOFGa/vjHvp
         jKaoAqDMslsY0V1/1Xaw3D2TBDmSVVnX6eNcfrtTkN3KdLZh5dspoGxMDa9gmfYHLpz5
         zzSuAJv+523wJlYV3lMH0suTW53Jnvr82luonB4pajQeLYqJYxtRzcqVDCLKKaDXDpoW
         KNV+lyqp/0ZLqUBiGPzZlzVk8JZN5dnCxdVrR1OFP/KjQsnJv8omywdTV50cXA24EEVs
         yUJfSBVGxJGBI57w1JBTQbqlWzUEpZlX4RPgi1j1axAz0cF5g5safvpT2TOAX5eokjUU
         1S9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882560; x=1728487360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCayeGfa66KPfvOFkBt9XeMoES9Vo9lnbpSOjOMdTpM=;
        b=G/mFfJp4MGZxWOVslXoYa33/0H4+jkTwkQAcND+KXmCplv1JysnZIGIfYptbK1LRPD
         PS2qdS4A1eH+spCoRn3Ra9OGNBysEE9uKrzWEL9haHHacVLWw6obMBunrGjhrhclId4t
         ocylZ/D0g1Jvv6ShTuateAMdRtsYIMyH39W0nI31Dl+QHpMlnQYhvjD08THezfuigCl3
         i/M54jd7tzi54JSMKYQYFipyqocsTdODxqlWKDxjQrzYNLqL0MDXgqvKE6x2YSU6u9zv
         RftWByYL2KCXcKuSbSjFUQqSeHs1DJiWwNy5g/RibtMDzInTDHysAUDD0veRMu4UMKgZ
         xCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsa5CcVqoBz4Q/u34PevSGRTJnuTqBiAYnrPcpEDbpI8ga6w9stFrlvxIfoI9uugB/TrsMdI32CnKYZ+Ho@vger.kernel.org, AJvYcCXttnqVxwtAaY8sn4bHJrOCIggQ66YV7xUhHNJk48OTXxNJKvftlSopl/TLUQMd/LOVYNA1OiDm3AYfAhMHipI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8SnSc45w9SnlddlGqEhzi3ZH9+B3xVzLNF3ENJx4RXh2+NYnH
	7VHRXROHRFMjIs6ef6gpLWaa4I3WT39yYcxilDJ/OMe4D/sNocmcEc0lK8s/sAk=
X-Google-Smtp-Source: AGHT+IG28XenyFsSVCePdboImwZXQeB74YLNXdYnCNB42mDfYmdAkWnjCzgCbAZUPT2H21F8waxHFw==
X-Received: by 2002:a17:902:d50c:b0:205:4721:19c with SMTP id d9443c01a7336-20bc5a5d0f6mr53403585ad.37.1727882559553;
        Wed, 02 Oct 2024 08:22:39 -0700 (PDT)
Received: from Hridesh-ArchLinux.domain.name ([59.92.201.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e63a62sm84747065ad.289.2024.10.02.08.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:22:39 -0700 (PDT)
From: Hridesh MG <hridesh699@gmail.com>
To: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Cc: Hridesh MG <hridesh699@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2] staging: media: fix spelling mistakes
Date: Wed,  2 Oct 2024 20:52:30 +0530
Message-ID: <20241002152231.8828-1-hridesh699@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three minor spelling/grammar issues:
	chunck -> chunk
	procotol -> protocol
	follow -> following

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
Changelog
	v1 -> v2: Move the changes from meta notes to commit
	message.
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 34f574b0b521..af4205f4b038 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -639,7 +639,7 @@ static int imgu_css_osys_calc_frame_and_stripe_params(
 				/*
 				 * FW workaround for a HW bug: if the first
 				 * chroma pixel is generated exactly at the end
-				 * of chunck scaler HW may not output the pixel
+				 * of chunk scaler HW may not output the pixel
 				 * for downscale factors smaller than 1.5
 				 * (timing issue).
 				 */
@@ -1416,7 +1416,7 @@ imgu_css_shd_ops_calc(struct imgu_abi_shd_intra_frame_operations_data *ops,
 }
 
 /*
- * The follow handshake procotol is the same for AF, AWB and AWB FR.
+ * The following handshake protocol is the same for AF, AWB and AWB FR.
  *
  * for n sets of meta-data, the flow is:
  * --> init
-- 
2.46.1


