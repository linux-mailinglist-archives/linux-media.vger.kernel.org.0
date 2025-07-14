Return-Path: <linux-media+bounces-37630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A8FB0408D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCB4216A980
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9426253B67;
	Mon, 14 Jul 2025 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGeelQD0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62E1FDA94;
	Mon, 14 Jul 2025 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501063; cv=none; b=VhZRX0cykDpICknXpSYj4xlVKJZvLFg3092rYwbp09Pi9SAquQo7t75szPiGvNTth6+8jMCfjH69rXBqRA4CXDHocIqNT947VeX/KQwOHtTr3WgN5Gficz+n1x9w6GwQAWTbr0I8hAsfQ/qQhiezVVTkMeBnpFhl81XgV8wfb2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501063; c=relaxed/simple;
	bh=OO3qtlOU5nab/BE/Qo+VwsrskRxL6r/L4D5lBrq84Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnABut4BNltkt57+wGCKpq5wjbXpnRdQ12PPjqaLr0yexZpYKkJlZjHsoKIH9ygcHytEB3II1qf/VKEd8CZtBghNkMjUftGf2pJBEXIZoWgPDS+NPtNFvAi7bSlrC4v5LIMIIq6qorRRLuVsZsXl42Og0qVYUWXE/Xn/y/j+ETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGeelQD0; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e4043c5b7so36853677b3.1;
        Mon, 14 Jul 2025 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752501061; x=1753105861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeeyZV6Qy4I7FM/LKS7AigWifBQxBfcSFWTkoEx7zvY=;
        b=PGeelQD0Vm5bVlCcwS1sbbhmFMhbUez34MS/eorlj2qo6NsGpBRJBeGmqIeEtPHvOB
         lp3p2TicdaG/u8iINqmdk0Vi9hTyqr4gi8MoYcXHNPyzx6248QD7TdNiE6txzqh6x1n9
         ha6BpZgH9iCse8FR3aKWaPq3q+RQOqB5uYoRJCEMuAitkvMrYazCjSgeQOHStNHebLTJ
         a0ZLjAJoCVgyGN1R+sH/WR6yUGLpgWHkZCO7+tC8VmKpqgQBc/gxD1/6LiYGEgGRUmhe
         lQZPCMqB3m5jP21ui/G/FHsO1yBRNyOSssVaCqHN8YBloUdBD715zqvBFrpwZ9clJK2N
         XBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501061; x=1753105861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeeyZV6Qy4I7FM/LKS7AigWifBQxBfcSFWTkoEx7zvY=;
        b=TGQh9RQKsbEkLGnadxcQ/ShWrCb3Lbf1AEZxhxg8vYKjwyyZlrBtq8rVDQW6HTAOgE
         meqFeioCfOhGmFFDLPDTlXS/sJLHXa8BkNHOUXcYRPdKDeD7d8V5uFHCKlbAeIIIWc/f
         M1evsDbZPTAx2Uf40I4s4nBS26I7L3Aro7YnASrYQD8mv/BXwARIozciy8+Fh41du74U
         OtUn5wqmYpzuBUUHCaUoP/Em8axFzs1P8JZrC9eqfQOPKbpGqPuRACvB8/40Kh7ee4SG
         uZW6qSsJ9uV2qpHVaG2g23KOxVuEhTUNiQu7pxUx1ip/tnudlziyhPxFWJ60RJ82HCsY
         M7ag==
X-Forwarded-Encrypted: i=1; AJvYcCV9b/PoqKct+UF72QLTjDaijpDok6cPz5+EadwKl+r3wR0gfR+ru8ly3ZxkLrAlnYcPKdSy5ftqNeDQ4u0=@vger.kernel.org, AJvYcCXu14aPmFwKNHT5SJwE3GgCcijWsVDGcbxvsQ6nT5hcKaMpflA/p5JU5WYU6q9OolQVcU2pJdyRf2d3C3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwpgkqswbn0giN9W469QKG+WO+5pHj3OaaurxGJReaJAzzeyyc
	kUMD/nyx3na3zkkAMX++kf/RytsPGoj8ov7pp1KJBhndh69eyHujVtWr
X-Gm-Gg: ASbGncs+83oLKShRKBNKkkQzUF4vuwj9LVT180rq40uiRaIP/rCcWaKU7yRxGvl4ISt
	+HiJRrwOYgeE71QRVp//LeEZ+JdBrapi1wScyXFLkmtiwJOlDRBSSAGGA4j4d8ijQwIMQwrLlQp
	ilUywtXmHM2s42yvitJCnNpEtNODgftETPCJLzL89baVvI5nnAaEcqR/dMRuTY0nGFAQyvwF2gt
	2INNCb5ZB+vFtkAATgkaaZOQnYuNUe13M/ayo+X4PUsdmTWzZ0JoTyoDSCagISBHgpc1KfQIzvR
	SCj59Rk1/6brnNRoXF/ljAH9NPtX05QkyIZFvmB9fAuq3nR3DhQCO9+irCcljF+LUHpFWAiE4K9
	0w+8BrO0NRQoj1m667A3+eQ3v2sNid8VHr3hsHv5pULNl+ve8BS0=
X-Google-Smtp-Source: AGHT+IEUpJDRgbueMpNzxHu0sc7ijmI3QsQbCpyeBsNqte/zBTUdFcQUyEI7MT2sTAt7mF3JUWuE8Q==
X-Received: by 2002:a05:690c:d94:b0:711:371e:ecbe with SMTP id 00721157ae682-717d7a5ff53mr196301597b3.29.1752501060805;
        Mon, 14 Jul 2025 06:51:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:5881:3041:2700:bc8c:6e13:ff9d:5355])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b4b72sm19726417b3.74.2025.07.14.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:51:00 -0700 (PDT)
From: Woohee Yang <woohee9527@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Woohee Yang <woohee9527@gmail.com>
Subject: [PATCH] stating:media:atomisp: fix open brace placement
Date: Mon, 14 Jul 2025 15:50:10 +0200
Message-ID: <20250714135014.212067-1-woohee9527@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: that open brace { should be on the previous
line" in isp_param.c

Signed-off-by: Woohee Yang <woohee9527@gmail.com>

---

Hey, this is my first patch, I appreciate any feedback, thank you!
---
 .../media/atomisp/pci/runtime/isp_param/src/isp_param.c     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 251dd75a7613..b4aac76c2ed5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -102,8 +102,7 @@ ia_css_isp_param_allocate_isp_parameters(
 	unsigned int mem, pclass;
 
 	pclass = IA_CSS_PARAM_CLASS_PARAM;
-	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			u32 size = 0;
 
@@ -178,8 +177,7 @@ ia_css_isp_param_copy_isp_mem_if_to_ddr(
     enum ia_css_param_class pclass) {
 	unsigned int mem;
 
-	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
 		size_t       size	  = host->params[pclass][mem].size;
 		ia_css_ptr ddr_mem_ptr  = ddr->params[pclass][mem].address;
 		char	    *host_mem_ptr = host->params[pclass][mem].address;
-- 
2.47.2


