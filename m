Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240D9293481
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 08:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391843AbgJTGCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 02:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391797AbgJTGCM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 02:02:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9A3C061755;
        Mon, 19 Oct 2020 23:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=E0coMztM2M48VT3IbLwBeTLJRP2K4p9f4EU9akewdLo=; b=J02CnMATiiRo87r424+sCz9MWg
        nPSqEVj+KVht9H9bgQJLl4Rn4iNc+oilbv4xk8Xl1gO2hvYmaNQaQRvoQFVbgephE0OMnouNIN2fp
        R8dAlaFCE30smHAriPv0BOUCOWogxHexR/K4VYR8/5P2i9Jl0ITuiBrnOgRnhFyliSBM2TazMghJ6
        7512jCpwM7ri7rOPnHqUhyc1GCWFoa/k8Lp2D4DY7xLuZ6o6MBouTcrQDhji6WgqFIPv/xYErQfI/
        n6dwdQNFt50waHtkRxI92mmpx1g9qv5cpixQzj6LZj+djyW6PNhQkPs/7irB3GFmf3WvljfRL6JWF
        ojXYvEHw==;
Received: from [2601:1c0:6280:3f0::507c]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kUkik-0006mr-S3; Tue, 20 Oct 2020 06:02:07 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] media/platform/marvell-ccic: fix warnings when CONFIG_PM is
 not enabled
Message-ID: <9a586496-0d62-f246-19ec-d17b6f47e200@infradead.org>
Date:   Mon, 19 Oct 2020 23:02:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build warnings when CONFIG_PM is not set/enabled:

../drivers/media/platform/marvell-ccic/mmp-driver.c:324:12: warning: 'mmpcam_runtime_suspend' defined but not used [-Wunused-function]
  324 | static int mmpcam_runtime_suspend(struct device *dev)
../drivers/media/platform/marvell-ccic/mmp-driver.c:310:12: warning: 'mmpcam_runtime_resume' defined but not used [-Wunused-function]
  310 | static int mmpcam_runtime_resume(struct device *dev)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/media/platform/marvell-ccic/mmp-driver.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20201009.orig/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ linux-next-20201009/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -307,6 +307,7 @@ static int mmpcam_platform_remove(struct
  * Suspend/resume support.
  */
 
+#ifdef CONFIG_PM
 static int mmpcam_runtime_resume(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
@@ -352,6 +353,7 @@ static int __maybe_unused mmpcam_resume(
 		return mccic_resume(&cam->mcam);
 	return 0;
 }
+#endif
 
 static const struct dev_pm_ops mmpcam_pm_ops = {
 	SET_RUNTIME_PM_OPS(mmpcam_runtime_suspend, mmpcam_runtime_resume, NULL)

