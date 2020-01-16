Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 699F613DD4B
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 15:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgAPOUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 09:20:21 -0500
Received: from www.linuxtv.org ([130.149.80.248]:53444 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbgAPOUV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 09:20:21 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1is5zU-00Bc3o-5u; Thu, 16 Jan 2020 14:19:20 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1is61X-0001jM-Sb; Thu, 16 Jan 2020 14:21:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] Various fixes
Date:   Thu, 16 Jan 2020 14:21:27 +0000
Message-Id: <20200116142127.6611-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <05d43c5d-f0ba-74df-3a95-e424c6b39a79@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61207/
Build log: https://builder.linuxtv.org/job/patchwork/33921/
Build time: 00:21:15
Link: https://lore.kernel.org/linux-media/05d43c5d-f0ba-74df-3a95-e424c6b39a79@xs4all.nl

gpg: Signature made Thu 16 Jan 2020 01:51:49 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-aspeed-Use-runtime-configuration.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-aspeed-Use-runtime-configuration.patch
patches/0006-media-aspeed-Use-runtime-configuration.patch:94: WARNING: line over 80 characters
patches/0006-media-aspeed-Use-runtime-configuration.patch:95: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:62: CHECK: Macro argument reuse 'x' - possible side-effects?
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:63: CHECK: Macro argument reuse 'x' - possible side-effects?
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:76: WARNING: line over 80 characters
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:78: WARNING: line over 80 characters
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:80: WARNING: line over 80 characters
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:82: WARNING: line over 80 characters
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:175: WARNING: line over 80 characters
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:177: WARNING: line over 80 characters
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:266: WARNING: line over 80 characters
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:268: WARNING: line over 80 characters
patches/0008-media-atmel-atmel-isc-base-expose-white-balance-as-v.patch:412: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

