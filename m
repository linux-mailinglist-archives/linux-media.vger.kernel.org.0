Return-Path: <linux-media+bounces-48807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87789CBE0D3
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 14:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70D6230633AB
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 13:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC7131AAB4;
	Mon, 15 Dec 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eKN/XSRv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6D314D25;
	Mon, 15 Dec 2025 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804840; cv=none; b=HrGZ/IZYZipDMVnEG6m80qIL1RIoFjnf4kpTCM+1v5RER+caEkgfuS0p0PhCRhkDMWEGx6MOa19yt8FUUjdvee2c/htCErpiD0ciqbJxcwRVeXywzNcZg4gIbsh9KLorttN45YO5jln42MxjgYYv1gBziNh3y8+ryTRKwEZ8CeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804840; c=relaxed/simple;
	bh=JrcrIoUY2IRu7tADcVg3SogYhRs0a4TO4Is+ri2AnTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORL8WTfANYVjFU2iaFRzD8p2OJCUtW0mXtWtzgGhxRa3H40tbV7QxFVN5LlKOjocXM2NKdrBqro/nGr54ndjUXKGj0o2P1XfFJuDPK0j40UgeuenkvDwg2zaB7uCL2+LNLcGpHOYDP+DQChMTDsm+MkKXZQoND1I+UFepUwlVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eKN/XSRv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-49-39.net.vodafone.it [5.90.49.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60441C6F;
	Mon, 15 Dec 2025 14:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765804825;
	bh=JrcrIoUY2IRu7tADcVg3SogYhRs0a4TO4Is+ri2AnTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eKN/XSRvkkfWYmcip4zNikIAUdk92zv8YVkB4cUOOeCz4NIO4KbKDOK2yrZhKTLsj
	 9gNELOdBS4jzYvot+WbpZPcHhDpZ4A+mRpVR9QidjCFoaCugQDwO0CYMn3GXGJdQAy
	 D947d0BCp9Ck8u2QidpbS1zhIOlS2+mcQo31lvzQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Dec 2025 14:20:21 +0100
Subject: [PATCH 1/3] Documentation: media: mali-c55: Use v4l2-isp version
 identifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-1-69f56dee3c71@ideasonboard.com>
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
In-Reply-To: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=JrcrIoUY2IRu7tADcVg3SogYhRs0a4TO4Is+ri2AnTQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpQAscwy4R9EYj8gj2NYYrF3PepMOVt7gKsJvsC
 MkYuFF7Tw2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaUALHAAKCRByNAaPFqFW
 PPPHD/4mU7neMEopvINgAazbVDvprQSDalyoRh0i0cC71W3KFtE0BLoyYQoA1f5G5GnTPPYYYeA
 xPBqfqPTBPdp1H2WhPuMEnQNYI/CLVIZdl8BHzOpyEqQbeh92nJA6JTKbU8KpS+dsTPcJEvgII4
 Jcces9XPdkf8gjEPJ4EJAm1KPzlxVj2wYrLmLtBZERsKr/MnQmGJJbOpyfv8uhkL5CtD4r2YIs6
 4Il5CApWMjKds1x0WJYp6k0tFdlinpNFPIGW+o0Zm7NfIbYEFhF5t266/0dpI3lfSOwY09c5Iqf
 d7RAleiWHz6kSS48CYQSz6waKX92BpvJ04dveaKoAFq2X3ACIFKzbcUu45jefe1OeA8FtJDJVoa
 esaWcuEZsfqrmJ1ma7cndVRQF/2ORCI3QzZd/4n6B/587L8MLVZQU0NMXdA1eJehG4YMtChY/XE
 x+VVv/a9JjeJ2j8z90xJPrVpFiWzvNUDkEmyiG+AuIGMAwG7qJ24YCie/awkV7186iV1Ty5XnfZ
 4/IQvPCeuMkLlHUJQu+s4fqTNBB8vrxyAzm/5orKDkqBQphrq+WFT0pbJvkTxNoL+pAvB5HguhK
 3dXJdpFo6xve9uRseqUlnqXotgJNsEa13C//R65Iq4u4w7xl8pIuMgEkvBED8ViM8VUqLW2yaX6
 1hR36P+6xhqVKsw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The Mali C55 driver uses the v4l2-isp framework, which defines its own
versioning numbers.

Do not use the Mali C55 specific version identifier in the code example
in the documentation of the Mali C55 stats and params metadata formats.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
index 696e0a645a7e0566921a3e9db3226b76d402f909..f8029bcb528283cddb1ea854b25469af97ecfa54 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
@@ -44,7 +44,7 @@ member and userspace must populate the type member with a value from
 	struct v4l2_isp_params_buffer *params =
 		(struct v4l2_isp_params_buffer *)buffer;
 
-	params->version = MALI_C55_PARAM_BUFFER_V1;
+	params->version = V4L2_ISP_PARAMS_VERSION_V1;
 	params->data_size = 0;
 
 	void *data = (void *)params->data;

-- 
2.52.0


