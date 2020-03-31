Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA9A19950C
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730606AbgCaLMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:57938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730607AbgCaLMO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6125821707;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=R7mECVcjrKzjWrqtfW4toBzT+HmUNsK9jqsrpNFyXYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F6n4Q2xAYyBykU7UGsNjOifr4mH1TSTtiZTMWWtXBVNWmOx2HFwTqWYNEYGzqqrVi
         6hKpIxRfsa0cUE7I7susMV7QLmSCnABSn2dRE2OJQpRw9SO4RZfaw3HOd2CEx3jNUC
         iPpvKiLztJpQQV5apY56EG9bi5481QvsWQSPuoFQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002brF-Jm; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 18/33] media: dvb-core: Kconfig: default to use dynamic minors
Date:   Tue, 31 Mar 2020 13:11:54 +0200
Message-Id: <6300baa90b06cbe096d95c07fb00da8072bee0e9.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
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
index 90e038d5ffd9..61f9e1ce99cb 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -19,6 +19,7 @@ config DVB_MAX_ADAPTERS
 config DVB_DYNAMIC_MINORS
 	bool "Dynamic DVB minor allocation"
 	depends on DVB_CORE
+	default y
 	help
 	  If you say Y here, the DVB subsystem will use dynamic minor
 	  allocation for any device that uses the DVB major number.
-- 
2.25.1

