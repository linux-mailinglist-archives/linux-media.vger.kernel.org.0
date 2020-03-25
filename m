Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA377192DB5
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 17:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgCYQEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 12:04:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:53246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727843AbgCYQEB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 12:04:01 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBD8220409;
        Wed, 25 Mar 2020 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585152241;
        bh=0OrqQVURmIfTXMZYOFnLj+Igl8DvlJdPmwTyYoCWlo8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H5RJP+LW5AC4zaNBoUKz801vKPvthyccL/jILpApM61sl9SMDiAgEC5yFNyPYzSxz
         AXlGL8FRcpTgdT0caOAVGv2JMvLAnFn9TX24RkTCimeHoMQAR8BprbG3CjCAvH6Dip
         Cq3WaadQgIOsmi/jkeFcD8okymJFJNUVx72weAik=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH8Va-003MJB-L9; Wed, 25 Mar 2020 17:03:58 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 1/4] media: dvb-core: Kconfig: default to use dynamic minors
Date:   Wed, 25 Mar 2020 17:03:54 +0100
Message-Id: <630569cfba15fb7c35eb5092c1eebb8467b33908.1585151701.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585151701.git.mchehab+huawei@kernel.org>
References: <cover.1585151701.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All modern Linux distributions nowadays use udev or some
alternative (like systemd). So, it makes sense to change
the default to use dynamic minors.

Please notice that this default doesn't enable any code.
It just changes the dvb-core behavior.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 0f8e53692b86..6ffac618417b 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -45,6 +45,7 @@ config DVB_MAX_ADAPTERS
 config DVB_DYNAMIC_MINORS
 	bool "Dynamic DVB minor allocation"
 	depends on DVB_CORE
+	default y
 	help
 	  If you say Y here, the DVB subsystem will use dynamic minor
 	  allocation for any device that uses the DVB major number.
-- 
2.25.1

