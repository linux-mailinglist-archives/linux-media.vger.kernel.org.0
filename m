Return-Path: <linux-media+bounces-19735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C7E9A0716
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 963311C225FE
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB9E2076C6;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNp90kIq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D07F206E66;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=MNHpc4sf+WjQCfdQ9gQpHjR6WIfLDoDDV+an4sYEww/iZlcK9DkyTdp3ZQDEH4st6WnggAs0gV2EaJh5xTRazW22XSUpUBX4LkZ1kOlPN4my2c01pTVzpouZYPLWWD6kP+to8EXDHZyBDQ3UOKF9vxlpoC7FvzmxHUJ8sbSvpCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=ZgpHQI6GK409XtLuLgOrMuqhCtgYxGC5WDTbMjcGNCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fz/FJU+saG0DtUaVGqrf47Rpcsp0mgJUDZwZ7DiiB+cbgi/ztClPhCtSYzmP8N7bfM1AByy4cL2R+tjmX3faBmc7Z2GUFIwDs/dswkRAiOsaybfCswpUt88EK3Km3eDCDdcS5ltMjjMNsoMDdHtPdfD2/Acs4QfjI0cfm00rNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNp90kIq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C43C4CEC5;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=ZgpHQI6GK409XtLuLgOrMuqhCtgYxGC5WDTbMjcGNCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dNp90kIqW6eaRwDQqDdml2VoOGQ3FJrQsvWIyRrY8m7PZR1MTTNxXOIt4IOwp6Zv6
	 Pv6jsrLUW5obGPukd6tm6T4yigUTXmIBDU1dghMRLAry2CYfvBCogdEm80vtKN5jRr
	 6AGbSbmLOhvAjD+hAkVHY5uRTEsPvzWOc+WV0s/0NLpxuLygcsnjZaC14PHJihx022
	 E/WrhiJal1MNMcPPYTCie/sQUIyiYvbvvO1gub2qnAGuKsAG+77abI2srR1Pm43vRy
	 lBQOGwQjlAag0wFMkmLpPOHfQXDxdg7El4EsGByA1tw5u3t1DtzkdB/iBROwciGjxl
	 mad3NNIHA9kzg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004Ymh-2F9J;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 05/13] media: mgb4: protect driver against spectre
Date: Wed, 16 Oct 2024 12:22:21 +0200
Message-ID: <4675c8e726c7d55bbecf9f4772370daa8b46ccd3.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Frequency range is set from sysfs via frequency_range_store(),
being vulnerable to spectre, as reported by smatch:

	drivers/media/pci/mgb4/mgb4_cmt.c:231 mgb4_cmt_set_vin_freq_range() warn: potential spectre issue 'cmt_vals_in' [r]
	drivers/media/pci/mgb4/mgb4_cmt.c:238 mgb4_cmt_set_vin_freq_range() warn: possible spectre second half.  'reg_set'

Fix it.

Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/mgb4/mgb4_cmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4/mgb4_cmt.c
index 70dc78ef193c..a25b68403bc6 100644
--- a/drivers/media/pci/mgb4/mgb4_cmt.c
+++ b/drivers/media/pci/mgb4/mgb4_cmt.c
@@ -227,6 +227,8 @@ void mgb4_cmt_set_vin_freq_range(struct mgb4_vin_dev *vindev,
 	u32 config;
 	size_t i;
 
+	freq_range = array_index_nospec(freq_range, ARRAY_SIZE(cmt_vals_in));
+
 	addr = cmt_addrs_in[vindev->config->id];
 	reg_set = cmt_vals_in[freq_range];
 
-- 
2.47.0


