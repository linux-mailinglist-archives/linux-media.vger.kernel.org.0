Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3BE3DFE77
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 11:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237241AbhHDJ5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 05:57:07 -0400
Received: from comms.puri.sm ([159.203.221.185]:41608 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236659AbhHDJ5G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 05:57:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 0E811DFD3B;
        Wed,  4 Aug 2021 02:56:24 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DQm56S8O-S3x; Wed,  4 Aug 2021 02:56:19 -0700 (PDT)
Message-ID: <bf02db8325bb799a861ff7a924ab4d7d5b1df0cc.camel@puri.sm>
Subject: Re: [PATCH v10 0/3] media: imx: add support for imx8mq MIPI RX
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dafna.hirschfeld@collabora.com, devicetree@vger.kernel.org,
        festevam@gmail.com, kernel@pengutronix.de, kernel@puri.sm,
        krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        m.felsch@pengutronix.de, mchehab@kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org,
        slongerbeam@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>
Date:   Wed, 04 Aug 2021 11:56:14 +0200
In-Reply-To: <20210804093125.GE30984@dragon>
References: <20210728091245.231043-1-martin.kepplinger@puri.sm>
         <YQFcfbrTmGw4kZvQ@pendragon.ideasonboard.com>
         <20210804093125.GE30984@dragon>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 04.08.2021 um 17:31 +0800 schrieb Shawn Guo:
> On Wed, Jul 28, 2021 at 04:32:45PM +0300, Laurent Pinchart wrote:
> > Hi Martin,
> > 
> > On Wed, Jul 28, 2021 at 11:12:42AM +0200, Martin Kepplinger wrote:
> > > hi,
> > > 
> > > This patch series adds a driver for the i.MX8MQ CSI MIPI receiver
> > > / controller.
> > > 
> > > It includes the driver, the dt-bindings and the DT addition to
> > > the SoC dtsi.
> > > I test it using libcamera. Thanks to Laurent who helped a lot.
> > > I'm happy for
> > > any feedback,
> > 
> > Thank you for the series. I've submitted a pull request that
> > contains
> > patches 1/3 and 2/3.
> > 
> > Shawn, Sascha, how would you like to handle 3/3 ?
> 
> I picked up the 3/3 in v9, which I think is identical to this
> version.
> Otherwise, please let me know.
> 
> Shawn

it's identical, yes. thank you very much,

                       martin

