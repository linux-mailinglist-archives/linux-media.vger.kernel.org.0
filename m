Return-Path: <linux-media+bounces-39948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA230B278C1
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C09BF189DA03
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 06:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB312571CD;
	Fri, 15 Aug 2025 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nflEetNp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1596218AAA;
	Fri, 15 Aug 2025 06:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755237882; cv=none; b=Q2hQJ/p08zWROTzf75jMIGvc1MwZxbMy0QcFOM0/L8ekMApzgMQB9ABfq5oinVt6l9lY4fzGDx8U9RjRoMzc7DAtgdfYLpusciJD9tDFhrt3svCvoEjDfDRlBLwH2A/mvgcfcLdx+jxXpwFlJ240TWK+fmWcXgzAOdug8oiP/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755237882; c=relaxed/simple;
	bh=d9VDI9bFuUtfWlPsQ9zIoZtYPWSYJZRj1s9zoh1a+NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTpPObm1yMTGaayFZeojjq2+YHKis0RAe7pQ5M7wrOFoEmJ4l/hBB1uwNvyf/pC8D57SxRNkTeqXciotXnud6BWF1y9OKHOmL87lh5HLznXlKoXq3DbizDRmMscl5K4bkV6myTa7apJ3hBOInZuHM52Ik6Sk27bQsNn5Q9RhtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nflEetNp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755237881; x=1786773881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d9VDI9bFuUtfWlPsQ9zIoZtYPWSYJZRj1s9zoh1a+NQ=;
  b=nflEetNpslKtQFvld41RRLjZgTmD8eLi3H7wrIOYW685lV8jXpb3bO/F
   42XbwrYawVQk6edqfie4qYWveZQjdbHRu/3QaqKW+EXb1f1WqdIhhKZLt
   0dgtVu0McKRZbhnkGsKDeeZEWhP/4UXt60rZMzUHEXga5d6V1A7LfmKc+
   gVQ+b6trzWWXkuSksht8DL0Okp3pwH4hl9QtLDeSI2ZUqX16RR9PT3xS7
   YHreZvJqdbR9dHwF2AtWLUpNAXw+FSDQ3cYPE6din5zYqHlTyKsErL0TD
   6rHafUGRaiebSdLo8Llp8fkM+9HSjzTXbIUiPGwSs89dDVfG7gm85iGxs
   A==;
X-CSE-ConnectionGUID: MR+CCXRvRtKy/2sa8lFFLA==
X-CSE-MsgGUID: 4HFcmlAXRYeYYcrjoBmuPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="56770302"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="56770302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:04:39 -0700
X-CSE-ConnectionGUID: uEkwpwp2Q/WE4peOaT+7Qg==
X-CSE-MsgGUID: VA45CygoTgakeNPdKVQNZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171189192"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:04:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CB2F511FA72;
	Fri, 15 Aug 2025 09:04:34 +0300 (EEST)
Date: Fri, 15 Aug 2025 06:04:34 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vgxy61: Report stream using frame descriptors
Message-ID: <aJ7N8tAqEp5KSTGN@kekkonen.localdomain>
References: <20250704-vgxy61-frame-desc-v1-1-0e62b9c4e260@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-vgxy61-frame-desc-v1-1-0e62b9c4e260@collabora.com>

Hi Julien,

On Fri, Jul 04, 2025 at 11:28:24AM +0200, Julien Massot wrote:
> Add support for .get_frame_desc() to report CSI-2 virtual channel
> and data type information. This allows CSI-2 receivers to properly
> interpret the stream without inferring the data type from the pixel
> format.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  drivers/media/i2c/vgxy61.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> index 5b0479f3a3c0592be430cefe5a1ab9a76812ba84..44d6c8d8fbf8d6182e42d44e129bc45945ee0da5 100644
> --- a/drivers/media/i2c/vgxy61.c
> +++ b/drivers/media/i2c/vgxy61.c
> @@ -1181,6 +1181,21 @@ static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>  
> +static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +	fd->entry[0].pixelcode = sensor->fmt.code;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = get_data_type_by_code(sensor->fmt.code);
> +
> +	return 0;
> +}
> +
>  static int vgxy61_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *format)
> @@ -1402,6 +1417,7 @@ static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
>  	.set_fmt = vgxy61_set_fmt,
>  	.get_selection = vgxy61_get_selection,
>  	.enum_frame_size = vgxy61_enum_frame_size,
> +	.get_frame_desc = vgxy61_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops vgxy61_subdev_ops = {
> 

I guess this is correct as such, but does it provide any information that
isn't already available? I.e. I wouldn't add it just for the sake of it.

-- 
Regards,

Sakari Ailus

