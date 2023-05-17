Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEDF706898
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 14:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbjEQMtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 08:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjEQMs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 08:48:58 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF5E5580
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 05:48:56 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pzGaN-005cGQ-DU; Wed, 17 May 2023 12:48:55 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pzGaF-003g8q-F5; Wed, 17 May 2023 12:48:47 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR 6.4] V4L2 fixes for 6.4 (#91897)
Date:   Wed, 17 May 2023 12:48:46 +0000
Message-Id: <20230517124846.876930-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZGTItbiccvPAbhkl@valkosipuli.retiisi.eu>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZGTItbiccvPAbhkl@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/307022/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/ZGTItbiccvPAbhkl@valkosipuli.retiisi.eu

gpg: Signature made Wed 17 May 2023 12:21:52 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0003-media-nxp-imx8-isi-Fix-undefined-config-warnings.patch doesn't apply:
Applying patch patches/0003-media-nxp-imx8-isi-Fix-undefined-config-warnings.patch
patching file drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
Hunk #1 FAILED at 30.
Hunk #2 FAILED at 48.
Hunk #3 FAILED at 63.
3 out of 3 hunks FAILED -- rejects in file drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
Patch patches/0003-media-nxp-imx8-isi-Fix-undefined-config-warnings.patch does not apply (enforce with -f)

