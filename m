Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8326E73A2
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 09:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjDSHHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 03:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjDSHHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 03:07:19 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE5A2710
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 00:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681888037; x=1713424037;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NmaMLAIHU7t2jFw8AlIYeO25fV89EXz/wQW5i4dg0hk=;
  b=gSnY04KL5lC8hGUA4q4yvRSYrrzbSYGtQFP+ff7CXIhFUWG7zvMTKaxy
   GYm4+OVkmoKNIH8ApaXLXo4OrXau7FdigqOtGaB5668Q6SREI/IKrSuP6
   oEwFW6coXrGgOF5biloOXpYn59+lHkhncv/4r9ga9MLM1xig2zCHlVmtS
   rUmJMEDN20LEt4g2DUQKpP04WdfsVh1POaK9XhEhzTfvFoDGCSR/I4iZU
   qnR/CFBLl/3lfv0hCkpYvjPu3ajeJCfbEMYd5b3vBGO6jkhznSi2oU5q6
   Hyn6rPfUpWuNhmjb+iSyE1ftvAB9kAXBv4+uP6IKaCcmQgbqt9qTmSRIk
   w==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415565"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Apr 2023 09:07:16 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 19 Apr 2023 09:07:16 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 19 Apr 2023 09:07:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681888036; x=1713424036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NmaMLAIHU7t2jFw8AlIYeO25fV89EXz/wQW5i4dg0hk=;
  b=XVIwn0nwzvbMTG59aiOwEh5cSn9q5crndYeX0tl4oSAuQCnu4HVyi8Lh
   uWKkb0yPbwhLnCVKKI+tHIqcuFzqRVTJXCSgRRABEeTEcGBR4Nhl3kZyy
   63SBneoDirqnuRtLZFZD5LC0UgWO1ye5sseQASlCKJLZj2zA4ZsRMzLJF
   l5C/1b7zjhkwgKyZD/62gsHsLgcveOK81CiDRaG4OGyLJhU6h5zvTLpFd
   EisLjfpBmf7mocBnj5rT38bdIxWYrwGqA5d9XQ2Iqh6EkUqia+xpbCoM5
   fs85i/fuEOiWcX2vbHxu+CMUtO3pvaZoBrerqM36hWiZTF/PiCFYz3o/C
   g==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415564"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Apr 2023 09:07:15 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BBAE6280056;
        Wed, 19 Apr 2023 09:07:15 +0200 (CEST)
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
Subject: [PATCH v4 0/4] Fix imx7-media-csi format settings
Date:   Wed, 19 Apr 2023 09:07:08 +0200
Message-Id: <20230419070712.1422335-1-alexander.stein@ew.tq-group.com>
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

v4 also incorporates feedback and improves commit messages a lot.
Patch 3 is simplified now with hardware alignment constraintd being figured
out.

Thanks,
Alexander

Alexander Stein (3):
  media: imx: imx7-media-csi: Get rid of superfluous call to
    imx7_csi_mbus_fmt_to_pix_fmt
  media: imx: imx7-media-csi: Remove incorrect interlacing support
  media: imx: imx7-media-csi: Relax width constraints for non-8bpp
    formats

Laurent Pinchart (1):
  media: imx: imx7-media-csi: Init default format with
    __imx7_csi_video_try_fmt()

 drivers/media/platform/nxp/imx7-media-csi.c | 94 ++++++---------------
 1 file changed, 24 insertions(+), 70 deletions(-)

-- 
2.34.1

