Return-Path: <linux-media+bounces-46180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CDC2A7D3
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 09:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0A0C1890881
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 08:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B182D12EF;
	Mon,  3 Nov 2025 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtSC2Pzh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90E1EEE6
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157293; cv=none; b=p5FTNj4b491ZXF1YmVQRN6HjHq1XPQZkGtahDUNbi8HkfVOn2Kisie6CtcWLqzVBCfE7HLk2GzIyjSKOwEHvEzlaG31FUMy0HEndd4V9EXcpisn3CzALLnsOYYOKiAbvMt6C/oDLFzwRMzch0oIanuqh0qL8HwTVgRtXb6DQnUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157293; c=relaxed/simple;
	bh=tz2zaeLgHculwksSgJC1b+iSpNvi+0JMbI/qgWd+J28=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=sHxB8UebPxk76J9dUGWWtTnlZ1HUG3HYi2UD+8KRLLBgBX1ju4jbcqlgF0qO4QI1aRzoYakbMHFy+p6vwsJr6ZBXNLj/APNdvFsDHFPTDj2eIn8JxX2RJE4cdl6wlUAakwiNeNydLNZZ1gT/a+t2WpEXqQmmBxTK+yPZWHaYRBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtSC2Pzh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF0FC4CEE7;
	Mon,  3 Nov 2025 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762157293;
	bh=tz2zaeLgHculwksSgJC1b+iSpNvi+0JMbI/qgWd+J28=;
	h=Date:From:Subject:To:References:Cc:In-Reply-To:From;
	b=GtSC2PzhKXfVgHU0kjDWS7wkVdqGUrNQvRVzXGgg4lo8+BiYVCxoVC1WmMNPJAM4g
	 HPH7DGnS1aQwO5lTsRP1dXrFiqRxoAut3iN0xsaaRkjfnErR+QsxG6wlC4LESFjHrp
	 kL7tTAXnIB3m014f806XCIcsHDQpcD2h6skP6AzDGS54XoQvh1NgA77HeyWTX96Ih7
	 0WiKdaJ1S9gNbyCxe80pNt8AKXayllNydUqW0T3mHFp+SDPwSc+J3F5PpDY66LAWcf
	 qTFoQj04hiZTAbT5qAQWuRaP/Pic2lpx4i7EqTETxRXv76y50NDnFECY41AHlw9LeT
	 jUdJe6v8cWQxA==
Message-ID: <4989c563-47f4-478c-80c4-41f7e98597e4@kernel.org>
Date: Mon, 3 Nov 2025 09:08:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR v6.19] NXP media drivers changes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20251103001640.GA9221@pendragon.ideasonboard.com>
Content-Language: en-US, nl
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20251103001640.GA9221@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

I noticed you forgot to CC to linux-media (I added that now), but also that all
these patches have a Link: tag. Linus only wants Link tags if there is additional
information through that link. That's not the case here.

I'm dropping the Link tags from the patches in this PR, let me know if you disagree.

Regards,

	Hans

On 03/11/2025 01:16, Laurent Pinchart wrote:
> Hi Hans, Mauro,
> 
> The following changes since commit 163917839c0eea3bdfe3620f27f617a55fd76302:
> 
>   MAINTAINERS: Update Daniel Scally's email address (2025-10-29 14:07:02 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20251103
> 
> for you to fetch changes up to a581a7c7d2c354131e184a8770f761c40168dda6:
> 
>   media: imx8mq-mipi-csi2: drop unused module alias (2025-11-03 01:23:28 +0200)
> 
> ----------------------------------------------------------------
> NXP media drivers changes:
> 
> - Add Frank Li as a reviewer for NXP media drivers
> - Improve buffer sequence in rkisp1
> - Add i.MX91 support and i.MX93 parallel input support to imx8-isi
> - Drop unused module aliases
> 
> ----------------------------------------------------------------
> Alice Yuan (2):
>       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
>       media: nxp: imx8-isi: Add parallel camera input support for i.MX93
> 
> Frank Li (1):
>       MAINTAINERS: Add Frank Li as reviewer for NXP media drivers
> 
> Guoniu Zhou (3):
>       media: nxp: imx8-isi: Refine code by using helper macro
>       media: nxp: imx8-isi: Reorder the platform data
>       media: nxp: imx8-isi: Add ISI support for i.MX91
> 
> Johan Hovold (3):
>       media: imx-mipi-csis: drop unused module alias
>       media: imx7-media-csi: drop unused module alias
>       media: imx8mq-mipi-csi2: drop unused module alias
> 
> Stefan Klug (1):
>       media: rkisp1: Improve frame sequence correctness on stats and params buffers
> 
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 ++++-
>  MAINTAINERS                                        |  4 ++
>  drivers/media/platform/nxp/imx-mipi-csis.c         |  1 -
>  drivers/media/platform/nxp/imx7-media-csi.c        |  1 -
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 58 +++++++++++++---------
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 22 ++++++--
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  1 -
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  1 +
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 27 ++++++++--
>  10 files changed, 92 insertions(+), 37 deletions(-)
> 


