Return-Path: <linux-media+bounces-62126-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGUfGapRDGqmfAUAu9opvQ
	(envelope-from <linux-media+bounces-62126-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:03:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A2D57E44A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66D223105620
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4142B335BDB;
	Tue, 19 May 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYjSoViU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E92E494A0C;
	Tue, 19 May 2026 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191817; cv=none; b=pMkfL6ZTUH0Pucl5YDlmPCWqF5gCK13Lnvs3bgtKfa9HpRFgTdkbKVpNvRz7A/x8gk4UIJ/napZl6B84aowA639lAayc3eJ+Pgxb5naS8cOOCA9avvUhyfD2ZgW0C70pRmd+tHJ5UUzh7reYIxqBqw2LUS10lhutUJrVEH43XSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191817; c=relaxed/simple;
	bh=eFmnDnZ+o7N1IdLChhAjVRR3p7Ozk+MZkQ/y18THHeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFHokwf8S98F92rTYUdfyrSsddDpvAx4xNFDfKXJy6PXGfDPilK28iYq5o3ibAbmTgiJ2246HyNXe2dIbRq24nO5dtMPh1xZhZCZQfz88N1CjURKSxk7KaycqbNGQlHLTJH1u7RTrNZwlrJ3Ytvo0iDFbLNcdtGJB5F0r3uqnAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYjSoViU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779191815; x=1810727815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eFmnDnZ+o7N1IdLChhAjVRR3p7Ozk+MZkQ/y18THHeU=;
  b=YYjSoViUnkON6neB30WisuakVkxJgSkQwaVDP1By5BewU4l/zPZnphIl
   hdmqFB/2r8dtvy/T4969uhv9udBNIfRDBq2mNIlrJT5Fv7TsO59VrC7Vf
   yidlAzxSF8wjajDCZRtL+NcgFFwLojaXaZdjBBVLGTbqXrBjnoiDyCjBl
   umGvqBKEgetp2nIH1yu0o/Wn3gs53wL8vjnb0J+t/YnsLgSRlZ0iTa6k8
   5ppSOgSJ87e9OnzKAfzx6ZUOnm33BOewlsEGsZOsupLcHCkmoHJalCkaD
   oYHOuH+lYBtxQnmKtHnG3NpBqQCWr6MeKSO4ou/BovmVGlYH6wiGrlA4F
   g==;
X-CSE-ConnectionGUID: b7jq4+20QaGJfcrLXGornA==
X-CSE-MsgGUID: ndJx/Z5hQL6qFR1gbXhbBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80097336"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80097336"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:56:54 -0700
X-CSE-ConnectionGUID: CC0e2UrKQWGgQ/Fv98iV8Q==
X-CSE-MsgGUID: 3jsF1dIpS9izlH0pDEiWDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="241587512"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.204])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:56:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0E8A4120E58;
	Tue, 19 May 2026 14:56:46 +0300 (EEST)
Date: Tue, 19 May 2026 14:56:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, sjoerd@collabora.com,
	dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 09/17] media: cadence: csi2rx: add get_frame_desc
 wrapper
Message-ID: <agxP_eCovgSpdYnZ@kekkonen.localdomain>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-10-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313090701.646534-10-r-donadkar@ti.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62126-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:email,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: C0A2D57E44A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rishikesh,

On Fri, Mar 13, 2026 at 02:36:53PM +0530, Rishikesh Donadkar wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
> 
> J721E wrapper CSI2RX driver needs to get the frame descriptor from the
> source to find out info about virtual channel. This driver itself does
> not touch the routing or virtual channels in any way. So simply pass the
> descriptor through from the source.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 2b25314ba6ab0..52ca940acd7d0 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>  	return NULL;
>  }
>  
> +static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
> +					     struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct media_pad *remote_pad;
> +
> +	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
> +	if (!remote_pad) {

media_entity_remote_source_pad_unique() returns an error code on error,
never NULL.

Could you use you use v4l2_subdev_get_frame_desc_passthrough()?

> +		dev_err(csi2rx->dev, "No remote pad found for sink\n");
> +		return -ENODEV;
> +	}
> +
> +	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
> +				remote_pad->index, fd);
> +}
> +
>  static inline
>  struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
>  {
> @@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>  }
>  EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
>  
> +static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +
> +	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
> +}
> +
>  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>  	.enum_mbus_code	= csi2rx_enum_mbus_code,
>  	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= csi2rx_set_fmt,
>  	.enable_streams         = csi2rx_enable_streams,
>  	.disable_streams        = csi2rx_disable_streams,
> +	.get_frame_desc	= csi2rx_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_core_ops csi2rx_core_ops = {

-- 
Regards,

Sakari Ailus

