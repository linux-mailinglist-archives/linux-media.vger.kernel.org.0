Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEEF36B1DBD
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 09:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjCIIVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 03:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCIIUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 03:20:31 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 003D5E842B;
        Thu,  9 Mar 2023 00:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678349813; x=1709885813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o2rhiM4rdYbnFdFUIMb47/y94qMgtRImYwSoikHwQEM=;
  b=iw3Fh7WECtk+u3EP72qD0EMrblSC75k2Z0iAuBgLL/nVKFHhja6n6aoE
   eMB1aW2KgEIsAwF/oIF59jr8cSsfeH3bON5wKBWZrrNs8QEIOzMCb8V3O
   pCpOpZdZK6plvZ5l5knslGbg7WsNbwh2xCfe3/GGPCL+aaS23UhM/3ED6
   89mYZ9Irt1v9++NYuy5NdhOk+GGexX4v5P7MZME1KfFq0qFkoaFgfjSFN
   FyRlQRq/ofxAlSosjLP2K/ClU7GIV4pLeE2t9ps50GiF7s1RUIPFidS/M
   L2Ar0ie5jS4XXQoD98hTDZcm9p/VnXn5IuI/UkP2UUT1E2cv7xTQdQ6mk
   g==;
X-IronPort-AV: E=Sophos;i="5.98,245,1673910000"; 
   d="scan'208";a="29567374"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 Mar 2023 09:16:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 09 Mar 2023 09:16:51 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 09 Mar 2023 09:16:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678349811; x=1709885811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o2rhiM4rdYbnFdFUIMb47/y94qMgtRImYwSoikHwQEM=;
  b=EW7xECHu4etDpVRaw4Xd+jevfMbu306WiV282aRIzAsHwY8rPzS8pMxP
   qll9+OOV1F9FV5spZ113Mf47PpqVMH6s/ZiCOLznZzVVRPCMzaV94Sy+P
   GqePI91tPmKD9+rrKxL0p+uQkePndpHBng3RiKtxxJaCH+3yv6X5ySive
   y7LgYcfBpmTEnAik5tRhGlj11HIeOi8kguwLh1F8MddNqmJvDLvCVW5A2
   A6TtmR5vVypqv5dbiHJTpS2bUprpj4y/VvBfmhVkTq3mV2PNuDh0VoV8F
   3wxV3rsHyBYL7ulRWgidwBmZhX1S9LeOHFABKV2zQiae8162UyNmqza6s
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,245,1673910000"; 
   d="scan'208";a="29567372"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Mar 2023 09:16:51 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BF2FB280056;
        Thu,  9 Mar 2023 09:16:50 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 00/15] media: i2c: imx290: Mono support, minor fixes, alternate INCK, and more controls
Date:   Thu, 09 Mar 2023 09:16:47 +0100
Message-ID: <5017997.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Am Mittwoch, 15. Februar 2023, 23:29:48 CET schrieb Laurent Pinchart:
> Hello,
>=20
> This patch series combines the "[PATCH v2 0/2] Add support for mono
> version of Sony IMX290 sensor" ([1]) and "[PATCH v2 00/13] imx290: Minor
> fixes, support for alternate INCK, and more ctrls" ([2]) previously
> submitted by Dave into a single series.
>=20
> As promised in my review of v2 of both series, I have tested the changes
> with my IMX327 camera sensor, connected to the i.MX8MP ISP, with
> libcamera. I haven't noticed any regression (but, full disclaimer, I
> haven't tested all the newly features). I think we're thus good to go.

What is the status of this series? Will it be picked up?

Best regards,
Alexander

>=20
> This version handles all review comments from v2, resulting in the
> following changes:
>=20
> - Deprecate the sony,imx290 compatible
> - Update the DT example to use the new sony,imx290lqr compatible
> - Drop unneeded pointer cast
> - Don't move imx290_of_match table
> - Fix typos
>=20
> The code has also been rebased on top of the latest media master branch,
> with rebase conflicts and rebase-induced compilation breakages fixed.
>=20
> The patches are available from
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
> next/media/sensors/imx290
>=20
> [1]
> https://lore.kernel.org/linux-media/20230203191644.947643-1-dave.stevenso=
n@
> raspberrypi.com [2]
> https://lore.kernel.org/linux-media/20230203191811.947697-1-dave.stevenso=
n@
> raspberrypi.com
>=20
> Dave Stevenson (15):
>   media: dt-bindings: media: i2c: Add mono version to IMX290 bindings
>   media: i2c: imx290: Add support for the mono sensor variant
>   media: i2c: imx290: Match kernel coding style on whitespace
>   media: i2c: imx290: Set the colorspace fields in the format
>   media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
>   media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
>   media: i2c: imx290: Support 60fps in 2 lane operation
>   media: i2c: imx290: Use CSI timings as per datasheet
>   media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
>   media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
>   media: i2c: imx290: VMAX is mode dependent
>   media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
>   media: i2c: imx290: Add support for 74.25MHz external clock
>   media: i2c: imx290: Add support for H & V Flips
>   media: i2c: imx290: Add the error code to logs in start_streaming
>=20
>  .../bindings/media/i2c/sony,imx290.yaml       |  24 +-
>  drivers/media/i2c/imx290.c                    | 537 ++++++++++++++----
>  2 files changed, 442 insertions(+), 119 deletions(-)
>=20
>=20
> base-commit: 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


