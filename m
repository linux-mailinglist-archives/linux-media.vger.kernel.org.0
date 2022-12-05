Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C70C642B91
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbiLEPZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbiLEPY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:24:58 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA55A20BFB
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 07:22:12 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bx10so19169032wrb.0
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 07:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzw5Cw5Kc1/3fvoKTJkRNd8l6kNFCYQflUftOHhfbOo=;
        b=cz86amsHb1M0BLwqtvF7EidYjMv08FQQucM974wUhylHtS+/dmcWzSicEkX+z6iNw3
         N41MCm+Gt9C91Pz/CoPpEmeHDBnaBENHWVbsE6DmtVZQ0GjQrtX4w4adMNzW9Eq3zLyh
         SPws6UoPaRSHnT9/MztRgpDYMLkS8XUtDMS19W3y7b8gMNjrVhCJOQcc7nQ6DE/TDnq4
         KvlCatOiSVbce0V9VYZlGoqhcIC7ox7ElfYUi0bzienrCjrUy6GW86BfmlfLqGrfa5Zq
         Pnu3dh7N8JrpzE/jmtm8YTT6VCCYP6kV1qrJLkU+DHdiltkjUqhmUMVUwCN1fAg+aEUU
         mV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzw5Cw5Kc1/3fvoKTJkRNd8l6kNFCYQflUftOHhfbOo=;
        b=7xYQnJV5ojhEZ8WhAxNfyj7L2OM/iztepoghQRMt8TIsfl8yzLgoRAGFCxv9FeMZhG
         VnQqLer9anC3ATF5eDtLfifZg+Yqg7Od1fYr6nO31ZlmnI4gB1a8e2aJcIpzfF89hXTn
         B0TvQJaIKv1XcrRaItUaprwm9luVskNb71DK28eSJldpW8llhtz18i1GH3SD3u1Sku0H
         bdPY7jhvcFp9cJFw8JvSSdIoAQwzFj32IAWoeTOhDCoIWTt+eLRBhtGomo9XlOFPUg0z
         znvRshghrSaO+v5uK963xgj8xGdrewvF+CcqvAf4CBSusJmpv55rpBdUalghKzkdskYz
         OJ7A==
X-Gm-Message-State: ANoB5pnObARMRc8pjP08Or32Uc1k3TxUfvPkUgx5ozWS+RrrlzA2Kw1Y
        scc0hHU++L/RkOax/l0TILSEoWOyxptTcwfA
X-Google-Smtp-Source: AA0mqf638E02RuPC8//7seUkXu72WylvplJZ57tXuhU0US7a2kT2b1MpINIifa8jNHEYEZ/NS7SVdQ==
X-Received: by 2002:adf:f4d0:0:b0:242:155c:6b97 with SMTP id h16-20020adff4d0000000b00242155c6b97mr22304596wrp.540.1670253730541;
        Mon, 05 Dec 2022 07:22:10 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id fc13-20020a05600c524d00b003d04e4ed873sm25144905wmb.22.2022.12.05.07.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:22:10 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 1/5] media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Mon,  5 Dec 2022 15:21:45 +0000
Message-Id: <20221205152149.1364185-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
References: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver changes the Bayer order based on the flips, but
does not define the control correctly with the
V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.

Add the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/media/i2c/ov2680.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index de66d3395a4d..54153bf66bdd 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -967,6 +967,8 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 
 	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
+	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
 	v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp, 1, true);
-- 
2.34.1

