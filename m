Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF95750C789
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 07:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbiDWFU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 01:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiDWFU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 01:20:56 -0400
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB078D6B1
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 22:17:58 -0700 (PDT)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id F0F1B80161E;
        Sat, 23 Apr 2022 05:17:57 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 67C9B8014FB;
        Sat, 23 Apr 2022 05:17:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650691077; a=rsa-sha256;
        cv=none;
        b=XWY/q9enU7eu2PjU2cTX22W3WeHCxFHD3KkGZov9CLDcKZh4KO4VWqVv+rVD1CuRZf2NrP
        fx2+xcz0jNP9DeavIe0kt1WdswW0SCuxv73VKBlKbBh/r7WXU7LJDJ6qqf3agJVmHn7p0K
        UBSchDxfxEQWmQ4iRR5JMYKMBrPGw8AxHOdjioK43pMywHbUAMN/VQYdsIPmpWEgCLGcuj
        9OsoRbuLeEwf9MeLYyHqTP++vTB4n0HfFgSlm8xlYoxTCLsgtrAUFX3vmipaxOMWyAevND
        Y+wuzKXF1eA0qMkkNosabnXfGr48tTyvgeb7ed0leNgaXxOpNm7HW12VSdTaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1650691077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:dkim-signature;
        bh=O2YpLxCZX0gFzvrzeHxWNDZ4KHtQ9BZwLgJu+fxKaVc=;
        b=7D4D08XKd+rTDsamAse+Xp5jYH5/qUzR/HELEvVE9V+yQzWgRYt3sSAlUEG3Ivcnu0A5z1
        iIcsMWk7SjLWh7rbHGqJZdq1+JuLgYEoduaWXgXn+6nv543hfjc3MnX9HbLwSEFLkgM6hJ
        wD2w7Y/JE1bBChrtBA33wZllem6hG1Hx1nBEYRoOVVr10kpva44LIL4gkDT7yfFbN6TtF3
        gcEp4ExWhrMMVN6ebJYS95vQF0DoINIOh5x/3QmtBZk6ywKWvX384UZ+vxIRZZ9N2P/zZW
        0GF2o+zGhdWupFZQdiz6D741uGxpIftRPAze/+nm43XvOPX846S4qdRCoV+k8Q==
ARC-Authentication-Results: i=1;
        rspamd-67b64f579b-chnfp;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Abiding-Tasty: 578c31796007b5b1_1650691077720_3305558993
X-MC-Loop-Signature: 1650691077720:1014664239
X-MC-Ingress-Time: 1650691077719
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.120.38.149 (trex/6.7.1);
        Sat, 23 Apr 2022 05:17:57 +0000
Received: from localhost.localdomain (unknown [69.12.38.97])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ian@linux.cowan.aero)
        by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4Klfg82dGGz1L0;
        Fri, 22 Apr 2022 22:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
        s=dreamhost; t=1650691077;
        bh=O2YpLxCZX0gFzvrzeHxWNDZ4KHtQ9BZwLgJu+fxKaVc=;
        h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
        b=XaBXrL0qtIETBlBIGnO4x+jXFn86bKpPQLwQL77nz+jc6k/p4JwNhjMFuV5U2EOPb
         nIUPQirbj036iCguQ2kwOuaNz4fTzi9GY5z4Xg8WKdQf9dLhqTOHdhFCsQN4zAxLT9
         M8ChCdtrXpGA5XSf5YgolpoE19MZiu7AedamotG8885kO8h3qxdPiTddPP83gh5nXr
         yVAnmgNeXjKmAq9VPqqLA9kxODVT83OUqI73dKeIPprK2SRc2euUiYxYgjZ4U46Jll
         PMjPBasFv7NQlUEg7Q60DCgkuhghSkfQXyYlNAWQEoscUB1bweWMm50e/NQ/xNsD4R
         VopJtLlKqsfBQ==
From:   Ian Cowan <ian@linux.cowan.aero>
To:     clabbe@baylibre.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        dan.carpenter@oracle.com, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        ian@linux.cowan.aero
Subject: [PATCH 1/4] staging: media: zoran: add zrdev_dbg() macros
Date:   Sat, 23 Apr 2022 01:17:45 -0400
Message-Id: <20220423051745.292683-1-ian@linux.cowan.aero>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds the zrdev_dbg() (pointing to dev_dbg()), zrdev_err() (pointing
to dev_err()), and zrdev_info() (pointing to dev_info()) macros to the
zoran drivers. These are the preferred method for debugging and this
will allow to extract the device from the zoran struct to make the call.

Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
---
 drivers/staging/media/zoran/zoran.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 654c95fa5aba..42b86356c022 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -19,6 +19,7 @@
 #define _BUZ_H_
 
 #include <linux/debugfs.h>
+#include <linux/dev_printk.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/videobuf2-core.h>
@@ -301,6 +302,18 @@ static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
 
 #endif
 
+/**
+ * Debugging macros
+ */
+#define zrdev_dbg(zr, format, args...) \
+	dev_dbg(&zr->video_dev->dev, format, ##args) \
+
+#define zrdev_err(zr, format, args...) \
+	dev_err(&zr->video_dev->dev, format, ##args) \
+
+#define zrdev_info(zr, format, args...) \
+	dev_info(&zr->video_dev->dev, format, ##args) \
+
 int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir);
 void zoran_queue_exit(struct zoran *zr);
 int zr_set_buf(struct zoran *zr);
-- 
2.35.1

