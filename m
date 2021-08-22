Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611B03F3CD2
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 02:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhHVAFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Aug 2021 20:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhHVAFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Aug 2021 20:05:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AC9C061575;
        Sat, 21 Aug 2021 17:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=2P4f8b9zjkblhd2q55UzBaaO80Xl5R5PMFyRxYqRT5M=; b=I4xMIObofvh8UYoC2Z0vfGwiWx
        J23bM3jqzUCphMoxfsZWiLNVUO/Ij83w7otea8C1I7rNaIoKi8E+27vLdrFqa2c9s6Rv0+jJGO3/Z
        JVGfzjUSBg+l9HKT6PchiefflCHBGKQS3Nl8bwt4KLzCTNNCmgcJR5HiSEoOcx24v8drz6ISxlXry
        xcEzge5MzFsrzyj653lov+MSBSRTxL7KQxQTsRsW8Lpnyjo5u+bdm2m2J/IjYcE96XOqxzABxhmCc
        jaOBIUclmlVnhQ2QxcHxNG1NCHpRDL7puxsR1BAkwWLUOIWhuGy0nNxjKitPQmMVkm2sBVTvAlcn3
        sGJ5dvJQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mHayq-00DLQX-3E; Sun, 22 Aug 2021 00:04:52 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, Sean Young <sean@mess.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] media: rc and cec: keep all menu entries together
Date:   Sat, 21 Aug 2021 17:04:50 -0700
Message-Id: <20210822000450.27329-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keep all of the Remote Controller and CEC menu entries grouped
together. This is most relevant to 'make xconfig', where the
entries for "HDMI CEC RC integration" and "Enable CEC error injection
support" are not displayed (presented) anywhere near the other
Remote Controller support options.
By grouping all of these menu entries inside a menu/endmenu block,
they are forced to be kept together.

Fixes: 46d2a3b964dd ("media: place CEC menu before MEDIA_SUPPORT")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sean Young <sean@mess.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20210820.orig/drivers/media/Kconfig
+++ linux-next-20210820/drivers/media/Kconfig
@@ -6,8 +6,10 @@
 #
 # NOTE: CEC and Remote Controller support should not depend on MEDIA_SUPPORT
 #
+menu "Remote Controller and CEC support"
 source "drivers/media/rc/Kconfig"
 source "drivers/media/cec/Kconfig"
+endmenu
 
 menuconfig MEDIA_SUPPORT
 	tristate "Multimedia support"
