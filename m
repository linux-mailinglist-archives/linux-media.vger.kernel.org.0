Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7475334CDFF
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 12:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhC2Ka0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 06:30:26 -0400
Received: from www.linuxtv.org ([130.149.80.248]:34440 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232311AbhC2KaL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 06:30:11 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lQp9t-0031Oy-Re; Mon, 29 Mar 2021 10:30:09 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lQpDp-0006zl-Ud; Mon, 29 Mar 2021 10:34:14 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.13] V4L2 camera patches (#72709)
Date:   Mon, 29 Mar 2021 10:34:13 +0000
Message-Id: <20210329103413.26848-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329102056.GA3@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210329102056.GA3@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/96380/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20210329102056.GA3@valkosipuli.retiisi.eu

gpg: Signature made Mon 29 Mar 2021 10:16:52 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key


Build aborted due to a fatal error:
FAILED: patch patch patches/0009-staging-media-ipu3-add-missing-kernel-doc-struct-key.patch doesn't apply:
Applying patch patches/0009-staging-media-ipu3-add-missing-kernel-doc-struct-key.patch
patching file drivers/staging/media/ipu3/ipu3-css-pool.h
Hunk #1 FAILED at 10.
Hunk #2 FAILED at 24.
2 out of 2 hunks FAILED -- rejects in file drivers/staging/media/ipu3/ipu3-css-pool.h
Patch patches/0009-staging-media-ipu3-add-missing-kernel-doc-struct-key.patch can be reverse-applied

