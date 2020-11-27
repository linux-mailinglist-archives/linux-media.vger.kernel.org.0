Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7345B2C6641
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 14:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbgK0NGF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 08:06:05 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36892 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729850AbgK0NGE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 08:06:04 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kidRr-00CdmA-25; Fri, 27 Nov 2020 13:06:03 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kidUy-0008HE-0o; Fri, 27 Nov 2020 13:09:16 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.10-rc6] vidtv driver fixes (#69439)
Date:   Fri, 27 Nov 2020 13:09:15 +0000
Message-Id: <20201127130915.31773-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127134100.101be34e@coco.lan>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201127134100.101be34e@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/78851/
Build time: 00:16:21
Link: https://lore.kernel.org/linux-media/20201127134100.101be34e@coco.lan

gpg: Signature made Fri 27 Nov 2020 12:34:41 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]

Summary: got 3/36 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0008-media-vidtv-add-error-checks.patch:

   checkpatch.pl:
	$ cat patches/0008-media-vidtv-add-error-checks.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:15: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0015-media-vidtv-do-some-cleanups-at-the-driver.patch:

    allmodconfig: return code #0:
	../drivers/media/test-drivers/vidtv/vidtv_psi.c:116:12: warning: ‘vidtv_psi_pmt_get_desc_loop_len’ defined but not used [-Wunused-function]
	../drivers/media/test-drivers/vidtv/vidtv_psi.c:105:1: warning: ‘vidtv_psi_pmt_stream_get_desc_loop_len’ defined but not used [-Wunused-function]
	../drivers/media/test-drivers/vidtv/vidtv_psi.c:93:1: warning: ‘vidtv_psi_sdt_serv_get_desc_loop_len’ defined but not used [-Wunused-function]

patches/0019-media-vidtv-improve-EIT-data.patch:

   checkpatch.pl:
	$ cat patches/0019-media-vidtv-improve-EIT-data.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:27: WARNING: line length of 154 exceeds 100 columns


Error #512 when building PDF docs

