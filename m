Return-Path: <linux-media+bounces-17774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE0B96F49A
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 14:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACCE8B23ED8
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5813F1CCB52;
	Fri,  6 Sep 2024 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2S9uiey"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322EAC13C
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725626992; cv=none; b=kVHLLpVpEPI7bmc0sGEFxtZxELNuWevQvL83Z2ASKTSZoLsnuQ//FH7WtbH4zgj9qvwDE+2AVcTt2EM7KGFD+1WNaVzzi5zhgya+wVlhXeC9eXCz+bHvbI/3Fm2hqto2NUnsUM+knyTuEUBKNTYhUfvI4PgEM69TrfFFZ1zujw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725626992; c=relaxed/simple;
	bh=t86KLr3ey0xV8aGVynxD9FglbGfnw1+H4wTv3kIeAlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fA9bRUNKRVRkBCk1RFu2ooANDW85ecmyK3cSF8h+B/f7GffmmchJpV0uvyLPIg52SPNlLdibzEwsdBMSs1tGGWb1J1gC09jSLIU0fcJXkoHx91h/v8qssv1Rkv//7ajSx9PRR7wScwBKVh719i5u8BDSQckYvFq5aHoLabGx84c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2S9uiey; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-a8a7929fd64so202924166b.0
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725626989; x=1726231789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Czp9Z6SR49+6O4X1D5+Idn0UT5IZExS748Rcd+ojbsg=;
        b=O2S9uiey+NhrJoO3EO+DoCjfEnVtP2vKjdjEklHqfxu7NVMb3+QxezzM//lFcb61k4
         fEUJQMdOb/LaGqeeJwopChfU9xMa0SPPDJc/2p42Mkp9yySiNyg3hyblWlrQP1f1DWv6
         bjz3lLV4OeE6E77cOfOWJUvqdzNHjYw2vi2YT1UQzut1ziZ/FYMkjg6hj9n5YgQlF+cM
         1bp9FHgAlZ3twm+1PQPepQ/CloYxNF1aqVBzjH3QZ59625y8lUvShbzXdszMFmMbpjP8
         WbX7dE6NHUhXontlo1NEt6cLdSTaNn61s95snXVxd9bf03M7ch5InBC5nNtSyb33ObZ8
         oFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725626989; x=1726231789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Czp9Z6SR49+6O4X1D5+Idn0UT5IZExS748Rcd+ojbsg=;
        b=F4OD84xKHzNCSqC/DR8y2GmhWlRFWmEP1xogFG/eX9UiWbDFnj1JEG2B0irUKihR5g
         SMRDDP0nebF4ustu31PVYVDFL6/j3onVZw6RTRu1RkHbnPcWTgnzxF0FQ+ipWcrLMsDb
         bthyBUn73MRZDhl22G/Y59/bBnYDGCW7i1B1jf1kUAxNHEqUJiesL0MLhFy4i6YM7n6X
         2SfwDAe/DUFXEcTeaga9qrXOTIOEToP11rvF4NBC/wGfMVvekDmY90Uhfog7fLD48WNw
         BaaCwNUvenzZ69KlyYor6j7WbYURHqGF9xDso4RRN1u/V/RrpBKuAjpUKGox3QfYNE5T
         6s/Q==
X-Gm-Message-State: AOJu0YzFnoD734//cLNdvKww4sOw8mbxkBFDKyjQDbKmVGRNV99mO+An
	pJZ3G9UsFp+spXVxFSatFr5xNxRm9vtBLVr2tonJtdMTP5NhZ6WqskULB7QybbZZ82uu
X-Google-Smtp-Source: AGHT+IHHhAW9GIFQTIRY9zmAPPcVvNSppP/4rRLpKJFnVTEhCPDAB9CM9kJXniAtJb+gu+VifiBL2A==
X-Received: by 2002:a17:907:782:b0:a89:b820:335 with SMTP id a640c23a62f3a-a8a888d9f8amr192867166b.65.1725626988471;
        Fri, 06 Sep 2024 05:49:48 -0700 (PDT)
Received: from navi.fritz.box ([2a02:2455:86a8:8d00:fbac:a56:d4a0:9ae1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a7dc91806sm158057166b.42.2024.09.06.05.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 05:49:48 -0700 (PDT)
From: Michal Rostecki <vadorovsky@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michal Rostecki <vadorovsky@gmail.com>
Subject: [PATCH v4l-utils] libv4l2: Guard the v4l2_ioctl function with HAVE_POSIX_IOCTL
Date: Fri,  6 Sep 2024 14:46:31 +0200
Message-ID: <20240906124629.11660-3-vadorovsky@gmail.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lack of this check leads to issues on musl-based system. Even though
compilation of libv4l2 itself with musl doesn't cause any errors,
using the library inside gst-plugins-v4l2 causes a compiler error
due to mismatch of the ioctl signature.

A similar check is already performed in v4l2convert.c, so the change
doesn't bring any inconsistency.

Link: https://bugs.gentoo.org/896418
Signed-off-by: Michal Rostecki <vadorovsky@gmail.com>
---
 lib/include/libv4l2.h | 4 ++++
 lib/libv4l2/libv4l2.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/lib/include/libv4l2.h b/lib/include/libv4l2.h
index ea1870db..16565555 100644
--- a/lib/include/libv4l2.h
+++ b/lib/include/libv4l2.h
@@ -63,7 +63,11 @@ LIBV4L_PUBLIC extern FILE *v4l2_log_file;
 LIBV4L_PUBLIC int v4l2_open(const char *file, int oflag, ...);
 LIBV4L_PUBLIC int v4l2_close(int fd);
 LIBV4L_PUBLIC int v4l2_dup(int fd);
+#ifdef HAVE_POSIX_IOCTL
+LIBV4L_PUBLIC int v4l2_ioctl(int fd, int request, ...);
+#else
 LIBV4L_PUBLIC int v4l2_ioctl(int fd, unsigned long int request, ...);
+#endif
 LIBV4L_PUBLIC ssize_t v4l2_read(int fd, void *buffer, size_t n);
 LIBV4L_PUBLIC ssize_t v4l2_write(int fd, const void *buffer, size_t n);
 LIBV4L_PUBLIC void *v4l2_mmap(void *start, size_t length, int prot, int flags,
diff --git a/lib/libv4l2/libv4l2.c b/lib/libv4l2/libv4l2.c
index 032a4f1c..1607ec35 100644
--- a/lib/libv4l2/libv4l2.c
+++ b/lib/libv4l2/libv4l2.c
@@ -1051,7 +1051,11 @@ static int v4l2_s_fmt(int index, struct v4l2_format *dest_fmt)
 	return 0;
 }
 
+#ifdef HAVE_POSIX_IOCTL
+int v4l2_ioctl(int fd, int request, ...)
+#else
 int v4l2_ioctl(int fd, unsigned long int request, ...)
+#endif
 {
 	void *arg;
 	va_list ap;
-- 
2.44.2


