Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E547309DBC
	for <lists+linux-media@lfdr.de>; Sun, 31 Jan 2021 16:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhAaPof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jan 2021 10:44:35 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36302 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229894AbhAaPod (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jan 2021 10:44:33 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l6EtB-004gLe-Q3; Sun, 31 Jan 2021 15:43:49 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l6Ewk-0003Ql-7h; Sun, 31 Jan 2021 15:47:30 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] MaxLinear 692 and smipcie-ir fix (#71207)
Date:   Sun, 31 Jan 2021 15:47:30 +0000
Message-Id: <20210131154730.13146-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210131152818.GA6521@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210131152818.GA6521@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/88211/
Build time: 00:05:11
Link: https://lore.kernel.org/linux-media/20210131152818.GA6521@gofer.mess.org

gpg: Signature made Sun 31 Jan 2021 03:15:16 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 2/5 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-mxl692-MaxLinear-692-ATSC-demod-tuner-driver.patch:

   checkpatch.pl:
	$ cat patches/0001-mxl692-MaxLinear-692-ATSC-demod-tuner-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:59: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:607: WARNING: line length of 102 exceeds 100 columns
	-:1253: WARNING: line length of 104 exceeds 100 columns

patches/0005-media-smipcie-fix-interrupt-handling-and-IR-timeout.patch:

   checkpatch.pl:
	$ cat patches/0005-media-smipcie-fix-interrupt-handling-and-IR-timeout.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:45: CHECK: Avoid CamelCase: <rbIRVld>
	-:61: CHECK: Avoid CamelCase: <irData>
	-:72: CHECK: Avoid CamelCase: <rbIRhighidle>


Error #512 when building PDF docs

