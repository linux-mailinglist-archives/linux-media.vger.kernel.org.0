Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F951B24AC
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 13:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgDULK3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 07:10:29 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48316 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDULK3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 07:10:29 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jQqkO-00AQ9N-BZ; Tue, 21 Apr 2020 11:07:24 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jQqp7-0000KH-76; Tue, 21 Apr 2020 11:12:17 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] analog support (#63131)
Date:   Tue, 21 Apr 2020 11:12:17 +0000
Message-Id: <20200421111217.1030-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200416140338.GA18975@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63131/
Build log: https://builder.linuxtv.org/job/patchwork/47607/
Build time: 00:14:43
Link: https://lore.kernel.org/linux-media/20200416140338.GA18975@gofer.mess.org

gpg: Signature made Thu 16 Apr 2020 12:17:16 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-si2157-module-debug-option-to-wait-on-signal-l.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-si2157-module-debug-option-to-wait-on-signal-l.patch
patches/0006-media-si2157-module-debug-option-to-wait-on-signal-l.patch:83: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0011-media-cx231xx-Add-i2c-device-analog-tuner-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0011-media-cx231xx-Add-i2c-device-analog-tuner-support.patch
patches/0011-media-cx231xx-Add-i2c-device-analog-tuner-support.patch:52: CHECK: Alignment should match open parenthesis
patches/0011-media-cx231xx-Add-i2c-device-analog-tuner-support.patch:56: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-lgdt3306a-Add-CNR-v5-stat.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0013-media-lgdt3306a-Add-CNR-v5-stat.patch
patches/0013-media-lgdt3306a-Add-CNR-v5-stat.patch:53: WARNING: line over 80 characters

