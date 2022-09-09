Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C795B3998
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 15:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbiIINsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 09:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiIINrz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 09:47:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F7513EE6D
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 06:47:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAAC087F;
        Fri,  9 Sep 2022 15:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662731258;
        bh=thWEvfSUnvzxCogyPGpbsVUh15GTftSRbrZ7J7bDcDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C1OpK9FUvbXyQ+CQpaeBWUMWZ5dzvcOUuv8wUU9quQiJub8akhqg9AcRMrkbG9X11
         qYZHz7M4Ju0dZ1AJesfNu0xMDjJHfRq02FWIe57LKA8JX9waxK0q51Isi2Oa3SZkU9
         OgPkuZCKRveB5Sa2bWkgTXKA8DT431JLP9mT6epo=
Date:   Fri, 9 Sep 2022 16:47:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        Gregor Jasny <gjasny@googlemail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [Media Summit] Finalizing the v4l-utils conversion to meson
Message-ID: <YxtD6AzjESJe00vN@pendragon.ideasonboard.com>
References: <YwwXrJ2ajZvZhUk6@pendragon.ideasonboard.com>
 <3ed0fa60-ed41-3969-ee42-e7f6fa413505@xs4all.nl>
 <Yxms+sBJaxFWxqgd@pendragon.ideasonboard.com>
 <YxpYTkEcm/YfTE1o@pendragon.ideasonboard.com>
 <3ccd8058-abcf-669c-2ac6-b622c7129205@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ccd8058-abcf-669c-2ac6-b622c7129205@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 09, 2022 at 11:03:56AM +0200, Hans Verkuil wrote:
> On 08/09/2022 23:02, Laurent Pinchart wrote:
> > Also, if we already have a consensus among the audience of the media
> > summit, we can remove this discussion point from the agenda and use the
> > time for other topics.
> > 
> > Should I prepare a new version of the patches, removing
> > autoconf/automake support on top ?
> 
> Yes, please. I'd like to see a version with the FIXUPs squashed in, and
> that makes it easy to revert if needed.

https://lore.kernel.org/linux-media/20220909134412.21934-1-laurent.pinchart@ideasonboard.com

> BTW, I think patch 1 can just be applied regardless, although v4l-utils.spec.in
> needs updating as well (README -> README.md).

Done in v7.

-- 
Regards,

Laurent Pinchart
