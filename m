Return-Path: <linux-media+bounces-45140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E59EEBF7771
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 17:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC3964FC6FB
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 15:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FC5343D63;
	Tue, 21 Oct 2025 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syptech.net header.i=@syptech.net header.b="rRGSZ88k"
X-Original-To: linux-media@vger.kernel.org
Received: from gw2.cammew.com (gw2.cammew.com [64.182.209.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E03235360;
	Tue, 21 Oct 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.182.209.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061592; cv=none; b=OAkDaefhXA94KOhp0L0O2uDMJLY1pdp9IWy/OSSGmNir5QeocUviipwjTJ+uC8vl0hGFu7V/IrJbd8b03q3W+jhdKDlpsSZYyMz9cBEne7XHfqnFRUhVZb5gAWp8eq0OAQ3w0vEybGs9uyf90ca8Goc7/n2iAH7gLa1VQppgvzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061592; c=relaxed/simple;
	bh=RT/PB8K2304s2elNDRCbUNIjSvmAG36IzD4TQ1t9n5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCEQzAg4sJVbjFaT9bA9le/d7DOQ2jiZcuVcMr/ocAH2wRY8VpoweKIONSza3xqadzR9dUwuNRUsKU5MO242uQOzNhRxzapu3I7Ue9L6bLhJ0MQ3aHMrcNKVHvocvNqfTQSxGv9ETYIH5QbPgcvk7sXuOCcNtik5n5pZ/5fZrqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=syptech.net; spf=pass smtp.mailfrom=syptech.net; dkim=pass (1024-bit key) header.d=syptech.net header.i=@syptech.net header.b=rRGSZ88k; arc=none smtp.client-ip=64.182.209.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=syptech.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syptech.net
Received: from syptech.net (unknown [24.236.176.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gw2.cammew.com (Postfix) with ESMTPSA id 2BED9EDCC9;
	Tue, 21 Oct 2025 11:46:27 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 gw2.cammew.com 2BED9EDCC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syptech.net;
	s=relay; t=1761061587;
	bh=U52mfHhJmF5gyQMLbus5atRcEtkyLgRKfzZvnhrKnIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRGSZ88kKmSKGNso1zpYJSLG5q+hbzS5mMhNHLrhKaYQhKSY7ZCTz9DCu213+hNVH
	 Sj6sOPzGz1K7AOodBUUwxTbZCpUfpfQTh5AwbJK1pQcOMZEDSWm5lxjZC1J7VHoTZF
	 QxYmGlrsdvBOzAMMsktod0p4dfx6SswPQGqu88ns=
Date: Tue, 21 Oct 2025 11:46:19 -0400
From: "Adam J. Sypniewski" <ajsyp@syptech.net>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: ov13b10: Add ACPI ID for ASUS Z13 Flow laptop
Message-ID: <aPeqy11m-TxwbzJV@garrus>
References: <aPecNTw6RHzprJ6e@garrus>
 <aPeeuSdxRL_JXfE9@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPeeuSdxRL_JXfE9@kekkonen.localdomain>

The ASUS ROG Flow Z13 2025 (GZ302) laptop uses an OV13B10 sensor with a
non-standard ACPI ID of OMNI13B1 instead of the expected OVTI13B1.

Add this ACPI ID to the driver to make the front-facing camera work on
these laptops.

Signed-off-by: Adam J. Sypniewski <ajsyp@syptech.net>
---
Changes in v2:
 - Added comment explaining the ASUS-specific ACPI ID (Sakari)

 drivers/media/i2c/ov13b10.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 869bc78ed792..5421874732bc 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1693,6 +1693,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
 static const struct acpi_device_id ov13b10_acpi_ids[] = {
 	{"OVTIDB10"},
 	{"OVTI13B1"},
+	{"OMNI13B1"},   /* ASUS ROG Flow Z13 (GZ302) uses this ACPI ID */
 	{ /* sentinel */ }
 };
 

base-commit: 1fdb55ed40fa5ebe6934bd6b93036c714ebb5ef8
-- 
2.50.1


