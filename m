Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3F72AB6C5
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 12:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgKIL1Q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 9 Nov 2020 06:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729038AbgKIL1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 06:27:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF323C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 03:27:15 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kc5KD-0005Q3-Hh; Mon, 09 Nov 2020 12:27:05 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kc5KC-00085B-Jc; Mon, 09 Nov 2020 12:27:04 +0100
Message-ID: <fab8817e2d78ab1a3d53ecc0ae39b8a7484e83c5.camel@pengutronix.de>
Subject: Re: [PATCH] staging: media: imx: Split config option in 2
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        rogerio.silva@nxp.com, slongerbeam@gmail.com, mchehab@kernel.org,
        shawnguo@kernel.org, festevam@gmail.com
Cc:     iain.galloway@nxp.com, kernel@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 09 Nov 2020 12:27:04 +0100
In-Reply-To: <20201109094633.13518-1-martin.kepplinger@puri.sm>
References: <2aec3ae20bf5a9eefbe691a69c76c91b09af2a35.camel@pengutronix.de>
         <20201109094633.13518-1-martin.kepplinger@puri.sm>
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

On Mon, 2020-11-09 at 10:46 +0100, Martin Kepplinger wrote:
> As described in NXPs' linux tree, the imx8m SoC includes the same
> CSI bridge hardware that is part of imx7d. We should be able to
> use the "fsl,imx7-csi" driver for imx8m directly.
> 
> Since ipuv3 is not relevant for imx8m we create VIDEO_IMX7_MEDIA and
> split up the configuration option in 2 menus (on 1 entry each
> for now but that can be changed later).
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
> 
> thanks, you're right. did you have something like this in mind?

Not quite, we need a separate option for the imx-media-common module, so
the Makefile has to be changed as well. That option should be selected
by VIDEO_IMX_MEDIA.
I'm not sure if introducing VIDEO_IMX7_MEDIA is necessary, the new
option could also be hidden if selected VIDEO_IMX7_CSI directly.

regards
Philipp
