Return-Path: <linux-media+bounces-12724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69F900400
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 14:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD437288D03
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE5B188CD6;
	Fri,  7 Jun 2024 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdvL0BHT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284881E4A6
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764312; cv=none; b=TtdMYgORYmz1DAYrrL6i0LjbAHwgqiR6zkDUwNoxRusr6S+crL1iSXfBtgmfaNPGsVvO/LJ0aVUjErKTQVYz9xvmSIS/xg803gNOojGcznNrEKPa+rFxuKZyr6GyLweK4tniRplfE8IY4DtQcJ68SISzc6HLYtuN96oRzbjJssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764312; c=relaxed/simple;
	bh=eT1R/6wVlYmrqjwXDq0YkmgpEfKu6uOeiKRozEj5rhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRW+blKvi97IBps+/U7JHCC+Zi68mdBC/u1N15VD8VmGFrOxmet1KA286j+7TSEFqrFlWgjFTJ3pYfxrwdOWjshw2McKmDZOeNdSqSJWtCyHdCU35n5RfeBqS+1Jun5QXuhp6kZomKhGPSW65f1CDlwvhiJX8c85n6nhuEAlNqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdvL0BHT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717764311; x=1749300311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eT1R/6wVlYmrqjwXDq0YkmgpEfKu6uOeiKRozEj5rhc=;
  b=UdvL0BHTHtDdYxeh2K0I0oNgVdgfvScCJCEoKwK8tA1C/i0Zj/qoA2bS
   gfn65uLbLCxj2RM/zO42QXMKoL+LXIT0tcybl2X/mL6/cy3d6+J47XA5p
   eLe8hAa+7UEViYyw0txPwyU0ajLfTnBDG59ovziCvWg7Oqui7XPGz15Lk
   kt4lsIty7uw2c9kOQ7mfVc/KTqGqGR5UQkTIy1tamfn1xcuVan8lfEFwI
   HQCKHdPfYTJU1cINf8byA0jxTtE1tPmm/YSd5+GhmqlwJnwjQD9yUAI44
   EH9f/MxKD8LpdtMSpBojTOnl7/Sbox9M9q9E3eYe07uEacuYOKALBjWmB
   w==;
X-CSE-ConnectionGUID: sCBZVnrJRXKEvpc1vAvzyQ==
X-CSE-MsgGUID: R58qGo5vSFS3u9t2j/ytgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14663795"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14663795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:45:11 -0700
X-CSE-ConnectionGUID: kfjOVI/gQXOKBS/Surp9Ag==
X-CSE-MsgGUID: w7ynH0XjQpmSQQGev9tS1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="75795503"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:45:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 95B9311FA94;
	Fri,  7 Jun 2024 15:45:06 +0300 (EEST)
Date: Fri, 7 Jun 2024 12:45:06 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wentong Wu <wentong.wu@intel.com>
Cc: linux-media@vger.kernel.org, hao.yao@intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: Re: [PATCH 3/3] media: ivsc: csi: remove privacy status in struct
 mei_csi
Message-ID: <ZmMA0pahCizgRdE2@kekkonen.localdomain>
References: <20240603082614.1567712-1-wentong.wu@intel.com>
 <20240603082614.1567712-4-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603082614.1567712-4-wentong.wu@intel.com>

Hi Wentong,

Thanks for the patch.

On Mon, Jun 03, 2024 at 04:26:14PM +0800, Wentong Wu wrote:
> The privacy status is maintained by privacy_ctrl, on which all
> of the privacy status changes will go through, so there is no
> point in maintaining one more element any more.
> 
> Reported-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Tested-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/pci/intel/ivsc/mei_csi.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> index d6ba0d9efca1..1d1b9181a50a 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -138,9 +138,6 @@ struct mei_csi {
>  	u32 nr_of_lanes;
>  	/* frequency of the CSI-2 link */
>  	u64 link_freq;
> -
> -	/* privacy status */
> -	enum ivsc_privacy_status status;
>  };
>  
>  static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
> @@ -271,10 +268,8 @@ static void mei_csi_rx(struct mei_cl_device *cldev)
>  
>  	switch (notif.cmd_id) {
>  	case CSI_PRIVACY_NOTIF:
> -		if (notif.cont.cont < CSI_PRIVACY_MAX) {
> -			csi->status = notif.cont.cont;
> -			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, csi->status);
> -		}
> +		if (notif.cont.cont < CSI_PRIVACY_MAX)
> +			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, notif.cont.cont);

notif.cont.cont represents is MEI's idea of the privacy state which just
happens to be aligned with V4L2's.

While this issue is not related to this patch, it'd be nice to use e.g.

			v4l2_ctrl_s_ctrl(csi->privacy_ctrl,
					 notif.cont.cont == CSI_PRIVACY_ON);

So could you add one more patch to the set for v2?

>  		break;
>  	case CSI_SET_OWNER:
>  	case CSI_SET_CONF:

-- 
Kind regards,

Sakari Ailus

