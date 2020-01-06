Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 468AC13133B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 14:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgAFNx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 08:53:27 -0500
Received: from www.linuxtv.org ([130.149.80.248]:34500 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgAFNx1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 08:53:27 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ioSo9-00EfBB-TN; Mon, 06 Jan 2020 13:52:37 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ioSpw-0003pB-JZ; Mon, 06 Jan 2020 13:54:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] Various fixes
Date:   Mon,  6 Jan 2020 13:54:28 +0000
Message-Id: <20200106135428.14656-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2337b954-6d92-319f-91d9-caa66713571e@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60987/
Build log: https://builder.linuxtv.org/job/patchwork/32479/
Build time: 00:13:30
Link: https://lore.kernel.org/linux-media/2337b954-6d92-319f-91d9-caa66713571e@xs4all.nl

gpg: Signature made Mon 06 Jan 2020 01:34:08 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-v4l2-Fix-fourcc-names-for-12b-and-14b-packed-b.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-v4l2-Fix-fourcc-names-for-12b-and-14b-packed-b.patch
patches/0002-media-v4l2-Fix-fourcc-names-for-12b-and-14b-packed-b.patch:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-pci-bt8xx-convert-to-i2c_new_scanned_device.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-pci-bt8xx-convert-to-i2c_new_scanned_device.patch
patches/0010-media-pci-bt8xx-convert-to-i2c_new_scanned_device.patch:35: WARNING: line over 80 characters

