Return-Path: <linux-media+bounces-43055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0377B9990B
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838302A450A
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 11:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DEA2E62B7;
	Wed, 24 Sep 2025 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP8RKiOM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67AA22541B
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758712978; cv=none; b=ialhAonkv0qs6+DoC4lwtR+0Biy1X1ara32TVkKrt+yIMRIDapFPX/gUgzZQb8hIO5jy4cSvQPycuU8UCxy35HrOwOW1k3sgIlOETuF9bpoXntH25H5zEJLxdCLAgWP5gof5JdW3PBpPL5YSImw+lwh6VsRunsFTv/AXZbBG9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758712978; c=relaxed/simple;
	bh=smmoHqFx9NdHNB21c8FwqdFdn5YpSJD1oho3IR5NZMg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yy0zxHwIfUFJvchiq/C0nh8zDJuvDshid+eE/MSx6yYfJftNmmsZ8iapMQrPjTDMOJYCireJVkC5SM3WxE25FWDG9qc4taXtrw+IZdCPP0EL2hBMMfRrJswCCEOKPm3WzPeJxhud9fAxupECuC1Bw+o5gUt19+l2ycEaj/EXEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP8RKiOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A70C4CEE7;
	Wed, 24 Sep 2025 11:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758712978;
	bh=smmoHqFx9NdHNB21c8FwqdFdn5YpSJD1oho3IR5NZMg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=gP8RKiOMubQlJ5Ny3n137nNK0A3lID2nJOMWFPRFMn/G8rq+WNafvYFYNhiwM5i0X
	 owyASJujApRzdWPRwCOZ+Q36bpzExfqC7iullk4M5TdoiLYUj7VHgOvuWLQrBLFnX9
	 Rvhabuw3fXfcJYf0+uplkgEVuTYlw/D12bNevL2jm3sg0LYgSQnUzcGAxFRrE0DaZo
	 YTE6hKV9Sh6WH8r8obaQtl8HPKD//akrDP5545jRlKizj3NZsByMmgtVaS0g1MkGe9
	 tJDfnjSsezBiQFGZurQ57i077HOHNaqyJdWUIp1B78dX9PbaUE/EgpGvdmjaDBrIgp
	 dI38Pk17koPwA==
Message-ID: <582bd5a7-fece-4cb9-b76c-73e536f78475@kernel.org>
Date: Wed, 24 Sep 2025 13:22:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR 6.18-fixes] Please pull
 platform-qcom-fixes-for-6.18
To: bod@kernel.org, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org
References: <20250924104419.7248-1-bod@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250924104419.7248-1-bod@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2025 12:43, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bod@kernel.org>
> 
> The following changes since commit 40b7a19f321e65789612ebaca966472055dab48c:
> 
>   media: tuner: xc5000: Fix use-after-free in xc5000_release (2025-09-17 12:15:35 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-fixes-for-6.18
> 
> for you to fetch changes up to 22d0fa7f9507d8e20db956aab5d2eecd55084db6:
> 
>   dt-bindings: media: camss: Add qcs8300 supplies binding (2025-09-23 00:13:39 +0100)
> 
> ----------------------------------------------------------------
> This tag contains three fixes for 6.18
> 
> - An alignment issue Loic identified in -next for QCM2290
> - A fix for Venus when OPP tables are missing
> - A fix for the QCS8300 CAMSS binding.
>   https://lore.kernel.org/linux-media/61b562ad-eb67-4917-a449-f5556c43ceef@linaro.org
>   https://lore.kernel.org/linux-media/e72800d4-cb65-443b-be7e-0966a60fa5a9@linaro.org
> 
> ----------------------------------------------------------------
> Loic Poulain (1):
>       media: qcom: camss: vfe: Fix BPL alignment for QCM2290
> 
> Nihal Kumar Gupta (1):
>       dt-bindings: media: camss: Add qcs8300 supplies binding

I am unhappy with this bindings patch: it's missing Acks from the device-tree devs,
and the commit log is vague:

"This commit adds in the missing vdda-phy and vdda-pll supplies from
qcs8300-camss.yaml."

Did you mean "to" instead of "from"?

Also mention why they were missing, I assume because it was simply forgotten? Shouldn't
there be a Fixes tag?

Since this is also a fix for a newly introduced file (hence the lack of Acks), I think it
is better to handle this as a post-v6.18-rc1 fix. That way the file that is fixed is
available for the devicetree maintainers, you can add a Fixes tag and update the commit
message.

I'll take the other two patches.

Regards,

	Hans

> 
> Renjiang Han (1):
>       media: venus: pm_helpers: add fallback for the opp-table
> 
>  .../devicetree/bindings/media/qcom,qcs8300-camss.yaml       | 13 +++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.c               |  1 -
>  drivers/media/platform/qcom/venus/pm_helpers.c              |  9 ++++++++-
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 


