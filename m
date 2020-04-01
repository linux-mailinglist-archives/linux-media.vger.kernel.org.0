Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2C519A973
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 12:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731608AbgDAKWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 06:22:54 -0400
Received: from www.linuxtv.org ([130.149.80.248]:33198 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbgDAKWy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 06:22:54 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jJaTm-001j2g-Cc; Wed, 01 Apr 2020 10:20:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jJaXx-0004Og-PV; Wed, 01 Apr 2020 10:24:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] hantro fixes/improvements (#62742)
Date:   Wed,  1 Apr 2020 10:24:33 +0000
Message-Id: <20200401102433.16861-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3456eb01-c9a0-0fae-2a95-08406a3d2646@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/62742/
Build log: https://builder.linuxtv.org/job/patchwork/44839/
Build time: 00:04:20
Link: https://lore.kernel.org/linux-media/3456eb01-c9a0-0fae-2a95-08406a3d2646@xs4all.nl

gpg: Signature made Wed 01 Apr 2020 10:12:34 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-hantro-Refactor-for-V4L2-API-spec-compliancy.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-hantro-Refactor-for-V4L2-API-spec-compliancy.patch
patches/0006-hantro-Refactor-for-V4L2-API-spec-compliancy.patch:16: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-dt-bindings-rockchip-vpu-Convert-bindings-to-json-sc.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-dt-bindings-rockchip-vpu-Convert-bindings-to-json-sc.patch
patches/0007-dt-bindings-rockchip-vpu-Convert-bindings-to-json-sc.patch:24: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt
patches/0007-dt-bindings-rockchip-vpu-Convert-bindings-to-json-sc.patch:69: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt

