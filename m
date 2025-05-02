Return-Path: <linux-media+bounces-31558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A2AA6E81
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 11:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDE7B9A62D2
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 09:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22DB23182E;
	Fri,  2 May 2025 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjeE+4or"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9505D231831
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179630; cv=none; b=Xbb5+RwUmBJNyMpbnAvjsgsQ2R+fiJPbRNrQYlhS7+bHlN0tIqrnE+38GqRQo51KaMCCz7a/4Sz+9/SleGQblc3NIxgOOpiw/KB0GItaA06Bd3eKUxhOCw9GqBRxD6ue2b8WyPYb1jxlzHFQqFEDlrN0kDNSg6fm1et0ob9ibaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179630; c=relaxed/simple;
	bh=mOoyC4P63Qdk9z9yWZhW2bw8xqywlsbJ20DK1MJMPQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMw1RjxCK64cr0C5pY102eyLAc+tCP5rJ9nKNKKSVnN3/5zwcxkvL3MMcsqfc3aW2kQS7vNQogBkjNOSbssGntO2a2jUtztE1eBDtAJMQX2WhAErg5KKtzknpvQ2tIxra+13aduw//63FfULx1HJNuXLuGFC2YhArPYrzElLwBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjeE+4or; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746179629; x=1777715629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mOoyC4P63Qdk9z9yWZhW2bw8xqywlsbJ20DK1MJMPQU=;
  b=UjeE+4or/noOHzH/s3izsTbzfZXRSj8ROEnEIfDGAK/A9pnDp67VemrH
   aZ/Xu4OGwQHpKi9C+dCuvGaOoKPc0z3qicWEUm88qyFjLIgOrO5dliazD
   FaPaNIA92PGolPf6pLchCB2qTWtzHsa/ZGWp9eLX9SuXFp4b8bcvOH0Zb
   w2fwPA9MHHo2hJQqCqohe9Ce7NXqsHA8NiE7EjdzDcM0LTS8bslvWcJyr
   rNMi6GHzbSfpem/gnVloGp+HKQL9FJqrJEq8bDqkRr/QNUXhkvsD6MKRV
   28dNwRjOOKUnzy3J8clG/Ckt5ZBvdwhXyRa/AraZ8Z1eU+G7AIHmCJ+HB
   A==;
X-CSE-ConnectionGUID: haNiXXGyRG2vq2u41GmTUA==
X-CSE-MsgGUID: HS8N6iAcSnGc0hqXlmwuyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47998732"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47998732"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:53:48 -0700
X-CSE-ConnectionGUID: bPlVzIygST+mdskNappuZA==
X-CSE-MsgGUID: +Cw0CaYCTEKB7b+pqmO6Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="165526268"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:53:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 814571202A9;
	Fri,  2 May 2025 12:53:43 +0300 (EEST)
Date: Fri, 2 May 2025 09:53:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2 2/5] media: intel/ipu6: Remove ipu6_isys dependency
 from ipu6_isys_subdev
Message-ID: <aBSWJ0zUZg3fzlIc@kekkonen.localdomain>
References: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
 <20250428161643.321617-3-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428161643.321617-3-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

On Mon, Apr 28, 2025 at 06:16:40PM +0200, Stanislaw Gruszka wrote:
> isys back pointer of ipu6_isys_subdev structure is only used to get
> pointer to struct device. We can use device pointer directly, what
> would allow to refactor ipu6 subdev code to make it more independent.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c   | 15 ++++-----------
>  drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 10 ++++------
>  drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h |  8 ++------
>  3 files changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 685ef81969ac..543f81b1899f 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -98,12 +98,8 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
>  static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
>  				struct v4l2_event_subscription *sub)
>  {
> -	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
> -	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
> -	struct device *dev = &csi2->isys->adev->auxdev.dev;
> -
> -	dev_dbg(dev, "csi2 subscribe event(type %u id %u)\n",
> -		sub->type, sub->id);
> +	dev_dbg(sd->dev, "csi2 subscribe event(type %u id %u)\n", sub->type,
> +		sub->id);
>  
>  	switch (sub->type) {
>  	case V4L2_EVENT_FRAME_SYNC:
> @@ -402,8 +398,6 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *state,
>  				  struct v4l2_subdev_selection *sel)
>  {
> -	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
> -	struct device *dev = &asd->isys->adev->auxdev.dev;
>  	struct v4l2_mbus_framefmt *sink_ffmt;
>  	struct v4l2_mbus_framefmt *src_ffmt;
>  	struct v4l2_rect *crop;
> @@ -442,7 +436,7 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
>  		src_ffmt->code = ipu6_isys_convert_bayer_order(sink_ffmt->code,
>  							       sel->r.left,
>  							       sel->r.top);
> -	dev_dbg(dev, "set crop for %s sel: %d,%d,%d,%d code: 0x%x\n",
> +	dev_dbg(sd->dev, "set crop for %s sel: %d,%d,%d,%d code: 0x%x\n",
>  		sd->name, sel->r.left, sel->r.top, sel->r.width, sel->r.height,
>  		src_ffmt->code);
>  
> @@ -532,8 +526,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
>  	csi2->port = index;
>  
>  	csi2->asd.sd.entity.ops = &csi2_entity_ops;
> -	csi2->asd.isys = isys;
> -	ret = ipu6_isys_subdev_init(&csi2->asd, &csi2_sd_ops, 0,
> +	ret = ipu6_isys_subdev_init(&csi2->asd, dev, &csi2_sd_ops, 0,
>  				    NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
>  	if (ret)
>  		goto fail;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> index e5ce76c17ca3..7c6125dc4af4 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> @@ -265,10 +265,9 @@ static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
>  	.init_state = ipu6_isys_subdev_init_state,
>  };
>  
> -int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
> +int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,

I wouldn't pass a function arguments that it already has access to through
other means, i.e. dev in this case.

That being said, having a macro to obtain a struct device pointer based on
sub-device or isys could be nice, it could be called e.g.
ipu_isys_to_dev(). As this patch is simply moving the code around I'd add
this in a separate patch.

>  			  const struct v4l2_subdev_ops *ops,
> -			  unsigned int nr_ctrls,
> -			  unsigned int num_sink_pads,
> +			  unsigned int nr_ctrls, unsigned int num_sink_pads,
>  			  unsigned int num_source_pads)
>  {
>  	unsigned int num_pads = num_sink_pads + num_source_pads;
> @@ -281,12 +280,11 @@ int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
>  			 V4L2_SUBDEV_FL_HAS_EVENTS |
>  			 V4L2_SUBDEV_FL_STREAMS;
>  	asd->sd.owner = THIS_MODULE;
> -	asd->sd.dev = &asd->isys->adev->auxdev.dev;
> +	asd->sd.dev = dev;
>  	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>  	asd->sd.internal_ops = &ipu6_isys_subdev_internal_ops;
>  
> -	asd->pad = devm_kcalloc(&asd->isys->adev->auxdev.dev, num_pads,
> -				sizeof(*asd->pad), GFP_KERNEL);
> +	asd->pad = devm_kcalloc(dev, num_pads, sizeof(*asd->pad), GFP_KERNEL);
>  	if (!asd->pad)
>  		return -ENOMEM;
>  
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> index 46a2ede867f0..732e6ecc927a 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> @@ -12,11 +12,8 @@
>  
>  #include "ipu-isys.h"
>  
> -struct ipu6_isys;
> -
>  struct ipu6_isys_subdev {
>  	struct v4l2_subdev sd;
> -	struct ipu6_isys *isys;
>  	u32 const *supported_codes;
>  	struct media_pad *pad;
>  	struct v4l2_ctrl_handler ctrl_handler;
> @@ -39,10 +36,9 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_mbus_code_enum
>  				    *code);
> -int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
> +int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
>  			  const struct v4l2_subdev_ops *ops,
> -			  unsigned int nr_ctrls,
> -			  unsigned int num_sink_pads,
> +			  unsigned int nr_ctrls, unsigned int num_sink_pads,
>  			  unsigned int num_source_pads);
>  void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd);
>  #endif /* IPU6_ISYS_SUBDEV_H */

-- 
Regards,

Sakari Ailus

