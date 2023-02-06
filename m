Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFAC68BDE6
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 14:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjBFNTe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 08:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjBFNS4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 08:18:56 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC01A7D8B;
        Mon,  6 Feb 2023 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675689473; x=1707225473;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3T2sh+1/gXnBbq51CiWyI7Py4emLBRAdMYK9kSDZRyE=;
  b=mRZuf42kZqPweLJDojz6PZo0f6D3uLECobABkJ8Br67+AXKzVHAJ6yEw
   SPqsOAPwHpxal/CrFeHdcDCHgWCHLac/z7zERizY1Q7B7KyG25py8xPGZ
   gnkOC95N2B4MKqblaW5tmy2r9HxzxGDPzW/dEvpuCLQ1RAhe+JcxwWW+B
   UGFcfsp2Ltw9DcS/GFZZl68rHa2sVyj6E9eHSvbcKmfWXMzjBTmACMwIy
   KeMXzd2bHuiDeiad3RoqHE/GxfVTDOe4FJVW+Yz/3WPXWKN/gTh4glw/t
   Af8UWewryVs1tDM17TKXEyVRcKOQEAj188eREMU3xdDw2uPgjNxwcnFBf
   w==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28891873"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Feb 2023 14:17:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 06 Feb 2023 14:17:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 06 Feb 2023 14:17:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675689461; x=1707225461;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3T2sh+1/gXnBbq51CiWyI7Py4emLBRAdMYK9kSDZRyE=;
  b=GO7x70pjP11Bt3nhGPHsM+VufRq/kwjICllhjiV677ta/fF3IRa6N8bX
   WxGAT7kw2TSWqt/+8O0NIeg6h7PMysJzerdPjYISeXFysc4mF51pzOO5f
   5LEw2iXJHny7iWED0DvrzabLCW6pBvtSu/Tyyp/OlbzRVRNym4p1JBzJg
   nH5/fdTpq/FBpt6ScnYgOQMJRjHyGDKwS815dAeBotLs5fabGXlG4gi0g
   /zaY3Kxi7PB3Az+bqhPaBBmLCUgMSOTjhryZw4OC/d5DubU9BHNLfICnX
   sickdwdk+eQLrECDZOGu+f2XXP3p3JXtPbQM6ad3cT6nb72OGy58g29x7
   A==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28891866"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Feb 2023 14:17:40 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 353AB280074;
        Mon,  6 Feb 2023 14:17:40 +0100 (CET)
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
Subject: [PATCH v2 0/2] media: i2c: imx290: imx327 support
Date:   Mon,  6 Feb 2023 14:17:29 +0100
Message-Id: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Switched compatible to sony,imx327lqr
* Rebased on top of Dave's updated series
* Split some register writes into common and device specific lists

[1] https://lore.kernel.org/linux-media/20230203191644.947643-1-dave.stevenson@raspberrypi.com/
[2] https://lore.kernel.org/linux-media/20230203191811.947697-1-dave.stevenson@raspberrypi.com/

Alexander Stein (2):
  media: dt-bindings: media: i2c: Add imx327 version to IMX327 bindings
  media: i2c: imx290: Add support for imx327 variant

 .../bindings/media/i2c/sony,imx290.yaml       |  1 +
 drivers/media/i2c/imx290.c                    | 58 ++++++++++++++++++-
 2 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.34.1

