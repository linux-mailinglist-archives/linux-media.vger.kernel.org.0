Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C8727FC6E
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 11:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731663AbgJAJ2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 05:28:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:54632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgJAJ2T (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 05:28:19 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A756D21531;
        Thu,  1 Oct 2020 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601544498;
        bh=rLh0rupkEm6craW7Qq07B0I7sa+iivglxBzUSkCfuss=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wYJ30t0ckmbI0gE/9zPQxOogoix11ErCLW59fFVUsV9eHdGCCwbugOiFLiu/R8yuz
         813MCYzZ6bKGttcz2jbCLPpHK++s4dS3EgF6CaUmrrKCugBXxXtRnVnFHtqyPJVY4R
         uMTVuNC7a0++QW7wgIs8/aNinS5IGJ++Y6qcBF0c=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNusp-005Xai-S3; Thu, 01 Oct 2020 11:28:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: [PATCH 2/3] media: zoran: get rid of an unused var
Date:   Thu,  1 Oct 2020 11:28:14 +0200
Message-Id: <0425a08a629f50f05159f6c458e0942bf62a7792.1601544491.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <21fd8f12edb27d269eefdbea172aa3a80e2aa6ce.1601544491.git.mchehab+huawei@kernel.org>
References: <21fd8f12edb27d269eefdbea172aa3a80e2aa6ce.1601544491.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The jpeg_error in lowercase is not used anywhere. Drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/zoran/zoran.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 7217a64fe59b..945502becd60 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -264,7 +264,6 @@ struct zoran {
 
 	/* Additional stuff for testing */
 	unsigned int ghost_int;
-	int jpeg_error;
 	int intr_counter_GIRQ1;
 	int intr_counter_GIRQ0;
 	int intr_counter_CodRepIRQ;
-- 
2.26.2

