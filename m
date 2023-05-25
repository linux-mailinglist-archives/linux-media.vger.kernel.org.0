Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A172B710B05
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 13:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240972AbjEYLdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 07:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240946AbjEYLde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 07:33:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF046191
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 04:33:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4852160B90
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 11:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA5AC433EF
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 11:33:31 +0000 (UTC)
Message-ID: <f4ba8b99-1626-393f-8dc6-ae72d5792ac2@xs4all.nl>
Date:   Thu, 25 May 2023 13:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] tegra-video: host1x_client_unregister now returns void
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

The host1x_client_unregister() function became a void function,
so stop using the error return value.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 6e71d56bc7e3..a1ab886acc18 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -257,11 +257,8 @@ static int tegra_vip_probe(struct platform_device *pdev)
 static int tegra_vip_remove(struct platform_device *pdev)
 {
 	struct tegra_vip *vip = platform_get_drvdata(pdev);
-	int err;

-	err = host1x_client_unregister(&vip->client);
-	if (err)
-		return dev_err_probe(&pdev->dev, err, "failed to unregister host1x client\n");
+	host1x_client_unregister(&vip->client);

 	pm_runtime_disable(&pdev->dev);

