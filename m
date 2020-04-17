Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06271AD6F9
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbgDQHID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:08:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728105AbgDQHIC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:08:02 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2E7721D94;
        Fri, 17 Apr 2020 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587107282;
        bh=PGToOoQNKUnf3fPGgV75aE6CQgH8NuLRX7WPzm7JEnY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rLGvEcIXjJgwtDkqXjbz2oPAAlOInQh9zbzCljpQWyeCLLodCXnZycoWNcpwKR2Z3
         8Sew6jdlrru5t8SBNxg//zEBKIncJdREcdAprnT0DmxwZiksumXQQ/YpjD7yDGdOkf
         S2WYByXnWudFqxrg4gG5aGzibSR+cc5wQlmxs/kQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPL6V-007ncF-Qe; Fri, 17 Apr 2020 09:07:59 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 3/3] media: cec/usb: depends on USB_SUPPORT and TTY
Date:   Fri, 17 Apr 2020 09:07:59 +0200
Message-Id: <a735e6b80d911fc1f452cea328c61779445e1054.1587107273.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
References: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported by Randy:

	WARNING: unmet direct dependencies detected for USB
	  Depends on [n]: USB_SUPPORT [=n] && USB_ARCH_HAS_HCD [=n]
	  Selected by [m]:
	  - USB_RAINSHADOW_CEC [=m] && MEDIA_CEC_SUPPORT [=y]

	WARNING: unmet direct dependencies detected for USB_ACM
	  Depends on [n]: USB_SUPPORT [=n] && USB [=m] && TTY [=n]
	  Selected by [m]:
	  - USB_RAINSHADOW_CEC [=m] && MEDIA_CEC_SUPPORT [=y]

in order to be able to select USB_ACM, we need both USB_SUPPORT
and TTY. So, depends on those two.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/usb/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/usb/Kconfig b/drivers/media/cec/usb/Kconfig
index d3bbef464bdb..3f3a5c75287a 100644
--- a/drivers/media/cec/usb/Kconfig
+++ b/drivers/media/cec/usb/Kconfig
@@ -2,5 +2,7 @@
 #
 # USB drivers
 
+if USB_SUPPORT && TTY
 source "drivers/media/cec/usb/pulse8/Kconfig"
 source "drivers/media/cec/usb/rainshadow/Kconfig"
+endif
-- 
2.25.2

