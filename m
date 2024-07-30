Return-Path: <linux-media+bounces-15590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797594222F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 23:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B92791C2311E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 21:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6C518E03B;
	Tue, 30 Jul 2024 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="r5v4qWLv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931331AA3FF;
	Tue, 30 Jul 2024 21:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722374943; cv=none; b=VzVVvQgybJS7fGd+BwMREf1Wxh4XZY6pKj3E5svWJTFjtG16GyT1/Uy41OgGzbr4XM2dp8SYH7bQos8MFbBQbcVBn/kY/OiCqcOvD9kV+8Zf4hVc7AobCvawj/fySAT7EnSWLg7njwKusnfEgjIwohoVp5CCdLVhNXd+0lz8+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722374943; c=relaxed/simple;
	bh=d9DOTRd8kAc5fw35sUzIu6WzsI7yQjrSEqrfuiFNqYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mG75mp3v+WWkdurTjG6U+YzkHTq8HaLuQIbSfC2af86MjVFV4I+GtJp3/5wJ9CH8N0l5GwyzQe7HQNCMM2XXGn1n5sUGQdmKEUFelMRGBCsMGh/aJZI/akgk5XtWOXLos0wfHiyJIkscLfUgTGQ+uMsfnpjlPYbqle0/1FSlI/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=r5v4qWLv; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WYSyz5ckCzDqP4;
	Tue, 30 Jul 2024 21:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722374940; bh=d9DOTRd8kAc5fw35sUzIu6WzsI7yQjrSEqrfuiFNqYU=;
	h=From:To:Cc:Subject:Date:From;
	b=r5v4qWLvY4/kGsvFw1l0EuORSd7UcVGRmb6wgORcG7y1hed/N22dH34KKS9gpgrG+
	 f0iKMvwycIR1QJ+hM2D+QLGIC9Y1iVI74nbC5EgvO/njW6faT7Jmwkf+JpZp4UuQXI
	 iNaBENHjU0RsW47rB0wf1J+pacwFPB6DJMPvy+jc=
X-Riseup-User-ID: 7192E67EA91FC2267A7FC0DECF5ABE72E1EF159850640A75E2FA476C35DB71A3
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYSyy0yn3zJtLb;
	Tue, 30 Jul 2024 21:28:57 +0000 (UTC)
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
Subject: [PATCH v3 1/2] staging: media: sdis: move open brace to a new line
Date: Wed, 31 Jul 2024 06:28:53 +0900
Message-Id: <20240730212854.474708-1-santiagorr@riseup.net>
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

V3: Insert the change history (including for V2)

V2: Remove spurious [PATCH] header from the Subject, inserted by mistake
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


