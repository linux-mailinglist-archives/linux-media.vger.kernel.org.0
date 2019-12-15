Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8940311F7DF
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 14:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfLONFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 08:05:14 -0500
Received: from www.linuxtv.org ([130.149.80.248]:49202 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbfLONFO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 08:05:14 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1igTZo-00FKqD-T7; Sun, 15 Dec 2019 13:04:48 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1igTb4-0002An-HJ; Sun, 15 Dec 2019 13:06:06 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] vivid touch fixes
Date:   Sun, 15 Dec 2019 13:06:06 +0000
Message-Id: <20191215130606.8312-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <6836d63c-d7ef-9d63-5293-c9af27538fb7@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60737/
Build log: https://builder.linuxtv.org/job/patchwork/29309/
Build time: 00:05:56
Link: https://lore.kernel.org/linux-media/6836d63c-d7ef-9d63-5293-c9af27538fb7@xs4all.nl

gpg: Signature made Sun 15 Dec 2019 12:49:34 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-v4l2-ioctl.c-allow-multiplanar-for-touch.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-v4l2-ioctl.c-allow-multiplanar-for-touch.patch
patches/0002-v4l2-ioctl.c-allow-multiplanar-for-touch.patch:23: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-vivid-support-multiplanar-touch-devices.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-vivid-support-multiplanar-touch-devices.patch
patches/0003-vivid-support-multiplanar-touch-devices.patch:143: WARNING: line over 80 characters

