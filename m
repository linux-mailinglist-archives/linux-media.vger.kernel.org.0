Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8195507B4
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 02:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbiFSAeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 20:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiFSAeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 20:34:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8372DF21
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 17:34:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C75D993;
        Sun, 19 Jun 2022 02:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655598848;
        bh=CJwMmUGuykwFuJQyzvqCXHaGSd5nFKNyUK+sRtc9VGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sRZy8PpTEX+A3G3UbOHcNnLYEmY1FD54xuSBX+oXu8FgfxBx13mNxsgty6MEqLXpd
         3Uq5aJ81qlj2YPQnxozIEhLK6uva/mlS66ceLnzVy48VdFKjCzFhhqXW7ZQqKUffZx
         ZONUjfSrFOnUEmuIcDlipqbARxPaENREzCPUQnsw=
Date:   Sun, 19 Jun 2022 03:33:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: stm32: dcmi: Register V4L2 subdev nodes
Message-ID: <Yq5u8sPxZoSVKZ7w@pendragon.ideasonboard.com>
References: <20220618222335.478205-1-marex@denx.de>
 <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
 <4dc7b39c-35cd-663a-98f8-6034693df3c8@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4dc7b39c-35cd-663a-98f8-6034693df3c8@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 19, 2022 at 02:28:55AM +0200, Marek Vasut wrote:
> On 6/19/22 01:20, Laurent Pinchart wrote:
> > Hi Marek,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Jun 19, 2022 at 12:23:35AM +0200, Marek Vasut wrote:
> >> Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
> >> the /dev/v4l-subdev* sub-device nodes are not registered and thus
> >> not created. Add the missing call.
> > 
> > This driver configures the subdevs internally. Exposing the subdev nodes
> > to userspace would conflict with driver operation.
> > 
> > If you need the subdev nodes only to query subdev information, you can
> > use v4l2_device_register_ro_subdev_nodes(). Ideally I'd prefer this
> > driver to expose subdev nodes to userspace and stop propagating formats
> > internally, but that may break applications :-(
> 
> I need those subdevs to configure e.g. test pattern on the sensor side.

Doesn't the dcmi driver expose the sensor controls on the video node ?

-- 
Regards,

Laurent Pinchart
