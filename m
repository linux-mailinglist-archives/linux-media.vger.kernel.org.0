Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB6BE199676
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 14:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730662AbgCaM0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 08:26:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730343AbgCaM0b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 08:26:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75304208FE;
        Tue, 31 Mar 2020 12:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585657590;
        bh=blx66YChKg+gYzKEMC/qbWXbGWWkIDZF3MMoWKJ1eBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hkw5y+kQWTNyKdIkosNGkEfWABxhGzH5a/ppqFq829ZPBlaDy5RCYDV91zOg1oJY1
         TVn2+L02XBcsrh2/Qs5dUdKrRx+B/MXJoJa0U9f9GVx3I2kH43m5N+oowO448yeNSt
         6H4qKsrdAGtepUtpQquxFrTr9E0K/5WcXQmtdOwI=
Date:   Tue, 31 Mar 2020 14:22:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20200331122209.GA1627483@kroah.com>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
 <981eea64742859c63d8ab88c24b1b3380ee32dd2.1585651678.git.mchehab+huawei@kernel.org>
 <20200331120608.GB4767@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331120608.GB4767@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 31, 2020 at 03:06:08PM +0300, Laurent Pinchart wrote:
> Hi Mauro,
> 
> Thank you for the patch.
> 
> On Tue, Mar 31, 2020 at 01:11:53PM +0200, Mauro Carvalho Chehab wrote:
> > Most of media Kconfig/Makefile files already has SPDX,
> > but there are a few ones still missing. Add it to them.
> 
> I think it's a good idea to state the license of each source file, the
> patch looks fine to me. I've however been thinking about licenses for
> build system files recently, and I'll hijack this thread a bit to ask a
> question :-)
> 
> For a project like the Linux kernel, and especially for subsystems that
> are covered by a single license, the choice is easy, we can apply the
> same license to the build files. However, for a project that contains
> components covered by different licenses (such as, for instance, an LGPL
> library, a GPL application and a BSD plugin), how should the license
> covering the build system files be selected ? I searched a bit for
> guidance on this topic, and couldn't find much.

By "default" if there is no license on a file in the kernel tree, it
falls under the GPLv2 license and we should explicity state it, like
this patch does.

So this is fine, but if you want to license the build files some other
way, that's good too, but do so when you add them to the tree, not at
some later time when it could cause confusion :)

thanks,

greg k-h
