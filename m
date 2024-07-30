Return-Path: <linux-media+bounces-15523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CB1940982
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1071C22654
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F6E18FC6C;
	Tue, 30 Jul 2024 07:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="BePqTENv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D288D18754F;
	Tue, 30 Jul 2024 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722324129; cv=none; b=rt11w4yIfT9YAaIWcgZ3VYBEoI4kZRPgsVCSYNYTTVHZo3QvN0QMJ2m2zYGiWmVZti2u6XUiK/0gnkyHajriqUiYLeeDE3bdxy7GHdIooSXkLdbkYopqJ8gif9yxUseyjSD6kY+kntSXI6Hfo2HVTI0ibWLJJbFoNN5UKHK+iLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722324129; c=relaxed/simple;
	bh=k6u1msdn4xjaBh51mVpqy52CCsPFga4yXT58BzIXQS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ms4oe5Cw+N3YJAu4hnhWOgku/TTgZpwVgCamIKLW2mPCElsyGLIe8E40tz2whRVLZHE0avduPiAamq64sMGAky4ExmUP2LIMg2DlTJ+sZWfA4SqDYOfDW8V9sAnDOA4RS9vdTtNH2lyIzwD/jMx4uAQKhnyQWm/xuYASd9G4NvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=BePqTENv; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WY69q0hXvz9tMg;
	Tue, 30 Jul 2024 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722324127; bh=k6u1msdn4xjaBh51mVpqy52CCsPFga4yXT58BzIXQS0=;
	h=From:To:Cc:Subject:Date:From;
	b=BePqTENvcK8hXiemprWsGoOj0b0WnQJQhysvzjfZ/orTuW+IK8Va33nX7p7aOH6Oa
	 1hKZlqSXFEN84HPRq95ZGkUwH/EPjMtqPRKodtGUpiT0LiOlWc1CysfcwuSD7j55BK
	 6y9Iv7OuAT8fG0UfzmDvr0/Q3MW9LXIvX5r53Tm4=
X-Riseup-User-ID: 2F20839050D65C01DC730B48ADB22AFA65990E70D5E6AA7E08C6B97C322414F9
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WY69p0rttzFtgM;
	Tue, 30 Jul 2024 07:22:05 +0000 (UTC)
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
Subject: [PATCH 1/2] [PATCH v1] staging: media: sdis: move open brace to a new line
Date: Tue, 30 Jul 2024 16:22:03 +0900
Message-Id: <20240730072204.989633-1-santiagorr@riseup.net>
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


