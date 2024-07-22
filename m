Return-Path: <linux-media+bounces-15256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AAE939113
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 16:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C7561F22163
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 14:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BE616DC38;
	Mon, 22 Jul 2024 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cp2wyqxj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D946F1598F4;
	Mon, 22 Jul 2024 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660096; cv=none; b=Wv/d1vYPfe+flk2a/w5FrszM4B7b51tW0oMjMPVW93DpClMQ2711KsZ5PTrD1Ut3qPLo0K6mSjKzD3EOh52/yo3/9BLaJNl4B0D+I+rp8NqKpCAW07wKjSbt+5mCcb/gkKKFGsMK0tn6rbUqLs/wVmDaszfoicegW1IASklZaXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660096; c=relaxed/simple;
	bh=SFMbi+gzer0+l8x74gNu4ktUYZ87yZwEQXW/AUYWIKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2btjJxgM/2G5YTwgLyosn12n2v+6hmoo6NlCEOlcHNjF68EzqysIqTnUNulDk1MB1RGvGH45YBuTLFv+AG/s/ID53c+hM3IupHlG9JM1yF5QPS1YKbLLHU+/IXu+hN8d+edMTQb7SsBx1g53nsHMO8buA+sH+x7Krfuaj/HzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cp2wyqxj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D9024CF;
	Mon, 22 Jul 2024 16:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721660052;
	bh=SFMbi+gzer0+l8x74gNu4ktUYZ87yZwEQXW/AUYWIKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cp2wyqxjg3WpgxoiiNR+NOuQV48c2MOsutgl0Dc+frzhZAyXRz2G7AR/2wASTPJcM
	 c0gZnsUKDmgOUPet556m/q6TeYKBU45+cnDmie4iLRaa5SUAOL9k9Rtr0bAT6u4N4A
	 IzMawm7cnO4wpbmt3OPXDv+p2/vMwlwPvkhgyoaU=
Date: Mon, 22 Jul 2024 17:54:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 13/14] staging: media: starfive: Drop read support for
 video capture devices
Message-ID: <20240722145435.GL13497@pendragon.ideasonboard.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-14-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-14-changhuang.liang@starfivetech.com>

Hi Changhuang,

Thank you for the patch.

On Tue, Jul 09, 2024 at 01:38:23AM -0700, Changhuang Liang wrote:
> StarFive video capture devices is not support VB2_READ queue access
> method. Drop the implementation of the read hook.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/starfive/camss/stf-video.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
> index 8c6c45d8b7a1..28e6679ee9b9 100644
> --- a/drivers/staging/media/starfive/camss/stf-video.c
> +++ b/drivers/staging/media/starfive/camss/stf-video.c
> @@ -570,7 +570,6 @@ static const struct v4l2_file_operations stf_vid_fops = {
>  	.release        = vb2_fop_release,
>  	.poll           = vb2_fop_poll,
>  	.mmap           = vb2_fop_mmap,
> -	.read           = vb2_fop_read,
>  };
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

