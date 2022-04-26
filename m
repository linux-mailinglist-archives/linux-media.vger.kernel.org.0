Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3149B50F032
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 07:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244364AbiDZFcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 01:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239637AbiDZFcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 01:32:50 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04E81BEB5
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 22:29:43 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so1529543pjm.1
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 22:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sslab.ics.keio.ac.jp; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MRv9kTCoSYsWNRqPUL4Sp98TRecI1P+g984YHsy8maE=;
        b=K8v+HZj9BR9iKCLYN83x1NdcVrjwAWCWzGOpSE4PuWfbs0/HpB6x8YiF5Wfw7AWjCW
         zMJwm92eaQ+uIigsdKm0syYRDnZ4AnuobImPEXWCP0GrG1SCn0ptuTz9guoeHngE4/mh
         nuqyu5HkB+s9erV75jnegbyj/ehHopUlbXcUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MRv9kTCoSYsWNRqPUL4Sp98TRecI1P+g984YHsy8maE=;
        b=K9qtduIYuGVI+sB09utEbiukX44sxi2uoLc679M6vpdLpDYAyApf6Ohzmva7NegZJW
         UCjpPU/WEH9dJ2OfuM9T3vGsMnMPkzyvVEEfB7+3Otx5e4OlEzxydOnFa+3CMwPnhnvm
         v0ASuz6+lqD+rThbq9TznFYeY4KKOyipgyXfmYyphaHwl2CpE3y3JI2Hxd0Idn+U4XhW
         i6ZR24AsVhC8hiMLEZO7K2HByEw9H25zdvmsY4LQw3sRZoWzIhOs4j50SCharycC1Y2a
         PcTQMF0UaGT9OruJgkuvywN+M53Fi2jxfC2D1Ydrp9oYlt5Z+n/NAnJ1gHJPstqJ4xi9
         4hqw==
X-Gm-Message-State: AOAM530pqH/fxxvPDFyd4OmwFCVzcVI/3iVxqk8+1D4LSvTHajgD82BY
        ZhJM3oe5Aqpg+Zf7vyHrh/SnAw==
X-Google-Smtp-Source: ABdhPJybyb+9ngi8GLbIZNB1Trg0oFzo3N6nCNc0mA0PW0afStAEv5oRMBAr99j7zozDVhm1G4lH/w==
X-Received: by 2002:a17:90a:e7d2:b0:1d7:4f8d:3ca6 with SMTP id kb18-20020a17090ae7d200b001d74f8d3ca6mr24950986pjb.144.1650950983301;
        Mon, 25 Apr 2022 22:29:43 -0700 (PDT)
Received: from saltlake.i.sslab.ics.keio.ac.jp (sslab-relay.ics.keio.ac.jp. [131.113.126.173])
        by smtp.gmail.com with ESMTPSA id bh3-20020a056a02020300b00378b62df320sm11262688pgb.73.2022.04.25.22.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 22:29:42 -0700 (PDT)
From:   Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Cc:     kernel@tuxforce.de, wanghai38@huawei.com,
        Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>,
        stable@vger.kernel.org, Wenwen Wang <wenwen@cs.uga.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-core: Fix double free in dvb_register_device()
Date:   Tue, 26 Apr 2022 05:29:19 +0000
Message-Id: <20220426052921.2088416-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In function dvb_register_device() -> dvb_register_media_device() ->
dvb_create_media_entity(), dvb->entity is allocated and initialized. If
the initialization fails, it frees the dvb->entity, and return an error
code. The caller takes the error code and handles the error by calling
dvb_media_device_free(), which unregisters the entity and frees the
field again if it is not NULL. As dvb->entity may not NULLed in
dvb_create_media_entity() when the allocation of dvbdev->pad fails, a
double free may occur. This may also cause an Use After free in
media_device_unregister_entity().

Fix this by storing NULL to dvb->entity when it is freed.

Fixes: fcd5ce4b3936 ("media: dvb-core: fix a memory leak bug")
Cc: stable@vger.kernel.org
Cc: Wenwen Wang <wenwen@cs.uga.edu>

Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
---
 drivers/media/dvb-core/dvbdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 675d877a67b2..4597af108f4d 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -332,6 +332,7 @@ static int dvb_create_media_entity(struct dvb_device *dvbdev,
 				       GFP_KERNEL);
 		if (!dvbdev->pads) {
 			kfree(dvbdev->entity);
+			dvbdev->entity = NULL;
 			return -ENOMEM;
 		}
 	}
-- 
2.25.1

