Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8701C17E15D
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 14:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgCINjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 09:39:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:42952 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbgCINjE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 09:39:04 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jBIae-008Uk7-L1; Mon, 09 Mar 2020 13:37:04 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jBIe2-0003X7-Fc; Mon, 09 Mar 2020 13:40:34 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] DVB & RC (#62001)
Date:   Mon,  9 Mar 2020 13:40:34 +0000
Message-Id: <20200309134034.13540-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309132259.GA10756@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/62001/
Build log: https://builder.linuxtv.org/job/patchwork/41548/
Build time: 00:10:24
Link: https://lore.kernel.org/linux-media/20200309132259.GA10756@gofer.mess.org

gpg: Signature made Mon 09 Mar 2020 12:55:50 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-m88ds3103-Add-support-for-ds3103b-demod.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-m88ds3103-Add-support-for-ds3103b-demod.patch
patches/0002-m88ds3103-Add-support-for-ds3103b-demod.patch:508: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-em28xx-Enable-Hauppauge-461e-rev2.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-em28xx-Enable-Hauppauge-461e-rev2.patch
patches/0003-em28xx-Enable-Hauppauge-461e-rev2.patch:84: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-dw2102-probe-for-demodulator-i2c-address.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-dw2102-probe-for-demodulator-i2c-address.patch
patches/0004-dw2102-probe-for-demodulator-i2c-address.patch:76: WARNING: line over 80 characters

