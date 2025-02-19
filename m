Return-Path: <linux-media+bounces-26359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631FA3BD69
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 12:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1D2F3B85A0
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36BE1DF26E;
	Wed, 19 Feb 2025 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ofpzvn79"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4949286291;
	Wed, 19 Feb 2025 11:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965633; cv=none; b=CPUh0OAhlfIANePLZnZQBXsBLc5g9Rqy07XEttXQK8qZ3X8UctFn3NemSspyS7gRNsqqa4JvN0bsRYcyUujTjfOfUSFOZwtfCwkRwKxarQ7nYFyAf5DkGAWXRqgR0ZeREPpsUMjAlYw3nD7CV7OTF2JK7oBgFEf3UznjguUqjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965633; c=relaxed/simple;
	bh=Retzvs5vG+5gFRyDruhBMUVBksDT2ovoZ/r3ZucKP5g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fnaF/1ZHm6TVRxWHKC0HJ/9cNqmcn+SD9qNnsH2ArJvForQ0H73qTq87rVfmJS5YpbyQpwmpCtOewGwqZCEQ+JILsD1ALTIaBxiMkxxtK846aXkvHOxcgEFrAkWTDmtc0CFS6jeOdO9VVIaCgZIRRduai9NKRTa1fU3+cewku/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ofpzvn79; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6153C169;
	Wed, 19 Feb 2025 12:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739965546;
	bh=Retzvs5vG+5gFRyDruhBMUVBksDT2ovoZ/r3ZucKP5g=;
	h=From:Subject:Date:To:Cc:From;
	b=Ofpzvn790t22Shr0jgetdByg5893wOjF6kiUYBWoa8hv5iP2uWlzYUA4tfTNiqJrz
	 Ay9NjncRsS33MDGZZPIucvxKe0Pkd86Un9i0jRNbioSwWDGGlcpeDNJ5XIaLwdv1Up
	 NR5D3h2qG7dPlqKMCA7TX1od4t/tbPR8IAk052UA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/3] media: i2c: imx219: Follow-up on binning fixes
Date: Wed, 19 Feb 2025 17:16:42 +0530
Message-Id: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLEtWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0NL3czcCiAVn5ZZkVocX2aka2pskWphmWKeZGluogTUVVCUCpYDaoq
 Ora0FANeYUT9hAAAA
X-Change-ID: 20250219-imx219_fixes_v2-538e89d7b974
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Retzvs5vG+5gFRyDruhBMUVBksDT2ovoZ/r3ZucKP5g=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBntcS1tpfQR6Rw2IanXtksRVlnhr+t2p1A6fP2f
 vWl5Yg+9ECJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7XEtQAKCRBD3pH5JJpx
 Rap4EACiOY44LjpZux/1efR1mhYAvEd/KMgHeMDDv37027ZCiJNiiPLKBGBhzLsx8drNKVdWOY3
 xes17sAELzOKw2W0vTi4rNypQ9NkGkZEYX7lL8nX8BFCzNuQ5Hy59egOvkUZwowgwP8txKSdD9r
 fhJVPUlQFT/MRIDLOyB2wRSWvY58zsdGpmTan9wJFk1gzQVV/JGE/oV1hTKhBQ7aTdeYnd1bUuq
 n5eXzEa2nvHOfwuzWz3lG3dEA0aROqJft+gjdXXxSlCaLYfYGgoxptyENAPZvsdd0sCNfnLOod2
 BiOTdfQvQlx/1LpHj/sD8nd4j02EwKTiGeffncKm+3zlCdHrxr6qGEuPSd16H52E1LCOxQwJTBv
 zuLdoyd2SoXOkFDMTNCz4w7fpm35wdVHnjQdC+nHoLFCbG3iNDh8yVDYJn4hccDWOJcpQEIb6Xr
 IXPx+EnqMfaZle+ZWTG4qfctjiaGmhRTZCbOCr+v1r34X8eV9CzEsQSpi07xlrJ4UYCu1r5Rruz
 YaKxPvclJKCXOtCn9LFINrerwCLlJuVXyfs/qAUWb97npWvEM4ESj1jbc7Db93PBs/rqT4GKzBO
 9ql6SZlCa85xXn/vmbdjkw0EXPr/L5R+lFm1lezxEfSJkK8ViTBNpqOlQ2W0Ajubl9HdE3mETEu
 I8tBUG6MBy27ZvQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series is a follow-up for the already merged series fixing the
binning for IMX219:
https://lore.kernel.org/all/20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com/

There were a few pending review comments and suggestions on the v6 and
v7 of the previous series which are addressed here.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (3):
      media: i2c: imx219: Only use higher LLP_MIN for binned resolutions
      media: i2c: imx219: Simplify binning mode
      media: i2c: imx219: Use subdev state to calculate binning and pixelrate

 drivers/media/i2c/imx219.c | 88 ++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 43 deletions(-)
---
base-commit: 955a999ca2336869a01bbc2d346185c348929e78
change-id: 20250219-imx219_fixes_v2-538e89d7b974

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


