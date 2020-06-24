Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFF1207631
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 16:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390529AbgFXO6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 10:58:00 -0400
Received: from www.linuxtv.org ([130.149.80.248]:46462 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389187AbgFXO6A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 10:58:00 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jo6mU-007f1I-Kw; Wed, 24 Jun 2020 14:53:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jo6so-0004Ja-Oz; Wed, 24 Jun 2020 15:00:14 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.9] More fixes (#64876)
Date:   Wed, 24 Jun 2020 15:00:14 +0000
Message-Id: <20200624150014.16545-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <169d364f-8961-1e4b-657c-44a58bc5ec45@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64876/
Build log: https://builder.linuxtv.org/job/patchwork/56817/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/169d364f-8961-1e4b-657c-44a58bc5ec45@xs4all.nl

gpg: Signature made Wed 24 Jun 2020 02:52:00 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-media-request-Fix-crash-if-memory-allocation-f.patch doesn't apply:
Applying patch patches/0001-media-media-request-Fix-crash-if-memory-allocation-f.patch
patching file drivers/media/mc/mc-request.c
Hunk #1 FAILED at 296.
Hunk #2 FAILED at 306.
Hunk #3 FAILED at 336.
3 out of 3 hunks FAILED -- rejects in file drivers/media/mc/mc-request.c
patching file drivers/staging/media/allegro-dvt/allegro-core.c
patching file drivers/staging/media/allegro-dvt/allegro-mail.c
patching file drivers/staging/media/allegro-dvt/allegro-mail.h
Patch patches/0001-media-media-request-Fix-crash-if-memory-allocation-f.patch does not apply (enforce with -f)

