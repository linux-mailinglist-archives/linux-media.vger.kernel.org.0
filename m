Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D02426CA4
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 16:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhJHOTp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 8 Oct 2021 10:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236679AbhJHOTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 10:19:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5A4C061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 07:17:48 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mYqh0-0002BR-9A; Fri, 08 Oct 2021 16:17:46 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mYqgz-0004y6-M0; Fri, 08 Oct 2021 16:17:45 +0200
Message-ID: <0f777e71e47bc64b193f7840ff86ddf9799f3b11.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] media: imx-pxp: Add rotation support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@denx.de>
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Date:   Fri, 08 Oct 2021 16:17:45 +0200
In-Reply-To: <20211008131015.3303915-2-festevam@denx.de>
References: <20211008131015.3303915-1-festevam@denx.de>
         <20211008131015.3303915-2-festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-10-08 at 10:10 -0300, Fabio Estevam wrote:
> PXP allows clockwise rotation of 0°, 90°, 180° and 270°.
> 
> Add support for it.
> 
> Tested on a imx6ull-evk.
> 
> For example, to rotate 90° the following Gstreamer pipeline can
> be used:
> 
> gst-launch-1.0 videotestsrc ! video/x-raw,width=640,height=480 ! \
> v4l2convert extra-controls=cid,rotate=90  ! \
> video/x-raw,width=120,height=160 ! fbdevsink
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
