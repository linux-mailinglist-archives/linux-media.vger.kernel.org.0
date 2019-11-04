Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0A2EDAC9
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 09:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfKDIs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 03:48:59 -0500
Received: from www.linuxtv.org ([130.149.80.248]:33996 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbfKDIs7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 03:48:59 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iRY2d-0005W5-Go; Mon, 04 Nov 2019 08:48:51 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iRY3D-000128-Jx; Mon, 04 Nov 2019 08:49:27 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR v5.5] Fixes and enhancements
Date:   Mon,  4 Nov 2019 08:49:27 +0000
Message-Id: <20191104084927.3931-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3db3e4e9-c403-7e63-7b0f-dd8dfa76ebcd@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59783/
Build log: https://builder.linuxtv.org/job/patchwork/23386/
Build time: 00:09:18
Link: https://lore.kernel.org/linux-media/3db3e4e9-c403-7e63-7b0f-dd8dfa76ebcd@xs4all.nl

gpg: Signature made Mon 04 Nov 2019 08:27:50 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0023-bt819-Reduce-amount-of-F-words-in-the-world.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0023-bt819-Reduce-amount-of-F-words-in-the-world.patch
patches/0023-bt819-Reduce-amount-of-F-words-in-the-world.patch:24: WARNING: line over 80 characters

