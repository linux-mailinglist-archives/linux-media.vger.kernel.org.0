Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919233E4172
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 10:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbhHIIQ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 04:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbhHIIQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 04:16:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A4FC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 01:16:35 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1mD0SJ-0008EO-HJ; Mon, 09 Aug 2021 10:16:19 +0200
Message-ID: <d19d35e8a90ece7124d06855b9f2b226b73c8f6e.camel@pengutronix.de>
Subject: Re: [PATCH V2 00/13] soc: imx: gpcv2: support i.MX8MM
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, krzk@kernel.org,
        agx@sigxcpu.org, Marek Vasut <marex@denx.de>,
        andrew.smirnov@gmail.com, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ping.bai@nxp.com, frieder.schrempf@kontron.de, aford173@gmail.com,
        abel.vesa@nxp.com, Peng Fan <peng.fan@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Mon, 09 Aug 2021 10:15:48 +0200
In-Reply-To: <CAAEAJfDfjkHF164x2qRnZg3e5JRN0pHjxyAq+d5+-3JFYwEEOQ@mail.gmail.com>
References: <20210506010440.7016-1-peng.fan@oss.nxp.com>
         <CAAEAJfDfjkHF164x2qRnZg3e5JRN0pHjxyAq+d5+-3JFYwEEOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am Mittwoch, dem 04.08.2021 um 11:30 -0300 schrieb Ezequiel Garcia:
> Hi Peng, Lucas,
> 
> On Wed, 5 May 2021 at 21:32, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> > 
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > 
> > V2:
> >  - Add R-b/A-b tag
> >  - Merge V1 patch 13 to V2 patch 6
> >  - Drop V1 patch 15
> >  - Merge V1 patch 16 to V2 patch 5 and add comments in patch 5 to explain
> >  details
> >  - Add explaination in patch 8 for "why the resets are not defined"
> > 
> > This patchset is a pick up Lucas's gpcv2 work for i.MX8MM and several
> > minor changes from me to make it could work with i.MX BLK-CTL driver.
> > 
> > Thanks for Lucas's work and suggestion, Frieder Schrempf for collecting
> > all the patches, Jacky Bai on help debug issues.
> > 
> > Lucas Stach (12):
> >   soc: imx: gpcv2: move to more ideomatic error handling in probe
> >   soc: imx: gpcv2: move domain mapping to domain driver probe
> >   soc: imx: gpcv2: switch to clk_bulk_* API
> >   soc: imx: gpcv2: split power up and power down sequence control
> >   soc: imx: gpcv2: wait for ADB400 handshake
> >   soc: imx: gpcv2: add runtime PM support for power-domains
> >   soc: imx: gpcv2: allow domains without power-sequence control
> >   dt-bindings: imx: gpcv2: add support for optional resets
> >   soc: imx: gpcv2: add support for optional resets
> >   dt-bindings: power: add defines for i.MX8MM power domains
> >   soc: imx: gpcv2: add support for i.MX8MM power domains
> >   soc: imx: gpcv2: Add support for missing i.MX8MM VPU/DISPMIX power
> >     domains
> > 
> 
> It's nice to see this finally moving forward!
> 
> As you know, Hantro G2 support for i.MX8MQ (and i.MX8MP, i.MX8MM) is currently
> blocked, as you have requested:
> 
> https://lore.kernel.org/driverdev-devel/5aa5700b862234895a7a6eb251ca3c80fdc1a6d3.camel@collabora.com/
> 
> So, I think we really need to include i.MX8MP and i.MX8MQ on this series.
> It's been quite a while and we really need to have that. To be honest,
> I fear that
> if we merge this series as-is, MX8MP and MX8MP support will fall in
> the oblivion,
> and Hantro G2 VPU will remain unusable.
> 
> We are planning to submit Hantro G2 VP9 support soon, and we've been testing
> on various platforms, but it will also be blocked by lack of power-domains.
> 
> In the future, please Cc the linux-media mailing list, as well as
> Benjamin, Andrzej and myself, so we can follow this.

Please take a look at [1], which is the current state of this work. I
intend to add both i.MX8MQ and i.MX8MP support to the series now, as it
seems that there have been no big objections to my approach over the
last 2 weeks, where I was on vacation. ;)

Regards,
Lucas

[1]
https://lore.kernel.org/linux-arm-kernel/20210716232916.3572966-14-l.stach@pengutronix.de/T/#m43cbf6b8615b2a37ff2abb0346e7e7f6594976d1


