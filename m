Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 324B463A886
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 13:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbiK1Mh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 07:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiK1Mh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 07:37:27 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8111D1A069
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 04:37:26 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ozdO0-00HCxp-VE; Mon, 28 Nov 2022 12:37:24 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ozdNy-002Ari-NC; Mon, 28 Nov 2022 12:37:22 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.2 v2] Various fixes and enhancements (#87832)
Date:   Mon, 28 Nov 2022 12:37:22 +0000
Message-Id: <20221128123722.518376-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <a2d90ef2-3219-b2e8-15de-fa1da9d031d5@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/a2d90ef2-3219-b2e8-15de-fa1da9d031d5@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/259884/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/a2d90ef2-3219-b2e8-15de-fa1da9d031d5@xs4all.nl

gpg: Signature made Mon 28 Nov 2022 12:31:16 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-s5p-mfc-Add-variant-data-for-MFC-v7-hardware-f.patch doesn't apply:
Applying patch patches/0001-media-s5p-mfc-Add-variant-data-for-MFC-v7-hardware-f.patch
patching file drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
Hunk #1 FAILED at 1590.
Hunk #2 succeeded at 1671 with fuzz 2 (offset 10 lines).
1 out of 2 hunks FAILED -- rejects in file drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
Patch patches/0001-media-s5p-mfc-Add-variant-data-for-MFC-v7-hardware-f.patch can be reverse-applied

