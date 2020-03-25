Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 955C01933A7
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 23:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgCYWNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 18:13:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48926 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgCYWNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 18:13:50 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A2A580C;
        Wed, 25 Mar 2020 23:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585174427;
        bh=IB7O8aa4VNcfC1dgaFkkyQUEh1Uo0S7fgHm/tTp/Rzw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k+eIxOLzCABzUDjpVUK/E8KG/RSgc8yWrTju8ADYg0xy3GIaDS1rmGXYg3RbaqKcx
         Xp8hwwKcZ13qg3Kw5AxibT6J2ZaYBE7wEzYEP3V4ASitmjZfmh19c4GM4KTg3HR80o
         dL9LGj32lC8eoFuSZzCkWJLS3JsvElv8m/5gWYas=
Date:   Thu, 26 Mar 2020 00:13:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
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
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 0/4] media Kconfig reorg - part 2
Message-ID: <20200325221343.GW19171@pendragon.ideasonboard.com>
References: <cover.1585151701.git.mchehab+huawei@kernel.org>
 <6fadc6ea-8512-03ba-da30-43c64d7562f6@collabora.com>
 <20200325223820.1c74aed3@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200325223820.1c74aed3@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, Mar 25, 2020 at 10:38:20PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 25 Mar 2020 16:36:31 -0300 Helen Koike escreveu:
> > On 3/25/20 1:03 PM, Mauro Carvalho Chehab wrote:
> > > That's the second part of media Kconfig changes. The entire series is
> > > at:
> > > 
> > > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-kconfig  
> > 
> > I made a quick experiment (using this branch) with someone who works with the kernel for his master degree, but doesn't have much experience in kernel development in general.
> > I asked him to enable Vimc (from default configs, where multimedia starts disabled).
> > He knows that Vimc is a virtual camera driver, and this is how he behaved:
> > 
> > === Start of experiment:
> > 
> > * He pressed '/' and searched for vimc to see the location path.
> > * Then he enabled "Multimedia support" and went straight to "Media drivers" (which just shows USB and PCI).
> > * He went back to "Multimedia support", entered "Media device types" and enabled "Test drivers".
> > * He went back to "Media drivers" again and didn't find Vimc (nothing changed in this menu).
> > * He seemed a bit lost, going back and forth in the menus a couple of times.
> > * Then he pressed '/' again to search for vimc and see the location path, and he realized that there
> > should be an option called "V4L test drivers" under "Media drivers" that is not showing up.
> > * He went back to "Media device types" again and start re-reading the options.
> > * He selected "Cameras and video grabbers" ant went back to "Media drivers".
> > * He sees "V4L test drivers", selects it, and enter this menu.
> > * He selects "Virtual Media Controller Driver".
> > 
> > I asked his impressions, and he mentioned that he thought that enabling just "Test drivers" would be enough, without need
> > to combine "Test drivers" with "Cameras and video grabbers".
> > He also asked me why virtual drivers should be hidden, and he mentioned that the word "Virtual" in front would be enough.
> > 
> > Then I showed him he could have disabled the option "Filter devices by their types" to see everything at one (which he didn't
> > realized by himself until that moment, nor tried it out to see what would happen).
> > 
> > He mentioned that hiding is nice, because it shows less options, but not very nice to search for something.
> > He also mentioned that if he had understood the filter mechanism from the start, he would have disabled "Filter devices by their types" sooner.
> 
> That's easy to solve: all it needs is to add something similar
> to this at drivers/media/Kconfig:
> 
> 	+	comment "Drivers are filtered by MEDIA_SUPPORT_FILTER"
> 	+		visible if MEDIA_SUPPORT_FILTER
> 	+
> 	+	comment "All available drivers are shown below"
> 	+		visible if !MEDIA_SUPPORT_FILTER
> 	+
> 	menu "Media drivers"
> 
> 	source "drivers/media/usb/Kconfig"
> 
> > === End of experiment
> > 
> > This was just one experiment from one person, I'll see if I can get some other people from lkcamp.dev group to also check
> > and send us their impressions. I think it would be nice to get more data about user experience, from people that are not used to
> > kernel development (kernel dev newbies for instance).
> > 
> > Just another remark from me:
> > 
> > From the default config, "Media drivers" shows USB and PCI, 
> 
> Well, assuming that there are 2 billion computers, 1% with Linux
> installed, and 10% of them have a media device (camera or TV),
> we have about 2 millions of people running Linux. That excludes
> Android and Embedded devices, where people usually don't touch.
> 
> During an entire year, there are about 4000 of Kernel developers 
> that has at least one patch accepted upstream (this number
> includes developers for Android and other SoCs). Also, the 
> number of Kernel developers submitting patches upstream for the
> media subsystem is around 20-40 people along an year.

$ git log --since 2019-01-01 --until 2020-01-01 --no-merges -- drivers/media/ | grep '^Author: ' | sort | uniq -c | wc -l   
215

There's some duplication of e-mail addresses, but it's still roughly an
order or magnitude bigger (and it's not counting staging, headers or
documentation).

> So, about 99,9998% of the users using the media subsystems aren't
> Kernel hackers. I bet that almost all of those will either need
> to enable USB or a PCI driver.

And the extremely vast majority of these will never enable a kernel
option because they will never compile a kernel. They don't even know
what a kernel is :-)

> Granted, 99,9998% seems too optimistic, but, assuming that this
> would reduce to something like 80% (e. g. only 200 users
> would ever try to build a media driver, with is a *very conservative*
> number) this is still a lot more than the number of media Kernel
> developers.
> 
> Also, a Kernel hacker will sooner or later find a way to enable it.
> A normal user may find it a lot more trickier and will very likely
> require more support, if the menus are too technical and the
> default options are wrong.

I'm not sure to follow you. Are you implying that this patch series,
which Helen has tested against a real user, not an experienced kernel
hacker, may make the configuration options more difficult for kernel
hackers, but improves the situation for users ?

> 
> -
> 
> Even with that, based on your small experiment (of someone from the
> area), I suspect that, if you had asked him to enable, for example,
> em28xx or dvbsky (with are some of the most popular drivers
> those days), he would be able to enable it a lot faster.

This is the *only* real piece of evidence we have, let's not assume we
know better.

> > and selecting those doesn't do anything, and people can even think
> > that, if they want to enable an USB device, just enabling the USB option there is enough (which is not), since no drivers
> > shows up.
> 
> It is hard to comment on individual experiments. In the past, our
> Kconfig system were like that: written for technical people with
> background on computer engineering and some experience building the
> Kernel.
> 
> E.g. people that knows that "/" activates a search mechanism at
> the Kernel building system.
> 
> We usually had to spend *a lot of time* both on IRC and on e-mail
> explaining people that just want to have their card supported,
> how to do that. After the reorg (with added those more user-faced
> interfaces), the number of people with problems reduced a lot.

Don't you think that could come mainly from better support for media
devices in distributions ?

> Btw, if one tries to compile from media-build (with lots of users
> do), this is even more relevant.

Can you quantify "lots of users" ?

-- 
Regards,

Laurent Pinchart
