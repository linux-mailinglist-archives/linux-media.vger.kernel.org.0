Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABC05B6B26
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 11:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiIMJsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Sep 2022 05:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiIMJsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Sep 2022 05:48:16 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B40B1D0D9
        for <linux-media@vger.kernel.org>; Tue, 13 Sep 2022 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663062494; x=1694598494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I9sUeB9m/lQWEW35aDTql8wUzNkpzyJLnhfsnQZILyw=;
  b=VxCh8k8UlqPfcojmPeZJBzPaU3u9stip65w4qoE1oWWRXXylv65Klga9
   i9NAPpCNB/aDuIUtoEtjAlJOZHyqJg4uae4rQZtaO4b5ZLQ0PHMo2ttwa
   dDT8sTuGsrd0oMBJiJ85FNecQEc1kJIxGhaxXjGUS2RTQGOZqdsv3L5Hb
   xR43Y4rbnFAu1J0LZmMMnjwgKB+Xi33vK1slV6CBFiYqsL66LENvbI4Iy
   ey6oUgSo3V7ZxEdZVCvI4+XVGv7XUOy4XD0kutFH144oBgouur8r5Oe36
   eiX9k7Et5lZ3IQx3kxAfiV1qBFSYgRyiBNYcm7PJ4R2o7hV8jCwoLQUpH
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,312,1654552800"; 
   d="scan'208";a="26145423"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Sep 2022 11:48:12 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 13 Sep 2022 11:48:12 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 13 Sep 2022 11:48:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663062492; x=1694598492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I9sUeB9m/lQWEW35aDTql8wUzNkpzyJLnhfsnQZILyw=;
  b=ij8fLwsNz0xy6t4qycDjUCQ+9c2qIEJF4uV1Jyd6R81dFDrFXYttRDIk
   H7sEbAGTvBAAft5ugEBeAwXZUWhBp4YrFX/k5fUNXkaxNfOJjO6G4vlxE
   fCzDdLnMDKF6M3yXsc0lX78TKwcWSuUwjy3Td8o2wGlFDZXTCCf3f+jIo
   K1A6QyN9RpHW0QxB7kRxk+wdNf0H+HJ0LGJJo4TCFSMyaf/jVGe3E/yoT
   Xvt+oMJwR2aAJHY/mnJyw5AarDjGQYVE+KaNx1asbV9LgaglQYbJblteK
   7W4WLgS+XbsfGENGX4Ak/8/QPfZQaa/X3LkEKZPq9QCoquosd7yK2n1fk
   w==;
X-IronPort-AV: E=Sophos;i="5.93,312,1654552800"; 
   d="scan'208";a="26145422"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Sep 2022 11:48:12 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D78C3280056;
        Tue, 13 Sep 2022 11:48:11 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 0/6] media: imx: imx7-media-csi: Destage driver
Date:   Tue, 13 Sep 2022 11:48:09 +0200
Message-ID: <4740951.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for the patch and putting in some progress.

Am Mittwoch, 7. September 2022, 22:04:18 CEST schrieb Laurent Pinchart:
> Hello,
> 
> This patch series is the last step of the imx7-media-csi driver
> destaging journey. Patch 1/6 starts by decoupling the imx7-media-csi and
> imx8mq-mipi-csi2 drivers in Kconfig, and patch 2/6 performs the
> destaging. Patches 3/6 to 6/6 then handle the low-hanging fruits of the
> staging imx cleanup by dropping features that were only used by the
> imx7-media-csi driver.
> 
> The patches apply on top of [1].
> 
> https://lore.kernel.org/linux-media/20220907191547.19255-1-laurent.pinchart@
> ideasonboard.com
> 
> Laurent Pinchart (6):
>   media: imx: Decouple imx8mq-mipi-csi2 from imx7-media-csi
>   media: imx: Unstage the imx7-media-csi driver
>   staging: media: imx: Drop imx_media_subdev_bound()
>   staging: media: imx: Drop IMX_MEDIA_GRP_ID_CSI
>   staging: media: imx: Drop unused helper functions
>   staging: media: imx: Make imx_media_of_add_csi() static
> 
>  MAINTAINERS                                   |  2 +-
>  drivers/media/platform/nxp/Kconfig            | 13 ++++
>  drivers/media/platform/nxp/Makefile           |  1 +
>  .../platform/nxp}/imx7-media-csi.c            | 24 +++++++
>  drivers/staging/media/imx/Kconfig             | 17 +++--
>  drivers/staging/media/imx/Makefile            |  3 +-
>  drivers/staging/media/imx/TODO                | 29 --------
>  .../staging/media/imx/imx-media-dev-common.c  | 14 ----
>  drivers/staging/media/imx/imx-media-of.c      |  5 +-
>  drivers/staging/media/imx/imx-media-utils.c   | 68 -------------------
>  drivers/staging/media/imx/imx-media.h         | 13 ----
>  11 files changed, 52 insertions(+), 137 deletions(-)
>  rename drivers/{staging/media/imx => media/platform/nxp}/imx7-media-csi.c
> (97%)

I could test this on TQMa8MQ (imx8mq) based platform with an OV9281 gray 
camera. I had a lot of frame drops when showing on wayland, but a 
fpsdisplaysink combined with testsink showed ~36 FPS. This is the same as 
before this series.

So I guess, you can add
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>



