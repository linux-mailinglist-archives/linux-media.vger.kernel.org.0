Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A3D51CC34
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 00:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386349AbiEEWhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 18:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386356AbiEEWhZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 18:37:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD6553727;
        Thu,  5 May 2022 15:33:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 583D961F47;
        Thu,  5 May 2022 22:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD30C385A4;
        Thu,  5 May 2022 22:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651790023;
        bh=hGR8u1po44PqRNRm8Caqu9lGQdERMV7VT79h9eSQ/mk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fn8rvJpuvTE3iJlKWIq2UTeDe3TE37K+gw6Vm54Ic3M8t9BG7amKH+NzaviE2Nwd4
         mzA0Pz/gQeAaDFX1qRqnhOgYtd/u4k/l3YZNUYirQRJTSsN8iKJQq4ptCCOeh86HT1
         2e4IvWmPfKHXDd2KGWSCx1sdhI+fLFplrF+uWKRE=
Date:   Thu, 5 May 2022 22:14:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [RESEND v7 1/7] media: v4l: move helper functions for fractions
 from uvc to v4l2-common
Message-ID: <YnQwCHKVLYcuTF7c@kroah.com>
References: <20220421211427.3400834-1-m.grzeschik@pengutronix.de>
 <20220421211427.3400834-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421211427.3400834-2-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 21, 2022 at 11:14:21PM +0200, Michael Grzeschik wrote:
> The functions uvc_simplify_fraction and uvc_fraction_to_interval are
> generic helpers which are also useful for other v4l2 drivers. This patch
> moves them to v4l2-common.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1 -> v7: -
> 
>  drivers/media/usb/uvc/uvc_driver.c    | 80 --------------------------
>  drivers/media/usb/uvc/uvc_v4l2.c      | 14 ++---
>  drivers/media/usb/uvc/uvcvideo.h      |  3 -
>  drivers/media/v4l2-core/v4l2-common.c | 82 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           |  4 ++
>  5 files changed, 93 insertions(+), 90 deletions(-)

I need an ack from a media maintainer in order to be able to take this
and patch 2/7.

I have applied a few other that were independent of these first two, but
the "real" changes in this series (the last 2), need these commits in
order to build properly.

thanks,

greg k-h
