Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6DD193136
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 20:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbgCYTgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 15:36:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38494 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbgCYTgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 15:36:47 -0400
Received: from [IPv6:2804:431:e7cc:972:9d5e:9691:eec8:dd70] (unknown [IPv6:2804:431:e7cc:972:9d5e:9691:eec8:dd70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CE96129718F;
        Wed, 25 Mar 2020 19:36:36 +0000 (GMT)
Subject: Re: [PATCH 0/4] media Kconfig reorg - part 2
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Chen-Yu Tsai <wens@csie.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        Yong Deng <yong.deng@magewell.com>,
        Kukjin Kim <kgene@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Pavel Machek <pavel@ucw.cz>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Zhi <yong.zhi@intel.com>,
        linux-samsung-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heungjun Kim <riverful.kim@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <cover.1585151701.git.mchehab+huawei@kernel.org>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <6fadc6ea-8512-03ba-da30-43c64d7562f6@collabora.com>
Date:   Wed, 25 Mar 2020 16:36:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <cover.1585151701.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 3/25/20 1:03 PM, Mauro Carvalho Chehab wrote:
> That's the second part of media Kconfig changes. The entire series is
> at:
> 
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-kconfig

I made a quick experiment (using this branch) with someone who works with the kernel for his master degree, but doesn't have much experience in kernel development in general.
I asked him to enable Vimc (from default configs, where multimedia starts disabled).
He knows that Vimc is a virtual camera driver, and this is how he behaved:

=== Start of experiment:

* He pressed '/' and searched for vimc to see the location path.
* Then he enabled "Multimedia support" and went straight to "Media drivers" (which just shows USB and PCI).
* He went back to "Multimedia support", entered "Media device types" and enabled "Test drivers".
* He went back to "Media drivers" again and didn't find Vimc (nothing changed in this menu).
* He seemed a bit lost, going back and forth in the menus a couple of times.
* Then he pressed '/' again to search for vimc and see the location path, and he realized that there
should be an option called "V4L test drivers" under "Media drivers" that is not showing up.
* He went back to "Media device types" again and start re-reading the options.
* He selected "Cameras and video grabbers" ant went back to "Media drivers".
* He sees "V4L test drivers", selects it, and enter this menu.
* He selects "Virtual Media Controller Driver".

I asked his impressions, and he mentioned that he thought that enabling just "Test drivers" would be enough, without need
to combine "Test drivers" with "Cameras and video grabbers".
He also asked me why virtual drivers should be hidden, and he mentioned that the word "Virtual" in front would be enough.

Then I showed him he could have disabled the option "Filter devices by their types" to see everything at one (which he didn't
realized by himself until that moment, nor tried it out to see what would happen).

He mentioned that hiding is nice, because it shows less options, but not very nice to search for something.
He also mentioned that if he had understood the filter mechanism from the start, he would have disabled "Filter devices by their types" sooner.

=== End of experiment

This was just one experiment from one person, I'll see if I can get some other people from lkcamp.dev group to also check
and send us their impressions. I think it would be nice to get more data about user experience, from people that are not used to
kernel development (kernel dev newbies for instance).

Just another remark from me:

From the default config, "Media drivers" shows USB and PCI, and selecting those doesn't do anything, and people can even think
that, if they want to enable an USB device, just enabling the USB option there is enough (which is not), since no drivers
shows up.

I hope this helps
Helen


> 
> It addresses some issues I noticed when reviewing the series, and do
> some changes on how things will be displayed.
> 
> It also simplify dependencencies on media-controller-dependent drivers,
> by auto-selecting the needed deps.
> 
> It should be noticed that the media controller may also optionally
> selected for several other drivers, so there is still a prompt to allow
> manually enabling it, in the case it was not auto-selected.
> 
> PS.: While not needed anymore, because all dependent drivers auto
> select, at least for now, I opted to keep the prompt for:
> 
> - VIDEO_V4L2_SUBDEV_API
> 
>   The rationale is that there are a few drivers that can optionally depend
>   on it (like tvp5150). So, better to keep the dependency, in order to be
>   able to test those drivers with and without the option.
> 
> - MEDIA_CONTROLLER_REQUEST_API
> 
>   The rationale is that there are some warnings at the Request API, and
>   it would be good to keep it, at least while drivers are on staging.
> 
> Mauro Carvalho Chehab (4):
>   media: dvb-core: Kconfig: default to use dynamic minors
>   media: Kconfig files: use select for V4L2 subdevs and MC
>   media: i2c/Kconfig: reorganize items there
>   media: Kconfig: don't use visible for device type select
> 
>  drivers/media/Kconfig                         |  25 +-
>  drivers/media/dvb-core/Kconfig                |   1 +
>  drivers/media/i2c/Kconfig                     | 406 +++++++++++-------
>  drivers/media/i2c/et8ek8/Kconfig              |   4 +-
>  drivers/media/i2c/m5mols/Kconfig              |   5 +-
>  drivers/media/i2c/smiapp/Kconfig              |   5 +-
>  drivers/media/pci/cobalt/Kconfig              |   4 +-
>  drivers/media/pci/intel/ipu3/Kconfig          |   4 +-
>  drivers/media/pci/sta2x11/Kconfig             |   6 +-
>  drivers/media/platform/Kconfig                |  28 +-
>  drivers/media/platform/am437x/Kconfig         |   4 +-
>  drivers/media/platform/atmel/Kconfig          |   4 +-
>  drivers/media/platform/cadence/Kconfig        |   8 +-
>  drivers/media/platform/exynos4-is/Kconfig     |   5 +-
>  drivers/media/platform/rcar-vin/Kconfig       |   8 +-
>  .../media/platform/sunxi/sun4i-csi/Kconfig    |   4 +-
>  .../media/platform/sunxi/sun6i-csi/Kconfig    |   4 +-
>  drivers/media/platform/xilinx/Kconfig         |   4 +-
>  drivers/media/spi/Kconfig                     |   4 +-
>  drivers/media/test_drivers/vimc/Kconfig       |   4 +-
>  drivers/staging/media/hantro/Kconfig          |   5 +-
>  drivers/staging/media/imx/Kconfig             |   5 +-
>  drivers/staging/media/ipu3/Kconfig            |   3 +-
>  drivers/staging/media/omap4iss/Kconfig        |   4 +-
>  drivers/staging/media/rkisp1/Kconfig          |   4 +-
>  drivers/staging/media/sunxi/cedrus/Kconfig    |   5 +-
>  26 files changed, 349 insertions(+), 214 deletions(-)
> 
