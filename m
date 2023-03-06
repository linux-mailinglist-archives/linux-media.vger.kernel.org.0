Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1BD6AB444
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 02:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCFBT5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Mar 2023 20:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjCFBTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Mar 2023 20:19:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4791BBDFE;
        Sun,  5 Mar 2023 17:19:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B4FDA60AE4;
        Mon,  6 Mar 2023 01:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545C1C433D2;
        Mon,  6 Mar 2023 01:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678065587;
        bh=MREzbXPpvfZe6cFJBJSi/CffhAuZMALG7DM5ZmXxOy8=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=jq/YnJQ+8T3AoCrXqHr07OaLhCYSYtgTjuubgDyaNsDalzp+U5+81FkF7W7OySle5
         //RrdaGklJtfLBZemPxSuhZ0mBfwo+H2Dseeusth7WL+07MtC9+8ZCSW+25ChC1H5I
         7mM291WyrQFSbLA3ZQ8FS0VrfQJz0QZyKQUc9z4e2zkRpdKhDF5eTB4y857/5Id8JX
         YGV4onxZKw89V4h4UpZ1UeEoRnn67nHmqDXYYnDn10j8YHUBv9yaXo7FTaufj8k0BH
         46H0pDSXEvbm8VZbGnNl67JoXkvuqTn9UhSftSGWcFbg7zbH3VLdEYCtdzvqHBrZ71
         cK3fwS4VFgN6g==
Date:   Mon, 6 Mar 2023 09:19:34 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/16] ARM: dts: imx7d: add node for PXP
Message-ID: <20230306011934.GA143566@dragon>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-8-e2281da1db55@pengutronix.de>
 <Y8V6yU8bZoVt32wN@pendragon.ideasonboard.com>
 <20230120090609.GB13264@pengutronix.de>
 <Y8pc2IZl09iNaUiR@pendragon.ideasonboard.com>
 <20230209140225.GC30549@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209140225.GC30549@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 09, 2023 at 03:02:25PM +0100, Michael Tretter wrote:
> Hi Shawn,
> 
> On Fri, 20 Jan 2023 11:20:24 +0200, Laurent Pinchart wrote:
> > On Fri, Jan 20, 2023 at 10:06:09AM +0100, Michael Tretter wrote:
> > > On Mon, 16 Jan 2023 18:26:49 +0200, Laurent Pinchart wrote:
> > > > On Fri, Jan 13, 2023 at 10:54:14AM +0100, Michael Tretter wrote:
> > > > > The i.MX7d contains a Pixel Pipeline in version 3.0. Add the device tree
> > > > > node to make it available.
> > > > > 
> > > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > 
> > > > Should this go through Shawn's tree ? If so, how would you like to
> > > > handle the dependency on the DT bindings in patch 01/16 ?
> > > 
> > > There is no actual dependency. The binding was already specified as a txt,
> > > just not as a yaml, and the added node matches both.
> > 
> > Good point. I'll send a pull request for the series then, without this
> > patch, which can be picked by Shawn separately.
> 
> Can you pick this patch or should I resend it as a separate series?

Applied, thanks!
