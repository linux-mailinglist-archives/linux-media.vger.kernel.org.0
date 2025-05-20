Return-Path: <linux-media+bounces-32924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B162ABD926
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E1E817D669
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 13:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB71242922;
	Tue, 20 May 2025 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="duaiH+Fc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95468241CA8;
	Tue, 20 May 2025 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747091; cv=none; b=HA4UnWHoITz/kgJVJiljaSgAKrJ7oSVCNoHwAhZXqbI4y/dmFUMnoTuvMAcUL/2jjvaXUm6RQUpnJ3w6xQAVNPSkyh1lAyalJfaRgEokGijS16Uf23+sGZWWD0586t87oVJCNuFJ21EPILVy7pl6Mi8JJ90dil/qDprxDL9N1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747091; c=relaxed/simple;
	bh=gY8QDm4D9bqPj1sYi0dLNg4r25V3eFgp/Pf3dyAqwrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NokrhyLrVNFW0uOGEKvuyZb/t1DJMGzD4yC6hmMgCbp24UvCbW3F+1CDWDLdSBsdaUbulJ1F94OUsYWQq5KmlCFIKiGzK1eOGTdXnagcUUnn3YxJz4psE9S0ykCxTrFXMJFtjx8breYXKo9yuv6pUmisy26IC9jg3MhIP/3naSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=duaiH+Fc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33C3CE9B;
	Tue, 20 May 2025 15:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747747058;
	bh=gY8QDm4D9bqPj1sYi0dLNg4r25V3eFgp/Pf3dyAqwrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=duaiH+FcKEfeLwgFm4EN1dKlWLTOv7IkoHyQEQB8S22/RkQV2o8KDVB9B2vUNWEol
	 07CxG8oJ3UgL/G3cs+EmT69P7+rOGCvTbjPmvRbsQGUVepPZ+Fci4kk8fjbdvjCFir
	 j4OP/0p2xuM0KT2vrHfk3pHZ9HO0mb3tTX6IgNKg=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 20 May 2025 14:17:46 +0100
Subject: [PATCH v2 3/3] media: ipu-bridge: Add _HID for OV5670
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-djrscally-ov5670-v2-3-104ae895aecf@ideasonboard.com>
References: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
In-Reply-To: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=gY8QDm4D9bqPj1sYi0dLNg4r25V3eFgp/Pf3dyAqwrI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoLIEEMWDrUMWq++44jjIm3dVgpSWGjw+GQulFy
 epffLqoyMWJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaCyBBAAKCRDISVd6bEV1
 MkGeD/9ZkBxl3AV2bJa2IqRQkLFfQpMgA3HxkL1vz8RYq0B5b9i9KAvbkplCICT+S882FxCQYGE
 P6tNeQR8e4rtHu5+c9vyapni9MMPJkZ8Ji4j3TmGf7dewQx2NPoio0Tt04nwmEAUhjziOpedHzC
 YeQVdNIx8fUhetzyggpR0Gga3buS6IFRlvtAHtm3s8iBe6MxSncnMPJEOelhbStrIBU3V64TnfC
 FtfbokAQXdREib4AphwtYNY63fPPsA+tEL05YkI/fC2SWkcwpK2wfhfHeKsIa6R9ru1na8iFEVr
 RcHyj1PQgjvZ18Z6fLf9pzfzTNRBg1q7fxsL6diWAUo3W7Qj68tYG7EXKSM9rWxrbb/6tVRgzym
 PFe8hFyCSYiVCdi4mifcotYf8+V1KbXLphKObUfEJSdVkncuWEACKvjWMQ74sDzXJkJOeRHtIGA
 mrbuSbL6nw9NtYCuYRrz+iqjL5sJgQeZ/l1+/dJMrlVCSR8phq4S7lLhvtKLv3W1BdA/PzmECij
 wsrBSYlMBj/1gO9E1/0yIOPGF6p2xO+Vi2aMma+dLPFP76neHMmnt8SzMjFZv5WVmjEJBCnRWAR
 Kv2v1Uz9tEALn8pZx//8lQ4/wgHmQtPCiJRMX/m/h3D60JyfEFqx92typYCoG1jJqVYN7p7fVqc
 pTsgfPdCs2nGnng==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The OV5670 is found on Dell 7212 tablets paired with an IPU3 ISP
and needs to be connected by the ipu-bridge. Add it to the list
of supported devices.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 83e682e1a4b77d9d97b2988750732d0b7c9087b3..73560c2c67c164c2d3a1d830f8e30b980a648e8e 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -60,6 +60,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV5670 */
+	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
 	IPU_SENSOR_CONFIG("INT347A", 1, 360000000),
 	/* Omnivision OV7251 */

-- 
2.34.1


