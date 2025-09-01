Return-Path: <linux-media+bounces-41471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F79B3EC97
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 18:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3FCF17A179
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 16:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EBF2E041D;
	Mon,  1 Sep 2025 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dgOcTrul"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6B41E2853
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745201; cv=none; b=Y75DooeRg8OabCUACdmYXhyDqqF1HRZ+BydXhmTmVk1fqnwPvm3DwL9ZoeDCo3Owu9/WeEz0yBy106aWEXW6uwLnGIHPsLKHLsvvvS80dCWoihXgZ+umjiqyxxt6KCrSXDQm2HGSGwnbWhDfzpBqntSXKmcPo8EZPNW3nKLcaQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745201; c=relaxed/simple;
	bh=68ahSFJ6ieclkmH3FFJwv4E+buPcoSLMnNcYnXLS/Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjC4QyyLFBkz834Kt0kRu1yUlWHN4betexh5t1XrJGOHM5nna7rXa1znT/uR2mHfnPNzneajXZG9GfT37YYqA4x4iTbWtH4vnpV8G8oYNEqDEtBmqIaZPSr5iu0IxmPiuodQMeyVlgMU94SwCvIj0UMUBMTmPYZWu6EqQ9K3V4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dgOcTrul; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30455E77;
	Mon,  1 Sep 2025 18:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756745131;
	bh=68ahSFJ6ieclkmH3FFJwv4E+buPcoSLMnNcYnXLS/Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgOcTruldPbGNBr6+CxjPHmBuqVnwSA21hPNEXExEr7dazE8IHMysm/wzxMeOxKCv
	 qOSX2OtW2pnCHgnG6dUOy+0yVKPOAzNYykeJqIK8YIyZXATs1A7tPKbuTrWgpCEURN
	 /BrHGqafYHQTvnX6hNnsxfaQzl6bm3sHGkL9OXQw=
Date: Mon, 1 Sep 2025 18:46:34 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 38/66] Revert "media: uapi: v4l: Don't expose generic
 metadata formats to userspace"
Message-ID: <mwz6wj5ctdqvdq4kizgyhz46z2bsjul2rjtr43pftf6oqqc66e@nkribkqex3ld>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-39-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-39-sakari.ailus@linux.intel.com>

On Mon, Aug 25, 2025 at 12:50:39PM +0300, Sakari Ailus wrote:
> This reverts commit d69c8429ea80af02e89e5b3eecb78e417ad049c8.
>
> Make the generic metadata formats visible for the userspace again.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

 \o/

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  include/uapi/linux/videodev2.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 6a5d9ac7bdb9..2b2e070f272c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -890,7 +890,6 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
>  #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
>
> -#ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
>   * adding new ones!
> @@ -902,7 +901,6 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_GENERIC_16	v4l2_fourcc('M', 'E', 'T', 'G') /* Generic 16-bit 8-bit metadata */
>  #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
>  #define V4L2_META_FMT_GENERIC_24	v4l2_fourcc('M', 'E', 'T', 'O') /* Generic 24-bit 8-bit metadata */
> -#endif
>
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> --
> 2.47.2
>
>

