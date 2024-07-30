Return-Path: <linux-media+bounces-15524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F658940986
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613DE1C2285E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A21190467;
	Tue, 30 Jul 2024 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="iCZ7NFbF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E3118FDB9;
	Tue, 30 Jul 2024 07:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722324132; cv=none; b=m2a63YAeJdQiMeUlzKUwQNigP6LAy37B3pCfIxxNiOoelJhzhxw9WH7qaNsZObxi21cknVe6tiS9MHfpDZpWNHUMm3zydH4kV2HZGUOxRVQWQg5pl8Yst0WeBvWyeB6RM5SbTbSJCyzh1N6GgibXGFyJjnoiMAfRyUnwAUnDt+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722324132; c=relaxed/simple;
	bh=IN0HWJHUttJgKzmbuBRdQBSALWkp3yw0kKtP0uBLjb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PR7vC75EUmOFAyyuNkelqepFwBAA6k9KpCcW4AhfwkjXgghh5sUsOlLP/h6ZtmwsA+ytDt7XyiUtqMhgSoHWkbZ/arKvS9ZH33hQ2ydsZFjVsS6AA+Q1DjEMamq4N+gfJw6azvNhKdo2AonQx+fOASL1GNMu9OU+F1d1z3V3Y+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=iCZ7NFbF; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WY69t1vZXzDqQ0;
	Tue, 30 Jul 2024 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722324130; bh=IN0HWJHUttJgKzmbuBRdQBSALWkp3yw0kKtP0uBLjb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCZ7NFbFedWyJiauzUfXftf8EgKQnzi60m8ybsVGQwBAKjzJi2WXe+3td2CrlF2mV
	 ncU1zt9uTV2/PxA3coi8k7NllpZkjmOIK/UygVqaTtgm8o7vOA084ydb22wn2037kn
	 2B5qOGMdz5B0ZayXT/jxstnCw2dE4i+uNNWjY8KM=
X-Riseup-User-ID: C22EFBD79D4794DCDD84B52A23D721205AECDBE08D8E5A569EA1E03EED89DF0A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WY69s3HFSzFtgM;
	Tue, 30 Jul 2024 07:22:09 +0000 (UTC)
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
Subject: [PATCH 2/2] [PATCH v1] staging: media: sdis: move open braces to the previous line
Date: Tue, 30 Jul 2024 16:22:04 +0900
Message-Id: <20240730072204.989633-2-santiagorr@riseup.net>
In-Reply-To: <20240730072204.989633-1-santiagorr@riseup.net>
References: <20240730072204.989633-1-santiagorr@riseup.net>
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


