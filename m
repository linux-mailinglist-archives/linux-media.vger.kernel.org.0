Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7627766C00B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 14:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbjAPNqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 08:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjAPNqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 08:46:17 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC271F915
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:46:16 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1pHPoO-0008JN-W5; Mon, 16 Jan 2023 14:46:09 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1pHPoN-00013F-Dm; Mon, 16 Jan 2023 14:46:07 +0100
Date:   Mon, 16 Jan 2023 14:46:07 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Message-ID: <20230116134607.GA31026@pengutronix.de>
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <20230113112456.GA9093@pengutronix.de>
 <Y8Sji3VUaPvKprCF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8Sji3VUaPvKprCF@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Jan 16, 2023 at 03:08:27AM +0200, Laurent Pinchart wrote:
[...]
> To make sure I understand this correctly, you need both changes, with
> the change in __v4l2_async_nf_has_async_subdev() meant to address asds
> being added after the subdev has been registered, and the change in
> v4l2_async_register_subdev() meant to address asds that have been added
> before ?

Yes, your understanding is correct.

> The imx6 ipu drivers implement a "clever hack" to handle the
> multi-endpoint issue that was never officially supported by v4l2-async.

That belongs in parentheses all right. I think it might even have been
accidental.

> Obviously, as it has worked so far, leaving it broken isn't a very nice
> option. The fix feels a bit like a hack though, and a better solution
> would be to allow subdevs to be matched multiple times, by multiple
> consumers. That's a more intrusive change though, so I could be OK with
> this as a short term fix, assuming it doesn't break anything else.

Right, the intention was that this patch could be applied on stable
kernels, as I only had noticed the issue after the release.

> I would however want to ensure this doesn't get abused by new drivers.
> Could we add a dev_warn() somewhere to indicate that multi-endpoint
> matching is not supported and shouldn't be used until fixed ? Sakari,
> what do you think ?
[...]

pr_warn_once() in both places, perhaps?

regards
Philipp
