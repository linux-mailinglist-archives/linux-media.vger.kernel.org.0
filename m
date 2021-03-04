Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E9B32D1E4
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 12:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239184AbhCDLhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 06:37:19 -0500
Received: from www.linuxtv.org ([130.149.80.248]:44416 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238447AbhCDLg5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 06:36:57 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHmHA-0013CY-CB; Thu, 04 Mar 2021 11:36:16 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lHmKw-0005Q9-8K; Thu, 04 Mar 2021 11:40:10 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Various fixes and cleanups (#71906)
Date:   Thu,  4 Mar 2021 11:40:10 +0000
Message-Id: <20210304114010.20796-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0807c7b9-52f0-e680-1320-e52703722a69@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/0807c7b9-52f0-e680-1320-e52703722a69@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/92790/
Build time: 00:08:54
Link: https://lore.kernel.org/linux-media/0807c7b9-52f0-e680-1320-e52703722a69@xs4all.nl

gpg: Signature made Thu 04 Mar 2021 11:02:40 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/19 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0013-media-aspeed-fix-clock-handling-logic.patch:

   checkpatch.pl:
	$ cat patches/0013-media-aspeed-fix-clock-handling-logic.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:43: WARNING: Duplicate signature
	-:44: WARNING: Duplicate signature
	-:61: WARNING: line length of 106 exceeds 100 columns
	-:65: WARNING: line length of 107 exceeds 100 columns

patches/0017-media-i2c-adv7511-remove-open-coded-version-of-SMBus.patch:

   checkpatch.pl:
	$ cat patches/0017-media-i2c-adv7511-remove-open-coded-version-of-SMBus.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:89: WARNING: line length of 103 exceeds 100 columns

patches/0019-media-ngene-switch-from-pci_-to-dma_-API.patch:

   checkpatch.pl:
	$ cat patches/0019-media-ngene-switch-from-pci_-to-dma_-API.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:157: CHECK: Avoid CamelCase: <Cur>
	-:157: CHECK: Avoid CamelCase: <Buffer1>
	-:158: CHECK: Avoid CamelCase: <scList1>
	-:158: CHECK: Avoid CamelCase: <Address>
	-:166: CHECK: Avoid CamelCase: <Buffer2Length>
	-:166: CHECK: Avoid CamelCase: <Buffer2>
	-:167: CHECK: Avoid CamelCase: <scList2>
	-:173: CHECK: Avoid CamelCase: <SCListMemSize>
	-:174: CHECK: Avoid CamelCase: <SCListMem>
	-:177: CHECK: Avoid CamelCase: <MemSize>
	-:177: CHECK: Avoid CamelCase: <Head>
	-:178: CHECK: Avoid CamelCase: <PAHead>
	-:190: CHECK: Avoid CamelCase: <OverflowBuffer>
	-:190: CHECK: Avoid CamelCase: <PAOverflowBuffer>
	-:198: CHECK: Avoid CamelCase: <FWInterfaceBuffer>
	-:199: CHECK: Avoid CamelCase: <PAFWInterfaceBuffer>
	-:228: CHECK: Avoid CamelCase: <Buffer>


Error #512 when building PDF docs

