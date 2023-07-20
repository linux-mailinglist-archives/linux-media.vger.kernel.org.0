Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6B975A7A9
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbjGTHUc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjGTHUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:20:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7319726A0
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:20:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4FBE61853
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 07:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79795C433C8;
        Thu, 20 Jul 2023 07:20:04 +0000 (UTC)
Message-ID: <4d55437f-4b3e-8a06-1d8e-e603dc333383@xs4all.nl>
Date:   Thu, 20 Jul 2023 09:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Dmitry Osipenko <digetx@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] staging: media: tegra-video: include video.h header
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This tells sparse that tegra_vip_driver is actually used,
and so avoids this warning:

drivers/staging/media/tegra-video/vip.c:280:31: warning: 'tegra_vip_driver' defined but not used [-Wunused-variable]
  280 | static struct platform_driver tegra_vip_driver = {
      |                               ^~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/tegra-video/vip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index a1ab886acc18..bc5fc82a7702 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -20,6 +20,7 @@
 #include <media/v4l2-fwnode.h>

 #include "vip.h"
+#include "video.h"

 static inline struct tegra_vip *host1x_client_to_vip(struct host1x_client *client)
 {
-- 
2.40.1

