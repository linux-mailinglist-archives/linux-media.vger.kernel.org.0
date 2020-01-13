Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A84139351
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgAMOPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:15:13 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:50371 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbgAMOPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:15:12 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MS4ab-1jFunO26Yd-00TY9y; Mon, 13 Jan 2020 15:15:01 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 9578164E74F;
        Mon, 13 Jan 2020 14:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gxXippCj9pKV; Mon, 13 Jan 2020 15:15:00 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 469E564F41A;
        Mon, 13 Jan 2020 15:15:00 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:15:00 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id DF1DB804E9; Mon, 13 Jan 2020 15:14:59 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:14:59 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 0/8] media: i2c: adv748x: add support for HDMI audio
Message-ID: <20200113141459.GA3606@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F657D64
X-Provags-ID: V03:K1:WRn8kDWvZJBZV9XEgaD3WUPXDBg4Z7NvFJjTF4aIMVraTsReI3K
 ZcsHHb4pG6K4QW6TmSwNunYqt6h5vAqCzkLEAEt9VoSiY6t982MwHJjy/h/bWdFA9fLqdWY
 O24c0J+NcsX/+TqxgVvxNG11l5+I2NY7YuLbeatvNuNRy7ockntQgEsQpx8yPBURsRFtCsx
 25EduWThKhIb/PDEDDR0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wVcwTeekgfo=:SXy1qsS6KRd5aa2WxVNUnn
 W4P3qGtHqPBIfn49eHFvGpMw3VCb54/Tu1dAyOV4FqsKSENANb2Pr8LHB7rqGQ6qET1m++ghC
 vJuZX0n2F3ArHSWbUe55YnUEQrdmB7ypd3RRPoBWrqwTDBuSZk+/uKizm7M+pjDk8vbJWePlv
 J+ZWCY2s7yaKZivAs4BBAI/ObXLFDM9VRh36xlM+znJqw9anVEu2KWDtTKwj6BuYh08DmImLw
 mG7odvXNYO65mI3tb07AJNcddVkQK2tJE8aOYlpJwYRrgLdibRRB0D1Dfq6MliNuTONXgFY5k
 JLDww8XW91Y3ojkLec9pf9EO3JvhdTN4o4bfD5YsrtjynO3iKbpDsIrKKXW6hbPhVMqeV5MDp
 /l7mII7j8wnrMiNj49u6Nxz0fXg+LFfv73se7kp//4kFRqUaavxOHoTAwtHT9NPZW2uy/TmbA
 zh0o1OCKAxDmVGlwpo/HhUs3D5EcqOQakJmT6nrxTgNUy5EgNqGwiFsPrGdELKjmayI1GDvLr
 OiOsTLUWk3SDJwYAtl35CfqpHSJXwEn+d20oowMtkRyiO4ZAvnHIiLRtGFqwCpphchkmC4+Pc
 PNlAaO1tcs/3hUzKOGNhYE/te3MubGFVn+lT4/Vx/OMB3g24hP8LK8Imvo7nMzbDen8paBQei
 Jl/ppyhIZ3YjGj02cT/3wEaXjE9relLPlZhIm3MO9hXQevT9mUs5b9TZemZjXNqJLsmS1Uuq3
 xPYIQx+3/XOKHhcLW/jkedw23PCr829Rz8qrw7iVVanKKaBnwifS/egmoroEyxiq2TjRjTtph
 a3ao0VnUnEtUaSFEVNEgbUQ/3hwf5lY+2aJMLyvqv37Q6ntnCnl4MVN8/zOlJkh9eLpkGAjvd
 72sqK8yT1n3Zam5q8rwJG8kOi+x42tx3nHVc6TTc8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds minimal support for controlling the audio output I2S port available
on ADV7481 and ADV7482 HDMI decoder devices by ADI. The port carries audio
signal from the decoded HDMI stream.

An ADV7482 on the Renesas Salvator-X ES1.1 was used during development of this
code.

Alex Riesen (8):
  media: adv748x: add a device-specific wrapper for register block read
  media: adv748x: add audio mute control and output selection ioctls
  media: adv748x: add log_status ioctl
  media: adv748x: reserve space for the audio (I2S) port in the driver
    structures
  media: adv748x: add an ASoC DAI definition to the driver
  media: adv748x: reduce amount of code for bitwise modification of
    device registers
  dt-bindings: adv748x: add information about serial audio interface
    (I2S/TDM)
  arm64: dts: renesas: salvator: add a connection from adv748x codec
    (HDMI input) to the R-Car SoC

 .../devicetree/bindings/media/i2c/adv748x.txt |  13 +-
 .../dts/renesas/r8a7795-es1-salvator-x.dts    |  24 +-
 .../boot/dts/renesas/salvator-common.dtsi     |  35 +-
 drivers/media/i2c/adv748x/adv748x-core.c      |  54 +++
 drivers/media/i2c/adv748x/adv748x-hdmi.c      | 355 ++++++++++++++++++
 drivers/media/i2c/adv748x/adv748x.h           |  53 ++-
 6 files changed, 523 insertions(+), 11 deletions(-)

-- 
2.24.1.508.g91d2dafee0
