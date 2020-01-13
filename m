Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 016B7139389
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgAMOT3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:19:29 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:53485 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgAMOT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:19:28 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MGz5h-1iwBUR0EjL-00E8lZ; Mon, 13 Jan 2020 15:19:20 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 0C80B64F293;
        Mon, 13 Jan 2020 14:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0lxoVKmw2u_b; Mon, 13 Jan 2020 15:19:18 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id B6DD064E2F2;
        Mon, 13 Jan 2020 15:19:18 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:19:18 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 5F3B8804EB; Mon, 13 Jan 2020 15:19:18 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:19:18 +0100
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
Message-ID: <cover.1578924232.git.alexander.riesen@cetitec.com>
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
X-Provags-ID: V03:K1:GZirzY4gCBAvcVAoboEzo8PAmOSS+Q2zeRvV3WJSr+8Is0fiFOf
 V9gcwiqbgtsVSnjFWBiLabOkfnkWR7gy1HiJkuENofkVBr5+8eqdUAyPHMbLhyweLTDtkvN
 4HPZKfE3Vln6hG3a3jSe0K6jqYPkkgSMLB1Apuz+dNjUgxJHPtaYinkiCIvS4wYQ9Wa8oLn
 ZqEA35/Tx8CR0TM6+izZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fWB6pESOSF4=:y8cNkKykP3gqRTEv6W0UET
 GUMXMJ75JAc/8AwPMMclUVBYsauxy25hiLgFMgscBOU5TkGFUVeG+f8xyrrSHb0dFCj9cwffo
 nRRUAHhvboHn5mMndRTuo71215yyeyMdvlxzUqY5NqdMJNa+snEDL8NpXkQrpWdZlsiEdZBHt
 Qns1MqurZ3hC1ApJYwATy1vXaHxV1znpUpfzfYSQKT7C096rSyO7lJPAKwS2dAEQflS+pdAwj
 dwssB0OdZWK1i6S0r/QgJ4sodnV9W+m/tJ0/lpkB5MpSsvuhRhULGg0W81bRfagep9eJRVsli
 KGku7+YGq02QFmSIH/s5sUKrp43UXAd78qXSl9thUIwzn2QJwnr3eBVA5HK0AFx64Wbeo5GTe
 YEWR7yFM35JJuzeCqeZ59ZVKdvUfNIJ7dE9DgnOKYx1jdjNS/QR5LnEA9xJf8m1jnBcJnetA2
 Ld7Uhf26/oFEJ4ePPdxq5jrJ2CaLqL2Yk9ERUlXtm3dYXljr2UpOkOtaxG99jaZ99Alx9cjd+
 PfksO+PD965OcJsVpxNftS5jGmBdICRwQdiaLZ+NcSr4I0FpoENDNd1lVPCfBfjijKoCMgN6q
 UZNSy41xogpLBW8TsDP0anQgMbo6wZ0Z8FTAisitr4Hc3y+QXttZGf+MoUkr3JzWLvAR4j6ms
 o5eXxL4hCefQubfgk7Z6U2o5UfSLjA+097K1yF9c+yeQYIas8e0c/z3ele+d7Fh8LZcImBSKA
 Cfd+lWG2FoxI2tYWGhcKUSp84IQbcuBIzM90AuF4OVdBzRPO+BGZyNPo2igPhxxaAMmLoRix0
 XTBn/NQ4D4uqe6mZkQkTMRRi6fFSUoxTTpIXx+k14kiTA0mYNVG7t3e4wm+jJfurpyWJehs6V
 sW6ZlLheEMzl4PR9Iil3SwKex3yhgePu0ci5wvjLs=
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
