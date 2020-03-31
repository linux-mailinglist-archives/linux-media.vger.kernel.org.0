Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 455061996AA
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 14:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730780AbgCaMjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 08:39:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60884 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730436AbgCaMjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 08:39:23 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67802999;
        Tue, 31 Mar 2020 14:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585658360;
        bh=tbwJXIHNoJr98k60FTTbX816TC3Gd5IRxDKktQ2VVdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f1VlS2f3ga3DvS+b4oT5dZqA2XEt0P7BtWTsz1Rh8OoaxqE1EOB4CoxtnoDmy4iB6
         X5iUhOXekkGa+8ZaSHi1+2aHuVd6i4awTQurv1cdH/lNYkacF7pfIxB7GLfJZznSya
         j4N0EW5NB1mkaPQTASiH/ozxp3qP4ZsgZza5luwE=
Date:   Tue, 31 Mar 2020 15:39:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        devel@driverdev.osuosl.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Helen Koike <helen.koike@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 17/33] media: add SPDX headers on Kconfig and Makefile
 files
Message-ID: <20200331123914.GC4767@pendragon.ideasonboard.com>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
 <981eea64742859c63d8ab88c24b1b3380ee32dd2.1585651678.git.mchehab+huawei@kernel.org>
 <20200331120608.GB4767@pendragon.ideasonboard.com>
 <20200331122209.GA1627483@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200331122209.GA1627483@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On Tue, Mar 31, 2020 at 02:22:09PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Mar 31, 2020 at 03:06:08PM +0300, Laurent Pinchart wrote:
> > On Tue, Mar 31, 2020 at 01:11:53PM +0200, Mauro Carvalho Chehab wrote:
> > > Most of media Kconfig/Makefile files already has SPDX,
> > > but there are a few ones still missing. Add it to them.
> > 
> > I think it's a good idea to state the license of each source file, the
> > patch looks fine to me. I've however been thinking about licenses for
> > build system files recently, and I'll hijack this thread a bit to ask a
> > question :-)
> > 
> > For a project like the Linux kernel, and especially for subsystems that
> > are covered by a single license, the choice is easy, we can apply the
> > same license to the build files. However, for a project that contains
> > components covered by different licenses (such as, for instance, an LGPL
> > library, a GPL application and a BSD plugin), how should the license
> > covering the build system files be selected ? I searched a bit for
> > guidance on this topic, and couldn't find much.
> 
> By "default" if there is no license on a file in the kernel tree, it
> falls under the GPLv2 license and we should explicity state it, like
> this patch does.
> 
> So this is fine, but if you want to license the build files some other
> way, that's good too, but do so when you add them to the tree, not at
> some later time when it could cause confusion :)

Thanks for your answer. I was hijacking the thread a little bit, the
question wasn't related to the kernel, but in this case to libcamera.
We've been wondering how to pick licenses for build files there, and I
thought fellow kernel developers may have valuable input on this topic.

-- 
Regards,

Laurent Pinchart
