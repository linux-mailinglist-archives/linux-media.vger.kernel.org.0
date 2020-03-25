Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67C3D1924A2
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgCYJts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727492AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 537BC215A4;
        Wed, 25 Mar 2020 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=Ouxe/ibQ8S33uxJ8KBxRmDCNq+3QeSz9aFGkdkxkarY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v5N+JmvQ9LVroi5qBJaWH/ylF2rufuShbgpwdMQ3qL/i4XL1qGPVQMCFObZxloTBp
         yiu+SWkIpsM/H4W9taHIsS1737GNd4mqFhnruWQsiGZPO2lP/ME++lUN/5AfWG2vtw
         Eajp2EVOAGi7gt74se3rwXzPC/X2TazWIwwOSxXM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HUc-Jh; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 20/22] media: Kconfig: on !EMBEDDED && !EXPERT, enable driver filtering
Date:   Wed, 25 Mar 2020 10:49:34 +0100
Message-Id: <fa983f22f8e47a00339809b19b40ee803d62d889.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Advanced and embedded users know what to do, so, by default,
they will likely want to be able to open the entire set of
Kconfig media options.

Normal "poor" users usually needs more help when setting
stuff, so let's open an more simplified version to them by
default.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index efc46792e87f..c900263438a7 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -21,6 +21,7 @@ if MEDIA_SUPPORT
 config MEDIA_SUPPORT_FILTER
 	bool "Filter devices by their types"
 	depends on MEDIA_SUPPORT
+	default y if !EMBEDDED && !EXPERT
 	help
 	   Configuring the media subsystem can be complex, as there are
 	   hundreds of drivers and other config options.
-- 
2.25.1

