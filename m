Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614BC660112
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 14:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbjAFNTT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 08:19:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234185AbjAFNTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 08:19:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D076C289
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 05:19:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C11A14AE;
        Fri,  6 Jan 2023 14:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673011138;
        bh=qLGMz/vWEd9aGRm0G+2GMvlN3cwcEZkDk0+PdwzpeLk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ihaKK5/ERJqgdtWHcH1ho7XvhYPgca09WtqUdlzYHJw6wz7rFQwwwU9444nmvogcX
         wIZk/5m4N27BmcYsXFwmb7dH3kbNpzzXaJa9E4SoFIHrhnx69eCMdnK6KpjpTMP0qO
         ArTPhHVzKK2tJhKEubVXZ2YJKE6i3H21bdEVX7ds=
Date:   Fri, 6 Jan 2023 15:18:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Pigg <adam@piggz.co.uk>
Cc:     linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v1 0/2] media: sun6i-csi: Fix format propagation in bridge
Message-ID: <Y7gfu67LJVW/k0BJ@pendragon.ideasonboard.com>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
 <2864735.e9J7NaK4W3@192-168-1-215>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2864735.e9J7NaK4W3@192-168-1-215>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Thu, Jan 05, 2023 at 09:48:46PM +0000, Adam Pigg wrote:
> On Wednesday, 4 January 2023 16:22:13 GMT Laurent Pinchart wrote:
> > Hello,
> > 
> > This small patch series fixes format propagation in the sun6i-csi-bridge
> > subdev from sink pad to source pad. In order to do so, it uses the V4L2
> > subdev active state provided by the V4L2 subdev core (patch 2/2), with a
> > preparatory patch (1/2) that drops direct access to the bridge fields
> > from the capture side.
> > 
> > I haven't tested the patches myself as I lack a hardware platform for
> > this, but Adam (on CC) has successfully tested them. Adam, if you want
> > to reply with a Tested-by tag, that would be appreciated.
> > 
> > Laurent Pinchart (2):
> >   media: sun6i-csi: capture: Use subdev operation to access bridge
> >     format
> >   media: sun6i-csi: subdev: Use subdev active state to store active
> >     format
> > 
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 211 ++++++++----------
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  23 +-
> >  3 files changed, 110 insertions(+), 133 deletions(-)
> > 
> > 
> > base-commit: 6599e683db1bf22fee74302c47e31b9a42a1c3d2
>
> Tested-by Adam Pigg <adam@piggz.co.uk>

Thank you.

For the next time, note that there should be a column after Tested-by,
as in

Tested-by: Adam Pigg <adam@piggz.co.uk>

Paul, if I could get your review on this, I'll include the patches in a
pull request for v6.3.

> I have used these 2 patches, along with the other 5 here [1] to successfully
> capture frames on the Pinephone rear camera (ov5640) using libcamera and its 
> cam utility.
> 
> I will submit the other patches here shortly.
> 
> [1] https://github.com/sailfish-on-dontbeevil/kernel-megi/commits/pinephone-libcamera

-- 
Regards,

Laurent Pinchart
