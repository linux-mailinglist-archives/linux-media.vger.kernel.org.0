Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EF13B6608
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 17:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhF1Pt0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 11:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236476AbhF1PtV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 11:49:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07011C07022F;
        Mon, 28 Jun 2021 08:18:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0B4E31F427D6
Message-ID: <276e3e43ba89ea996f89eb4109b0d50bc43d4d7f.camel@collabora.com>
Subject: Re: [PATCH v9 03/13] media: hantro: Use syscon instead of 'ctrl'
 register
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-imx@nxp.com, kernel@pengutronix.de, kernel@collabora.com,
        cphealy@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Date:   Mon, 28 Jun 2021 12:18:34 -0300
In-Reply-To: <24bea430-56d9-9a62-130d-1ed3830c1915@collabora.com>
References: <20210407073534.376722-1-benjamin.gaignard@collabora.com>
         <20210407073534.376722-4-benjamin.gaignard@collabora.com>
         <7bcbb787d82f21d42563d8fb7e3c2e7d40123932.camel@pengutronix.de>
         <24bea430-56d9-9a62-130d-1ed3830c1915@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, 2021-06-28 at 15:35 +0200, Benjamin Gaignard wrote:
> 
> Le 16/04/2021 à 12:54, Lucas Stach a écrit :
> > Am Mittwoch, dem 07.04.2021 um 09:35 +0200 schrieb Benjamin Gaignard:
> > > In order to be able to share the control hardware block between
> > > VPUs use a syscon instead a ioremap it in the driver.
> > > To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
> > > phandle is not found look at 'ctrl' reg-name.
> > > With the method it becomes useless to provide a list of register
> > > names so remove it.
> > Sorry for putting a spoke in the wheel after many iterations of the
> > series.
> > 
> > We just discussed a way forward on how to handle the clocks and resets
> > provided by the blkctl block on i.MX8MM and later and it seems there is
> > a consensus on trying to provide virtual power domains from a blkctl
> > driver, controlling clocks and resets for the devices in the power
> > domain. I would like to avoid introducing yet another way of handling
> > the blkctl and thus would like to align the i.MX8MQ VPU blkctl with
> > what we are planning to do on the later chip generations.
> > 
> > CC'ing Jacky Bai and Peng Fan from NXP, as they were going to give this
> > virtual power domain thing a shot.
> 
> Hey guys,
> 
> I may I have miss them but I haven't see patches about power domain for IMX8MQ
> VPU control block ?
> Is it something that you still plan to do ?
> If not, I can resend my patches where I use syscon.
> 

Please see "soc: imx: add i.MX BLK-CTL support" [1] sent by Peng
a couple weeks ago. It adds the VPUMIX for i.MX8MM, so it seems
the best way forward is to follow that design, extending it for
i.MX8MQ.

That's still under discussion, but hopefully it will be sorted out for v5.15.

Speaking of i.MX8MM, I got a report that the Hantro G1 block mostly
work, but needs to be restricted to 1920x1080. If you could add a new
compatible and variant for that, maybe we can find someone to test it.

[1] https://lore.kernel.org/linux-arm-kernel/7683ab0b-f905-dff1-aa4f-76ad638da568@oss.nxp.com/T/#mf73fe4a13aec0a8e633a14a5d9c2d5609799acb4

Kindly,
Ezequiel

