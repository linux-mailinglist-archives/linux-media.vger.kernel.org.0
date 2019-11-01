Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5972EC179
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 12:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbfKALBE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 07:01:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:47558 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726711AbfKALBD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Nov 2019 07:01:03 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iQUfn-0008Dd-AL; Fri, 01 Nov 2019 11:00:55 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iQUgM-00016u-C1; Fri, 01 Nov 2019 11:01:30 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Fixes and enhancements
Date:   Fri,  1 Nov 2019 11:01:30 +0000
Message-Id: <20191101110130.4227-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5b66c0ee-a45d-c85c-7556-6f1bf3648203@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59739/
Build log: https://builder.linuxtv.org/job/patchwork/22967/
Build time: 00:11:00
Link: https://lore.kernel.org/linux-media/5b66c0ee-a45d-c85c-7556-6f1bf3648203@xs4all.nl

gpg: Signature made Fri 01 Nov 2019 10:45:29 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0024-bt819-Reduce-amount-of-F-words-in-the-world.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0024-bt819-Reduce-amount-of-F-words-in-the-world.patch
patches/0024-bt819-Reduce-amount-of-F-words-in-the-world.patch:24: WARNING: line over 80 characters

