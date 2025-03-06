Return-Path: <linux-media+bounces-27779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBDDA5562C
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 20:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC70718963BC
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 19:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B7E26E15F;
	Thu,  6 Mar 2025 19:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9BUFe6w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239425A652
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288048; cv=none; b=GWSu1LyDlEocLhoJH26osefGt92riWRFJ7bKNc2IFIZa6xFQoMS8yhiL6wTt3/x8P39AnH32t4qC77lvkc6zSCkdhBreYhT0hGGDOLFAg+kJNzqg0HFa07/E8z3eJF4vwX+qRPWUFIS0AkJDqYyJET9FX2pkO08tYarIMGp7wiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288048; c=relaxed/simple;
	bh=NuM0/4Z7CHDs8YxtoXcHEdVgcIA8PHCLZ43FdsDlooE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JW8nkRXgNOiStMtO25E5vyO8mj73uOfDbFjZruf9hCFCgYWdUpoespKpP0+l69Wgwe3Xt2OszXsP03XLCeZaQomYbAjA9nX7ORJr0xf+K0Js+BhEG0gy9/jZvMnvfqNANo5EG3XPrPe4uo8rkQvatXuEa8c7Y2kcMc5qgAbUY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L9BUFe6w; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3910e101d0fso648479f8f.2
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741288044; x=1741892844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcPTYtu0Id6NGn3oYEB5ke8Yt/wGoQtkJ2G5rC4dZ8Y=;
        b=L9BUFe6wQl7esND5MuBdPsZinKeYSbUgoPxkPCAJyQuhtGF3snTFBizBoOkJ+RKI5O
         N12b8QdpV3jw7r5c+nHY33pZPZAWuIxVMo8MglEh2qAFUiaBB94rM9vYj6+YU4srM8QR
         6AHqb037g9Ey1JlMvu9xOpkpmbimzXC0HQ+1Ng2ikwgZlmHocSVKJ23E6+WRkzrmt4SH
         GEUIBQES4uwKIehTFZ9gNGXujB3DWewwFcz0W7PPw7nAdKKc8/t51noeQthkSICWMhS9
         DVT6XyCt1T4riGchcfvr1GFtT3X43CkSvIz2LeAI5WDPoo8/ufxpHwBLtLTt88twWEMW
         +XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288044; x=1741892844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcPTYtu0Id6NGn3oYEB5ke8Yt/wGoQtkJ2G5rC4dZ8Y=;
        b=t/gUxPaP7rZPGCRMoy7h6QAG+Dsj+08z+V4BtUZyJP7zzVe4QCooxi7Y6OQZY+3/14
         OaFCPATsW7XwAojeSf1/PMSiHfNFvi0ZdQkY+tsR3zp6hIxof5pP/uFAykWJ5ocMXhg+
         6A7MYV5sptmRZb93XAAk7uEtUAKcMcrdy04Fr1ErsS+9QhGph8kdq6G9Tcb5T4Oq6DGB
         U7UT/3oyAxJ/bkKr9sfmwLh8l/Sve5tmeHo95Kj9a1DQg5mUiVLsHJ9EpXixyDr7Hb1m
         PPbAI61der16MIRz4QqF88n9yBGImoR0BBTdaMDif8VnqqI3Iy+QRUXyvjw3DCx74P80
         AnCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkLj6r98gJjD2IxZSWti5ewPChQyuB3ULyu53PeDRpVMw8J3WfmVgT5mUZpyy98UYQml+WnU+QccMpZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHuCGKRPHPAn+f8gqh7JEmk2pFTflF3UNVfXuU8R00sTcPBMP
	+yr9yA9zLMLX6k0h3BhkxvhFZnJ+xD6XoKxaTlTpQCaB5NAKiljiaegd6PHL94I=
X-Gm-Gg: ASbGnctEXTX0qjY1Yr+GvmpCwUd8qaj0vyUVcwY3TIaVXtyTEDV12DIHXYK4Gm2uzrs
	aiN8YhoVWjsX7whmZVrhfZd85Dw3QlocjTZZUf/tZxW11oyP3+Qg+pmWs/D4vGia3qq839Eg+FA
	5zdgXcLLG4LPmZawR+40qrccgJQnUl/WppRNFIBPGrMz6W9VfE58HgRsgVLykQYh4hIn/7LqbYp
	CRVDRzDwr+P6kgtRebdbkuyB5wSKNo5YBVAu4CISd4QOZzKuUOvM9gEwXRrJ2btKqDRojsXUyvy
	4pIA9Uah0dl3Msam1D7aoSvllwEOd141mfxMEH7HqfCPhqJgqg==
X-Google-Smtp-Source: AGHT+IGw/KEJ9CBs+ZmqDYKL+kV1HSN6Zuv++vQFuUB2xUBy6Y//0Fpmd9GzursfaQ4hN9Ki5iMA9Q==
X-Received: by 2002:a5d:6c66:0:b0:390:fceb:72f1 with SMTP id ffacd0b85a97d-39132d7625emr290402f8f.26.1741288044594;
        Thu, 06 Mar 2025 11:07:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e1476sm2880709f8f.70.2025.03.06.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:07:23 -0800 (PST)
Date: Thu, 6 Mar 2025 22:07:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mathis Foerst <mathis.foerst@mt.com>, linux-kernel@vger.kernel.org,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>

On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> Hi Mathis,
> 
> Thanks for the patch.
> 
> On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > The imx-media-csi driver requires upstream camera drivers to implement
> > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > implement this function are not usable on the i.MX6.
> > 
> > The docs for get_mbus_config [1] say:
> > @get_mbus_config: get the media bus configuration of a remote sub-device.
> >             The media bus configuration is usually retrieved from the
> >             firmware interface at sub-device probe time, immediately
> >             applied to the hardware and eventually adjusted by the
> >             driver.
> > 
> > Currently, the imx-media-csi driver is not incorporating the information
> > from the firmware interface and therefore relies on the implementation of
> > get_mbus_config by the camera driver.
> > 
> > To be compatible with camera drivers not implementing get_mbus_config
> > (which is the usual case), use the bus information from the fw interface:
> > 
> > The camera does not necessarily has a direct media bus link to the CSI as
> > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > between them on the media pipeline.
> > The CSI driver already implements the functionality to find the connected
> > camera sub-device to call get_mbus_config on it.
> > 
> > At this point the driver is modified as follows:
> > In the case that get_mbus_config is not implemented by the upstream
> > camera, try to get its endpoint configuration from the firmware interface
> > usign v4l2_fwnode_endpoint_parse.
> > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > configuration.
> > For all other mbus_types, return an error.
> > 
> > Note that parsing the mbus_config from the fw interface is not done during
> > probing because the camera that's connected to the CSI can change based on
> > the selected input of the video-mux at runtime.
> > 
> > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > [1] include/media/v4l2-subdev.h - line 814
> > 
> > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > ---
> >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> >  1 file changed, 32 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > index 3edbc57be2ca..394a9321a10b 100644
> > --- a/drivers/staging/media/imx/imx-media-csi.c
> > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> >  {
> >  	struct v4l2_subdev *sd, *remote_sd;
> >  	struct media_pad *remote_pad;
> > +	struct fwnode_handle *ep_node;
> > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> 
> Are there any defaults in DT bindings (other than 0's)? Also initialising a
> field to zero this way is redundant, just use {}.
> 

I was going to respond in much the same way.  This is equivalen to:

struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };

> >  	int ret;
> >  
> >  	if (!priv->src_sd)
> > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> >  
> >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> >  			       remote_pad->index, mbus_cfg);
> > -	if (ret == -ENOIOCTLCMD)
> > -		v4l2_err(&priv->sd,
> > -			 "entity %s does not implement get_mbus_config()\n",
> > -			 remote_pad->entity->name);
> > +	if (ret == -ENOIOCTLCMD) {
> 
> 	if (!ret)
> 		return 0;
> 
> And you can unindent the rest.

I was going to say this too but then I thought actually this needs to
be:

	if (ret != -ENOIOCTLCMD)
		return ret;

Which is weird.  Better to break all the new code into a separate
helper function.

	if (ret == -ENOIOCTLCMD)
		ret = parse_fw_link_config_stuff();

	return ret;

regards,
dan carpenter



