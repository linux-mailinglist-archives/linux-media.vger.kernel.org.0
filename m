Return-Path: <linux-media+bounces-11711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 533C38CBC78
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 09:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9FB11F2277E
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 07:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE867E79F;
	Wed, 22 May 2024 07:54:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20EF7E59A
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716364481; cv=none; b=paF6x8saNQLLPTgHvVsbWjVuUfN2yLY/bBsBR1hlgN+qe5JfGRWXlI3Y7mBn0WjjliBMRUhWQapfIxNo2h0J5WeK6srYUBqbSEA9ZqKpCJtqaEC/rsyt9VdC931A9+IMj288uq5PKp/ObVakSsPm8Ioe0vB9hF4w02tH9WL+XyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716364481; c=relaxed/simple;
	bh=SVntbTmQZEA3PKqs8A1qluZvBPdpd11OxVSUTFpHJGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rhi1x1auevKsDzKY4YbJY5GmIcYATCw30Oblf/KlBQY9OxYZ+fWoRlc93tu+LxSvxXoZerirJD4W9/AQGiJ9qxiAZZzFWyNoBQiwuPiH3oIeLgnSr45dVfgytlnMYVfuZQRc624816sSvOCMEl5Vt+3RwlwhCImPljjPqjeDjrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1s9gnz-0000y6-6g; Wed, 22 May 2024 09:54:35 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1s9gny-002Ulm-AQ; Wed, 22 May 2024 09:54:34 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1s9gny-007sjD-0l;
	Wed, 22 May 2024 09:54:34 +0200
Date: Wed, 22 May 2024 09:54:34 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Message-ID: <Zk2kunIzL0ylxHiH@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20240517094940.1169-1-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240517094940.1169-1-nas.chung@chipsnmedia.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Fri, 17 May 2024 18:49:40 +0900, Nas Chung wrote:
> We expect V4L2_TYPE_IS_CAPTURE() macro allow only CAPTURE type.
> But, Inverting OUTPUT type can allow undefined v4l2_buf_type.
> Check CAPTURE type directly instead of inverting OUTPUT type.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  include/uapi/linux/videodev2.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index fe6b67e83751..32b10e2b7695 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -171,7 +171,13 @@ enum v4l2_buf_type {
>  	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
>  	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
>  
> -#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
> +#define V4L2_TYPE_IS_CAPTURE(type)				\
> +	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE			\
> +	 || (type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
> +	 || (type) == V4L2_BUF_TYPE_VBI_CAPTURE			\
> +	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE		\
> +	 || (type) == V4L2_BUF_TYPE_SDR_CAPTURE			\
> +	 || (type) == V4L2_BUF_TYPE_META_CAPTURE)

Maybe adding a V4L2_TYPE_IS_VALID(type) macro would be helpful to define
TYPE_IS_CAPTURE as all valid types that are not OUTPUT:

	#define V4L2_TYPE_IS_VALID(type) \
		((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE \
		&& (type) <= V4L2_BUF_TYPE_META_OUTPUT)

	#define V4L2_TYPE_IS_CAPTURE(type) \
		(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))

This would avoid keeping the two explicit lists of OUTPUT and CAPTURE
types.

Michael

>  
>  enum v4l2_tuner_type {
>  	V4L2_TUNER_RADIO	     = 1,
> -- 
> 2.25.1
> 
> 
> 

