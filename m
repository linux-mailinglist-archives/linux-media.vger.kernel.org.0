Return-Path: <linux-media+bounces-45135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 059E2BF72D7
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E39F4EA21D
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B222233FE31;
	Tue, 21 Oct 2025 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syptech.net header.i=@syptech.net header.b="ADcVACyK"
X-Original-To: linux-media@vger.kernel.org
Received: from gwf2.litvpn.com (gwf2.litvpn.com [216.244.76.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1932E6B4;
	Tue, 21 Oct 2025 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.244.76.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058461; cv=none; b=WGH94bjzDQXDvfDyBIkEuh1YeYsBfvpzkF1c9KtHr+uGFp1FlfOJmxxJI4AKJ7jIERLMm6akb83dD7P97IsN9/JS8tVR4GgI46qPQFhNOZWuDjgv3vrOy4+DaRMYKZS1bUCSsMskxgn1fx2ouMWaaGap36UEqkjQoV4rRV+La40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058461; c=relaxed/simple;
	bh=kjXzDlWgb9eThwmH9F3G/KyoVnumA55hC58shjQvoPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xfe4A5zrS19JDDlKDz8gxZ6VK/rvnAZgHxVvzKXEYAm7XK5Rh8OdqZagzO16Tv63zVcbpKhKdefMGNS7baIAcAhIgaHCq8HZMuLAUDUT4wFeIv+p1ku22D8VHT6oPMkDtaQ6Rt6JdAnfW6fqhUcHO5e7sBP86WUtxO145lUvC5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=syptech.net; spf=pass smtp.mailfrom=syptech.net; dkim=pass (1024-bit key) header.d=syptech.net header.i=@syptech.net header.b=ADcVACyK; arc=none smtp.client-ip=216.244.76.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=syptech.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syptech.net
Received: from gw2.cammew.com (gw2 [64.182.209.149])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gwf2.litvpn.com (Postfix) with ESMTPS id 35516185C914;
	Tue, 21 Oct 2025 10:44:25 -0400 (EDT)
Received: from syptech.net (unknown [24.236.176.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gw2.cammew.com (Postfix) with ESMTPSA id 852F3EE8FD;
	Tue, 21 Oct 2025 10:44:18 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 gw2.cammew.com 852F3EE8FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syptech.net;
	s=relay; t=1761057858;
	bh=4aiSc+CL9FZ65eMtNDmHHoElR3Dgy8bynX4TCf5YXW0=;
	h=Date:From:To:Cc:Subject:From;
	b=ADcVACyKVUNyoJgnlnEBaEEdRFdL9SBM6pqbG9jp8zHY0qjEkwDGSGiu7yWpYAOb2
	 0V9DpTRHnNfvE/jjHUm5eQNZc47xiGsBqVA+MEKOGCAVPrHLKKLLY06nqWjtJ0C2q7
	 QwkrUq/fBXm89NKaU9FyBOZQlQarEwtrMwyxp2DU=
Date: Tue, 21 Oct 2025 10:44:05 -0400
From: "Adam J. Sypniewski" <ajsyp@syptech.net>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ov13b10: Add ACPI ID for ASUS Z13 Flow laptop
Message-ID: <aPecNTw6RHzprJ6e@garrus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The ASUS ROG Flow Z13 2025 (GZ302) laptop uses an OV13B10 sensor with a
non-standard ACPI ID of OMNI13B1 instead of the expected OVTI13B1.

Add this ACPI ID to the driver to make the front-facing camera work on
these laptops.

Signed-off-by: Adam J. Sypniewski <ajsyp@syptech.net>
---
 drivers/media/i2c/ov13b10.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 869bc78ed792..6ecd77d02b78 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1693,6 +1693,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
 static const struct acpi_device_id ov13b10_acpi_ids[] = {
 	{"OVTIDB10"},
 	{"OVTI13B1"},
+	{"OMNI13B1"},
 	{ /* sentinel */ }
 };
 

base-commit: 1fdb55ed40fa5ebe6934bd6b93036c714ebb5ef8
-- 
2.50.1


