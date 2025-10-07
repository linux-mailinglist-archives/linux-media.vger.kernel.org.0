Return-Path: <linux-media+bounces-43825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B95BC0DE8
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 11:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7F05189D9DD
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 09:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A004D2D7DCF;
	Tue,  7 Oct 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOmfza0K"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38932D47F3;
	Tue,  7 Oct 2025 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829893; cv=none; b=lpMrkiuWHEkdqWiroFtLOHKHm77bKwmtIf9x3zNO/nJ77YFmcXa2sSM10W5KSs7PpcCurXY6MRzdvG/TeqSEEwhnv48flNgozv0xbNfqeiUtLapBP6wmPGKysACy1vIuUfgYd2RmcPebVESDiqFLmf0ujeQKep7gi9+3W+tVucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829893; c=relaxed/simple;
	bh=u92iuBD9npKLkZwen9nH8npHhYPl96jEeJrt91lktJc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SX3TJdDguF9pbgfoN88oKWrfNM6cMvXnrK0ybwPFtq6TGV+qer+90AIAtgFXkrFguO7l6Fdxqt6O9RCLgxKwQ9oDH3FWnMup87Ocjcsbfmjnj9Tp8rHAjfgg5QctiP3rFqkEB/om5VumQY7GZk2Twmg968Ps9/JczJtwhu6Sarg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOmfza0K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD0CC4CEF1;
	Tue,  7 Oct 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759829892;
	bh=u92iuBD9npKLkZwen9nH8npHhYPl96jEeJrt91lktJc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HOmfza0KUcqItu3B38b5T6A/W6mNpqIlnJurMLmB5zfuBM5aiOHgkBxzuXEx0OIcU
	 6l6XKwM6xG208TlQxlrhCVTa05vgYi3VT7iPd5Hv1z5dn8yGMXmD/93PkkzQDOfOB4
	 oQQ/lRAmAM1HmpGQjyStvsVCT23CdCNY7EgMZ5BkuIqWu73fXvNptIIKkszqsiOf45
	 5+SUu/6+ufe8btQh7bgOozY1EhPQEiDHD8MqKqTwjJrQQO0J0X0mkEOOUDSXp82vTT
	 hLwHAjRaPAC3NbvQxOWsb2yMdZKvp+KAkXVK89YgjcaW+CXwUAay8CAXsxPyFT/44P
	 S8c0fXIkOhkNA==
Message-ID: <1f920cc2-625c-48af-a6d0-a505980fbeaa@kernel.org>
Date: Tue, 7 Oct 2025 11:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
To: iommu@lists.linux.dev
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 29/09/2025 10:23, Hans Verkuil wrote:
> Loading the omap3isp driver fails in __iommu_attach_group:
> group->blocking_domain is NULL, and so the check
> group->domain != group->blocking_domain is always true and it
> returns -EBUSY.
> 
> Only return -EBUSY if group->blocking_domain is non-NULL.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Fixes: 0286300e6045 ("iommu: iommu_group_claim_dma_owner() must always assign a domain")
> ---

So just ignore this patch :-)

Today I dropped this patch from my branch, and retested on my Beagle xM and it all
worked fine.

I suspect that it might be related to the fact that I started testing with the Beagle
board (so not the xM variant), and I hit the issue there. But the Beagle board doesn't
have the connector for the camera, so later I switched to the xM variant. But I probably
never tried running it on the xM without that iommu patch until today.

In two weeks time I have access to my Beagle board again and I'll experiment a bit
to see if my theory is correct.

Apologies for all the noise.

Regards,

	Hans

> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
> just papering over a bug elsewhere, or whether this is really the correct solution.
> 
> The omap3isp code in question is here:
> 
> drivers/media/platform/ti/omap3isp/isp.c, function isp_attach_iommu().
> 
> This omap3isp code predates the addition of blocking_domain and it used to work
> before that feature was added.
> 
> I've tested this patch with my Beagle XM board.
> 
> If this patch is addressing the issue in the wrong place, then advise
> on what the correct solution is would be very much appreciated!
> 
> I have a bunch of media omap3isp cleanup patches pending, but there is no point in
> posting those until this issue is resolved.
> 
> Regards,
> 
> 	Hans
> ---
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 060ebe330ee1..0ab1671ee850 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2220,7 +2220,7 @@ static int __iommu_attach_group(struct iommu_domain *domain,
>  	struct device *dev;
> 
>  	if (group->domain && group->domain != group->default_domain &&
> -	    group->domain != group->blocking_domain)
> +	    group->blocking_domain && group->domain != group->blocking_domain)
>  		return -EBUSY;
> 
>  	dev = iommu_group_first_dev(group);


