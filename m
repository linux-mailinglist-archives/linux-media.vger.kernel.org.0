Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B126C2B53
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 08:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjCUH1R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 03:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjCUH1Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 03:27:16 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6BC32525
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679383633; x=1710919633;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5tj+Rl7lduu+hi0CK2BCupc6YDQEEyaBypzY7B35iP8=;
  b=IXzuw5xDyyjSM4ig33UqGHUQYFzk6WhO1K8zOx4NmYmgHKdp1vKVlWm6
   ksTiPkQmlU5odpQStSFpM4xzq7VaeM4mKgZ1erbnRlDJCJAwqQTVjiRPa
   RFGwE8Fni8rKS5EOfRZ5K53yxB4oyu9zFKXMCPPgF6DPurZZvwsqGEKkH
   A7MOzRgmmZOGzfO0DoYIvz8Yz2TpPbiMCYCbCw1MO6dunXzkgVF2y/jjw
   2CnxkGkuagc3Fw/t1kzNg4dqnykzHZ6f24jVeWrl5VAbS66jXDQjEW74e
   naXqsVCldrRyHyBUAGqHhS+TtngUHLN6k1zrAJ8KsyDl0cDG3DWp8JpNb
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29819253"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Mar 2023 08:27:11 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 21 Mar 2023 08:27:11 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 21 Mar 2023 08:27:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679383631; x=1710919631;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5tj+Rl7lduu+hi0CK2BCupc6YDQEEyaBypzY7B35iP8=;
  b=ZKIeW/Bbqlo8fy5WzkGoGLq3Rx0lDVNB8pKBAzdbQHrihJslhx5Cp0q1
   yTExwPE0Fh+byIaNv4Zl/aPqTcIE+4D0vbGEe6295AlwVDdIgi+whXQco
   2SXWOYgXyC0IzzwDYxQ536blJ5aHKSbXZWk7SX3KBrFzzZaSVla7N7SRx
   kpvsq8P7jUExQwJ+5qrE5Og8eJF6V++oHb5uSEtmBGelO75RlW+tJlcHf
   G970e1N1F33Kr7EBjFHlAfP8k45jzeINMgf5d6QIIFn0TXS04n5dKi2NA
   QoH+G2G0vmQe2LJyPcxCXi8xnvSdmyfj1LPhXTnKIE97SlnCQPR4AOBOs
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29819252"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Mar 2023 08:27:11 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DBFB9280056;
        Tue, 21 Mar 2023 08:27:10 +0100 (CET)
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
Subject: [PATCH v2 0/2] imx7-media-csi: small cleanup
Date:   Tue, 21 Mar 2023 08:27:05 +0100
Message-Id: <20230321072707.678039-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

this is v2 of a small series for 7mx-media-csi cleanup.
Changes in v2:
* State the reason for patch 1 in commit message
* Drop 'Fixes' in patch 1
* Collect R-b in patch 2
* Drop patch 3. it's superfluous

Regards,
Alexander

Alexander Stein (2):
  media: imx: imx7-media-csi: Fix mbus framefmt field init
  media: imx: imx7-media-csi: Fail on invalid type in VIDIOC_G_SELECTION

 drivers/media/platform/nxp/imx7-media-csi.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.34.1

