Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4C160C1A8
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 04:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbiJYCZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 22:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbiJYCZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 22:25:21 -0400
X-Greylist: delayed 3600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Oct 2022 19:25:20 PDT
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com [192.185.193.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDD51F2C8
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 19:25:18 -0700 (PDT)
Received: from atl1wswcm03.websitewelcome.com (unknown [50.6.129.164])
        by atl3wswob06.websitewelcome.com (Postfix) with ESMTP id 74B52A0917
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 01:04:15 +0000 (UTC)
Received: from br984.hostgator.com.br ([162.241.203.37])
        by cmsmtp with ESMTP
        id n8MYoU5waPUI8n8MZodCXp; Tue, 25 Oct 2022 01:04:15 +0000
X-Authority-Reason: nr=8
Received: from [177.194.67.221] (port=43054 helo=arch-avell.meuintelbras.local)
        by br984.hostgator.com.br with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <pedro.guilherme@espectro.eng.br>)
        id 1on8MY-001BYl-FD;
        Mon, 24 Oct 2022 22:04:14 -0300
From:   Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
To:     laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pedro Guilherme Siqueira Moreira 
        <pedro.guilherme@espectro.eng.br>
Subject: [PATCH 3/3] media: uvc_driver: fix usage of symbolic permissions to octal
Date:   Mon, 24 Oct 2022 22:03:03 -0300
Message-Id: <20221025010303.570815-3-pedro.guilherme@espectro.eng.br>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025010303.570815-1-pedro.guilherme@espectro.eng.br>
References: <20221025010303.570815-1-pedro.guilherme@espectro.eng.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - br984.hostgator.com.br
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - espectro.eng.br
X-BWhitelist: no
X-Source-IP: 177.194.67.221
X-Source-L: No
X-Exim-ID: 1on8MY-001BYl-FD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (arch-avell.meuintelbras.local) [177.194.67.221]:43054
X-Source-Auth: pedro.guilherme@espectro.eng.br
X-Email-Count: 10
X-Source-Cap: ZXNwZWN0ODU7ZXNwZWN0ODU7YnI5ODQuaG9zdGdhdG9yLmNvbS5icg==
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNKObqbpMac0XdL+N4inm/OaCvewOxk/bs2JWzvkp0bHK9IR+Tp957MODWAlv5ZZhWUD3hFy78GHBwkVMoGsL47SEC/QVfTAX4RT3f1CskH8kKAoFslu
 pDdRbfwQozEHK/i1Y4ilfgeZ6WHzbLULMdcNtIJvJFL9KnBi89Ve6B9WWUPg3LPtP67qqapP/vIy9GUWLsexn2jgKmvi71R4/RP/ZzQf7ru6HrWkRoBwv4tq
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
---
 drivers/media/usb/uvc/uvc_driver.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7b6c97ad3a41..c5adad4e51e2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2362,17 +2362,17 @@ static int uvc_clock_param_set(const char *val, const struct kernel_param *kp)
 }
 
 module_param_call(clock, uvc_clock_param_set, uvc_clock_param_get,
-		  &uvc_clock_param, S_IRUGO|S_IWUSR);
+		  &uvc_clock_param, 0644);
 MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
-module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, S_IRUGO|S_IWUSR);
+module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
 MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
-module_param_named(nodrop, uvc_no_drop_param, uint, S_IRUGO|S_IWUSR);
+module_param_named(nodrop, uvc_no_drop_param, uint, 0644);
 MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
-module_param_named(quirks, uvc_quirks_param, uint, S_IRUGO|S_IWUSR);
+module_param_named(quirks, uvc_quirks_param, uint, 0644);
 MODULE_PARM_DESC(quirks, "Forced device quirks");
-module_param_named(trace, uvc_dbg_param, uint, S_IRUGO|S_IWUSR);
+module_param_named(trace, uvc_dbg_param, uint, 0644);
 MODULE_PARM_DESC(trace, "Trace level bitmask");
-module_param_named(timeout, uvc_timeout_param, uint, S_IRUGO|S_IWUSR);
+module_param_named(timeout, uvc_timeout_param, uint, 0644);
 MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
 
 /* ------------------------------------------------------------------------
-- 
2.38.1

