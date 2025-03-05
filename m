Return-Path: <linux-media+bounces-27610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C5A4FDF0
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12AA3A576E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABC3241662;
	Wed,  5 Mar 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oG8/ow7K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4217C2E3372;
	Wed,  5 Mar 2025 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175161; cv=none; b=A7Zro7ZKytjBA+KQrzhBiHVLu7KZEuSHb8n5SaxgJqz3ZHFYcs1/sy/cex0Zf0jwJ+wYyD2yA2zcwHMcZ5JE7/eQBEFv0j/8naKip1cvMpJm8bPDtTky9H+0FliG1hNz8CE/qBhBr4qJ/+CNN9G7G7dtdxFSdT69hA0/hynGqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175161; c=relaxed/simple;
	bh=jCVOIod30h+lSwy9042pHFbMu1wURiEi3CLiAWIdzso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uea83/BXROs5F7R0okMP9KwUmiKiuoY4al0f+VscSX1kqPk9SesUS438AaG8ujnWT4ff0HtL4QiEYjxqx3MuMsHRcSFP7kfWKJYKdHnnopxHE2ATrHSR5S7LheNfRtFugJu/OKa3MMs9tGasL+2h8kZD0f6hduvZjFB7U3OT6jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oG8/ow7K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2F2AE29;
	Wed,  5 Mar 2025 12:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741175066;
	bh=jCVOIod30h+lSwy9042pHFbMu1wURiEi3CLiAWIdzso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oG8/ow7KkH6H1uRTwoivo5xbUq03NDT+NBNNM3Mc6A2YkLNDpok33KvlY2+ntLWDq
	 plMAKZkZkjChJCOvbf/Wcb1quxRk9J6pv3+lcA4G4z/DpiXdEsCCuxQK10v/3c4viy
	 zINGWp624SCuaDNYJu3P6GH2HPibXgQLVKv9AbPc=
Date: Wed, 5 Mar 2025 13:45:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gost.dev@samsung.com
Subject: Re: [PATCH] media: imx-mipi-csis: Fix v4l2 mbus frame descriptor type
Message-ID: <20250305114536.GB31618@pendragon.ideasonboard.com>
References: <CGME20250305060259epcas5p20c02f4c4b4ff84b0f790b4ea446056e6@epcas5p2.samsung.com>
 <20250305055655.6622-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250305055655.6622-1-inbaraj.e@samsung.com>

Hi Inbaraj,

Thank you for the patch.

On Wed, Mar 05, 2025 at 11:26:55AM +0530, Inbaraj E wrote:
> For MIPI CSI2 v4l2 mbus frame descriptor type should be set to
> V4L2_MBUS_FRAME_DESC_TYPE_CSI2. Now frame descriptor type is set to
> V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL. So changing the frame descriptor
> type to V4L2_MBUS_FRAME_DESC_TYPE_CSI2.

The frame descriptor describes the bus on the *output* of the CSIS.
That's not CSI-2 anymore, but a parallel bus.

Is this patch fixing an actual issue ?

> Fixes: d200de90de2a0 ("media: imx: imx-mipi-csis: Implement the .get_frame_desc() operation")
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 29523bb84d95..bb6550bed230 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1137,7 +1137,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	if (!csis_fmt)
>  		return -EPIPE;
>  
> -	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>  	fd->num_entries = 1;
>  
>  	entry->flags = 0;

-- 
Regards,

Laurent Pinchart

