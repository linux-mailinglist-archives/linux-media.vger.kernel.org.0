Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B223A3BF2
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 08:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbhFKGQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 02:16:22 -0400
Received: from mga12.intel.com ([192.55.52.136]:51220 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230406AbhFKGQV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 02:16:21 -0400
IronPort-SDR: aPtgTGGxGJYWZQ+V34HDEZpYkdKJaqbzUTKwjvrMP0D7eTxvWrhMVK28o+ugLDU6AP0Eq4mJ0Q
 chKPwbsp6OhA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185160442"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="185160442"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 23:14:23 -0700
IronPort-SDR: J0RkFeg3TbRmOA1vksM6Zzb9jbMU3xaY46QEB0aEjePdyjO8H3Gbg71A6Goc4JQEHGmO8+2+M0
 GIKdcp7/cMxw==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="450657291"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 23:14:15 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 23EA42036A;
        Fri, 11 Jun 2021 09:14:13 +0300 (EEST)
Date:   Fri, 11 Jun 2021 09:14:13 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pavel Machek <pavel@ucw.cz>, Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Heungjun Kim <riverful.kim@samsung.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mickael Guene <mickael.guene@st.com>,
        Mats Randgaard <matrandg@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Yong Zhi <yong.zhi@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo@jmondi.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v5 0/9] media: v4l2-subdev: add subdev-wide state struct
Message-ID: <20210611061413.GM3@paasikivi.fi.intel.com>
References: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Thu, Jun 10, 2021 at 05:55:57PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> v5 of the series. No content changes compared to v4, but the series is
> split into smaller parts to enable reviews.
> 
> The split is artificial, and all the patches need to be squashed into
> one before merging.
> 
> The point of the series is explained in "media: v4l2-subdev: add
> subdev-wide state struct", but for easier reviews I add it partially
> here:
> 
> We have 'struct v4l2_subdev_pad_config' which contains configuration for
> a single pad used for the TRY functionality, and an array of those
> structs is passed to various v4l2_subdev_pad_ops.
> 
> I was working on subdev internal routing between pads, and realized that
> there's no way to add TRY functionality for routes, which is not pad
> specific configuration. Adding a separate struct for try-route config
> wouldn't work either, as e.g. set-fmt needs to know the try-route
> configuration to propagate the settings.
> 
> This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
> moment only contains the v4l2_subdev_pad_config array) and the new
> struct is used in most of the places where v4l2_subdev_pad_config was
> used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
> are changed to instead take v4l2_subdev_state.

Thanks for the update.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Terveisin,

Sakari Ailus
