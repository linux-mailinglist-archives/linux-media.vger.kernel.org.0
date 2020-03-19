Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A4518BE61
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 18:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbgCSRmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 13:42:08 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50797 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgCSRmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 13:42:07 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M3UEW-1jEQwX2Lqc-000euR; Thu, 19 Mar 2020 18:41:43 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id E8FFE65021B;
        Thu, 19 Mar 2020 17:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vd7tABGtwXbN; Thu, 19 Mar 2020 18:41:40 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 2839E64FB10;
        Thu, 19 Mar 2020 18:41:40 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.52) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Mar 2020 18:41:40 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 696CB8050C; Thu, 19 Mar 2020 18:41:39 +0100 (CET)
Date:   Thu, 19 Mar 2020 18:41:39 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 00/10] media: adv748x: add support for HDMI audio
Message-ID: <cover.1584639664.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.8.5.52]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7762
X-Provags-ID: V03:K1:mvDYqnPYL3BVimmptxRglwccrdzJ9m6QeBKfaLIDjh4sDza7r3X
 QdeASc2IvBmpfRKnTcr+Hx3CGUl8j6GckfAQ6mqDk0eoQaNdJZxIl5NP68k29ZGxG3WXIlE
 I+VBXTnhpFnQtxrwxYdJ9JluO7AzkoyJcJ3f2150JxbjmK8x9aa722MWqEtUoGG/Hjo4kNO
 QXUJJ0I1r5UmyC++mo2dQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CIkuGflbLG0=:qce+Kh7+XiEPleqp/rhhcf
 5RjPHnQLaGasfR2ASI+SyeDCa7W9H6UZ+akD3D4yn4YIOcd39XM5QDPu9W2wTLoD/V20f4Msh
 kfOa53CybeOD4pkAQjiPvjtH751S6aCf81JUcXM1Qhf7BlX8ojgU8WA4TmCX9W6USMRj1uaP/
 Cu/UUls0M3iRa2JWjBVrgnVdYD7clhLEIxuLli/KuSX7vI8NVftjbzDFup5Ky4KWTFKoB1mmI
 hvgv05bm1G521Fw2fbG0JYIgFHjPWs5frzgmE0JVCMLzDqRMv3kJbfoT7/K09ebxvYOOMUa/e
 tnDuTt6vqJKe19LsNoidbHKfKm8wdvYU3k1Cg5CitpoArvsBunREsi5NDqstnj0VsEZUFJhMG
 ktz940c4vr+2d8cKHK8aYLTPjw8KUJVSzdwVeYTU5QYNXLTr9QD5+bF7jkHLw8L6sg6BIOMwo
 sJKR/l6UNg322xTLGJAJE4mTNDQBybyztKRxWSMr2pf9YUVQ+DJpI3YSjBCC1X8ske/O8cnB/
 Glwl3VYdUiZ2f7uUGzULzvzAWB9BNiKU9tl/GOczmEzSOFWzExVKIpzs4KcpxkCxs4VJm3Yt9
 UYbWZ953efQzawxCF1A0Ts/T01Z1hx+6xuFI5p1KJP/BQ/FVC+aUoq+tbcxXRLHJJ0tX4lGOc
 Qa0xvTk+w3IuRWiyxGMVsAtGx9RgLNu2gvPZ9iGelqjHQQISkHE0glarxj2QfKDClaBRv2mHo
 sF081BO89BMVMLYJXCVoRJO43Y1wGzDfzvveaPVSGROpHe1/QJclwge8xAo1fJPKPvF3/JEsf
 HCTdMsGaho78iRk1+WJnNh5KqyIJq4BsnVu1uT7v+inoPwLENRfcBi4+LsNS3L1R2ZqcMtw
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds minimal support for accessing the HDMI audio provided through the
I2S port available on ADV7481 and ADV7482 decoder devices by ADI.
The port carries audio signal from the decoded HDMI stream.

Currently, the driver only supports I2S in TDM, 8 channels a 24bit at 48kHz.
Furthermore, only left-justified, 8 slots, 32bit/slot TDM, at 256fs has been
ever tried.

An ADV7482 on the Renesas Salvator-X ES1.1 (R8A77950 SoC) was used during
development of this code.

Changes since v1:
  - Add ssi4_ctrl pin group to the sound pins. The pins are responsible for
    SCK4 (sample clock) WS4 and (word boundary input), and are required for
    SSI audio input over I2S.
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - Removed the audio clock C from the list of clocks of adv748x,
    it is exactly the other way around.
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - Add an instance of (currently) fixed rate I2S master clock (MCLK),
    connected to the audio_clk_c line of the R-Car SoC.
    Explicitly declare the device a clock producer and add it to the
    list of clocks used by the audio system of the Salvator-X board.
    Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

  - The implementation of DAI driver has been moved in a separate file
    and modified to activate audio decoding and I2S streaming using
    snd_soc_dai_... interfaces. This allows the driver to be used with
    just ALSA interfaces.

  - The ioctls for selecting audio output and muting have been removed,
    as not applicable.
    Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    I have left implementation of the QUERYCAP in, as it seems to be required
    by v4l-ctl to support loading of EDID for this node. And setting the EDID
    is one feature I desperately need: there are devices which plainly refuse
    to talk to the sink if it does not provide EDID they like.

  - A device tree configuration without audio port will disable the audio code
    altogether, supporting integrations where the port is not connected.

  - The patches have been re-arranged, starting with the generic changes and
    changes not related to audio directly. Those will be probably sent as a
    separate series later.

  - The whole series has been rebased on top of v5.6-rc6

Alex Riesen (10):
  media: adv748x: fix end-of-line terminators in diagnostic statements
  media: adv748x: include everything adv748x.h needs into the file
  media: adv748x: reduce amount of code for bitwise modifications of
    device registers
  media: adv748x: add definitions for audio output related registers
  media: adv748x: add support for HDMI audio
  media: adv748x: only activate DAI if it is described in device tree
  dt-bindings: adv748x: add information about serial audio interface
    (I2S/TDM)
  arm64: dts: renesas: salvator: add a connection from adv748x codec
    (HDMI input) to the R-Car SoC
  media: adv748x: add support for log_status ioctl
  media: adv748x: allow the HDMI sub-device to accept EDID

 .../devicetree/bindings/media/i2c/adv748x.txt |  16 +-
 .../boot/dts/renesas/r8a77950-salvator-x.dts  |   3 +-
 .../boot/dts/renesas/salvator-common.dtsi     |  47 +++-
 drivers/media/i2c/adv748x/Makefile            |   3 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |   2 -
 drivers/media/i2c/adv748x/adv748x-core.c      |  56 +++-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   4 +-
 drivers/media/i2c/adv748x/adv748x-dai.c       | 261 ++++++++++++++++++
 drivers/media/i2c/adv748x/adv748x-hdmi.c      | 208 +++++++++++++-
 drivers/media/i2c/adv748x/adv748x.h           |  67 ++++-
 10 files changed, 633 insertions(+), 34 deletions(-)
 create mode 100644 drivers/media/i2c/adv748x/adv748x-dai.c

-- 
2.25.1.25.g9ecbe7eb18

