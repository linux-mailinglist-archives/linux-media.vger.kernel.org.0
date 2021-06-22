Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A853B0548
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 14:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhFVM5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 08:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbhFVM5N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 08:57:13 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211A3C061574;
        Tue, 22 Jun 2021 05:54:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5126D1F42F0B
Message-ID: <3ab5878bc03eb91a785c0fa57836e8d226df524d.camel@collabora.com>
Subject: Re: [PATCH v3 0/8] Additional features for Hantro HEVC
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 22 Jun 2021 09:54:35 -0300
In-Reply-To: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, 2021-06-18 at 15:15 +0200, Benjamin Gaignard wrote:
> version 3:
>  - Change trace file name to hantro_trace.h
> 
> version 2:
>  - Fix structure name in ext-ctrls-codec.rst
>  - Define the value for compression storage size
>  - Add comments about registers usage
>  - Add documentation about P010 padding
> 
> Basic HEVC support has been added to Hantro driver in this pull request:
> https://www.spinics.net/lists/linux-media/msg193744.html
> 
> Thanks to that it is now possible to support more features for this driver.
> 
> The first patch allow to log the hardware performance per macroblock.
> The second patch makes the driver use compressed reference frames to
> reduce memory bandwidth consumption.
> Patches 3 to 5 allow to decode and produce 10-bits P010 frames.
> Patch 6 make usage of G2 post processor to scale down the frames.
> Patches 7 and 8 add the support of HEVC scaling matrix by adding a new
> control.
> 

For the next cover letter, please make sure you provide
some notes about how this was tested, with a gstreamer
public branch if needed; and also fluendo's fluster conformance
results before/after this patchset.

While there, make sure you check for performance regressions/improvements
and add such information to the commit descriptions. The more the merrier.

Thanks a lot,
Ezequiel

