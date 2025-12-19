Return-Path: <linux-media+bounces-49212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5DCCD11B9
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 18:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32457302922E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1712BEFE7;
	Fri, 19 Dec 2025 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BF2ujhGU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FC524468B
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164653; cv=none; b=J/TIweawrfdtO8iglLCZmM4EIDCdtTL+/kKRspV64Hl67DJQBb3Ga6z42mEkQ/V8afaL2tQuZEfJ3cR6FAqxNXISd0HiyBVGaxh2TCNI9F080zVFkT9iDfXl0CNlSBg1ChKVmKtKdaCRgdrO6XFxUZwckY5K+h8nQygWR3rV3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164653; c=relaxed/simple;
	bh=+F4CYmAya4d1TwExXJTpcg/fpwMMIcjfd2uJAyCJ2u4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttzAifpL4tKNL0y7YJyrthCnd2ZpRmf6hwhHgRG8lwoG46Gb1H8ADkfBYWawctqJdNsirhlMqJCjI+B4cZyooHYIpLOanmkgVz5nDza+zayTgAHl1PjxVnzVIuzVbAHgpmitv49OBkaNl9FKFV8Y84dDGkkhc2wCfoUiPbfmwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BF2ujhGU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6E607E4;
	Fri, 19 Dec 2025 18:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766164640;
	bh=+F4CYmAya4d1TwExXJTpcg/fpwMMIcjfd2uJAyCJ2u4=;
	h=Date:From:To:Cc:Subject:From;
	b=BF2ujhGUAFoub7+3CEeY8x2G4NR+7ohLfezBgZzHu/oJJK/ZHXDqjcQu/vD3wv3WA
	 NuZnyN/IRlm27xT9r4ewIGJ6YejOGBOHUDc4VREJEJC9KCChe5NHHW8w0ogc8CnLJ/
	 b0R9heP5wm8KirxJ0fSTO7qZKXfzW0xLLpOBNbm0=
Date: Fri, 19 Dec 2025 18:17:24 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [GIT PULL for v6.19-rc1] Mali header and Renesas IVC fixes
Message-ID: <ggbjdyaaa6zzh5qk6dw5q3ihbvmtxjb7vaops4izkjaayhcuym@7xld57bqgtmy>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro

The following changes since commit b70886ff5833cf499e77af77d2324ce8f68b60ce:

  media: vb2: drop wait_prepare/finish callbacks (2025-12-18 11:14:57 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/mali-c55-update-for-v6.19-rc1

for you to fetch changes up to 24e5938d09e6253b23dc44cd0e92a87a98608161:

  media: rzg2l-cru: csi-2: Support RZ/V2H input sizes (2025-12-19 17:44:40 +0100)

----------------------------------------------------------------
Update for Mali C55 and Rensas IVC on v6.19-rc1

Update the Mali C55 uAPI, driver and documentation to use the versioning
symbols defined in v4l2-isp instead of using its own one.

On top of the headers update, a patch that has fallen into the cracks
and has not been collected for v6.19 but which is required for proper
functioning of the ISP on Renesas RZ/V2H.

CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1570570
Ignore the checkstyle error as it doesn't recognize my +renesas email address
----------------------------------------------------------------
Jacopo Mondi (4):
      media: Documentation: mali-c55: Use v4l2-isp version identifier
      media: mali-c55: Remove duplicated version check
      media: uapi: mali-c55-config: Remove version identifier
      media: rzg2l-cru: csi-2: Support RZ/V2H input sizes

 .../media/v4l/metafmt-arm-mali-c55.rst             |  2 +-
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  7 ----
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 41 ++++++++++++++--------
 include/uapi/linux/media/arm/mali-c55-config.h     |  9 -----
 4 files changed, 27 insertions(+), 32 deletions(-)

