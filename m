Return-Path: <linux-media+bounces-57447-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D42F3fvx2mcfAUAu9opvQ
	(envelope-from <linux-media+bounces-57447-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:10:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ABA34ECC7
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5797F3027115
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AF4344DAB;
	Sat, 28 Mar 2026 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imarcom.net header.i=@imarcom.net header.b="LQSp1H58"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B708A1FC0FC
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710605; cv=none; b=Jt6xL6EaREAghLAFX0/ENOuhNu/DNb1NSjUDUmXwz+qqYdXZ54NkQ8Hm3RfcMtQWHFTXKSrHKiEzNn+ZaAGOo90I/bnKLxaGLIARflVnCIzeL3S4Ea6BZQUpOxkHiZTFGyM/PBrXuPo1rOI4NSn32tgSgGDV7PrADH8rJtvQMyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710605; c=relaxed/simple;
	bh=FPi17ulhlZb0Nh7g4bA+5CMJwB2VDszgc84H1G/p+b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pzhVwdoLuEokyh7RaYTfQmemgAyw34ljGNDrsNh4SBSmeGIlGlJeO3i7m0t2ZWSJcTXeYQynpCCPhgUIuMmcNRZH4DI09KH2+eQ7Dm1B5H8Dnb5iAF1J9js8EkhwbCBIUizGkaNp6nRs6xPOsdK1yzRmixJFgxW55ExPDFtdHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imarcom.net; spf=pass smtp.mailfrom=imarcom.net; dkim=pass (2048-bit key) header.d=imarcom.net header.i=@imarcom.net header.b=LQSp1H58; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imarcom.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imarcom.net
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50b392f1846so49800071cf.3
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imarcom.net; s=google; t=1774710603; x=1775315403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNGrJbQZmfQ6fRrQhvlfsM9LjimdSqFD6j440bkAGso=;
        b=LQSp1H58987iX9Ja2wty3ad6mjCMNh/k3+NVcsNIDyRFe+Z7P1PM4GVBKKF7jGcQ5l
         5Y+YnAdBwzh1TkuXgpsiGWJtUwm6DzPrZ0hZctteCDIEba1DIDimGC3iqkh5QKsq+3/H
         cbhHTGgfttlzbpGx8jndAbIbJOX025hPyAwFBBlOcpNGRfeJ3O5TLDLpREpnJyGx3C0e
         a7tpORjbu7MXjx2cGvnu7RnGWOgg+dUmMyMpWyaLdG4UpHWA0RWljs5dVQvHW4b4bDMF
         FM9UJy4cuQYe3jMkQe17S0GIfdD+ttuv6pZxF6kKwf7K2aa/mjDklgfk8GooQ1U0Voa3
         Nk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774710603; x=1775315403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNGrJbQZmfQ6fRrQhvlfsM9LjimdSqFD6j440bkAGso=;
        b=mwF1FMiv9/bKUPuW3C8aCvZRT0rt1posLkrlNuibDcvqdtHP9CSDhHfBuF3kW30E/7
         ebc4XN+dWuZ059V7Jnp89uLvGZC93aXT7jSohPfuMwYalBFLL9p4gZE+K7E2NNsZi1PK
         K+ttlZNFSzn+G5nKQas3ffAB7ifE8XQoQjI8Gx7hi3basg9jKXuImiMwl1EO4pwUFB/P
         3WNGYSG8hGjK4+BuDGyPxlIKafwZg5w4wK3uioRLF6AEBiHk7x5nYM+4VRCsCvhE7zcn
         M9rl0ExWZdIVZrUzRmbeZdjOYUXQzszW2nZhvneUFDwZTzRaQee9/u4C/827gs9EZBdE
         hfvQ==
X-Gm-Message-State: AOJu0YyE/BAQIInT340jJXBv1KO3fG7Dy/tk1Jnm7d0KERyUjUqj73jv
	0YXbYjN2coWpAoz0Blu3OfxCRh+zz2Fv6veaeRAssiED634W+32Xt8sikWZUuptlA0fh5Sut1uJ
	yc4U=
X-Gm-Gg: ATEYQzxN5q8OCSF2SqV+1i1HWoX+0lcYfb4cSFzjf2pWeJYGY4aXdPEY6Rgsk6ITPQO
	PUKiCjkSfqLoO1ViSssUlCOEtn4bYIq7LGX77exw7+hsuGHP4MWnWbSE7AVxscy2zo3bvOlruxS
	JTed225eKQMY1NtILSG8N0LXf9veuLLEAeXvN75chJy2lTMWT4JlHKPMcEsxUL6VK/gmf44BUPN
	igwVfgRXSBrXUyitB8G7cqQwrP9UKdgLXL7+8usisVVjRyWrzuiUWWwWzY73/kYo8HYpvwi3Uvf
	2AYbxNToieJwV+mcIUoXWjWEo9Y/0BjnYk+M97amIhIuImrPLEdbp8XYLjDs45o5Wa6krBXAAW1
	gu/iKgw8T0kR2rvO5zcyo4N9fvaA4riOXqadwgxEHlzU/Sp8TihkT8C5w7psg9f9qyErYMUrZDG
	tz7/id/xCwifhpLfgZ9Tb9E2qQnKA1Hs3qH5Gscg==
X-Received: by 2002:ac8:5f0a:0:b0:50b:46ba:d271 with SMTP id d75a77b69052e-50ba380812bmr90824751cf.12.1774710603293;
        Sat, 28 Mar 2026 08:10:03 -0700 (PDT)
Received: from mdellraspe ([2001:4958:3d0c:9401:5bc8:b8be:38e9:7986])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2de76a6sm20201241cf.18.2026.03.28.08.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:10:02 -0700 (PDT)
From: MaximeD <mderaspe@imarcom.net>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Maxime Deraspe <mderaspe@imarcom.net>
Subject: [PATCH] media: ipu-bridge: Add Dell 14 Premium DA14250 to upside-down DMI table
Date: Sat, 28 Mar 2026 11:09:57 -0400
Message-ID: <20260328150957.22380-1-mderaspe@imarcom.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imarcom.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[imarcom.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[imarcom.net:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57447-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mderaspe@imarcom.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,imarcom.net:dkim,imarcom.net:email,imarcom.net:mid]
X-Rspamd-Queue-Id: 04ABA34ECC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maxime Deraspe <mderaspe@imarcom.net>

The Dell 14 Premium DA14250 (Lunar Lake) has its ov02c10 front camera
sensor mounted upside-down, but the ACPI SSDB does not report a 180°
rotation. Add a DMI quirk entry so that the ipu-bridge driver reports
the correct rotation, allowing libcamera and applications to display the
camera image with the proper orientation.

Signed-off-by: Maxime Deraspe <mderaspe@imarcom.net>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index b2b710094..2611a96fc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -118,6 +118,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 14 Premium DA14250"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.53.0


