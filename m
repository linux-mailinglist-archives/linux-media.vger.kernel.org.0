Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21EB459CD2
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 08:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234078AbhKWHl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 02:41:59 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:23356 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233737AbhKWHl6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 02:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637653131; x=1669189131;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=67Q79M0k75Uc1aChwsH0Q0MmAmLjc1DAcg0vbLXQPLM=;
  b=LZmXWiPmJvWdeuKgoTgZkixoFUTM3bOXb23nBf4FW+n52P0yIjKlRUtM
   ecP96LHiX7COAlfkYbi7Q+uBWEkLjd20Divb7ST04nRlJt6CdOn02r63u
   9z64PUOYEkjUZCC1hzu2ge0BgJQGaT0FkoYIG1eP9vmygKJttZfDc9pnm
   ylCmWWc/4Zd8tRxhefWp9L8VcFVzgUkMgIYhZDbp0V34JkCCU0d46nakL
   yKpANV2Gs7fFcENGZ0wnvX6LiaESo2NOavUZji+pSVJal0HrdqdVXRG14
   Eqv7OzGko1+5IWGqChjINaa+PURB4+pDaFVKRpOKpZcfJ+nRbpV8BTvCl
   g==;
X-IronPort-AV: E=Sophos;i="5.87,257,1631570400"; 
   d="scan'208";a="20611422"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2021 08:38:49 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 23 Nov 2021 08:38:50 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 23 Nov 2021 08:38:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1637653129; x=1669189129;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=67Q79M0k75Uc1aChwsH0Q0MmAmLjc1DAcg0vbLXQPLM=;
  b=XHnFguosv4nZ0vw79S3ySjeK/BQsF4g4CAnqD1lSh1Rspk72oycRdGKn
   Qk0E2l/GP3J7M7cLJE/2UAIEnu51q5zT5Lc6CzumuBfi8VV5pkY+U5fY7
   LuXFEinKfGpVwrNJtjVMLAeESZskzi0XReJ/CI4Z6AMfKUYw4OrQGZ8Og
   /XmcRsqfMBPJlGL1XZlyuuth7u21Afa5NVFYLoNBLQnw+cCMGalJsDqF8
   hrsiGbTnhw1VCFem7SwUqMhfK+4XOtlRbgZHil4txjI2NEprRu8NyD2/A
   UEl6smJtrophVG2J2iWpJEIudfYu5cxtotJ5bMbV+ZJ1FPPO8p0wIi8+M
   w==;
X-IronPort-AV: E=Sophos;i="5.87,257,1631570400"; 
   d="scan'208";a="20611421"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2021 08:38:49 +0100
Received: from steina-w (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7A9C2280065;
        Tue, 23 Nov 2021 08:38:49 +0100 (CET)
Message-ID: <0c3b4cdd075919ca5cc27c56e792f510e3b76cd7.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: [PATCH V2 4/5] arm64: dts: imx8mm-beacon: Enable
 OV5640 Camera
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Ford <aford173@gmail.com>
Cc:     arm-soc <linux-arm-kernel@lists.infradead.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Tue, 23 Nov 2021 08:38:47 +0100
In-Reply-To: <YZwyhWPJVlC0JmpK@pendragon.ideasonboard.com>
References: <20211106155427.753197-1-aford173@gmail.com>
         <20211106155427.753197-4-aford173@gmail.com>
         <YZrTyVJR8VN6dQAf@pendragon.ideasonboard.com>
         <CAHCN7xK=SNgiC2kRzX4gftjkZX4Ms8PVbL69n7+eR-EAe68xag@mail.gmail.com>
         <YZwyhWPJVlC0JmpK@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, dem 23.11.2021 um 02:15 +0200 schrieb Laurent Pinchart:
> Hi Adam,
> 
> On Sun, Nov 21, 2021 at 09:07:26PM -0600, Adam Ford wrote:
> > On Sun, Nov 21, 2021 at 5:18 PM Laurent Pinchart wrote:
> > > On Sat, Nov 06, 2021 at 10:54:26AM -0500, Adam Ford wrote:
> > > > The baseboard has support for a TDNext 5640 Camera which
> > > > uses an OV5640 connected to a 2-lane CSI2 interface.
> > > > 
> > > > With the CSI and mipi_csi2 drivers pointing to an OV5640
> > > > camera, the media
> > > > pipeline can be configured with the following:
> > > > 
> > > >     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-
> > > > csis.0':0[1]"
> > > > 
> > > > The camera and various nodes in the pipeline can be configured
> > > > for UYVY:
> > > >     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480
> > > > field:none]"
> > > >     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480
> > > > field:none]"
> > > > 
> > > > Signed-off-by: Adam Ford <
> > > > aford173@gmail.com
> > > > >
> > > 
> > > As the ov5640 is on an add-on module, would a DT overlay be
> > > better ?
> > 
> > At least for the Beacon / LogicPD boards, I would prefer to avoid
> > the
> > overlays.  We have an i.M6Q and an OMAP3 board with cameras enabled
> > in
> > our development kit device trees.  If the cameras are not
> > connected,
> > they just display a message that the cameras are not communicating
> > and
> > move on.  I'm OK with that.
> 
> You know the board better than I do, so I won't push against this,
> but I
> still think it may not lead to the best user experience, especially
> if a
> user wanted to connect a different sensor to the development board.

I see the advantages of overlays compared to "stacked" .dts files. But
is there any general supported interface how to actually apply an
overlay?
Documentation/devicetree/overlay-notes.rst
states of_overlay_fdt_apply() but there is only exactly one user in-
kernel (rcar-du). Is it expected that the bootloader like u-boot shall
apply the .dtbo files?

Best regards,
Alexander

