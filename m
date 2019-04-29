Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB2BE04B
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 12:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfD2KKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 06:10:43 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50667 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbfD2KKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 06:10:43 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hL3F8-0004f7-Cz; Mon, 29 Apr 2019 12:10:38 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hL3F7-0001ZL-Lr; Mon, 29 Apr 2019 12:10:37 +0200
Date:   Mon, 29 Apr 2019 12:10:37 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Varunkumar Allagadapa <varunkum@xilinx.com>, kernel@pengutronix.de,
        linux-firmware@kernel.org, linux-media@vger.kernel.org
Subject: Re: Xilinx/Allegro DVT VCU firmware
Message-ID: <20190429101037.gtdfxc6ygfvxrnxu@pengutronix.de>
References: <20190328113245.32467cdc@litschi.hi.pengutronix.de>
 <20190416095911.233742e0@litschi.hi.pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190416095911.233742e0@litschi.hi.pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 16, 2019 at 09:59:11AM +0200, Michael Tretter wrote:
> Hi Varunkumar,
> 
> On Thu, 28 Mar 2019 11:32:45 +0100, Michael Tretter wrote:
> > Hi Varunkumar,
> > 
> > I am working on a mainline driver [0] for the VCU/video-codec that is
> > found on the Xilinx ZynqMP. The driver depends on a firmware for the
> > video codec [1], which is the same firmware that is used by the
> > downstream VCU driver.
> > 
> > As the license allows to distribute the binary, it should be fine to
> > include the firmware in the linux-firmware repository and properly
> > distribute it with Linux. 
> > 
> > As you tagged the latest release of the firmware, maybe you could add
> > the VCU firmware to the linux-firmware repository and add your
> > Signed-off-by: to the commit.
> > 
> > I could add the firmware myself, but having this done by someone from
> > Xilinx would be much better.
> 
> Any suggestion how we can continue with that?

I think even if this comming from Xilinx directly would be great it is
not uncommon that others add blobs to the firmware repository. So I
wouldn't wait here.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
