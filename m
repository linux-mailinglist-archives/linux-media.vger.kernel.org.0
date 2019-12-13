Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B2811E27F
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 12:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfLMLFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 06:05:35 -0500
Received: from www.linuxtv.org ([130.149.80.248]:55594 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfLMLFf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 06:05:35 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifiky-00BeBM-E0; Fri, 13 Dec 2019 11:05:12 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifimA-0006DF-EM; Fri, 13 Dec 2019 11:06:26 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] Various fixes/enhancements
Date:   Fri, 13 Dec 2019 11:06:26 +0000
Message-Id: <20191213110626.23840-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e47a67f8-da88-b0af-d59a-bf54f28e56c1@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60699/
Build log: https://builder.linuxtv.org/job/patchwork/29010/
Build time: 00:16:07
Link: https://lore.kernel.org/linux-media/e47a67f8-da88-b0af-d59a-bf54f28e56c1@xs4all.nl

gpg: Signature made Fri 13 Dec 2019 10:46:44 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 4 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-coda-jpeg-add-CODA960-JPEG-encoder-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-coda-jpeg-add-CODA960-JPEG-encoder-support.patch
patches/0004-media-coda-jpeg-add-CODA960-JPEG-encoder-support.patch:38: WARNING: line over 80 characters
patches/0004-media-coda-jpeg-add-CODA960-JPEG-encoder-support.patch:890: CHECK: Alignment should match open parenthesis
patches/0004-media-coda-jpeg-add-CODA960-JPEG-encoder-support.patch:895: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-dt-bindings-media-amlogic-vdec-convert-to-yaml.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-dt-bindings-media-amlogic-vdec-convert-to-yaml.patch
patches/0007-dt-bindings-media-amlogic-vdec-convert-to-yaml.patch:22: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0007-dt-bindings-media-amlogic-vdec-convert-to-yaml.patch:138: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-atmel-atmel-isc-base-add-support-for-Y10-forma.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-atmel-atmel-isc-base-add-support-for-Y10-forma.patch
patches/0013-media-atmel-atmel-isc-base-add-support-for-Y10-forma.patch:51: CHECK: Macro argument reuse 'mbus_code' - possible side-effects?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0017-media-atmel-atmel-isi-add-support-for-mono-sensors-G.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0017-media-atmel-atmel-isi-add-support-for-mono-sensors-G.patch
patches/0017-media-atmel-atmel-isi-add-support-for-mono-sensors-G.patch:61: CHECK: Prefer using the BIT macro

