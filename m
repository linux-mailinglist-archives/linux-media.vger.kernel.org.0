Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C0F57476F
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 10:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236564AbiGNInP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 04:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235942AbiGNInN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 04:43:13 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A4D1570B
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:43:11 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oBuRC-00ADje-3J; Thu, 14 Jul 2022 08:43:10 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oBuRA-000rbP-06; Thu, 14 Jul 2022 08:43:08 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] v2: hantro/cedrus/vb2 updates (#84842)
Date:   Thu, 14 Jul 2022 08:43:07 +0000
Message-Id: <20220714084307.206001-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <6f43a0fa-f6ad-17dc-53a0-7eabf643f751@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/6f43a0fa-f6ad-17dc-53a0-7eabf643f751@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/224730/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/6f43a0fa-f6ad-17dc-53a0-7eabf643f751@xs4all.nl

gpg: Signature made Thu 14 Jul 2022 08:04:41 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0012-media-cedrus-h265-Add-a-couple-of-error-checks.patch doesn't apply:
Applying patch patches/0012-media-cedrus-h265-Add-a-couple-of-error-checks.patch
patching file drivers/staging/media/sunxi/cedrus/cedrus_h265.c
Hunk #1 FAILED at 435.
1 out of 1 hunk FAILED -- rejects in file drivers/staging/media/sunxi/cedrus/cedrus_h265.c
Patch patches/0012-media-cedrus-h265-Add-a-couple-of-error-checks.patch does not apply (enforce with -f)

