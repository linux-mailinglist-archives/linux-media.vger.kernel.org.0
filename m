Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6C4182FCA
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 13:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgCLMEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 08:04:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:35502 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgCLMEE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 08:04:04 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jCMXI-00Byhj-Sh; Thu, 12 Mar 2020 12:02:00 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jCMal-0001Db-J0; Thu, 12 Mar 2020 12:05:35 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] TVP5150 Features and Fixes (#62126)
Date:   Thu, 12 Mar 2020 12:05:35 +0000
Message-Id: <20200312120535.4642-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <76233d4e-2085-1a1a-86ad-0799292b419f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/62126/
Build log: https://builder.linuxtv.org/job/patchwork/41969/
Build time: 00:25:25
Link: https://lore.kernel.org/linux-media/76233d4e-2085-1a1a-86ad-0799292b419f@xs4all.nl

gpg: Signature made Thu 12 Mar 2020 11:26:54 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-dt-bindings-display-add-sdtv-standards-defines.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-dt-bindings-display-add-sdtv-standards-defines.patch
patches/0002-dt-bindings-display-add-sdtv-standards-defines.patch:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-partial-revert-of-media-tvp5150-add-HW-input-connect.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-partial-revert-of-media-tvp5150-add-HW-input-connect.patch
patches/0009-partial-revert-of-media-tvp5150-add-HW-input-connect.patch:237: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-media-tvp5150-fix-set_selection-rectangle-handling.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-media-tvp5150-fix-set_selection-rectangle-handling.patch
patches/0012-media-tvp5150-fix-set_selection-rectangle-handling.patch:57: WARNING: line over 80 characters

