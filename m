Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD206E6114
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 14:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjDRMUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 08:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjDRMUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 08:20:46 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C541BC0
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 05:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820445; x=1713356445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wMH5dSPZKAzj3Yf2kLYQIfCn8CTqZAJD01dyyK+F6Gw=;
  b=X567eylCDZ4/t2mXdm03dznchugme7O73OKUUi0grBIauuVg8YGnD7nw
   OskC3EfLI4SqWQh4GGaZLpq3HVieCeTFrd8RAfNBVdTY3UOinxvJKTrr+
   fTSKnn0WdMFZSadUJdH5yPS820zfszWn+9UWddmnXgw3q5GVVGfP0Fxu3
   RLhRfxnzukvrNZftn4wGKWalzY0OxIAqAAmyrS+e1kM7H0hJVWmC0uqk5
   MRqP7vMzsamYUv2fVBbF7aTBevybS5/clT1jo7Esp32o7m9fVEmTRaMuq
   EDQfc6SkAbk8GsyYcX1ax65nTqtWPQ00D7S0Jf0bPpPt9UZsWFsIhNuhE
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398469"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 14:20:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 14:20:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 14:20:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820443; x=1713356443;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wMH5dSPZKAzj3Yf2kLYQIfCn8CTqZAJD01dyyK+F6Gw=;
  b=h9OzfVoU6LkBQCyfbr0BeI4KJhiEYSrfbYiiOqsAynVqd85MPbHz7v77
   paq3Stls+NA5TgWoIGG6o3eoLNNhhuTdDy/W+7GVwB8V5t5ExhJbGmmvx
   SNPmTsJNcCWdYTkbg874EKBm2ndU9Oj0e7UN0Bl/hcHHFyvk9V9V8OFkf
   9oCUScH3puoOoNcOElAYqJFaeQwnSfqGz5fyHN/vvxmfQTLKnUiMBtw3A
   5tQb9rPmv2o7aT6ftIm8dHUIKElp2YBxsuyNLCTAoqwtUCDBx3K+MFAlK
   Tt72LMEAmK4MSk1OcUL9CDEtoZ1NVsQ4Riw3mTfN1y05WfiOXprtTsiJ9
   g==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398468"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 14:20:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 08CDF280056;
        Tue, 18 Apr 2023 14:20:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] Fix imx7-media-csi format settings
Date:   Tue, 18 Apr 2023 14:20:37 +0200
Message-Id: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this v3 incorporates feedback and includes a new patch, provided by
Laurent Pinchart.

Thanks,
Alexander

Alexander Stein (3):
  media: imx: imx7-media-csi: Get rid of superfluous call to
    imx7_csi_mbus_fmt_to_pix_fmt
  media: imx: imx7-media-csi: Remove interlave fields
  media: imx: imx7-media-csi: Lift width constraints for 8bpp formats

Laurent Pinchart (1):
  media: imx: imx7-media-csi: Init default format with
    __imx7_csi_video_try_fmt()

 drivers/media/platform/nxp/imx7-media-csi.c | 97 ++++++---------------
 1 file changed, 28 insertions(+), 69 deletions(-)

-- 
2.34.1

