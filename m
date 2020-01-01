Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77E8D12DE57
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 10:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgAAJef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 04:34:35 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48884 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgAAJef (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jan 2020 04:34:35 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1imaNz-007UVI-90; Wed, 01 Jan 2020 09:33:51 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1imaPe-0007xN-5P; Wed, 01 Jan 2020 09:35:34 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] DVB & RC
Date:   Wed,  1 Jan 2020 09:35:34 +0000
Message-Id: <20200101093534.30544-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200101092726.GA15659@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60957/
Build log: https://builder.linuxtv.org/job/patchwork/31734/
Build time: 00:05:22
Link: https://lore.kernel.org/linux-media/20200101092726.GA15659@gofer.mess.org

gpg: Signature made Wed 01 Jan 2020 08:30:04 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-serial_ir-change-ignoring-spike-to-debug-level.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-serial_ir-change-ignoring-spike-to-debug-level.patch
patches/0010-media-serial_ir-change-ignoring-spike-to-debug-level.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0011-media-dvb-add-support-for-TerraTec-TC2-Stick-193534.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0011-media-dvb-add-support-for-TerraTec-TC2-Stick-193534.patch
patches/0011-media-dvb-add-support-for-TerraTec-TC2-Stick-193534.patch:44: WARNING: line over 80 characters

