Return-Path: <linux-media+bounces-40094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE78B29AEE
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8ABE5E5AA4
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675A927A460;
	Mon, 18 Aug 2025 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhL47L2N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F62797B2;
	Mon, 18 Aug 2025 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502683; cv=none; b=jJnbw4CENipn8HSKGLe/OpaK3uxuJDzl1nS1ju3OujDoPTfLczpiJo52DEgkudtMk0tvV7WhLEaWGgKmvo7Lcq27sGu39TeyNEts2fVHT8yX2X7D3qE2SoQker7dkGoboTPtrZLZDpu3+N/vAQl8HK/p8qzGzDhdFlH6fawNuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502683; c=relaxed/simple;
	bh=88MdU1v1o+4fNWWqJuQ/u22iMfo7loAwf7RLul7EH+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdcIA6w/+uQuPFlIU3YcrqrL8M1zwSJhl1EGfVF1ITWMAmWfkaRvnvbNHd3v0SsOloLEwfbVclQWayQJHLgVZVAiyrO5F5ORvnOneVv/xKzBDaMAdv/OuVMw/0RKZ+nvYCxz1Kp89r0VOSCGAMnHZHDqvd+1OzyQ1iUeogyz7rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhL47L2N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755502683; x=1787038683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=88MdU1v1o+4fNWWqJuQ/u22iMfo7loAwf7RLul7EH+E=;
  b=nhL47L2N7mBTPI921O2Ny/3aPROF08h8ng4tW8v6GSK+tZPdIvH3RjJh
   cBSWTZl/b5JLHZ+KHoh+Yyw06rHo54WEO1L1Xh/y7lYPfD2/sgrdMVBz7
   jf66cQeRCb8gT0W2qCIFLktnDXUJHPlBpzm/iHnRGBQwytM7aNNHUTcsO
   fiJwCvE2fXfz4SN3mdQ0XeCChy8FN81JdBuVSdr9mYsUxg8o+o8p8Twb/
   xqs8Tkx8/vByIkDD00G8vslxCmBdk3f0s+oRzA5LEq/C/TKjQpIxGA8G2
   74IqqvcLC0yx4sKLSkn3GGDDfzyuypb5J2ObpaI5DBASbZdBKa2bUh0cU
   Q==;
X-CSE-ConnectionGUID: gc3HM8ujRNq5ZjbD1fQA9Q==
X-CSE-MsgGUID: Ra9zKMsdQZq1KhJnBEZ3Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57577372"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57577372"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:38:02 -0700
X-CSE-ConnectionGUID: c2i5GMJHQ1ilSIxqyrhmag==
X-CSE-MsgGUID: EhWbMexOSxetme6OQ+Yxbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="168318186"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.152])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:37:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 62A1E1212C6;
	Mon, 18 Aug 2025 10:37:56 +0300 (EEST)
Date: Mon, 18 Aug 2025 07:37:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 5/7] media: i2c: dw9719: Update PM last busy time upon
 close
Message-ID: <aKLYVDDLnD5stpqZ@kekkonen.localdomain>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
 <20250817-dw9719-v1-5-426f46c69a5a@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250817-dw9719-v1-5-426f46c69a5a@apitzsch.eu>

Hi André,

Thanks for the patchset.

On Sun, Aug 17, 2025 at 07:09:24PM +0200, André Apitzsch via B4 Relay wrote:
> From: Val Packett <val@packett.cool>
> 
> Update the close callback to match other similar drivers like dw9768.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/dw9719.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 61758a9450aee20c9226e879a15eccfced9a3e96..2952d8064899e4ac29f3b1af02692fe8043ccfac 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -284,7 +284,8 @@ static int dw9719_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  
>  static int dw9719_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
> -	pm_runtime_put(sd->dev);
> +	pm_runtime_mark_last_busy(sd->dev);

Please drop this line; the pm_runtime_mark_last_busy() is nowadays called
by pm_runtime_put_autosuspend() already.

> +	pm_runtime_put_autosuspend(sd->dev);
>  
>  	return 0;
>  }
> 

-- 
Kind regards,

Sakari Ailus

