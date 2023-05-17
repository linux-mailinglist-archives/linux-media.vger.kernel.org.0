Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6C97072FF
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 22:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjEQU1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 16:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjEQU1B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 16:27:01 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46687D89
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 13:26:58 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pzNjc-005mPI-1x; Wed, 17 May 2023 20:26:56 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pzNjZ-005QPz-Lo; Wed, 17 May 2023 20:26:53 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.5] Camera sensor, CSI-2 related patches plus more (#91908)
Date:   Wed, 17 May 2023 20:26:53 +0000
Message-Id: <20230517202653.1293145-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZGU3kwC9CdTuq4zx@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZGU3kwC9CdTuq4zx@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/307112/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/ZGU3kwC9CdTuq4zx@valkosipuli.retiisi.eu

gpg: Signature made Wed 17 May 2023 08:19:14 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-rcar-vin-Gen3-can-not-scale-NV12.patch doesn't apply:
Applying patch patches/0001-media-rcar-vin-Gen3-can-not-scale-NV12.patch
patching file drivers/media/platform/renesas/rcar-vin/rcar-dma.c
Hunk #1 FAILED at 1312.
1 out of 1 hunk FAILED -- rejects in file drivers/media/platform/renesas/rcar-vin/rcar-dma.c
Patch patches/0001-media-rcar-vin-Gen3-can-not-scale-NV12.patch can be reverse-applied

