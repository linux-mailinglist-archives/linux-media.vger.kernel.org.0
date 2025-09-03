Return-Path: <linux-media+bounces-41637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA4B41743
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD2833BA8D8
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 07:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2492E2EF0;
	Wed,  3 Sep 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="botaCraU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42D2E266E;
	Wed,  3 Sep 2025 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885941; cv=none; b=gX8Kwkc1wX0/HKXSX6Fm31A8VErDBEZEYsB9e1dFIOtyLvISrZgcOjUcjXlvxA0sr1NRWNYQEebcCNTRTss+cbZ/MNPd39I5nclk6+4DF723nzSK7jpjib+wghdiGg1Wgar5l9eKR7gnL/lX3F/2bazx3ZgTLFNyFLL6Rgga/C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885941; c=relaxed/simple;
	bh=zDBrq12AtON0ruZfOWH7E085iZXOR09Angr/19+M6OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fznMhqrC/yR8escA0jpoFFUzY59hEGvTNN/ZTC709zP+iALN+3AEP9DqtfLsgvWyr1eSJ4NVQkXNPGiZZhwEFV3cNWxYrPFp3JuAjzz8b7tQG5Gg0ZjlDohta3CqVn2EBo3jE1ZJbr5aFdkWAKNmqL28jrmwLFxy+h5WEmGc2GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=botaCraU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 26FCDC6D;
	Wed,  3 Sep 2025 09:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756885864;
	bh=zDBrq12AtON0ruZfOWH7E085iZXOR09Angr/19+M6OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=botaCraUS4M0XPXyK6JsSZ9sOpdaS03eNRWMSYuv2cArgNkYQDHyDMaenJ4IzsnRx
	 PBrsrYN6ouskZnQ8IJNiAyPgXUGu/n1bNcSaTb0ZaVW/UXMNDaXIc7RzwVmSnJC6Du
	 9D9Q0MD8riBT7iWRH1z7MXFr76QiwpomZ3su+lao=
Date: Wed, 3 Sep 2025 09:51:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Du, Bin" <bin.du@amd.com>
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
Message-ID: <20250903075152.GA13448@pendragon.ideasonboard.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250902124932.GN13448@pendragon.ideasonboard.com>
 <2464e531-6ef3-4d27-8053-5e4874a15b8c@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2464e531-6ef3-4d27-8053-5e4874a15b8c@amd.com>

On Wed, Sep 03, 2025 at 11:22:27AM +0800, Du, Bin wrote:
> Thanks Laurent Pinchart
> 
> On 9/2/2025 8:49 PM, Laurent Pinchart wrote:
> > Hi Bin,
> > 
> > Could you please provide the v4l2-compliance report (please use the
> > very latest version of v4l2-compliance), as well as the output of
> > `media-ctl -p -d /dev/media0` (replacing media0 with the appropriate
> > device) ?
> > 
> > Generally speaking, you should include a cover letter in patch series,
> > and that information can be included in the cover letter.
> > 
> 
> Yes, there is a cover letter for the patch series 
> https://lore.kernel.org/linux-media/20250828084507.94552-1-Bin.Du@amd.com/, 
> because of some server issue, the cover letter and left patches are sent 
> separately, really sorry for the confusing. It does contain 
> v4l2-compliance report, but the media-ctl output is missing, many thanks 
> for the guide, will include it either in the next patch

My bad, I even replied to that cover letter, but then forgot about it.

> > On Thu, Aug 28, 2025 at 06:08:05PM +0800, Bin Du wrote:
> >> AMD isp4 capture is a v4l2 media device which implements media controller
> >> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
> >> be connected to a remote CSI2 TX endpoint. It supports only one physical
> >> interface for now. Also add ISP4 driver related entry info into the
> >> MAINTAINERS file
> >>
> >> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> >> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> >> Signed-off-by: Bin Du <Bin.Du@amd.com>
> >> ---
> >>   MAINTAINERS                              |  13 +++
> >>   drivers/media/platform/Kconfig           |   1 +
> >>   drivers/media/platform/Makefile          |   1 +
> >>   drivers/media/platform/amd/Kconfig       |   3 +
> >>   drivers/media/platform/amd/Makefile      |   3 +
> >>   drivers/media/platform/amd/isp4/Kconfig  |  13 +++
> >>   drivers/media/platform/amd/isp4/Makefile |   6 ++
> >>   drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
> >>   drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
> >>   9 files changed, 185 insertions(+)
> >>   create mode 100644 drivers/media/platform/amd/Kconfig
> >>   create mode 100644 drivers/media/platform/amd/Makefile
> >>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
> >>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
> >>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
> >>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h

-- 
Regards,

Laurent Pinchart

