Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3806E391DA8
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 19:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbhEZRQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 13:16:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:5589 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234188AbhEZRQa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 13:16:30 -0400
IronPort-SDR: ewagfwxBD2wBh9ww41t60xXRMdAHyP5KcHxnGOLd/+JeLhSYUo7G4pNK/Q/EFn9vbcQP2lgQ8C
 wuvGU87+c0JA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202277177"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="202277177"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 10:14:57 -0700
IronPort-SDR: rMn/9UR7w7MAQJDLp/3RxcLw2YnxpI1aQOCKUiXdtLLnZLpVLFCL3enkIKFrPeYR42YtUP0S89
 axXYofxh/3yQ==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="615036247"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 10:14:49 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id DB3CD2011E;
        Wed, 26 May 2021 20:14:47 +0300 (EEST)
Date:   Wed, 26 May 2021 20:14:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v5 00/16] Allwinner MIPI CSI-2 support for A31/V3s/A83T
Message-ID: <20210526171447.GF3@paasikivi.fi.intel.com>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
 <f92c0812-7e1c-74e4-602b-7a885ef31454@xs4all.nl>
 <YK5M9PyUB4IfuaNU@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YK5M9PyUB4IfuaNU@aptenodytes>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, May 26, 2021 at 03:28:20PM +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Wed 26 May 21, 14:00, Hans Verkuil wrote:
> > Hi Paul,
> > 
> > On 15/01/2021 21:01, Paul Kocialkowski wrote:
> > > This series introduces support for MIPI CSI-2, with the A31 controller that is
> > > found on most SoCs (A31, V3s and probably V5) as well as the A83T-specific
> > > controller. While the former uses the same MIPI D-PHY that is already supported
> > > for DSI, the latter embeds its own D-PHY.
> > > 
> > > In order to distinguish the use of the D-PHY between Rx mode (for MIPI CSI-2)
> > > and Tx mode (for MIPI DSI), a submode is introduced for D-PHY in the PHY API.
> > > This allows adding Rx support in the A31 D-PHY driver.
> > > 
> > > A few changes and fixes are applied to the A31 CSI controller driver, in order
> > > to support the MIPI CSI-2 use-case.
> > 
> > Besides the compile error for patch 2/16, I also get several other compile errors:
> > 
> > drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c: In function ‘sun6i_csi_v4l2_fwnode_init’:
> > ./include/media/v4l2-async.h:207:10: error: expected expression before ‘)’ token
> >   207 |  ((type *)       \
> >       |          ^
> > drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:790:8: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_remote_subdev’
> >   790 |  ret = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
> >       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ./include/media/v4l2-async.h:207:10: error: expected expression before ‘)’ token
> >   207 |  ((type *)       \
> >       |          ^
> > drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:811:8: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_remote_subdev’
> >   811 |  ret = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
> >       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > make[5]: *** [scripts/Makefile.build:272: drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.o] Error 1
> > make[5]: *** Waiting for unfinished jobs....
> > make[4]: *** [scripts/Makefile.build:272: drivers/media/platform/rockchip/rkisp1/rkisp1-isp.o] Error 1
> > make[3]: *** [scripts/Makefile.build:515: drivers/media/platform/rockchip/rkisp1] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> > In file included from ./include/media/v4l2-subdev.h:14,
> >                  from ./include/media/v4l2-device.h:13,
> >                  from drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:19:
> > drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c: In function ‘sun8i_a83t_mipi_csi2_v4l2_setup’:
> > ./include/media/v4l2-async.h:207:10: error: expected expression before ‘)’ token
> >   207 |  ((type *)       \
> >       |          ^
> > drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:495:8: note: in expansion of macro
> > ‘v4l2_async_notifier_add_fwnode_remote_subdev’
> >   495 |  ret = v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
> >       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from ./include/media/v4l2-subdev.h:14,
> >                  from ./include/media/v4l2-device.h:13,
> >                  from drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:18:
> > drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c: In function ‘sun6i_mipi_csi2_v4l2_setup’:
> > ./include/media/v4l2-async.h:207:10: error: expected expression before ‘)’ token
> >   207 |  ((type *)       \
> >       |          ^
> > drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:437:8: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_remote_subdev’
> >   437 |  ret = v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
> >       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Can you rebase this series?
> 
> Thanks for letting me know, I'll look into this for the next iteration.
> 
> > I also need Acked-by's for patches 1-3 from one of the PHY maintainers, but as
> > you mentioned this might need to change as well.
> > 
> > Was there a reason why I haven't looked at this before? It's quite an old series,
> > usually I don't wait for so long. If it was because I was really slow, then I
> > apologize and please kick me sooner if you see a review like this take so long.
> 
> I'm not sure, but Sakari definitely went over previous interations and made
> various comments,so the series definitely hasn't gone unreviewed!

My acks seem to be missing. Let me go through it. As for Hans: please ping
if you don't get reviews.

-- 
Kind regards,

Sakari Ailus
