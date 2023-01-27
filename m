Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79D167DC4A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjA0C3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjA0C3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:29:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12C942BF5
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:29:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FB612B3;
        Fri, 27 Jan 2023 03:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674786575;
        bh=xlxQFhjoxPUhgq/bvD0sSYotiL2WvOOHRTJfvjLIV74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g/RScqK1obt1MvCxiML4bja8sO+4EmwXn3uAJadQwKh1wSHp8x59Rdf5jgZDItr0Z
         35Z318ZhPTVBhpyS/ZUurG0XoB14Hf1y3P5Ug2xTau2aYzpG9R1ui84Bo4hyn9N6yT
         PQzXYXOmUzHs27UIHPHcOjdlAYCwyUQk5pePBZYE=
Date:   Fri, 27 Jan 2023 04:29:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH v1 0/5] media: imx-mipi-csis: Move to subdev active state
Message-ID: <Y9M3C5+LcbAxq7Sv@pendragon.ideasonboard.com>
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
 <CAHCN7xL9ybGtr1CXOjqv2cc6u1p+1QuM5akp809iLm2S3w8gqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xL9ybGtr1CXOjqv2cc6u1p+1QuM5akp809iLm2S3w8gqA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Thu, Jan 26, 2023 at 07:54:10PM -0600, Adam Ford wrote:
> On Thu, Jan 26, 2023 at 3:34 PM Laurent Pinchart wrote:
> >
> > Hello,
> >
> > This small series moves the imx-mipi-csis driver to use the subdev
> > active state. Patches 1/5 to 3/5 are small preparatory cleanups, with
> > the main change in 4/5. Patch 5/5 is further cleanup that could have
> > been included in 4/5, but that should be easier to review as a separate
> > patch.
> >
> > The series has been tested on the i.MX8MP with the ISI, and IMX296 and
> > IMX327 camera sensors.
> 
> I didn't notice any overall change in the CSIS capture on the imx8mn.
> I can test the Mini if you want.

That would be great. Would you be able to test it in conjunction with
the similar imx7-media-csi series I've just sent ([1]) ? I expect a
possible lockdep warning if this series is applied with the
corresponding change in imx7-media-csi, but together they should be
fine.

[1] https://lore.kernel.org/linux-media/20230127022715.27234-1-laurent.pinchart@ideasonboard.com

> For the series:
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mn-beacon
> 
> > Laurent Pinchart (5):
> >   media: imx-mipi-csis: Rename error labels with 'err_' prefix
> >   media: imx-mipi-csis: Don't take lock in runtime PM handlers
> >   media: imx-mipi-csis: Pass format explicitly to internal functions
> >   media: imx-mipi-csis: Use V4L2 subdev active state
> >   media: imx-mipi-csis: Implement .init_cfg() using .set_fmt()
> >
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 249 +++++++++------------
> >  1 file changed, 103 insertions(+), 146 deletions(-)

-- 
Regards,

Laurent Pinchart
