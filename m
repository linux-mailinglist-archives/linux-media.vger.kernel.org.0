Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A301D9197
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 10:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgESIDZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 04:03:25 -0400
Received: from www.linuxtv.org ([130.149.80.248]:41114 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbgESIDZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 04:03:25 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jaxAC-00Dpcr-W8; Tue, 19 May 2020 07:59:48 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jaxFd-0004Jy-4J; Tue, 19 May 2020 08:05:25 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] move rockchip dphy rx0 bindings out of staging (#63916)
Date:   Tue, 19 May 2020 08:05:24 +0000
Message-Id: <20200519080524.16567-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <8de4c526-ef2c-51db-ac5f-17a240612df7@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63916/
Build log: https://builder.linuxtv.org/job/patchwork/51603/
Build time: 00:14:46
Link: https://lore.kernel.org/linux-media/8de4c526-ef2c-51db-ac5f-17a240612df7@xs4all.nl

gpg: Signature made Tue 19 May 2020 07:43:23 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0002-dt-bindings-phy-phy-rockchip-dphy-rx0-move-rockchip-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0002-dt-bindings-phy-phy-rockchip-dphy-rx0-move-rockchip-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
-:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

