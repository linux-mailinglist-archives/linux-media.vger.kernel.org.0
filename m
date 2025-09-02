Return-Path: <linux-media+bounces-41580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E074B40134
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CB951B60B2A
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FA72D24A6;
	Tue,  2 Sep 2025 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bm2AUXca"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8E833E7;
	Tue,  2 Sep 2025 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817396; cv=none; b=g1bWg7HNhh7ktbSNh91oCnB3vtxx8ezBrLRfItdcBhIG6a31ejZLRmUuinpxpdrrNV8/wMupJM+SdQiHapFlyjU9bLCbAgkrWNtj65NtAuSWp0al+yPMu66ho8WUdE8zb7UKqPzcKMv8fHq9SfHiX2yiqj7DHbyqcAhXjf5tjao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817396; c=relaxed/simple;
	bh=dWRXtDoYp5v4SRV2t3rxa+lHAX/qWDqfeEE7hmCL48M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPDrgfjQUBplbOypXDZK3ewtpqchJcVgZOM6sozVyEeI2bdebZOe2J+IIVSfyDZXUltqsJwCkAqA6HXkDO8C8ZUkWigS6WYOwPh+e6uDHWyzBBWlQJzDsV/XbimiPAntJxLr24msTRlgmIKab/eYGzHhAKjGh12mFIERpUz+9QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bm2AUXca; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1070EC77;
	Tue,  2 Sep 2025 14:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756817325;
	bh=dWRXtDoYp5v4SRV2t3rxa+lHAX/qWDqfeEE7hmCL48M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bm2AUXcaTJlN71Rrq1DZvI4l+EZ4kJxV02RlMa5vDTqgtmO6pZooJ+SxV9iSNspAA
	 G/siOXegP8fuWpavGgAKwGG2pGzupIPrAk7qqG4OO2rQSKtM/TrIjtpRIiLRcSbqRF
	 ZmY3yql9XAmwbUoF2AIk/dUI4a5DQwslSRaYOhn4=
Date: Tue, 2 Sep 2025 14:49:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
Message-ID: <20250902124932.GN13448@pendragon.ideasonboard.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828100811.95722-1-Bin.Du@amd.com>

Hi Bin,

Could you please provide the v4l2-compliance report (please use the
very latest version of v4l2-compliance), as well as the output of
`media-ctl -p -d /dev/media0` (replacing media0 with the appropriate
device) ?

Generally speaking, you should include a cover letter in patch series,
and that information can be included in the cover letter.

On Thu, Aug 28, 2025 at 06:08:05PM +0800, Bin Du wrote:
> AMD isp4 capture is a v4l2 media device which implements media controller
> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
> be connected to a remote CSI2 TX endpoint. It supports only one physical
> interface for now. Also add ISP4 driver related entry info into the
> MAINTAINERS file
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> ---
>  MAINTAINERS                              |  13 +++
>  drivers/media/platform/Kconfig           |   1 +
>  drivers/media/platform/Makefile          |   1 +
>  drivers/media/platform/amd/Kconfig       |   3 +
>  drivers/media/platform/amd/Makefile      |   3 +
>  drivers/media/platform/amd/isp4/Kconfig  |  13 +++
>  drivers/media/platform/amd/isp4/Makefile |   6 ++
>  drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
>  9 files changed, 185 insertions(+)
>  create mode 100644 drivers/media/platform/amd/Kconfig
>  create mode 100644 drivers/media/platform/amd/Makefile
>  create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>  create mode 100644 drivers/media/platform/amd/isp4/Makefile
>  create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4.h

-- 
Regards,

Laurent Pinchart

