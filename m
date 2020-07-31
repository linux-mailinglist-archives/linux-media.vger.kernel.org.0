Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F02823485D
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 17:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732564AbgGaPX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 11:23:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:4011 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgGaPX7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 11:23:59 -0400
IronPort-SDR: ieHzjBUvwhR+MmwCJ53Tj8TeGi1axH9txbeq/9/sQ3wGvWQItlj6pvngUJmyNW/vWWtuVdpVZM
 IQfRCuBtisrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="139776760"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="139776760"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 08:23:58 -0700
IronPort-SDR: bSb6tvJsAMoUmHEgucZC11pIyRmfpRA9zMhvYeL+rzLp6S00sj16uBLvwgPPAbnNwMQJhlSFhv
 8md9gp1s7X2w==
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="321423421"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 08:23:56 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1F4F720722; Fri, 31 Jul 2020 18:23:54 +0300 (EEST)
Date:   Fri, 31 Jul 2020 18:23:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ov5640: Add support for BT656 mode
Message-ID: <20200731152353.GS13316@paasikivi.fi.intel.com>
References: <1596187487-31403-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596187487-31403-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596187487-31403-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Fri, Jul 31, 2020 at 10:24:47AM +0100, Lad Prabhakar wrote:
> @@ -2875,8 +2891,10 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
>  			ret = ov5640_set_stream_mipi(sensor, enable);
> -		else
> +		else if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL)
>  			ret = ov5640_set_stream_dvp(sensor, enable);
> +		else
> +			ret = ov5640_set_stream_bt656(sensor, enable);

I'd also check for the Bt.656 mode here, rather than assuming it. 

Could you also update the DT bindings, given that the sensor appears to
support Bt.656 as well? I believe this requires the bus-type property, too.

>  
>  		if (!ret)
>  			sensor->streaming = enable;

-- 
Kind regards,

Sakari Ailus
