Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F431AD6FA
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgDQHID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:08:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728698AbgDQHIC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:08:02 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E40ED221F7;
        Fri, 17 Apr 2020 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587107282;
        bh=b5nw/cypuMOVWxhnvLyVdRg0uHDAxnO+NY+IaA0SAuU=;
        h=From:To:Cc:Subject:Date:From;
        b=I0SrMPiy1JgtZkKn59m5Iil9sbmE+xQdsD7fy8k6FZCInB8NxRASOx6eGL150IyxA
         2ZeHTNqL9t8HRFHgnezwyohfhVxtRTit5lz9D16R2cFqK8fIB+3UHbbNEKjTIss3cl
         KeuWI7eljQj0NhxedM3cDTquSmQcB1EbQX8bV6/0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPL6V-007nc8-Oz; Fri, 17 Apr 2020 09:07:59 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] media: cec: don't select PCI & DMI
Date:   Fri, 17 Apr 2020 09:07:57 +0200
Message-Id: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While select would be a great idea for most archs, this
causes a breakage with s390:

	"I don't think that's a good idea, as it suddenly enables selecting all PCI
	 drivers on platforms that do not have PCI.

	    WARNING: unmet direct dependencies detected for PCI
	      Depends on [n]: HAVE_PCI [=n]
	      Selected by [m]:
	      - CEC_SECO [=m] && MEDIA_CEC_SUPPORT [=y] && (X86 || IA64 || COMPILE_TEST [=y])

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/platform/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/Kconfig b/drivers/media/cec/platform/Kconfig
index 2c4dd7401dd8..350533cd8261 100644
--- a/drivers/media/cec/platform/Kconfig
+++ b/drivers/media/cec/platform/Kconfig
@@ -100,8 +100,7 @@ config CEC_TEGRA
 config CEC_SECO
 	tristate "SECO Boards HDMI CEC driver"
 	depends on (X86 || IA64) || COMPILE_TEST
-	select PCI
-	select DMI
+	depends on PCI && DMI
 	select CEC_CORE
 	select CEC_NOTIFIER
 	help
-- 
2.25.2

