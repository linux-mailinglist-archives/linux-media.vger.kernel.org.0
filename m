Return-Path: <linux-media+bounces-47123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2AC5E0EE
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 17:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50FE93656C9
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9CD33E378;
	Fri, 14 Nov 2025 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PaZwhQLD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC2F331207;
	Fri, 14 Nov 2025 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132250; cv=none; b=kEQLM95Ue14Oi0fHEG59dMyUaHBntxl5FSSNkFjDhrsC7xQAdb91CqXADzSV85RxSnOCVCYisFE2G9qAVFHrHX6UwubX3TrNLiks+lxiUwQzKm3xNfInze0CaiF58uSXnNOiZsU6h2V70b4A7bX3rcz6b+qU0LVftuqgCHHE0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132250; c=relaxed/simple;
	bh=UTl0W5+Bdo6I+bjM1sDG2qr2k/CxEVF6Tf83hOXGMzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4sNlGV2qEcjBGdH7l0avBQ8twftorCP6lmdOz0cTInxoXbA6ie/aBU8UImT/lugiMQAFn+a1PfTw0/8JOTAQ+5LWqrZSRC4TL4TzkdDhPGSEVVXWUb4Sc2Gen5WEjqKtqE+V9GTT7GVvMK+T/ZMY+eCDhhsHFGomweYinfGig8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PaZwhQLD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1036CB5;
	Fri, 14 Nov 2025 15:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763132124;
	bh=UTl0W5+Bdo6I+bjM1sDG2qr2k/CxEVF6Tf83hOXGMzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaZwhQLDGaev/igVb0jI/OydGH3dMJiRT5hie2WPZI9PhWjrvgydCncmP68HwsIgu
	 NMOdv/Dod3ygTeAVnKJy2eINSdDKG2I3B7kqTPukZdAjBN9Jt3CCNjyRmGKUN7rBX6
	 nd3GoNDppwdbVYgtEa5Z/5fN1XuPLYXj9XDckE7E=
Date: Fri, 14 Nov 2025 15:57:21 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, nayden.kanchev@arm.com, 
	robh+dt@kernel.org, mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 15/15] Documentation: mali-c55: Document the mali-c55
 parameter setting
Message-ID: <umslyxkmj4gnr743c6ixsykay5w2seoeiy2hzidg6lb3fcizep@dglvrn7l7a4q>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
 <20251111-c55-v13-15-3dc581355e3a@ideasonboard.com>
 <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>
 <aRdBbn4cpdn_7H0v@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aRdBbn4cpdn_7H0v@kekkonen.localdomain>

Hi Sakari,
   can't say timing is what we excel the most at.

Afaik Hans has applied the PR, and as all comments here are on ...
comments, they will be addressed with patches on top

On Fri, Nov 14, 2025 at 04:49:18PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Nov 13, 2025 at 09:39:37AM +0100, Jacopo Mondi wrote:
> > > +the data member with the blocks that need to be configured by the driver, but
> > > +need not populate it with **all** the blocks, or indeed with any at all if there
> > > +are no configuration changes to make. Populated blocks **must** be consecutive
> > > +in the buffer. To assist both userspace and the driver in identifying the
> > > +blocks each block-specific struct embeds :c:type:`v4l2_params_block_header` as
> > > +its first member and userspace must populate the type member with a value from
> > > +:c:type:`mali_c55_param_block_type`. Once the blocks have been populated
> > > +into the data buffer, the combined size of all populated blocks shall be set in
> > > +the data_size member of :c:type:`v4l2_params_buffer`. For example:
> > > +
> > > +.. code-block:: c
> > > +
> > > +	struct v4l2_params_buffer *params =
> > > +		(struct v4l2_params_buffer *)buffer;
> > > +
> > > +	params->version = MALI_C55_PARAM_BUFFER_V1;
> > > +	params->data_size = 0;
> > > +
> > > +	void *data = (void *)params->data;
> > > +
> > > +	struct mali_c55_params_awb_gains *gains =
> > > +		(struct mali_c55_params_awb_gains *)data;
> > > +
> > > +	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> > > +	gains->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> > > +	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> > > +
> > > +	gains->gain00 = 256;
> > > +	gains->gain00 = 256;
> > > +	gains->gain00 = 256;
> > > +	gains->gain00 = 256;
> > > +
> > > +	data += sizeof(struct mali_c55_params_awb_gains);
> > > +	params->data_size += sizeof(struct mali_c55_params_awb_gains);
> > > +
> > > +	struct mali_c55_params_sensor_off_preshading *blc =
> > > +		(struct mali_c55_params_sensor_off_preshading *)data;
> > > +
> > > +	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> > > +	blc->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> > > +	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> > > +
> > > +	blc->chan00 = 51200;
> > > +	blc->chan01 = 51200;
> > > +	blc->chan10 = 51200;
> > > +	blc->chan11 = 51200;
> > > +
> > > +	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);
> >
> > s/total_size/data_size
> >
> > And I've also updated it to use the v4l2-isp types
> >
> > +.. code-block:: c
> > +
> > +       struct v4l2_isp_params_buffer *params =
> > +               (struct v4l2_isp_params_buffer *)buffer;
>
> What's the type of buffer here? If it's void, you can drop the cast.
>
> > +
> > +       params->version = MALI_C55_PARAM_BUFFER_V1;
> > +       params->data_size = 0;
> > +
> > +       void *data = (void *)params->data;
>
> No need for a cast here.
>
> > +
> > +       struct mali_c55_params_awb_gains *gains =
> > +               (struct mali_c55_params_awb_gains *)data;
>
> Ditto.
>
> Unless, I guess, you use C++. :-)
>

It was C++ code yes :)

> > +
> > +       gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> > +       gains->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> > +       gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> > +
> > +       gains->gain00 = 256;
> > +       gains->gain00 = 256;
> > +       gains->gain00 = 256;
> > +       gains->gain00 = 256;
> > +
> > +       data += sizeof(struct mali_c55_params_awb_gains);
>
> 	data += sizeof(*gains);
>
> ?
>
> > +       params->data_size += sizeof(struct mali_c55_params_awb_gains);
>
> Ditto.
>
> > +
> > +       struct mali_c55_params_sensor_off_preshading *blc =
> > +               (struct mali_c55_params_sensor_off_preshading *)data;
> > +
> > +       blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> > +       blc->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> > +       blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> > +
> > +       blc->chan00 = 51200;
> > +       blc->chan01 = 51200;
> > +       blc->chan10 = 51200;
> > +       blc->chan11 = 51200;
> > +
> > +       params->data_size += sizeof(struct mali_c55_params_sensor_off_preshading);
>
> 	... += sizeof(*blc);
>
> ?

Patches will follow after v6.19 has been released


>
> >
> > With your ack, I'll apply the following changes before sending the PR.
> >
> > Thanks
> >   j
> >
> > > +
> > >  Arm Mali-C55 uAPI data types
> > >  ============================
> > >
> > >
>
> --
> Regards,
>
> Sakari Ailus

