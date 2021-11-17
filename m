Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3144543C3
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234677AbhKQJdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:33:25 -0500
Received: from comms.puri.sm ([159.203.221.185]:51568 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234977AbhKQJdY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:33:24 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 497BDE01BB;
        Wed, 17 Nov 2021 01:29:56 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ig7WsEC-_5mb; Wed, 17 Nov 2021 01:29:55 -0800 (PST)
Message-ID: <9be2623ed7d31b15e67932133d10312453423610.camel@puri.sm>
Subject: Re: (EXT) [BUG] media: imx: imx7-media-csi issue with vb2 is
 hanging / freezing the system
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com,
        slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org
Cc:     linux-imx@nxp.com, kernel@puri.sm, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date:   Wed, 17 Nov 2021 10:29:48 +0100
In-Reply-To: <BB893496-0F12-4A5D-AD1D-AB095D837709@puri.sm>
References: <ab8929d22461300f0f167ab44e1b5c902dde5fcd.camel@puri.sm>
         <44e674de003a8b8ebce908cebf5ea35f32ddd6ab.camel@ew.tq-group.com>
         <BB893496-0F12-4A5D-AD1D-AB095D837709@puri.sm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, dem 12.11.2021 um 15:49 +0100 schrieb Martin Kepplinger:
> 
> 
> Am 12. November 2021 13:40:43 MEZ schrieb Alexander Stein
> <alexander.stein@ew.tq-group.com>:
> > Hello Martin,
> > 
> > Am Freitag, dem 12.11.2021 um 12:23 +0100 schrieb Martin
> > Kepplinger:
> > > hi Laurent and all who it may concern,
> > > 
> > > Ever since I switches to using imx7-media-csi on imx8mq I have
> > > seen a
> > > bug that hangs /freezes the system so that I can't really save a
> > > trace
> > > or get logs for it. It happens not every time when starting
> > > streaming,
> > > but sometimes - when starting to stream frames.
> > > 
> > > It kind of looks like a lock not released or something similar,
> > > but
> > > some race condition might happen since it's happening every 2 to
> > > 10
> > > times.
> > > 
> > > For me, when it fails, it fails the first time when starting to
> > > stream
> > > after rebooting. If it succeeds that first time, it continues to
> > > succeed, until I reboot.
> > 
> > When I read your description I was immediately reminded to this
> > post on
> > NXP forums [1].
> > I do not know if this is what is happening to you, but it sounds
> > somewhat similar. There is also an errata in post [2] describing
> > some
> > backgrounds. Later posts also describe that apparently only CSI
> > port 1
> > is affected, but CSI port 2 is not.
> > Do you have the possibility to test CSI port 2?
> 
> yes but I can only say that csi port 2 behaves better while I have
> seen a lockup there too. That too matches your links' issue
> description. I dont have logs from port 2 yet.
> 
> Thanks a lot, there's at least something new to test I think. Let's
> see whether a kernel thread would work instead of an m4 program.
> 
> But why haven't I ever seen the problem on the mx6s_capture nxp
> driver? That doesn't fit the picture yet for me.
> 
> > 
> > Best regards,
> > Alexander
> > 
> > [1]
> > https://community.nxp.com/t5/i-MX-Processors/IMX8MQ-MIPI-CSI2-Base-address-switching-change-error/m-p/1218063
> > [2]
> > https://community.nxp.com/t5/i-MX-Processors/IMX8MQ-MIPI-CSI2-Base-address-switching-change-error/m-p/1216509/highlight/true#M167970
> > 

this seems to be fixed by
https://lore.kernel.org/linux-media/20211117092710.3084034-1-martin.kepplinger@puri.sm/T/#t

the issue described in the nxp forums should be taken care of by the
underrun (or called "discard" in the nxp driver) buffer in the driver.

thank you!

                                 martin


