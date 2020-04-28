Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52AD01BC608
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 19:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgD1REH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 13:04:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728089AbgD1REH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 13:04:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACF6120730;
        Tue, 28 Apr 2020 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588093447;
        bh=+BzuoEta3GpkJhXTYu0wLZOwyAEizrEkeMqnK9YrukY=;
        h=Date:From:To:Cc:Subject:From;
        b=Px8EXGW46wQvZImhVdLaAEVzRsdigCFe9OPIo9u6BBPu/ji0c9Nmn9GKXDsiFrNTe
         bgw6v7L30kMNrfoanY8ho7PFz56gIiyxHQg4W5dyrt7Mlmu45We4TAYZ4APiat7q/+
         5m0a5zNLlhVK4v3UMaHDJXg3EP/cvyUTlHf4KEbU=
Date:   Tue, 28 Apr 2020 19:04:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH] staging: media: imx: no need to check return value of
 debugfs_create functions
Message-ID: <20200428170405.GA1649098@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-media@vger.kernel.org
Cc: devel@driverdev.osuosl.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 29 ++++------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index fbc1a924652a..d7c9e7343f1f 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -915,33 +915,14 @@ static int mipi_csis_dump_regs_show(struct seq_file *m, void *private)
 }
 DEFINE_SHOW_ATTRIBUTE(mipi_csis_dump_regs);
 
-static int mipi_csis_debugfs_init(struct csi_state *state)
+static void mipi_csis_debugfs_init(struct csi_state *state)
 {
-	struct dentry *d;
-
-	if (!debugfs_initialized())
-		return -ENODEV;
-
 	state->debugfs_root = debugfs_create_dir(dev_name(state->dev), NULL);
-	if (!state->debugfs_root)
-		return -ENOMEM;
-
-	d = debugfs_create_bool("debug_enable", 0600, state->debugfs_root,
-				&state->debug);
-	if (!d)
-		goto remove_debugfs;
-
-	d = debugfs_create_file("dump_regs", 0600, state->debugfs_root,
-				state, &mipi_csis_dump_regs_fops);
-	if (!d)
-		goto remove_debugfs;
-
-	return 0;
-
-remove_debugfs:
-	debugfs_remove_recursive(state->debugfs_root);
 
-	return -ENOMEM;
+	debugfs_create_bool("debug_enable", 0600, state->debugfs_root,
+			    &state->debug);
+	debugfs_create_file("dump_regs", 0600, state->debugfs_root, state,
+			    &mipi_csis_dump_regs_fops);
 }
 
 static void mipi_csis_debugfs_exit(struct csi_state *state)
-- 
2.26.2

