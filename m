Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7ED6AC016
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 14:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjCFNB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 08:01:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbjCFNB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 08:01:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832942CC60
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 05:00:41 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1pZASF-0000bF-TZ; Mon, 06 Mar 2023 14:00:39 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1pZASB-0007uh-4T; Mon, 06 Mar 2023 14:00:35 +0100
Date:   Mon, 6 Mar 2023 14:00:35 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 1/3] media: Zero-initialize all structures passed to
 subdev pad operations
Message-ID: <20230306130035.GA28898@pengutronix.de>
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
 <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
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

On Wed, Feb 15, 2023 at 06:50:19PM +0200, Laurent Pinchart wrote:
> Several drivers call subdev pad operations, passing structures that are
> not fully zeroed. While the drivers initialize the fields they care
> about explicitly, this results in reserved fields having uninitialized
> values. Future kernel API changes that make use of those fields thus
> risk breaking proper driver operation in ways that could be hard to
> detect.
> 
> To avoid this, make the code more robust by zero-initializing all the
> structures passed to subdev pad operation. Maintain a consistent coding
> style by preferring designated initializers (which zero-initialize all
> the fields that are not specified) over memset() where possible, and
> make variable declarations local to inner scopes where applicable. One
> notable exception to this rule is in the ipu3 driver, where a memset()
> is needed as the structure is not a local variable but a function
> parameter provided by the caller.
> 
> Not all fields of those structures can be initialized when declaring the
> variables, as the values for those fields are computed later in the
> code. Initialize the 'which' field in all cases, and other fields when
> the variable declaration is so close to the v4l2_subdev_call() call that
> it keeps all the context easily visible when reading the code, to avoid
> hindering readability.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
[...]
>  drivers/staging/media/imx/imx-media-capture.c | 28 ++++++++++--------

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
