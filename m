Return-Path: <linux-media+bounces-43314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A367EBA8629
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 10:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55F94169D4D
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 08:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A9F2727E6;
	Mon, 29 Sep 2025 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPR+XEzN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EC14B06C;
	Mon, 29 Sep 2025 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759134231; cv=none; b=T8ifKhYM5aux0tggBpWx9ujw9sNWn0SEh35AvPF6FFZW2YL40qUT8H1az/DxRRhjezNOG56T2WA4+kDZXVG8j1tnfKLABLI8GBkSAkJL2Y/bbBCTnOAa6AU3ygStT1+Xmf/riZ7fbbaiV2uBcDPNLbXEKJ96IQ7BX105C7NwCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759134231; c=relaxed/simple;
	bh=wm0QjJCF1CMzW9/QYQ/5sGBAebod32hT9vhfjMmv9jY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=f3e5uFITJhUXF1pVnUhoQEd3hQLk9dPP/kzVwQiepFF/faS8tODaS7gsJbQQCpSRqFy991d8SmAX7R1z2uV9un+XSpcLCUxZu9P/0CdsDCSeLTrUYoMMnr2/AWkoh9pT0M62xOBU6cnk/q4xyd8DhmGecs26OzJazzxbKMp/54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPR+XEzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BDCC4CEF4;
	Mon, 29 Sep 2025 08:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759134230;
	bh=wm0QjJCF1CMzW9/QYQ/5sGBAebod32hT9vhfjMmv9jY=;
	h=Date:From:Subject:To:Cc:From;
	b=bPR+XEzN6bcFMTLQRDkKMeoI3dh65WYaUmxSywqNoGy94DBQffhUmfQNX8S+MBwAA
	 QIfZ6Cm0SDc7859MBlpseklj9koHPlKhzWwpa3oyrl5lobe8Rg103Wx+Gcq29Pfl9S
	 Vwz16hPZQeZxUXc+MVfDyBOjjRFY8tes6pLSwwOM5nO7H4GuKF6M+sjTj7NF6tV1jb
	 qtedXy6J5mQ/q3oADfYbAM7TLCGbjOMHbMEeBieCwlwaFQFnh5/OIy3IWGeRj6NjWE
	 p6/1IELs6q5RLX/aXyzpbEVkP0gcnN0nhGHH/1xt9EwBEHFTQwRT4B1PJ1HEaZmIU6
	 9MxhYGC6RXtRQ==
Message-ID: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
Date: Mon, 29 Sep 2025 10:23:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
To: iommu@lists.linux.dev
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Loading the omap3isp driver fails in __iommu_attach_group:
group->blocking_domain is NULL, and so the check
group->domain != group->blocking_domain is always true and it
returns -EBUSY.

Only return -EBUSY if group->blocking_domain is non-NULL.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Fixes: 0286300e6045 ("iommu: iommu_group_claim_dma_owner() must always assign a domain")
---
Since I am unfamiliar with the iommu core code, I am uncertain whether I am
just papering over a bug elsewhere, or whether this is really the correct solution.

The omap3isp code in question is here:

drivers/media/platform/ti/omap3isp/isp.c, function isp_attach_iommu().

This omap3isp code predates the addition of blocking_domain and it used to work
before that feature was added.

I've tested this patch with my Beagle XM board.

If this patch is addressing the issue in the wrong place, then advise
on what the correct solution is would be very much appreciated!

I have a bunch of media omap3isp cleanup patches pending, but there is no point in
posting those until this issue is resolved.

Regards,

	Hans
---
 drivers/iommu/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 060ebe330ee1..0ab1671ee850 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2220,7 +2220,7 @@ static int __iommu_attach_group(struct iommu_domain *domain,
 	struct device *dev;

 	if (group->domain && group->domain != group->default_domain &&
-	    group->domain != group->blocking_domain)
+	    group->blocking_domain && group->domain != group->blocking_domain)
 		return -EBUSY;

 	dev = iommu_group_first_dev(group);
-- 
2.47.2



