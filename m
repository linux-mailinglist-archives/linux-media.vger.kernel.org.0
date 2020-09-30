Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C3627EB99
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 16:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgI3O7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 10:59:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:55570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728149AbgI3O7C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 10:59:02 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B9E0206FC;
        Wed, 30 Sep 2020 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601477941;
        bh=N3+Tsm9Pra0YyIgpFUdp71awF/rV5GQVgS+yl8d0qVY=;
        h=From:To:Cc:Subject:Date:From;
        b=vLpj+RcfO30czrtNpRn5GHE+/O7zk0zp7NQXq8+o1wz5Xl2Za3WSDPcGgoGdpKNee
         wPHyE9Fhl1Va2PuO608hKUxCo+A8vxE1zEy4efK2UOrWS4u97YiqOdhw1miKR2saUH
         +plAKBea6zu7bu29pLEH+0KjqqrKz1SwHGLYaszI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNdZK-001Yd3-Pm; Wed, 30 Sep 2020 16:58:58 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fixes a breakage due to a cleanup patch
Date:   Wed, 30 Sep 2020 16:58:54 +0200
Message-Id: <e0bc43fcada40dc1c7cd1b77e40b429641c7ca66.1601477929.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A temporary var needed for building with ISP2401 was removed
by accident on a cleanup patch.

Fix the breakage.

Fixes: 852a53a02cf0 ("media: atomisp: get rid of unused vars")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index e8c5caf3dfe6..8e4e82a97098 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1365,7 +1365,6 @@ start_binary(struct ia_css_pipe *pipe,
 {
 	assert(pipe);
 	/* Acceleration uses firmware, the binary thus can be NULL */
-	/* assert(binary != NULL); */
 
 	if (binary)
 		sh_css_metrics_start_binary(&binary->metrics);
@@ -1381,7 +1380,7 @@ start_binary(struct ia_css_pipe *pipe,
 #endif
 
 #if !defined(ISP2401)
-	if (stream->reconfigure_css_rx) {
+	if (pipe->stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
 					 pipe->stream->config.mode);
 		stream->reconfigure_css_rx = false;
-- 
2.26.2

