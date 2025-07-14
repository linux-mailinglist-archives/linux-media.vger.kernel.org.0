Return-Path: <linux-media+bounces-37621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01857B04009
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02919167922
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFAC25229C;
	Mon, 14 Jul 2025 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=fortysixandtwo.eu header.i=@fortysixandtwo.eu header.b="C91aBkc9"
X-Original-To: linux-media@vger.kernel.org
Received: from fortysixandtwo.eu (fortysixandtwo.eu [212.227.65.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1438224DCE6;
	Mon, 14 Jul 2025 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.65.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499897; cv=none; b=vFTa8DKR3mN4bEw71IPX5pwcNcXaM/9CxxHClrDxu/WKUOV/Fl8OIaJnocD0mkD/NXRU/lb1JlyjB2h/TK5t5qA5d53KF1ulRj1w7MBbwsGzrkZhB2dDuSka/6ZWJ75I/A6dFIHbEc6PFnT/Vb/I9Dxc2Eb2GeLPKyvwJ9KhjSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499897; c=relaxed/simple;
	bh=xclahf+ZrUjjFua4GD4Fh4LfsEARiipy40GzZkFcGCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+d5ZEPu0D0WfAhFRTaotZHFV9atuvovQwjw/nBfBvZH43R6zUA4hSf8N8tAg2d6aeOGq7zzY38fe0cv6ZG5AYiflseywQyp74VYoXILikQDUumFmk69H2RjXv0/gM9QYqarIJi/Q6Bndu35QsWcikc3UbeshAOIOtvIKY1HCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fortysixandtwo.eu; spf=pass smtp.mailfrom=fortysixandtwo.eu; dkim=pass (4096-bit key) header.d=fortysixandtwo.eu header.i=@fortysixandtwo.eu header.b=C91aBkc9; arc=none smtp.client-ip=212.227.65.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fortysixandtwo.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fortysixandtwo.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fortysixandtwo.eu;
	s=mail; t=1752499361;
	bh=xclahf+ZrUjjFua4GD4Fh4LfsEARiipy40GzZkFcGCs=;
	h=From:To:Cc:Subject:Date:From;
	b=C91aBkc9q2zpVX1u5FFhU/0bdzw7FDyJPygmuntKK00sko/1JizUU1FUe6Gd2sK/9
	 mdKLbSiRji0n+pwuC1LCB01CpOuf0nq8Ytg5DXmDqyyHSz5hTUzyQXBFATuquuPS5F
	 U5TDVA+Y2JbJmBZsL3pivwED5r3Mi1592HUfLkfvCbaB+ZbjBeDnuRwTP+oGqKgzR8
	 8l+HN9p0DXaC1+GFEgJNhI/STZLXwuUlC5aeCTI2Nha7NTJpUJmuzq3qHZpDKFoU7D
	 Ju4AJQQFcjWdxGLRbH8fbwiYyjQtASnLkjQ0fO57FeHR0Bhbgb2pv92FJdJHyDXitf
	 l4gk9QVQhnNheH9Y1G/soVBcsIynKHUhsX/BrcQmya/xvqoZUFN5CbyzpeYMkz24jw
	 ekcZ2WCFNNN5JeuUetmnCVGA4nUkU5PfswYb0kE5qcooO+2NzKx/oHgHJqLgyX7a1z
	 DGfMNilL01mlS7qZl+j69eV6jIMzOrvmHTe0Zth1Y/wC2NtJrQghD07AbiMVu8qG4S
	 TkMRxhIARG5sT11iuzbf23fwrFRhS4ReyaK3ar/bdbx7KmNmIe6k3/KrpDpdDQ0plt
	 eAYEuGj9793kVnQoikO3c4ahfLDyWXV6IGdaWdpO4QGYYKlfPptE8gaJr5ZYFt6vUI
	 1DyqlOCd+dnbazR/9YnQAVAY=
Received: from localhost (unknown [89.234.162.240])
	by fortysixandtwo.eu (Postfix) with UTF8SMTPSA id A1DE72E742;
	Mon, 14 Jul 2025 15:22:41 +0200 (CEST)
From: Evangelos Ribeiro Tzaras <devrtz@fortysixandtwo.eu>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Evangelos Ribeiro Tzaras <devrtz@fortysixandtwo.eu>
Subject: [PATCH] media: atomisp: put trailing statement on it's own line
Date: Mon, 14 Jul 2025 15:22:16 +0200
Message-ID: <20250714132221.4611-1-devrtz@fortysixandtwo.eu>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: trailing statements should be on next line"
in ia_css_formats.host.c:47.

Signed-off-by: Evangelos Ribeiro Tzaras <devrtz@fortysixandtwo.eu>
---

Hey, this is my first patch
(done as part of a workshop at DebConf25),
I appreciate any feedback, thanks!
---
 .../atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
index bae1ca2cd505..9a4f9cc40bfa 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.c
@@ -44,7 +44,8 @@ ia_css_formats_dump(
     const struct sh_css_isp_formats_params *formats,
     unsigned int level)
 {
-	if (!formats) return;
+	if (!formats)
+		return;
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "video_full_range_flag", formats->video_full_range_flag);
 }
-- 
2.50.0


