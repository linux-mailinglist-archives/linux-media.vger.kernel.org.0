Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C6E67CA1C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 12:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237248AbjAZLij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 06:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjAZLii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 06:38:38 -0500
X-Greylist: delayed 2152 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Jan 2023 03:38:37 PST
Received: from devnull.tasossah.com (devnull.tasossah.com [IPv6:2001:41d0:1:e60e::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9EC12F3E
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 03:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=clHmMkiFMCCsf2t/4tMY5b58B9EDhv6+bC2tDhILJLU=; b=nyWsXUm9Z6gvccSU7TS3WOxWVC
        DigFcy04+nCIE8czhQQ3JNUz3unW27Mp0sYOtcmi+BB/6siOzHE0Dt0F6GKJMwvBLKRnWI10nBhTP
        cKiS/WsjkWZ7DtQ855GctdkaBaUu9KtONb8B2GXuNj4AbPFbsTyXUjToJgDW46jtjdyw=;
Received: from [2a02:587:6a0e:9900::298] (helo=localhost.localdomain)
        by devnull.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <tasos@tasossah.com>)
        id 1pL01g-005zfL-Qj; Thu, 26 Jan 2023 13:02:40 +0200
From:   Tasos Sahanidis <tasos@tasossah.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH] saa7134: Use video_unregister_device for radio_dev
Date:   Thu, 26 Jan 2023 13:00:59 +0200
Message-Id: <20230126110059.20575-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The radio device doesn't use vb2, thus calling vb2_video_unregister_device()
which results in the following warning being printed on module unload.

WARNING: CPU: 1 PID: 215963 at drivers/media/common/videobuf2/videobuf2-v4l2.c:1236 vb2_video_unregister_device+0xc6/0xe0 [videobuf2_v4l2]

Fixes: 11788d9b7e91 ("media: media/pci: use vb2_video_unregister_device()")
Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 drivers/media/pci/saa7134/saa7134-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 96328b0af164..cf2871306987 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -978,7 +978,7 @@ static void saa7134_unregister_video(struct saa7134_dev *dev)
 	}
 	if (dev->radio_dev) {
 		if (video_is_registered(dev->radio_dev))
-			vb2_video_unregister_device(dev->radio_dev);
+			video_unregister_device(dev->radio_dev);
 		else
 			video_device_release(dev->radio_dev);
 		dev->radio_dev = NULL;
-- 
2.25.1

