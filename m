Return-Path: <linux-media+bounces-15377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9B593DF6E
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 14:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 342E41F216BD
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2024 12:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96F712DD90;
	Sat, 27 Jul 2024 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gVacsQ2j"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A211E52C;
	Sat, 27 Jul 2024 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722084736; cv=none; b=F+P4TVFYDXwNNiUq+pAs0DpPaFrKXgqkBiPoP/h/LCj4JALs+/4DirsbdhCOwLIkRGFOGASDPDCz2EzZBq5+BcIsAqLFX79H1rXtAqNPkD0ZtToQn5P6ZAf+XXebVa3FwV/LkgSjqJHZlawepcsLjKSdGEfd4dTGxDtIlOIUWN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722084736; c=relaxed/simple;
	bh=azMAeRKNJ4R0xJRk/zhdOIOPd4PfFprwObYbhjyyIG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fcqPr3im6KzIrQyaD59oZoW39FNaCDQoF+mEmwrSaSFL7a5WPKe9zHoStU971B9hWq3lB5XismHE1FN56Y91wqhrg5292rgAL3RcMZe+8z/49AE4pmhltQzmaNAJUI1SDjANLXhQbgr3SeGVBUWT60XYoO3uV3B6mj2UTsR/xno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=gVacsQ2j; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Xgu3sXNPV6bu3Xgu4si8AC; Sat, 27 Jul 2024 14:52:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722084726;
	bh=VoRgXRGb6x2pkA/kN42NiJ89KlfU0z16uyEo2pPo8H0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gVacsQ2j4LRxeBgxnvn4Hp1mc9QY2hk0hM6BD3aGsAO76DCVTNx/JpaFHewmStlAK
	 sg+YH3wca5nU4d7WgVKogdTCcR9bvAvAUiXZduvXn0/q+VnI4tk/p+iOq3zweVgo7Q
	 xqyqif08DeBRCSp+HM2eYDLMZF6dUpOB6g0Syjw43AjBz0gQIdehBGLI14zB4XfPQk
	 7hJsSB2v0br2+weTUcKDGoKasdW2q/kIKzK9s7tL0JB3MaG+nyJkl+pbWbt8Ij7I4R
	 efhY5GlY2zNA010hrd2ldeEUraAVm+Q+xgWgjK+xcDQY739dyjDIvdb1gZiXdh+QB9
	 6RboTWNSlk5jw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 27 Jul 2024 14:52:06 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: David.Laight@ACULAB.COM,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: Use clamp_t() in ia_css_eed1_8_vmem_encode()
Date: Sat, 27 Jul 2024 14:51:56 +0200
Message-ID: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using clamp_t() instead of min_t(max_t()) is easier to read.

It also reduces the size of the preprocessed files by ~ 193 ko.
(see [1] for a discussion about it)

$ ls -l ia_css_eed1_8.host*.i
 4829993 27 juil. 14:36 ia_css_eed1_8.host.old.i
 4636649 27 juil. 14:42 ia_css_eed1_8.host.new.i

[1]: https://lore.kernel.org/all/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS.aculab.com/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index e4fc90f88e24..96c13ebc4331 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -172,25 +172,25 @@ ia_css_eed1_8_vmem_encode(
 		base = shuffle_block * i;
 
 		for (j = 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
-			to->e_dew_enh_x[0][base + j] = min_t(int, max_t(int,
-							     from->dew_enhance_seg_x[j], 0),
-							     8191);
-			to->e_dew_enh_y[0][base + j] = min_t(int, max_t(int,
-							     from->dew_enhance_seg_y[j], -8192),
-							     8191);
+			to->e_dew_enh_x[0][base + j] = clamp_t(int,
+							       from->dew_enhance_seg_x[j],
+							       0, 8191);
+			to->e_dew_enh_y[0][base + j] = clamp_t(int,
+							       from->dew_enhance_seg_y[j],
+							       -8192, 8191);
 		}
 
 		for (j = 0; j < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); j++) {
-			to->e_dew_enh_a[0][base + j] = min_t(int, max_t(int,
-							     from->dew_enhance_seg_slope[j],
-							     -8192), 8191);
+			to->e_dew_enh_a[0][base + j] = clamp_t(int,
+							       from->dew_enhance_seg_slope[j],
+							       -8192, 8191);
 			/* Convert dew_enhance_seg_exp to flag:
 			 * 0 -> 0
 			 * 1...13 -> 1
 			 */
-			to->e_dew_enh_f[0][base + j] = (min_t(int, max_t(int,
-							      from->dew_enhance_seg_exp[j],
-							      0), 13) > 0);
+			to->e_dew_enh_f[0][base + j] = (clamp_t(int,
+							        from->dew_enhance_seg_exp[j],
+							        0, 13) > 0);
 		}
 
 		/* Hard-coded to 0, in order to be able to handle out of
-- 
2.45.2


