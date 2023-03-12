Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839FA6B660D
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 13:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjCLM4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 08:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCLM4j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 08:56:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A834E3755E;
        Sun, 12 Mar 2023 05:56:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-145-228-nat.elisa-mobile.fi [85.76.145.228])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8010814;
        Sun, 12 Mar 2023 13:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678625797;
        bh=yUhIv5mIXW7d12smi/RLzcPOkN/96N0e+Yq9dq5pACI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rum6P4XeakH5fXyACiWq+eZHLVUqazINR9ukOqbzXYVXscwJusfRDh1hxtj+rG760
         1Z+fL1czdT+wkL629AnPu28+RRXn8/P183gqqyDJY88RhFwHfFhSq9tRtDnzG/Gf6X
         FDcO7GiIFGkWXNsoAuDqd2UYqTvufHUvqOB7evaw=
Date:   Sun, 12 Mar 2023 14:56:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 00/15] media: i2c: imx290: Mono support, minor fixes,
 alternate INCK, and more controls
Message-ID: <20230312125632.GE2545@pendragon.ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
 <5017997.GXAFRqVoOG@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5017997.GXAFRqVoOG@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Thu, Mar 09, 2023 at 09:16:47AM +0100, Alexander Stein wrote:
> Am Mittwoch, 15. Februar 2023, 23:29:48 CET schrieb Laurent Pinchart:
> > Hello,
> > 
> > This patch series combines the "[PATCH v2 0/2] Add support for mono
> > version of Sony IMX290 sensor" ([1]) and "[PATCH v2 00/13] imx290: Minor
> > fixes, support for alternate INCK, and more ctrls" ([2]) previously
> > submitted by Dave into a single series.
> > 
> > As promised in my review of v2 of both series, I have tested the changes
> > with my IMX327 camera sensor, connected to the i.MX8MP ISP, with
> > libcamera. I haven't noticed any regression (but, full disclaimer, I
> > haven't tested all the newly features). I think we're thus good to go.
> 
> What is the status of this series? Will it be picked up?

I expect Sakari to pick it up for v6.4. I have pushed the whole series
with acks to the next/media/sensors/imx290 branch on
git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git.

> > This version handles all review comments from v2, resulting in the
> > following changes:
> > 
> > - Deprecate the sony,imx290 compatible
> > - Update the DT example to use the new sony,imx290lqr compatible
> > - Drop unneeded pointer cast
> > - Don't move imx290_of_match table
> > - Fix typos
> > 
> > The code has also been rebased on top of the latest media master branch,
> > with rebase conflicts and rebase-induced compilation breakages fixed.
> > 
> > The patches are available from
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
> > next/media/sensors/imx290
> > 
> > [1] https://lore.kernel.org/linux-media/20230203191644.947643-1-dave.stevenson@raspberrypi.com
> > [2] https://lore.kernel.org/linux-media/20230203191811.947697-1-dave.stevenson@raspberrypi.com
> > 
> > Dave Stevenson (15):
> >   media: dt-bindings: media: i2c: Add mono version to IMX290 bindings
> >   media: i2c: imx290: Add support for the mono sensor variant
> >   media: i2c: imx290: Match kernel coding style on whitespace
> >   media: i2c: imx290: Set the colorspace fields in the format
> >   media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
> >   media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
> >   media: i2c: imx290: Support 60fps in 2 lane operation
> >   media: i2c: imx290: Use CSI timings as per datasheet
> >   media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
> >   media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
> >   media: i2c: imx290: VMAX is mode dependent
> >   media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
> >   media: i2c: imx290: Add support for 74.25MHz external clock
> >   media: i2c: imx290: Add support for H & V Flips
> >   media: i2c: imx290: Add the error code to logs in start_streaming
> > 
> >  .../bindings/media/i2c/sony,imx290.yaml       |  24 +-
> >  drivers/media/i2c/imx290.c                    | 537 ++++++++++++++----
> >  2 files changed, 442 insertions(+), 119 deletions(-)
> > 
> > 
> > base-commit: 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41

-- 
Regards,

Laurent Pinchart
