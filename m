Return-Path: <linux-media+bounces-15536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD9940AC7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 529B81F2142A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961D619308F;
	Tue, 30 Jul 2024 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="OxahsIy0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B4193081;
	Tue, 30 Jul 2024 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326799; cv=none; b=HSKx275rirxiQ0eYxSFGH49G1DqQJOHM+vMQuBifuzyzv92WYxDxy43EPMV0wjzoKRHeI5Xb1bIdJz/He/tKQWNex0ooKrFKsHde3TIHrlvmA/yf5IT2g17nApjxQ/ChzLROeC/rmJYxIJs1AuPe/30E/l9QxpnNqD8Qgi4U+Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326799; c=relaxed/simple;
	bh=IN0HWJHUttJgKzmbuBRdQBSALWkp3yw0kKtP0uBLjb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMdsn/SPysC9rSiyIVAnOUDpsdl+Ls06FOyDh5RjUIxfCEii8DexsbOUXCPr5BRRLw8Cqln2xTe9rLkKhtYiSuBCrPIYZxaVvbYR8HbKVOt6XZCwG4klD2AC6EWi1Id7kkIzd0nloGzQcaffTS9V6mcGe9P3DF/e7H2bBKSwi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=OxahsIy0; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WY79872kkz9tLy;
	Tue, 30 Jul 2024 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722326797; bh=IN0HWJHUttJgKzmbuBRdQBSALWkp3yw0kKtP0uBLjb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OxahsIy0NF6OlKKSOEVjONXL13rhw/TYuVglAR66/Tj31mWuGWdt78XkM628HbXTa
	 ay9x7Uav5PE3FgXPw1B4BlDuf9Tbx0s4RL8WL2NvgYyLCJzbAYt9F/HQV7dpgvZkbp
	 7dpnfGtX6tVHwsh888N74tMXS85KfO+uHMtaoE0k=
X-Riseup-User-ID: E36BF8B1E1466AA98E5ACF45BCD2A3FB1146A92052B7B9895FF67AC8447BBDA7
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WY7976QlBzJtQv;
	Tue, 30 Jul 2024 08:06:35 +0000 (UTC)
From: =?UTF-8?q?Santiago=20Ruano=20Rinc=C3=B3n?= <santiagorr@riseup.net>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: helen.koike@collabora.com,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2 2/2] staging: media: sdis: move open braces to the previous line
Date: Tue, 30 Jul 2024 17:06:28 +0900
Message-Id: <20240730080628.991297-2-santiagorr@riseup.net>
In-Reply-To: <20240730080628.991297-1-santiagorr@riseup.net>
References: <20240730080628.991297-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: that open brace { should be on the previous
line" in ia_css_sdis.host.c:253 and :258.

Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>

---
This is one of my first patches. Could you please if is there anything
wrong with it? Thank you
---
---
 .../pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c        | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index cabacfc84..467572d84 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -250,13 +250,11 @@ ia_css_get_dvs_statistics(
 	assert(isp_stats);
 
 	map = ia_css_isp_dvs_statistics_map_allocate(isp_stats, NULL);
-	if (map)
-	{
+	if (map) {
 		hmm_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
 		ia_css_translate_dvs_statistics(host_stats, map);
 		ia_css_isp_dvs_statistics_map_free(map);
-	} else
-	{
+	} else {
 		IA_CSS_ERROR("out of memory");
 		ret = -ENOMEM;
 	}
-- 
2.39.2


