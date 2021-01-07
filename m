Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4678C2ECEC8
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 12:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbhAGLf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 06:35:59 -0500
Received: from www.linuxtv.org ([130.149.80.248]:52960 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbhAGLf7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 06:35:59 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kxTZV-004RUs-I8; Thu, 07 Jan 2021 11:35:17 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kxTct-0005rw-24; Thu, 07 Jan 2021 11:38:47 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] Venus updates (#70533)
Date:   Thu,  7 Jan 2021 11:38:46 +0000
Message-Id: <20210107113846.22519-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107111316.18115-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210107111316.18115-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/84739/
Build time: 00:12:17
Link: https://lore.kernel.org/linux-media/20210107111316.18115-1-stanimir.varbanov@linaro.org

gpg: Signature made Thu 07 Jan 2021 10:53:28 AM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 4/25 patches with issues, being 0 at build time

Error/warnings:

patches/0015-venus-Create-hfi-platform-and-move-vpp-vsp-there.patch:

   checkpatch.pl:
	$ cat patches/0015-venus-Create-hfi-platform-and-move-vpp-vsp-there.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:228: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0020-venus-hfi_plat_v6-Populate-capabilities-for-v6.patch:

   checkpatch.pl:
	$ cat patches/0020-venus-hfi_plat_v6-Populate-capabilities-for-v6.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:55: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0021-venus-hfi_plat-Add-hfi-platform-buffers-ops.patch:

   checkpatch.pl:
	$ cat patches/0021-venus-hfi_plat-Add-hfi-platform-buffers-ops.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0022-venus-Add-platform-buffers-for-v6.patch:

   checkpatch.pl:
	$ cat patches/0022-venus-Add-platform-buffers-for-v6.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:44: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

