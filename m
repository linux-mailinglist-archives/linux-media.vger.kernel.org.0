Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62FDC1AD6F8
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgDQHIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:08:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:57322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728693AbgDQHIC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:08:02 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2F52221E9;
        Fri, 17 Apr 2020 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587107282;
        bh=/XXaXPntadrmVfiYdBRKhYb0xX0mWCqt/zmreOZQ3WY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oz2UAfAqcnUD9JmcevTa8ynEgGiwWzrgc6h3y7vupY8vdwnVKzmQKxJCc5DZ1MsIA
         G7D5dM8Ad/kTEWeMGaEYfAo9SAzJ2THgWq+tUF2iC8trpF+D72bRMNRakp5UH9fbA2
         vM113S+/5+r+BStylJ33dxj0eNtKH4vw+/UHy4hE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPL6V-007ncB-Pq; Fri, 17 Apr 2020 09:07:59 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 2/3] media: mc/Kconfig: remove staging dependency for request API
Date:   Fri, 17 Apr 2020 09:07:58 +0200
Message-Id: <e36b68ed273e12a4539b54d24bcdb929d94b68ba.1587107273.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
References: <6af5797c76c11d8c08ae1f5a73c3711fcf89ab6f.1587107273.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the request API got merged, only drivers at staging were
using it. As we wanted to be able to do future changes on it,
we added an artificial depends on STAGING_MEDIA.

Yet, request API is there for quite some time now, and
didn't suffer any API breakages during this time. So, drop
this.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/mc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 7c9628f37196..4815b9dde9af 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -14,7 +14,7 @@ config MEDIA_CONTROLLER_DVB
 
 config MEDIA_CONTROLLER_REQUEST_API
 	bool
-	depends on MEDIA_CONTROLLER && STAGING_MEDIA
+	depends on MEDIA_CONTROLLER
 	help
 	  DO NOT ENABLE THIS OPTION UNLESS YOU KNOW WHAT YOU'RE DOING.
 
-- 
2.25.2

