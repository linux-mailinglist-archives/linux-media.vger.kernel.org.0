Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAA46F45C4
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 16:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234341AbjEBOGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 10:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbjEBOGk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 10:06:40 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C949DA
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683036383; x=1714572383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dcu4xqJaiAtDSRULWhw3uqjMjMt64Z/EtbyGi1eFZrs=;
  b=EhNlO/G1pT248sKtzmE7M+11tf63GjW0k4TlwPmjsjm5ebjarSMczEeW
   gtJ4oyijQTdeAw/bkjpuPnh5b74A28u76yFF865TrndCekMUUpbXjX3sc
   3/RfsmIZ0s7HCTFjx7a/nsDyEXsrC/QKvErIWOhYKQShO5s+y+paDfUM7
   NGpjD6QmfDqgNIQTZFz7Tg3s0+1lBait5bJUvOxSkWexZgpt74vVZOr80
   j/ehA7bGj5vIuirQ3Kfh4lPptIRxcAuary/jgKnY8tHb6SP9LJ+JtkHFm
   FCUyPIjqdtQ9v5FgD+/5ZsBJr6mZY4GXcfJVlU8isEjsU7W3ksVJqZcVF
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,244,1677538800"; 
   d="scan'208";a="30671677"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 May 2023 16:06:21 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 02 May 2023 16:06:21 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 02 May 2023 16:06:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683036381; x=1714572381;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dcu4xqJaiAtDSRULWhw3uqjMjMt64Z/EtbyGi1eFZrs=;
  b=JEtTQ7agI7D++ZHu8EjqglePcUF1Unwo2yeVXK4nxWX65elStC9z0+Ft
   rbimhI8BMw0xAPjINIUlarx9d9UtnaFokwjOIlk41/xiB2CwS1wZY5tCQ
   6jkZzbFnDqSvAEuc8l8JNEQGimL/3XxyHfJQHDmzZ8a2eMqB8NdMqATNg
   UJbjGKE1Gz4pzVqCCeVtYFJzXPx6nGNQcNesBq2tfYGBPPBChjsXlIJOx
   qxdb9dI+tz2x6cVHWuTsgHQhpvs52N+fb2xuhMuq/MuStSKw2+b6ozmzC
   WD6l7ldYtwX3boxZQ81CHMKCktMRE7/92bR29BP9Lbch3AZw1GNE6NxJV
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,244,1677538800"; 
   d="scan'208";a="30671676"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 May 2023 16:06:21 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 10B71280056;
        Tue,  2 May 2023 16:06:21 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: tc358743: fix cleanup path
Date:   Tue,  2 May 2023 16:06:11 +0200
Message-Id: <20230502140612.2256850-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When allocating a cec adapter, v4l2_async_register_subdev was called
already. Remove subdev from async list upon cec error.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
I don't reallylike that __maybe_unused after the label, but I don't know
of any other way to get rid of the warning of unused label if CEC
support is disabled.

 drivers/media/i2c/tc358743.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index ad6a72b2bcf5..86fc7bf12685 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2106,7 +2106,7 @@ static int tc358743_probe(struct i2c_client *client)
 		CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL, CEC_MAX_LOG_ADDRS);
 	if (IS_ERR(state->cec_adap)) {
 		err = PTR_ERR(state->cec_adap);
-		goto err_hdl;
+		goto err_async;
 	}
 	irq_mask |= MASK_CEC_RMSK | MASK_CEC_TMSK;
 #endif
@@ -2162,6 +2162,8 @@ static int tc358743_probe(struct i2c_client *client)
 		flush_work(&state->work_i2c_poll);
 	cancel_delayed_work(&state->delayed_work_enable_hotplug);
 	mutex_destroy(&state->confctl_mutex);
+err_async: __maybe_unused
+	v4l2_async_unregister_subdev(sd);
 err_hdl:
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(&state->hdl);
-- 
2.34.1

