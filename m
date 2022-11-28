Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9E363AD9A
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 17:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbiK1QXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 11:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbiK1QXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 11:23:03 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FFB15A2A
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:23:00 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v1so17680534wrt.11
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ghEAqr7TAEenV7q5+qBDvkXNEf5uBkmu1HKSzbrwGn8=;
        b=jXx3JoSxy5l/WfiUfmFmQVrn+P3blUzcTc+UmhJn/BIof+EbGIa+Li2wzQ2UUwaH/r
         GDEdzGsHh/UV2ZO/ZU/OyWizqg5TXfQv/0ywHk3uclhL3t+IVTzTTGT78arhMckBaqYu
         yxFra+mwQZQyy4uBrQtw5BwMidnqZnOjoUKnRiMTSDZ9EKLm6Ks8GCXXrqZkh2jAbpEK
         4ljrzv2k36gH1pLnRelUMrmpheqT8BQz28cQIn6FF6STaGQ/jgRyWsn8bQxNxAI2IQSM
         M9/VEG9dL/IgGrRyhQ0EIsuLtvLuzWkCt+MHBgfiH4UmMZ6B/5XDmvV99xV5Xajx8gl4
         svSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghEAqr7TAEenV7q5+qBDvkXNEf5uBkmu1HKSzbrwGn8=;
        b=gb7dRki7Mz/KGoJvM3Zt3opKIzfoOoaIDt8dy3waWY7TDVKAVaz5KGg5iiL2/3OLm+
         Qu+7oDfRvL0UVuGwvmE7bwPnkWgqheCUYlINxcR1bOIW9xEi708H5Zxxdmnsmu+eNRcR
         FdkIGnhcm+r/d6XOBAbeEgGmCOxBFeRXVW43XqNFJIF+LvOmUMxHLQtNICB+esSuhod4
         M7/xQs5urlstlR46Z+gpiYrkfJFeXkNuVeSV3XIKv5p1GzJfm1WnnJCaISoBpg47edwn
         +peeTT4LYu7iCX+kMbWzYxHfQ6YmIDCWF+YGsSLxz6pVMEw6CnTh2b3Lxhh4VvZDwr4Y
         XNLA==
X-Gm-Message-State: ANoB5pk8KDAa0iwWZP7jaBNleC6w7sJofGYjGGeZc9xKIq8UQ59bCrZ4
        RLAc1QGUt6dJ6l2TxYVqXIjzsg==
X-Google-Smtp-Source: AA0mqf52plHv9B2UWnlxD6Jqyx33guqYG02Pojfc1M2LCiGW0qlWj+nZk7AZ1WnM1whlfbU6zsoddw==
X-Received: by 2002:adf:f951:0:b0:23a:2311:b35 with SMTP id q17-20020adff951000000b0023a23110b35mr19532836wrr.183.1669652579386;
        Mon, 28 Nov 2022 08:22:59 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id o15-20020a5d474f000000b002421a8f4fa6sm2353530wrs.92.2022.11.28.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:22:58 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/3] ov9282: Fix Smatch errors
Date:   Mon, 28 Nov 2022 16:22:46 +0000
Message-Id: <20221128162249.536455-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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

This serires fixes up smatch errors from the recent patches for ov9282.

Dave Stevenson (3):
  media: i2c: ov9282: Fix missing documentation in structures
  media: i2c: ov9282: Make common_regs_list static
  media: i2c: ov9282: Add missing clk_disable_unprepare to error path

 drivers/media/i2c/ov9282.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1

