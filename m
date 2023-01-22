Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9771E6772FC
	for <lists+linux-media@lfdr.de>; Sun, 22 Jan 2023 23:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjAVWWL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Jan 2023 17:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjAVWWL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Jan 2023 17:22:11 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C825125BA
        for <linux-media@vger.kernel.org>; Sun, 22 Jan 2023 14:22:10 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pJij2-006yNM-C7; Sun, 22 Jan 2023 22:22:08 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pJiiz-008nzj-D9; Sun, 22 Jan 2023 22:22:05 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.3] Lots of camera sensor and some MC material (#89121)
Date:   Sun, 22 Jan 2023 22:22:05 +0000
Message-Id: <20230122222205.2098757-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Y82xOSG8nLpHxKVV@kekkonen.localdomain>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Y82xOSG8nLpHxKVV@kekkonen.localdomain/
Build log: https://builder.linuxtv.org/job/patchwork/275589/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/Y82xOSG8nLpHxKVV@kekkonen.localdomain

gpg: Signature made Sun 22 Jan 2023 09:51:45 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0004-media-mc-entity-Fix-doc-for-media_graph_walk_init.patch doesn't apply:
Applying patch patches/0004-media-mc-entity-Fix-doc-for-media_graph_walk_init.patch
patching file drivers/media/mc/mc-entity.c
Hunk #1 FAILED at 295.
1 out of 1 hunk FAILED -- rejects in file drivers/media/mc/mc-entity.c
Patch patches/0004-media-mc-entity-Fix-doc-for-media_graph_walk_init.patch can be reverse-applied

