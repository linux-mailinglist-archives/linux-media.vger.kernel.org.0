Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB61715D83F
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 14:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgBNNRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 08:17:55 -0500
Received: from www.linuxtv.org ([130.149.80.248]:58248 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbgBNNRz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 08:17:55 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j2apS-00EYTD-1v; Fri, 14 Feb 2020 13:16:22 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j2asD-0001Mz-M1; Fri, 14 Feb 2020 13:19:14 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] Various fixes, mainly hantro and rkisp1
Date:   Fri, 14 Feb 2020 13:19:13 +0000
Message-Id: <20200214131913.5224-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d5b15f36-305f-593f-dbb9-41463e018107@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61651/
Build log: https://builder.linuxtv.org/job/patchwork/38089/
Build time: 00:19:02
Link: https://lore.kernel.org/linux-media/d5b15f36-305f-593f-dbb9-41463e018107@xs4all.nl

gpg: Signature made Fri 14 Feb 2020 12:53:31 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0024-media-staging-rkisp1-add-serialization-to-the-isp-su.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0024-media-staging-rkisp1-add-serialization-to-the-isp-su.patch
patches/0024-media-staging-rkisp1-add-serialization-to-the-isp-su.patch:35: CHECK: struct mutex definition without comment

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0025-media-staging-rkisp1-add-serialization-to-the-resize.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0025-media-staging-rkisp1-add-serialization-to-the-resize.patch
patches/0025-media-staging-rkisp1-add-serialization-to-the-resize.patch:27: CHECK: struct mutex definition without comment

