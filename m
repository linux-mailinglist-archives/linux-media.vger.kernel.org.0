Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F079F69A89D
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 10:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjBQJwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Feb 2023 04:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjBQJwh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Feb 2023 04:52:37 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0344E5F257;
        Fri, 17 Feb 2023 01:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676627556; x=1708163556;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ethMpkCcbDeOCL9P9gasiZPA+cPLSWjnQDLBlY1hqWM=;
  b=VPcSbKq01W9w+tNwnpaSYS5SIPfKT8mTAH2rJeOj59ZZoYB3fzu6ZjKj
   ZFA+3oXrXVRWhJ6Hnl5lXD0BAJJKsGdOnv8BS3wSVOOUUbNjfgXz9VFR5
   hiu+HDUmuCA9l5dLsvTu1vxACe8ST/gzDLcjj7iczWlf3p1Pr87NjdQNs
   aNTmIiQ99UivZtojrk5QTElrFwdSIZ4eTyPf3mcnRyca457dtxsC+VN4F
   tp9VIhUz56SLw0BrlFReM+k1jV3Mjq1d3Py/Ujf5K7Qp65/5LD3afO+Sl
   UTEdNDshvsksG3oAKwrrwtmibk0lbdUzRkwjNyO50EziE/Zj/pHn9Qr6k
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29151772"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 10:52:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 17 Feb 2023 10:52:34 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 10:52:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676627554; x=1708163554;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ethMpkCcbDeOCL9P9gasiZPA+cPLSWjnQDLBlY1hqWM=;
  b=QfIXv81R1v2tZ9e6tIbe8aTXIV4ey+/KEaaVf4xqbbrt4rUA2LxqNzqk
   RWCvnzoJV/NcG1c6L7875utVMDnAg4g0XBQXQzSXo/x11y/EOXZZCqYRy
   puf/CwNa+l97wIhFH4dCpHZYM82kSuoz5Bxg4wVXoFtIcVT/paE3beGS0
   pNN2jVLWa1/nCpu58STACNelxSW1eYbUAchZp8yP3gllUls5ot+tR45my
   tZ7AkE2fC2I3BXlZEMsjrIQ8wTNyVwg3wrgNfVh4jaekC2DYLwa2Cqy+a
   gv/r/OfWES3DikOvipSxR/nWKkkf5qZ1NP0xl+VgbjVDbBZ1DP5CDT1Iv
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29151771"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Feb 2023 10:52:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BBC88280056;
        Fri, 17 Feb 2023 10:52:33 +0100 (CET)
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
Subject: [PATCH v3 0/2] media: i2c: imx290: imx327 support
Date:   Fri, 17 Feb 2023 10:52:19 +0100
Message-Id: <20230217095221.499463-1-alexander.stein@ew.tq-group.com>
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

this is the next version for supporting imx327 sensor.
Changes in v3:
* Rebased on top of Laurent's collected series [1]
* Add model-specific initialization registers to struct

[1] https://lore.kernel.org/linux-media/1924202.PYKUYFuaPT@steina-w/T/#t


Alexander Stein (2):
  media: dt-bindings: media: i2c: Add imx327 version to IMX327 bindings
  media: i2c: imx290: Add support for imx327 variant

 .../bindings/media/i2c/sony,imx290.yaml       |  1 +
 drivers/media/i2c/imx290.c                    | 44 ++++++++++++++++++-
 2 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.34.1

