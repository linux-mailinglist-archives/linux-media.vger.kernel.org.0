Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625964766E0
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 01:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhLPARR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 19:17:17 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54316 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230469AbhLPARQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 19:17:16 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mxeSR-004nXT-Hf; Thu, 16 Dec 2021 00:17:15 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mxeSP-005NKD-8O; Thu, 16 Dec 2021 00:17:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.17] V4L2 patches (#79461)
Date:   Thu, 16 Dec 2021 00:17:13 +0000
Message-Id: <20211216001713.1281255-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YbqEPv6h6cESfWY5@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YbqEPv6h6cESfWY5@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/165762/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/YbqEPv6h6cESfWY5@valkosipuli.retiisi.eu

gpg: Signature made Wed 15 Dec 2021 11:27:30 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-max96712-Depend-on-VIDEO_V4L2.patch doesn't apply:
Applying patch patches/0001-max96712-Depend-on-VIDEO_V4L2.patch
patching file drivers/staging/media/max96712/Kconfig
Hunk #1 FAILED at 3.
1 out of 1 hunk FAILED -- rejects in file drivers/staging/media/max96712/Kconfig
Patch patches/0001-max96712-Depend-on-VIDEO_V4L2.patch can be reverse-applied

