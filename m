Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2091F1F8D59
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 07:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgFOFnH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 01:43:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbgFOFnH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 01:43:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D627F2070E;
        Mon, 15 Jun 2020 05:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592199787;
        bh=i+KcznjcHmFJXCMts75e4liweyEkr+LWYq1E5sBldjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hxWwBhqMMBx3qmznipb/y2csGiLWi1WNhOYFFa/PHNKmaNcxazt6OYtWOn1lZewDg
         JfBfku8IMnhAgVsqaFPIvo+gWvgaScSJp3/C2qX16nQQ596fH1C/76oYZaIFahfVeI
         QIUt08pndiHgPuJWifq4HXp2TkNdpIrsOI3x7DP8=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jkhtg-009hQx-Ni; Mon, 15 Jun 2020 07:43:04 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: atomisp: fix help message for ISP2401 selection
Date:   Mon, 15 Jun 2020 07:43:04 +0200
Message-Id: <52b8bb5c7ebf039b4b7f72f250cbe897a0671b34.1592199777.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <a6fa7016f510f13ed6e31052b8bcf83e4680d899.1592199777.git.mchehab+huawei@kernel.org>
References: <a6fa7016f510f13ed6e31052b8bcf83e4680d899.1592199777.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'm pretty sure I named this right, but it sounds that I ended
doing something weird maybe while solving some conflict.

So, fix the title of this config var.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index fea06cb0eb48..37577bb72998 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -22,7 +22,7 @@ config VIDEO_ATOMISP
 	  module will be called atomisp
 
 config VIDEO_ATOMISP_ISP2401
-	bool "VIDEO_ATOMISP_ISP2401"
+	bool "Use Intel Atom ISP on Cherrytail/Anniedale (ISP2401)"
 	depends on VIDEO_ATOMISP
 	help
 	  Enable support for Atom ISP2401-based boards.
-- 
2.26.2

