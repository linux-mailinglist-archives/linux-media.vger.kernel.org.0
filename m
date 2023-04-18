Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 248366E5A2C
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 09:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjDRHOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 03:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjDRHOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 03:14:51 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6ED71BDC
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 00:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681802089; x=1713338089;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aplC/R8aIo9CPn0ymih9XPRBTFWzmKEt0bJtd3WF3E4=;
  b=E7YG4h/jWtUs6fRUuTNi2VpdhPt0FvJHWoM8/ey3M8XOB8dPEPOXnK03
   YFHpgmcsdorPJF9Os0f5GVF9hhvO2Gs8MAvOiAB+D4GcL2M7/escRxW2O
   YgM39LN+ZkrsLnR19ju/CgPmC9XT6waaO2mxVMDaufjOu9J/6JdcXUwTH
   BP97U/Wmi2fqV80OE0c0/sBsFhS3KwnQjM5CsMiH+n6U3cv16FSO9CFkQ
   n+8EVjkn3sokpzt4QJrELBSExE3n5PQXoXK49XuJAU01Ipo23VsZ3woor
   94d+NLkIBE1165DhGGWNLAFzNe2hwyhMeqYQGwxVKI5QG1xf6Z/dlWgXX
   w==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30385552"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 09:14:46 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 09:14:46 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 09:14:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681802086; x=1713338086;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aplC/R8aIo9CPn0ymih9XPRBTFWzmKEt0bJtd3WF3E4=;
  b=hppTPFpTJvNqEhF0gK3o2Wzt8nM3Pb/ZMdffMHvsW2T123rmuWP1wYUO
   W6y8zkXCkK3/bs+uKgycotVtiViTprGPC23HWGseS6NkUYKlvakSVSLXS
   JbaZ+F8x3DAqPoJNBi35iV1811eObBNA+d3aVmkkcwlhqoux634yVAGC+
   SFsc3ueuXmEADVz5r5J3O2sGm3i+2idEvTOfk7w46abxw8GurNxphpOf2
   bR3ANgXsxE5+TBX+B0a2OVlo5RrQ5AD1UeX1TJ0kgPbYIEChTNwryFkhN
   yijeKde0K78eyjBeSLWqVTYfy2kp2Zwm2NbImfw5BIUrF+UFz8vk3Y6Ny
   A==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30385549"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 09:14:46 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 64540280056;
        Tue, 18 Apr 2023 09:14:46 +0200 (CEST)
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
Subject: [PATCH v2 0/3] Fix imx7-media-csi format settings
Date:   Tue, 18 Apr 2023 09:14:36 +0200
Message-Id: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
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

Hi all,

this v2 splits the previous patch ([1]) into dedicated patches.
Patch 1 removes the calls for converting the pix_format to mbus_framefmt and
back again while applying the hardware limits to width and height.
The bytesperline and sizeimage fields are set correctly as well.
Together with patch 2 v4l2-compliance errors are gone.

Best regards,
Alexander

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20230406135637.257580-1-alexander.stein@ew.tq-group.com/

Alexander Stein (3):
  media: imx: imx7-media-csi: Get rid of superfluous call to
    imx7_csi_mbus_fmt_to_pix_fmt
  media: imx: imx7-media-csi: Remove interlave fields
  media: imx: imx7-media-csi: Lift width constraints for 8bpp formats

 drivers/media/platform/nxp/imx7-media-csi.c | 22 ++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

-- 
2.34.1

