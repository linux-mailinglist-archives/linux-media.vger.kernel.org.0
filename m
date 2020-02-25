Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC5F416C178
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 13:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgBYM4f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 07:56:35 -0500
Received: from www.linuxtv.org ([130.149.80.248]:34010 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbgBYM4e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 07:56:34 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j6Zjc-00A8Pv-Qf; Tue, 25 Feb 2020 12:54:48 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j6Zmg-0004lR-O9; Tue, 25 Feb 2020 12:57:58 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] Various fixes, new Allwinner A83T Rotate driver (#61804)
Date:   Tue, 25 Feb 2020 12:57:58 +0000
Message-Id: <20200225125758.18270-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <07f45cff-4c53-4892-f63a-2812d92d31a2@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61804/
Build log: https://builder.linuxtv.org/job/patchwork/39671/
Build time: 00:17:47
Link: https://lore.kernel.org/linux-media/07f45cff-4c53-4892-f63a-2812d92d31a2@xs4all.nl

gpg: Signature made Tue 25 Feb 2020 12:36:00 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-dt-bindings-media-Add-Allwinner-A83T-Rotate-dr.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-dt-bindings-media-Add-Allwinner-A83T-Rotate-dr.patch
patches/0002-media-dt-bindings-media-Add-Allwinner-A83T-Rotate-dr.patch:20: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-sun8i-Add-Allwinner-A83T-Rotate-driver.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-sun8i-Add-Allwinner-A83T-Rotate-driver.patch
patches/0003-media-sun8i-Add-Allwinner-A83T-Rotate-driver.patch:58: WARNING: please write a paragraph that describes the config symbol fully

