Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011F77622E5
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 22:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjGYUCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 16:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjGYUCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 16:02:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A723A12E
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 13:02:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E4C6982;
        Tue, 25 Jul 2023 22:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690315303;
        bh=453MTYtJP4nvuJZ3XdwieMpiBQ25wtsefDR8XT3OZqk=;
        h=From:To:Cc:Subject:Date:From;
        b=H5Ud84yS+69vtrLe9rC10HWDFOMA0Ds3B5hQX8m4ZwykXF2aRcfETOh8X3lGbZ4qp
         jYKab3FOk25beE/18eMBqdXMSnH4HSjzD6f5MPRrrD7dNswk7V2MVLXsnwca8kT6/y
         rYhVs0l7OQsVGrmpxKNAezWmLTbqUnls02S+MDTU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Fabio Estevam <festevam@denx.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Martin Kepplinger <martink@posteo.de>,
        Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v3 0/3] media: imx: imx7-media-csi: Fix width alignment
Date:   Tue, 25 Jul 2023 23:02:46 +0300
Message-Id: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series is an attempt to fix the issue reported by Tim Harvey
in [1].

Both Alexander Stein and Fabio Estevam gave this a try in [2] and [3]
respectively, with Alexander's self-nacking his patches and Fabio's
solution receiving requests for changes during review.

Compared to those attempts, this version implements a simpler fix for
the issue (in patch 1/3), before addressing a TODO item (patch 2/3) and
cleaning up includes as a drive-by improvement (patch 3/3).

The series doesn't need to be merged in one go. Patch 1/3 can get merged
as a fix for v6.5, while patches 2/3 and 3/3 can wait until v6.6.

Tim, would you be able to test this ?

[1] https://lore.kernel.org/linux-media/CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com/
[2] https://lore.kernel.org/linux-media/20230720074129.3680269-1-alexander.stein@ew.tq-group.com
[3] https://lore.kernel.org/linux-media/20230720222543.1740198-1-festevam@gmail.com

Fabio Estevam (1):
  media: imx: imx7-media-csi: Fix applying format constraints

Laurent Pinchart (2):
  media: imx: imx7-media-csi: Fix frame sizes enumeration
  media: imx: imx7-media-csi: Include headers explicitly

 drivers/media/platform/nxp/imx7-media-csi.c | 48 +++++++++++++++------
 1 file changed, 34 insertions(+), 14 deletions(-)

-- 
Regards,

Laurent Pinchart

