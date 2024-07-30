Return-Path: <linux-media+bounces-15535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 650A1940AC5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1777E1F22E2B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E371922F7;
	Tue, 30 Jul 2024 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="j1ebN4g1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B5191F9F;
	Tue, 30 Jul 2024 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326795; cv=none; b=W75pHEVpTyJiyKr5sEuRMafNEPOF8HjMz+j1tHcL7JM2a4REetOF1S6vRUz7XthNyLocT/fUFSYB1yy3/Dz6XlXx5e/BSxB/M6eKO3My0R/ZeP8bsSDoYg7L2lKgLgpvrfIqegPa4WXXGZsxHu89lLgA/wbOzZ3IniTKSD27z7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326795; c=relaxed/simple;
	bh=k6u1msdn4xjaBh51mVpqy52CCsPFga4yXT58BzIXQS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jdGbTaoPl1zDOfpRH4sxuL2oV8bXyZnCf5eAWaV/GyrbuxHxbtgqviQs1exTGaHW+/ARJQv7p5HSqTwS2vDOSv10iOz9x+9g50qyja4ucJw0CGfysYehQ8IjZZn+v+Fbk4ZodRYTSvuQ3IIPa5UfqFUaQJGM4I5FhVw4PeNnsEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=j1ebN4g1; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WY7946KDLzDq9t;
	Tue, 30 Jul 2024 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722326793; bh=k6u1msdn4xjaBh51mVpqy52CCsPFga4yXT58BzIXQS0=;
	h=From:To:Cc:Subject:Date:From;
	b=j1ebN4g1p7vnpQCW6Nrp6rNFT7l72hqSXCu+5cCKsufS8MT/AvZxqOXOO3H6bzk0L
	 3zc+YKCbjOKyllZAJMd3s2K5UrinLQ5T+hLv24k21fO/3rqPsOps7XrnOYTznSNuv0
	 XpIr+wrQlTC5EujVmIk17rVLhzGgJ/prpfgU60B4=
X-Riseup-User-ID: 25AADFFFA0A2CC1555A5E09A585885777CBF5704F3A8BBF65A069167EBDC4E21
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WY7936fB7zJtQv;
	Tue, 30 Jul 2024 08:06:31 +0000 (UTC)
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
Subject: [PATCH v2 1/2] staging: media: sdis: move open brace to a new line
Date: Tue, 30 Jul 2024 17:06:27 +0900
Message-Id: <20240730080628.991297-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: open brace '{' following function
definitions go on the next line" in sdis_1.0/ia_css_sdis.host.c:239.

Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>

---
This is one of my first patches. Could you please tell me if is there
anything wrong with it? Thank you.
---
---
 .../atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index bf0a768f8..cabacfc84 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -239,7 +239,8 @@ void ia_css_sdis_clear_coefficients(
 int
 ia_css_get_dvs_statistics(
     struct ia_css_dvs_statistics	       *host_stats,
-    const struct ia_css_isp_dvs_statistics *isp_stats) {
+    const struct ia_css_isp_dvs_statistics *isp_stats)
+{
 	struct ia_css_isp_dvs_statistics_map *map;
 	int ret = 0;
 
-- 
2.39.2


