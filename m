Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79AB64C2EBF
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 15:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235668AbiBXOze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 09:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235669AbiBXOze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 09:55:34 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6C225F366
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 06:55:04 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nNFWI-00FFBg-Tk; Thu, 24 Feb 2022 14:55:02 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nNFWF-0036CJ-JM; Thu, 24 Feb 2022 14:54:59 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR 5.18] More V4L2 patches (#81055)
Date:   Thu, 24 Feb 2022 14:54:59 +0000
Message-Id: <20220224145459.738761-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YheWqQBjLtUXR5Xb@valkosipuli.retiisi.eu>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YheWqQBjLtUXR5Xb@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/185696/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/YheWqQBjLtUXR5Xb@valkosipuli.retiisi.eu

gpg: Signature made Thu 24 Feb 2022 02:27:14 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA


Build aborted due to a fatal error:
FAILED: patch patch patches/0004-media-Add-a-driver-for-the-og01a1b-camera-sensor.patch doesn't apply:
Applying patch patches/0004-media-Add-a-driver-for-the-og01a1b-camera-sensor.patch
patching file MAINTAINERS
patching file drivers/media/i2c/Kconfig
patching file drivers/media/i2c/Makefile
Hunk #1 FAILED at 64.
1 out of 1 hunk FAILED -- rejects in file drivers/media/i2c/Makefile
patching file drivers/media/i2c/og01a1b.c
Patch patches/0004-media-Add-a-driver-for-the-og01a1b-camera-sensor.patch does not apply (enforce with -f)

