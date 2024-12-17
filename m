Return-Path: <linux-media+bounces-23545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE89F44F4
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 08:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D7FE188DE8B
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CEF1D45F2;
	Tue, 17 Dec 2024 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTi2Kk6U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0231315A843;
	Tue, 17 Dec 2024 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734419930; cv=none; b=PowzIae3AuX0YiTdVarI0r1DPWE6YOp5P9FcEE6I9qHbH4NEWBdVweWeOhgSs0QFn+EoVcL/MLjfuGRNcV8mct4HlHDU3CHMPmJMy6ObFNk++NkFkQc3SNba6i0Ryf9iEQXsP3pdHoEG+mUFD/F0CAfV/nqenuMcCWduYNJq6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734419930; c=relaxed/simple;
	bh=LNlNnwNuXsVzox3ZB3P2TEiz00AMaabmgjM3esEcg8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itjp6rjto6PljojxHDUS1UF7mtxbVYDZUkp2R1ra+vBTIgr/lT6HXgKJD5osBCCgE2LZrkDzWuwu50v41B0Ak4vi8LWZwOin78J1ff3wACykdCsKFnudVJ6NGAuQ0r/GYfuZfZ+rmyYKpphjIRPONQXcUUnbQlyx9Twas8vrGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTi2Kk6U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734419927; x=1765955927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LNlNnwNuXsVzox3ZB3P2TEiz00AMaabmgjM3esEcg8k=;
  b=fTi2Kk6ULyAsSB49WkZlTKXzclW87VVhsTdr4MUsqn0XfHHdiCYlj+4o
   +G9KsgGPaLUfJgCfVPB9cNVcai3INAC/tcyl1hyVsXIvRiKBnh95NMNjm
   zfFQFUIed1yIq/OK8UWPDU0F4+rh1DsbRLcas64L8gf3bOntecX8Ni7i9
   o8RBFYemGAmqRREzgql6ejRrW85GFJhB5c0vS+0ip6J/Z/NtRuCr9Zdet
   nMoJ9hFDsIpB6aV1cW9WVjb08hY6jzyr1Bjyk1DBzij6AlE2m+49+JIHM
   6cgCh4DCFImZdY62uIb3M94VNeHO6+IE8VEn7RjYvtASCMC5xwZpQEH5o
   Q==;
X-CSE-ConnectionGUID: qoIt9DpUTxWKy/AQ7nchzQ==
X-CSE-MsgGUID: b7oWpSoQT/S3+ae8Yf6iyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38505558"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="38505558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:18:46 -0800
X-CSE-ConnectionGUID: RXX72eciREyZ/EWk/HC7Lg==
X-CSE-MsgGUID: wjdesa4/S7mH6B6f8TtPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97345947"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:18:44 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5FF4811F775;
	Tue, 17 Dec 2024 09:18:41 +0200 (EET)
Date: Tue, 17 Dec 2024 07:18:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] staging: media: max96712: fix kernel oops when
 removing module
Message-ID: <Z2El0RShqHTKdsil@kekkonen.localdomain>
References: <20241217065151.1281037-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217065151.1281037-1-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

Thanks for the patch.

On Tue, Dec 17, 2024 at 08:51:50AM +0200, Laurentiu Palcu wrote:
> The following kernel oops is thrown when trying to remove the max96712
> module:
> 
> Unable to handle kernel paging request at virtual address 00007375746174db
> Mem abort info:
>   ESR = 0x0000000096000004
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x04: level 0 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af89000
> [00007375746174db] pgd=0000000000000000, p4d=0000000000000000
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> Modules linked in: crct10dif_ce polyval_ce mxc_jpeg_encdec flexcan
>     snd_soc_fsl_sai snd_soc_fsl_asoc_card snd_soc_fsl_micfil dwc_mipi_csi2
>     imx_csi_formatter polyval_generic v4l2_jpeg imx_pcm_dma can_dev
>     snd_soc_imx_audmux snd_soc_wm8962 snd_soc_imx_card snd_soc_fsl_utils
>     max96712(C-) rpmsg_ctrl rpmsg_char pwm_fan fuse
>     [last unloaded: imx8_isi]
> CPU: 0 UID: 0 PID: 754 Comm: rmmod
> 	    Tainted: G         C    6.12.0-rc6-06364-g327fec852c31 #17
> Tainted: [C]=CRAP
> Hardware name: NXP i.MX95 19X19 board (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : led_put+0x1c/0x40
> lr : v4l2_subdev_put_privacy_led+0x48/0x58
> sp : ffff80008699bbb0
> x29: ffff80008699bbb0 x28: ffff00008ac233c0 x27: 0000000000000000
> x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> x23: ffff000080cf1170 x22: ffff00008b53bd00 x21: ffff8000822ad1c8
> x20: ffff000080ff5c00 x19: ffff00008b53be40 x18: 0000000000000000
> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> x14: 0000000000000004 x13: ffff0000800f8010 x12: 0000000000000000
> x11: ffff000082acf5c0 x10: ffff000082acf478 x9 : ffff0000800f8010
> x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff6364626d
> x5 : 8080808000000000 x4 : 0000000000000020 x3 : 00000000553a3dc1
> x2 : ffff00008ac233c0 x1 : ffff00008ac233c0 x0 : ff00737574617473
> Call trace:
>  led_put+0x1c/0x40
>  v4l2_subdev_put_privacy_led+0x48/0x58
>  v4l2_async_unregister_subdev+0x2c/0x1a4
>  max96712_remove+0x1c/0x38 [max96712]
>  i2c_device_remove+0x2c/0x9c
>  device_remove+0x4c/0x80
>  device_release_driver_internal+0x1cc/0x228
>  driver_detach+0x4c/0x98
>  bus_remove_driver+0x6c/0xbc
>  driver_unregister+0x30/0x60
>  i2c_del_driver+0x54/0x64
>  max96712_i2c_driver_exit+0x18/0x1d0 [max96712]
>  __arm64_sys_delete_module+0x1a4/0x290
>  invoke_syscall+0x48/0x10c
>  el0_svc_common.constprop.0+0xc0/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x34/0xd8
>  el0t_64_sync_handler+0x120/0x12c
>  el0t_64_sync+0x190/0x194
> Code: f9000bf3 aa0003f3 f9402800 f9402000 (f9403400)
> ---[ end trace 0000000000000000 ]---
> 
> This happens because in v4l2_i2c_subdev_init(), the i2c_set_cliendata()
> is called again and the data is overwritten to point to sd, instead of
> priv. So, in remove(), the wrong pointer is passed to
> v4l2_async_unregister_subdev(), leading to a crash.
> 
> Fixes: 5814f32fef13 ("media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

I believe Cc: stable is needed here, too, I'll add it. max96712 has been
around for quite some time...

> ---
> Changes in v2:
>  * removed call to i2c_set_clientdata() in probe;
>  * cleaned up the trace in commit message as the tmux status line string
>    sneaked into it;
> 
> Thanks,
> Laurentiu
> 
>  drivers/staging/media/max96712/max96712.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index ede02e8c891cb..0751b2e048958 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -418,7 +418,6 @@ static int max96712_probe(struct i2c_client *client)
>  	priv->info = of_device_get_match_data(&client->dev);
>  
>  	priv->client = client;
> -	i2c_set_clientdata(client, priv);
>  
>  	priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
>  	if (IS_ERR(priv->regmap))
> @@ -448,7 +447,8 @@ static int max96712_probe(struct i2c_client *client)
>  
>  static void max96712_remove(struct i2c_client *client)
>  {
> -	struct max96712_priv *priv = i2c_get_clientdata(client);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
>  
>  	v4l2_async_unregister_subdev(&priv->sd);
>  

-- 
Regards,

Sakari Ailus

