Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32559D9240
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389987AbfJPNTM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:19:12 -0400
Received: from www.linuxtv.org ([130.149.80.248]:54313 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388141AbfJPNTM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:19:12 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iKjCh-0007CN-31; Wed, 16 Oct 2019 13:19:03 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iKjD9-0007pD-Bk; Wed, 16 Oct 2019 13:19:31 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Various fixes/improvements
Date:   Wed, 16 Oct 2019 13:19:31 +0000
Message-Id: <20191016131931.30038-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cb6f7dfe-8e7c-5fa9-e287-22daa356bbbe@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59501/
Build log: https://builder.linuxtv.org/job/patchwork/20678/
Build time: 00:09:21
Link: https://lore.kernel.org/linux-media/cb6f7dfe-8e7c-5fa9-e287-22daa356bbbe@xs4all.nl

gpg: Signature made Wed 16 Oct 2019 12:57:44 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-i2c-adv7842-make-array-cri-static-and-const-ma.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-i2c-adv7842-make-array-cri-static-and-const-ma.patch
patches/0009-media-i2c-adv7842-make-array-cri-static-and-const-ma.patch:35: WARNING: line over 80 characters

