Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD0F1A7907
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 13:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438876AbgDNLAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 07:00:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:38428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438846AbgDNLAH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 07:00:07 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BE1F2072D;
        Tue, 14 Apr 2020 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586862006;
        bh=eC+5cRV6ipOWR8MeZlhnJO4MliXEMvFtGb/1ilRcW5w=;
        h=From:To:Cc:Subject:Date:From;
        b=WfuBd6RJU+LX8STj+rJ+7Q1cOpH2SdxyKlNq/dUM9AztLPJFyI+PvbTi1xLrXTFPB
         eWTkl9C4Kx5Euq9xbtZGIeVzEvqFSRz9ENJgSvxC9GJ5vvkmluUc+kPe/VY2ZhPj8U
         FV1ZebnRBAx0byOZJs4y9nm28+mJqSClB2uys7IQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOJIS-005zbb-AA; Tue, 14 Apr 2020 13:00:04 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] media: docs: fix some broken references
Date:   Tue, 14 Apr 2020 13:00:03 +0200
Message-Id: <ec16d2ab4d0bb0344ae6aab74d642f813984b737.1586861981.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some media files got moved. Update the corresponding
references to the referenced files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/drivers/vimc-devel.rst | 4 ++--
 MAINTAINERS                                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/vimc-devel.rst b/Documentation/driver-api/media/drivers/vimc-devel.rst
index b2aa2ee79205..1584abba6ee0 100644
--- a/Documentation/driver-api/media/drivers/vimc-devel.rst
+++ b/Documentation/driver-api/media/drivers/vimc-devel.rst
@@ -9,7 +9,7 @@ Source code documentation
 vimc-streamer
 ~~~~~~~~~~~~~
 
-.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.h
+.. kernel-doc:: drivers/media/test_drivers/vimc/vimc-streamer.h
    :internal:
 
-.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.c
+.. kernel-doc:: drivers/media/test_drivers/vimc/vimc-streamer.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 0cfd86594b0b..db9937643a6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5125,7 +5125,7 @@ X:	Documentation/ABI/
 X:	Documentation/devicetree/
 X:	Documentation/firmware-guide/acpi/
 X:	Documentation/i2c/
-X:	Documentation/media/
+X:	Documentation/admin-guide/media/
 X:	Documentation/userspace-api/media/
 X:	Documentation/driver-api/media/
 X:	Documentation/power/
@@ -10609,7 +10609,7 @@ W:	https://linuxtv.org
 Q:	http://patchwork.kernel.org/project/linux-media/list/
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/
-F:	Documentation/media/
+X:	Documentation/admin-guide/media/
 F:	Documentation/userspace-api/media/
 F:	Documentation/driver-api/media/
 F:	drivers/media/
-- 
2.25.2

