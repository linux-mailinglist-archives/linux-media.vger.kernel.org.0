Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE9066BD5B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 12:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjAPL6G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 06:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjAPL5S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 06:57:18 -0500
Received: from smtp-out-01.comm2000.it (smtp-out-01.comm2000.it [212.97.32.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A591CF5B
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 03:57:15 -0800 (PST)
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id 9FE1884292E;
        Mon, 16 Jan 2023 12:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1673870232;
        bh=fz4BMvtzPy2jTvyVt7PGxvoUdQa023V6r50npYhew/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=JnU0v4N+/FUN8GAvftW4IZ8ZSjTYmKqIhBHJ5fKAUFilXD1rcH4NNEOiKdmssDdLe
         JA2aXE4H1e3oOPd0shuUJrfzJeiq9eAk2C2dPG35tmzvMimh5GAibv4tClfNekR0Mf
         vVzQ34Hxprh/0NFAQDhlXHLc0MluM+zSM82Y52vz/H0l10MJwMrsxeusYXTDA3Wr6A
         XSz4yHHA3SzGi93lqXV+PA2IW8eWbL22I8STHiGaAHPdSgCCtt2NJlB+eIB8zvoFUF
         CBRrBDLQkq2kH/fX6K1DlupmfuELo97uKLfoDXQ9+4Z/CEriesdPNi9wW2YE7UVVcn
         M77Hd3SwCVjkA==
Date:   Mon, 16 Jan 2023 12:57:09 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Message-ID: <Y8U7lSKarZZnPa0L@francesco-nb.int.toradex.com>
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <20230113112456.GA9093@pengutronix.de>
 <Y8Sji3VUaPvKprCF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8Sji3VUaPvKprCF@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+ Aishwarya

On Mon, Jan 16, 2023 at 03:08:27AM +0200, Laurent Pinchart wrote:
> Hi Philipp,
> 
> (CC'ing Francesco)
> 
> My apologies for not having noticed the patch.
> 
> On Fri, Jan 13, 2023 at 12:24:56PM +0100, Philipp Zabel wrote:
> > Hi,
> > 
> > On Wed, Aug 10, 2022 at 12:48:48PM +0200, Philipp Zabel wrote:
> > > Asynchronous subdevice probing on imx-media with imx6-mipi-csi2 is
> > > broken since commit 1f391df44607 ("media: v4l2-async: Use endpoints in
> > > __v4l2_async_nf_add_fwnode_remote()").
> > > 
> > > This is a side effect of imx6-mipi-csi2 having a single subdevice with
> > > four separate source ports connected to different subdevices. Before,
> > > the imx-media-csi and video-mux devices registered async sub-devices
> > > via device fwnode that matched the imx6-mipi-csi2 device on their
> > > respective notifiers. This caused the first asd to be put on the
> > > notifier waiting list, and the other three to return -EEXIST and be
> > > ignored.
> > > 
> > > With async subdev registration via endpoint fwnode, all four asds are
> > > distinct and three of them keep dangling on their notifiers after the
> > > first one is bound.
> > > 
> > > This patch modifies __v4l2_async_nf_has_async_subdev() to consider
> > > asds matching different fwnode endpoints of the same sub-device equal
> > > if the latter is already bound and matches via device fwnode. Further,
> > > v4l2_async_register_subdev() is modified to remove dangling duplicate
> > > asds that were registered before the sub-device was available to check
> > > its fwnode.
> 
> To make sure I understand this correctly, you need both changes, with
> the change in __v4l2_async_nf_has_async_subdev() meant to address asds
> being added after the subdev has been registered, and the change in
> v4l2_async_register_subdev() meant to address asds that have been added
> before ?
> 
> The imx6 ipu drivers implement a "clever hack" to handle the
> multi-endpoint issue that was never officially supported by v4l2-async.
> Obviously, as it has worked so far, leaving it broken isn't a very nice
> option. The fix feels a bit like a hack though, and a better solution
> would be to allow subdevs to be matched multiple times, by multiple
> consumers. That's a more intrusive change though, so I could be OK with
> this as a short term fix, assuming it doesn't break anything else.
> 
> I would however want to ensure this doesn't get abused by new drivers.
> Could we add a dev_warn() somewhere to indicate that multi-endpoint
> matching is not supported and shouldn't be used until fixed ? Sakari,
> what do you think ?
> 
> > > Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > 
> > Any comments on this? The issue persists on v6.2-rc3.
> 
> Francesco, does this fix your issue ?

Aishwarya, can you try this patch [0] and verify if it solves the issue?
Just provide a Tested-by tag eventually (and hopefully :-)

Francesco

[0] https://lore.kernel.org/all/20220810104848.846783-1-p.zabel@pengutronix.de/

