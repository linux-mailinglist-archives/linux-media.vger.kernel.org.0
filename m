Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342BC6D2C43
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 03:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbjDABFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 21:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjDABFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 21:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1821C1E8
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 18:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680311102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZezcjhdJnPBqT5fIkJeXVlzuTEM0bkI2yB633mRrHn4=;
        b=irzOkqPi7uoaQOXSVtqyhzCSyg/HlKzm2RQV0w8durDmcej9mSdMl6kdRUYWEtmGjihFNj
        hiGhZ9PMQtbYbpt2s2K4wjJ9Q2RboX8xs1nIl2TA0nWMGtl0ebJcieOpatOMldlcDwdEgl
        /hZk6Arctl0hzzevylwFDTICzXbuONA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-Z6O40gpsN7inxfjo8_5dIw-1; Fri, 31 Mar 2023 21:05:00 -0400
X-MC-Unique: Z6O40gpsN7inxfjo8_5dIw-1
Received: by mail-qv1-f69.google.com with SMTP id r4-20020ad44044000000b005ad0ce58902so10494666qvp.5
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 18:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680311100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZezcjhdJnPBqT5fIkJeXVlzuTEM0bkI2yB633mRrHn4=;
        b=QYqc6qAMjJevk8etCP6R98HEjy4IvYXoRYKtV8OGWyEoefzwk9NlEk1oKC3Kj6nNIM
         ToxcFchDerCmV79yUP9NaDBbtu1s81VufCAukI0iN1fkvvUGVGCGe4rfxd+PxJqk+kce
         FPab2dxY36gWl6N+FVRaQXdKZPEktQKxGd2NyYL2HP6HtKem/r45e0znyjfGNcYO9zbG
         EQjVCf4Wk1pw+dTGsydyr9UjQcIbsipFxA388ErydcLkSjxXskqs76FLsHKd7Y4GRdVX
         Q1TSGbFhy3EYxk2XnUiEfjU/DwYXYXonWks5EvdmXmddHa9z6bDeww1eK9WthHqjBU/H
         PuXA==
X-Gm-Message-State: AO0yUKXfoNP2daXcYNfV47z7ES4Ar9g6qE0waePAdgOeThaHvpDYsYd7
        ++5t/H6g6+yAs9MMFPoCPZO3+/vulBBbHQfEKmIjShUOx5RIp7PL7124wk+u3P7WRXj6fRX8owm
        uUYvqyGEblQ4rslIEE73w5aY=
X-Received: by 2002:a05:622a:594:b0:3bf:db0a:c105 with SMTP id c20-20020a05622a059400b003bfdb0ac105mr47836556qtb.6.1680311100444;
        Fri, 31 Mar 2023 18:05:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set9G4/WUx6L3PsHLq2UxivRskDVehlN2TbR8kJzcUk6OcCVFU7GWx4dbSv+XR5SXUmN8++dfFA==
X-Received: by 2002:a05:622a:594:b0:3bf:db0a:c105 with SMTP id c20-20020a05622a059400b003bfdb0ac105mr47836535qtb.6.1680311100209;
        Fri, 31 Mar 2023 18:05:00 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i187-20020a3786c4000000b006f9f3c0c63csm1061634qkd.32.2023.03.31.18.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 18:04:59 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     mchehab@kernel.org, nathan@kernel.org, ndesaulniers@google.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] [media] mb86a20s: remove unused active_layers variable
Date:   Fri, 31 Mar 2023 21:04:56 -0400
Message-Id: <20230401010456.1866555-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

clang with W=1 reports
drivers/media/dvb-frontends/mb86a20s.c:1572:6: error: variable
  'active_layers' set but not used [-Werror,-Wunused-but-set-variable]
        int active_layers = 0, pre_ber_layers = 0, post_ber_layers = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/dvb-frontends/mb86a20s.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-frontends/mb86a20s.c
index b74b9afed9a2..125fed4891ba 100644
--- a/drivers/media/dvb-frontends/mb86a20s.c
+++ b/drivers/media/dvb-frontends/mb86a20s.c
@@ -1569,7 +1569,7 @@ static int mb86a20s_get_stats(struct dvb_frontend *fe, int status_nr)
 	u32 t_post_bit_error = 0, t_post_bit_count = 0;
 	u32 block_error = 0, block_count = 0;
 	u32 t_block_error = 0, t_block_count = 0;
-	int active_layers = 0, pre_ber_layers = 0, post_ber_layers = 0;
+	int pre_ber_layers = 0, post_ber_layers = 0;
 	int per_layers = 0;
 
 	dev_dbg(&state->i2c->dev, "%s called.\n", __func__);
@@ -1589,9 +1589,6 @@ static int mb86a20s_get_stats(struct dvb_frontend *fe, int status_nr)
 
 	for (layer = 0; layer < NUM_LAYERS; layer++) {
 		if (c->isdbt_layer_enabled & (1 << layer)) {
-			/* Layer is active and has rc segments */
-			active_layers++;
-
 			/* Handle BER before vterbi */
 			rc = mb86a20s_get_pre_ber(fe, layer,
 						  &bit_error, &bit_count);
-- 
2.27.0

