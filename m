Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 633C11842A7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 09:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgCMIbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 04:31:22 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40135 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgCMIbV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 04:31:21 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mr9O4-1jiCrb2HEU-00oFj6; Fri, 13 Mar 2020 09:31:09 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id C340E650117;
        Fri, 13 Mar 2020 08:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cxOrl4KuroB3; Fri, 13 Mar 2020 09:31:08 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 5C8C964FBDA;
        Fri, 13 Mar 2020 09:31:08 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Mar 2020 09:31:08 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id EB30A804F8; Fri, 13 Mar 2020 09:31:07 +0100 (CET)
Date:   Fri, 13 Mar 2020 09:31:07 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/8] media: i2c: adv748x: add support for HDMI audio
Message-ID: <20200313083107.GB3832@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200113141459.GA3606@pflmari>
 <e93e6e1e-11dc-d505-7287-46b115a4a609@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e93e6e1e-11dc-d505-7287-46b115a4a609@xs4all.nl>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A627063
X-Provags-ID: V03:K1:fjYydfuJxQy/H8udIdxXYJOsSL6CEuFrOL2Fk27fHc9ELzJwygD
 tSR2eDKm9wVKROUb22OoSignvMm//2ihBwndyENNAK1vw/GGwbcPzSuRsgCu/zXswPhjrJn
 QsZzGMdofYcDj+izAhTTtYzE5VeqCNqGS4xRBqOAryw0OIO6FHPkMRAt/l4/5JB4YS/HPn4
 kp84HfyyRUDGN8AOVHeUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nKFlS+QJRi8=:1hjS7oGd246sQU4texx2hz
 4v7AJxdCoJqx8xpbGKHdB9Pvql+H9DIKCZmGbdhJ61fgZfWZgzxSnlk+ZAEbigmrPk0kKyKrW
 PHPZDGOpXzDeA8Ef2W0HEQjyfAQuCKobDjYHbVMh/nyAglluh2o47IDnbhoxkSZhw7pcafeba
 K2HqgerOeNZAUqNArlqJ1NqQ/3OwMFA9DPEM2qWzQ8fUMBlA9fWoTMrvlWCWd2WcQAYlstWIy
 o70LXvpY+iDiRz+c3WYjesFkIMry8EVlFrXYohAfYxhwQCVTiuLQORvwwvJSZtvU9R01sdamG
 yaY0BJYKO4U1QmMrP9BQV5e7e4CY5urvdeO3Ix4e3um3lS0qmnupPFlw7D/Yep7Dlxmo53mGy
 bjyUacXnvTtr30ea36Q5GDn4qDIt5dehhaSOjQmZpaGXLWI8zRv5mvbGAnkL+AhM4l2GoS6Dz
 K7ofXW9K11lGMcq0xZcT5ZyHg1/7yYqz//H0oyCneSERixHlNZqMaMagyrUvD0vwTUHXzA4zO
 2i0PaJyzb+1gcT7XIHEvQQbM9wYFO1aCbeVmW/MHE6PM439FQGxZQr8X+LNgjUatujp5nkggt
 6iDjtuATX6TQ/NjqSTSqkdEpMQVRbJ9Fx6bJal80kQOK+DlABQFHLHWntV2BNNoMyQup653l3
 LofCZS37X6F/5PQRn01zznxopDl2SjoAzAO5NyhlPqYAANlXqzk1Wn8YsdwoBddys6LRWz2WN
 C6nb47Ai2HZ1IYQxf59b00qmuIywIUKxMaFIZKYdl3uxm/p7qByxHkNpBAzdPxQXsXtC5QGho
 /Vegu7uGUml07e2l1aSEQlYklRNoFYobAa7tzF1fnLzLgiuj4TfGQZvwveoH3k1M1jZiZ1a
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Hans Verkuil, Fri, Mar 13, 2020 09:21:05 +0100:
> As a general note for this series: it might be better to have two
> patch series: one for patches 1 and 3-6 (not sure whether 5 can be included
> or not), and one where the public API changes (i.e. new V4L2 audio controls)
> are added. The first can probably be merged fairly quickly, the second will
> likely require more iterations since public API patches always take much longer
> before they are mature.

I see. After the discussion started, I started to have suspicions of my own
regarding the V4L2 ioctls. Except for log-status, which is a practical
diagnostics feature (even supported by v4l2-ctl), I'm thinking about dropping
them altogether in favor of audio soc DAI implementation.
The DAI implementation does all we ever needed from the device. Besides,
selecting a I2S protocol variant from user space (I2S vs I2S/TDM) never felt
right.

Shall I submit the log-status separately?

Regards,
Alex

> On 1/13/20 3:14 PM, Alex Riesen wrote:
> > This adds minimal support for controlling the audio output I2S port available
> > on ADV7481 and ADV7482 HDMI decoder devices by ADI. The port carries audio
> > signal from the decoded HDMI stream.
> > 
> > An ADV7482 on the Renesas Salvator-X ES1.1 was used during development of this
> > code.
> > 
> > Alex Riesen (8):
> >  1. media: adv748x: add a device-specific wrapper for register block read
> >  2. media: adv748x: add audio mute control and output selection ioctls
> >  3. media: adv748x: add log_status ioctl
> >  4. media: adv748x: reserve space for the audio (I2S) port in the driver
> >     structures
> >  5. media: adv748x: add an ASoC DAI definition to the driver
> >  6. media: adv748x: reduce amount of code for bitwise modification of
> >     device registers
> >  7. dt-bindings: adv748x: add information about serial audio interface
> >     (I2S/TDM)
> >  8. arm64: dts: renesas: salvator: add a connection from adv748x codec
> >     (HDMI input) to the R-Car SoC
> > 
> >  .../devicetree/bindings/media/i2c/adv748x.txt |  13 +-
> >  .../dts/renesas/r8a7795-es1-salvator-x.dts    |  24 +-
> >  .../boot/dts/renesas/salvator-common.dtsi     |  35 +-
> >  drivers/media/i2c/adv748x/adv748x-core.c      |  54 +++
> >  drivers/media/i2c/adv748x/adv748x-hdmi.c      | 355 ++++++++++++++++++
> >  drivers/media/i2c/adv748x/adv748x.h           |  53 ++-
> >  6 files changed, 523 insertions(+), 11 deletions(-)
> > 
