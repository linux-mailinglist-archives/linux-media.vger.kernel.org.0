Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6C8170F388
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 11:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbjEXJyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 05:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbjEXJxt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 05:53:49 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8907119C;
        Wed, 24 May 2023 02:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684922017; x=1716458017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EwKt2AKev8JsslSeP6fLzQlunynMmrUAsnEW9t+BUP8=;
  b=lxiDloLsyWhf9DdBW+PbQb+ji/ascef6eNVyCg19jLxPrILHq23Jtoge
   57Br6tO6DKXoru1+zKBJE7XDBAPa9HLMXtVFX5J3fKiuVbkxHHLav5eWB
   SQB96itAEl4vx/OuR3T8iITm6uEYPBKeHeuLLNNwDryxQ/gr71iHoVL03
   Jmy+sGCT+JfCJ5MZUwjBsRwab+2rQ3/36APO6iCPjT4HMYedr8RGSmbos
   zQtbpHADBIMLAd3XfC1RrklrM4WQd/33CdE7EKIqi0BxchELSDwLoWVmM
   7upuO10Tc9/HIwhi9K5zSuA6VX4xo8JPpGuYFp90fI/T+D3FmNriZU4kD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="355874659"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="355874659"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 02:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="794128661"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="794128661"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 02:53:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 203B41202A8;
        Wed, 24 May 2023 12:53:32 +0300 (EEST)
Date:   Wed, 24 May 2023 09:53:32 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3] media: renesas: fdp1: Identify R-Car Gen2 versions
Message-ID: <ZG3enBHbEkS//A+H@kekkonen.localdomain>
References: <3d6cbf2cd4398f29379d8d7287b93e8b8ec6c147.1684856457.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d6cbf2cd4398f29379d8d7287b93e8b8ec6c147.1684856457.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Tue, May 23, 2023 at 05:42:21PM +0200, Geert Uytterhoeven wrote:
> On R-Car M2-W:
> 
>     rcar_fdp1 fe940000.fdp1: FDP1 Unidentifiable (0x02010101)
>     rcar_fdp1 fe944000.fdp1: FDP1 Unidentifiable (0x02010101)
> 
> Although the IP Internal Data Register on R-Car Gen2 is documented to
> contain all zeros, the actual register contents seem to match the FDP1
> version ID of R-Car H3 ES1.*, which has just been removed.
> Fortunately this version is not used for any other purposes yet.
> 
> Fix this by re-adding the ID, now using an R-Car Gen2-specific name.
> 
> Fixes: af4273b43f2bd9ee ("media: renesas: fdp1: remove R-Car H3 ES1.* handling")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
> Version register contents verified on R-Car H2 ES1.0, R-Car M2-W ES1.0 &
> ES3.0, and R-Car E2 ES1.0.  I couldn't get hold of an R-Car M2-N.
> 
> v3:
>   - Add Reviewed-by,

V2 is already in my PR to Mauro. I hope that's fine!

> 
> v2:
>   - Add Reviewed-by,
>   - Add comment.
> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
> index f43e458590b8cada..ab39cd2201c85d84 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -254,6 +254,8 @@ MODULE_PARM_DESC(debug, "activate debug info");
>  
>  /* Internal Data (HW Version) */
>  #define FD1_IP_INTDATA			0x0800
> +/* R-Car Gen2 HW manual says zero, but actual value matches R-Car H3 ES1.x */
> +#define FD1_IP_GEN2			0x02010101
>  #define FD1_IP_M3W			0x02010202
>  #define FD1_IP_H3			0x02010203
>  #define FD1_IP_M3N			0x02010204
> @@ -2360,6 +2362,9 @@ static int fdp1_probe(struct platform_device *pdev)
>  
>  	hw_version = fdp1_read(fdp1, FD1_IP_INTDATA);
>  	switch (hw_version) {
> +	case FD1_IP_GEN2:
> +		dprintk(fdp1, "FDP1 Version R-Car Gen2\n");
> +		break;
>  	case FD1_IP_M3W:
>  		dprintk(fdp1, "FDP1 Version R-Car M3-W\n");
>  		break;

-- 
Kind regards,

Sakari Ailus
