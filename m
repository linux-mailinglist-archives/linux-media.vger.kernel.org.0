Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448276BD27A
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 15:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjCPOii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 10:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjCPOii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 10:38:38 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE2E34023
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678977516; x=1710513516;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UMzb03NhjG2Ncc6/pCDgUgivpELG9yRnaliMyFrDCwo=;
  b=NyChY7j1W7n4H8Z7HvJcBDXcMmOyAT7AFLP6lMvtQUmCzw6C1VUXx1hV
   EPQJksBPjOz18gAbdOfhDYXsoEoqGpCR+TFedcuDzOqqYUwZfg9Jxsk1m
   3Xdj6x/RdV8SWfknWVdONK1isswEsF5tYPK3t7zFNkrlEoQREsgME9/vn
   Qb14/Vu+eEyYMW0tjXHR5EdTLTmCv0HsMgYngyT0u3zkZcXbvBmGz5m+0
   fYoP6FCAI3i5HYjK04ZBh9IfquyCmVnjvPMEHWHuBFFbVD9QGNe7DhjhJ
   1KlPGWjjLoF+gzjiZU+PITlgTim5oOaDWPHGCguakPslUp7JEJ0W6GrBa
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29742382"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2023 15:38:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Mar 2023 15:38:34 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 16 Mar 2023 15:38:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678977514; x=1710513514;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UMzb03NhjG2Ncc6/pCDgUgivpELG9yRnaliMyFrDCwo=;
  b=S7ScZKcAyBDsgkzkLnt3GYT1Cx+J4zMwWOBvRhb1zNlSWsi1EtmcDFOZ
   1QK523UGsL2UGRaFLtutJHil2o2HChFYSIjJhMyKXDkE22ow2vzZT1u28
   LXSGrsJCLHzP3VXCL7TJg8dpQM0UfnTf80SagSDTbMCWBN8qRIikGNTgq
   c2hxwbkw6FYy0lXahb64KF83Lz3g9j7Ktifj4ZeOXV7ra7LF8RRUuG3b8
   fKtXdpnxM437FA+t+ICmuFCuHVMhryK4MUZ0e+3MQT+uIXqKT9IUK+/vW
   L8UMm1wFen4UYk10vQ2WWw28OgSGGP95+AHvpAFxwx5PXmQQLsuPOAXOY
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29742381"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Mar 2023 15:38:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E389B280056;
        Thu, 16 Mar 2023 15:38:33 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] imx7-media-csi: small cleanup
Date:   Thu, 16 Mar 2023 15:38:26 +0100
Message-Id: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
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

Hi all,

this is a small series for 7mx-media-csi cleanup. Namely early return
when invalid v4l2_buf_type is passed.
Also init v4l2_field during initialization.

Regards,
Alexander

Alexander Stein (3):
  media: imx: imx7-media-csi: Fix mbus framefmt field init
  media: imx: imx7-media-csi: Fail on invalid type in VIDIOC_G_SELECTION
  media: imx: imx7-media-csi: Fail for non video-capture formats

 drivers/media/platform/nxp/imx7-media-csi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1

