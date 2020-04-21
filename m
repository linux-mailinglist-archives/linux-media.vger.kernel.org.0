Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF9D1B252A
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 13:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbgDULdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 07:33:55 -0400
Received: from www.linuxtv.org ([130.149.80.248]:50830 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728576AbgDULdz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 07:33:55 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jQr74-00ARY9-Pw; Tue, 21 Apr 2020 11:30:50 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jQrBn-0006v4-Kj; Tue, 21 Apr 2020 11:35:44 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Various fixes/enhancements (#63140)
Date:   Tue, 21 Apr 2020 11:35:43 +0000
Message-Id: <20200421113543.25572-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <6a56ccf7-4c26-b3ad-eb3a-0647944c2f95@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63140/
Build log: https://builder.linuxtv.org/job/patchwork/47607/
Build time: 00:23:21
Link: https://lore.kernel.org/linux-media/6a56ccf7-4c26-b3ad-eb3a-0647944c2f95@xs4all.nl

gpg: Signature made Fri 17 Apr 2020 08:17:16 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 4 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-staging-rkisp1-cap-serialize-start-stop-stream.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-staging-rkisp1-cap-serialize-start-stop-stream.patch
patches/0004-media-staging-rkisp1-cap-serialize-start-stop-stream.patch:82: CHECK: struct mutex definition without comment

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-staging-rkisp1-replace-the-call-to-v4l2_async_.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-staging-rkisp1-replace-the-call-to-v4l2_async_.patch
patches/0006-media-staging-rkisp1-replace-the-call-to-v4l2_async_.patch:97: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-replace-the-call-to-v4l2_async_.patch:118: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-coda-add-RC-enable-controls.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-coda-add-RC-enable-controls.patch
patches/0007-media-coda-add-RC-enable-controls.patch:70: CHECK: Alignment should match open parenthesis
patches/0007-media-coda-add-RC-enable-controls.patch:72: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0015-dt-bindings-media-convert-rockchip-rga-bindings-to-y.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0015-dt-bindings-media-convert-rockchip-rga-bindings-to-y.patch
patches/0015-dt-bindings-media-convert-rockchip-rga-bindings-to-y.patch:28: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt
patches/0015-dt-bindings-media-convert-rockchip-rga-bindings-to-y.patch:64: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt
patches/0015-dt-bindings-media-convert-rockchip-rga-bindings-to-y.patch:70: WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)

