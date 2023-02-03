Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4342689696
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 11:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbjBCKZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 05:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233471AbjBCKZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 05:25:21 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A928C1D6;
        Fri,  3 Feb 2023 02:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675419896; x=1706955896;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R+eLmORD+0rW/2s7vE0AZji0mukDMbdK7TGsIj7PzWQ=;
  b=E17wm3dg71nAqZCDZMAmlBc1diAr6wG3XlTdl5SpraioHY/zZVTdJ19E
   m5Osg8oMw88rQdMcyPC2V0U4Px5lOALnMvZ23ybi4Y8D2Na9su2phEB5U
   BeIVgAG4Zyadmbp/DSZ/v0BKUCkJO35QefhW26BgHTCzLurTir6NBYKHC
   GT8w8G54Gi7ZB3RD8/Ynqo+IpdO20JD8ubizdthCfCZrclXI5khVIUlh4
   RSTNEX3ppwQmctgsYiY9ZTmip5BEM+Uf5gkBryRlf+MVfAH2Spjrwk+XM
   F9Bn8v4HR3t3t011QE7+ImbklKJLKqMD1Za8hlfTjTFYBpoqsAy4Fnrms
   w==;
X-IronPort-AV: E=Sophos;i="5.97,270,1669071600"; 
   d="scan'208";a="28851849"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 11:24:46 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 11:24:46 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 11:24:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675419886; x=1706955886;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R+eLmORD+0rW/2s7vE0AZji0mukDMbdK7TGsIj7PzWQ=;
  b=ZYATnYUlCUxa6nz5xHsm6VgZsEx+9fqN3doMFUoewmAQ4iHb4u6wDtsL
   ga6zCeBlWcD3/iWPKOpVQ1XLFw+jRAYLfdhKpd5UTilTeVpK2Nqa+kZ7q
   yhP4C0w4CIPaVhrXuwQ9T3WwT2/+d9CrQj6iAioSQ39p78vnlXrnU3WSF
   02jNb0Cdk23vorIiUB41qFN3ghBR9zVfj65OXonTpHe74eBdxfRjkahaO
   IJ57bIGYcbc6QI6HIIwZydK5KhWsWCw02xJnn/iAShm82MKph9j93ZK0G
   yh8iQ6cQWzh4UwfJTW75JemEg/L4CKGzmBEkDxBoYcFoN6Y3979NH/y8U
   g==;
X-IronPort-AV: E=Sophos;i="5.97,270,1669071600"; 
   d="scan'208";a="28851848"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 11:24:46 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AC7BC280056;
        Fri,  3 Feb 2023 11:24:45 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: imx290: imx327 support
Date:   Fri,  3 Feb 2023 11:24:37 +0100
Message-Id: <20230203102439.237527-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this series adds support imx327 to existing imx290 driver. The differences
in specs is that imx327 lacks support for 8 lanes LVDS (LVDS not used in
driver anyway) and 120 FPS (currently only 60 FPS supported).
Although just magic numbers, imx327 has a specific set of init register to
be written.
This series is based on [1] and [2] which adds imx290-mono support.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-media/20230131190700.3476796-2-dave.stevenson@raspberrypi.com/
[2] https://lore.kernel.org/linux-media/20230131192016.3476937-3-dave.stevenson@raspberrypi.com/

Alexander Stein (2):
  media: dt-bindings: media: i2c: Add imx327 version to IMX327 bindings
  media: i2c: imx290: Add support for imx327 variant

 .../bindings/media/i2c/sony,imx290.yaml       |  1 +
 drivers/media/i2c/imx290.c                    | 88 ++++++++++++++++---
 2 files changed, 78 insertions(+), 11 deletions(-)

-- 
2.34.1

