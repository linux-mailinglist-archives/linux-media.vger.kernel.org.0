Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F7E66C642
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 17:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbjAPQRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 11:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbjAPQQl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 11:16:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09032D177
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 08:09:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9891C802;
        Mon, 16 Jan 2023 17:09:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673885380;
        bh=A/rSlLX7/ELosAY6jcyBPlMwwe7fUDBSC//URSO2cS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RgQJiZvUIsldIRzNoIia+sYp/XlNUMfvb/GCM0GK/6HGZVDbYS0XQ4yD9PNY+shaX
         835mWZ+jBb36QtnXuhgZsQCGD8xTIH+Ii8O7rGNxlCZ48qlCoqD+LLhT/+SG3Zsp4Q
         SZ/m3P6M+pzU4Jhwdhg8ivuDR+Sx+7xPCtddH6rU=
Date:   Mon, 16 Jan 2023 18:09:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Message-ID: <Y8V2xQ872MLZ1cDD@pendragon.ideasonboard.com>
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <20230113112456.GA9093@pengutronix.de>
 <Y8Sji3VUaPvKprCF@pendragon.ideasonboard.com>
 <20230116134607.GA31026@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230116134607.GA31026@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Mon, Jan 16, 2023 at 02:46:07PM +0100, Philipp Zabel wrote:
> On Mon, Jan 16, 2023 at 03:08:27AM +0200, Laurent Pinchart wrote:
> [...]
> > To make sure I understand this correctly, you need both changes, with
> > the change in __v4l2_async_nf_has_async_subdev() meant to address asds
> > being added after the subdev has been registered, and the change in
> > v4l2_async_register_subdev() meant to address asds that have been added
> > before ?
> 
> Yes, your understanding is correct.
> 
> > The imx6 ipu drivers implement a "clever hack" to handle the
> > multi-endpoint issue that was never officially supported by v4l2-async.
> 
> That belongs in parentheses all right. I think it might even have been
> accidental.

There are explicit checks in the video-mux driver and in the ipu driver
for -EEXIST, so it was likely done on purpose :-)

> > Obviously, as it has worked so far, leaving it broken isn't a very nice
> > option. The fix feels a bit like a hack though, and a better solution
> > would be to allow subdevs to be matched multiple times, by multiple
> > consumers. That's a more intrusive change though, so I could be OK with
> > this as a short term fix, assuming it doesn't break anything else.
> 
> Right, the intention was that this patch could be applied on stable
> kernels, as I only had noticed the issue after the release.
> 
> > I would however want to ensure this doesn't get abused by new drivers.
> > Could we add a dev_warn() somewhere to indicate that multi-endpoint
> > matching is not supported and shouldn't be used until fixed ? Sakari,
> > what do you think ?
> [...]
> 
> pr_warn_once() in both places, perhaps?

I'm fine with that.

-- 
Regards,

Laurent Pinchart
