Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD6619131C
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgCXO02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728249AbgCXO01 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:27 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3D9D21D6C;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059986;
        bh=1nHoIlvAAtgS9/1HbiXy6FKLACLGKOljzYG5G1rnyUU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N1cWzNTB3GLEgmvB7w1KElmTOUn95wHzSId7TmEnIB8Nswn1aMuingmgvpnXGvD4g
         p2NsUJFvcOmLshjpu5D71Ztim0Yk4c/r4arKJLi9iC+rMIls7ucInmUqJ2JKx0Vgj4
         yE7JTU05tb2LTjamqXRYaPhALfpq2O9M2frusrqM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVc-00267w-8j; Tue, 24 Mar 2020 15:26:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 20/20] media: Kconfig: on !EMBEDDED && !EXPERT, enable driver filtering
Date:   Tue, 24 Mar 2020 15:26:21 +0100
Message-Id: <a308d449c0ca3f808fe9d0e88dbc4e3cbfea2075.1585059897.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
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
index 81259287ffa3..ef71cc03c1c5 100644
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
2.24.1

