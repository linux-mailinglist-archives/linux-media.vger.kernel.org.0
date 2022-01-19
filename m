Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980CF493898
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 11:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346631AbiASKd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 05:33:59 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46558 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353846AbiASKdE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 05:33:04 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nA8Gy-00G7Ql-PD; Wed, 19 Jan 2022 10:33:00 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nA8Gw-009NWs-9n; Wed, 19 Jan 2022 10:32:58 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.18] V4L2 patches (#80103)
Date:   Wed, 19 Jan 2022 10:32:58 +0000
Message-Id: <20220119103258.2235352-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Yefnzk4ndvoxGEB+@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/Yefnzk4ndvoxGEB+@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/175420/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/Yefnzk4ndvoxGEB+@valkosipuli.retiisi.eu

gpg: Signature made Wed 19 Jan 2022 10:19:59 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-camss-csiphy-Move-to-hardcode-CSI-Clock-Lane-n.patch doesn't apply:
Applying patch patches/0001-media-camss-csiphy-Move-to-hardcode-CSI-Clock-Lane-n.patch
patching file drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
patching file drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
Hunk #2 succeeded at 449 (offset 128 lines).
Hunk #3 FAILED at 345.
Hunk #4 succeeded at 511 (offset 100 lines).
1 out of 4 hunks FAILED -- rejects in file drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
patching file drivers/media/platform/qcom/camss/camss-csiphy.c
Hunk #1 succeeded at 230 (offset 1 line).
Hunk #2 succeeded at 243 (offset 1 line).
patching file drivers/media/platform/qcom/camss/camss-csiphy.h
Patch patches/0001-media-camss-csiphy-Move-to-hardcode-CSI-Clock-Lane-n.patch does not apply (enforce with -f)

