Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520BE2FE6A0
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 10:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbhAUJpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 04:45:05 -0500
Received: from www.linuxtv.org ([130.149.80.248]:41798 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728367AbhAUJpC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 04:45:02 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l2WVo-0077XY-Ag; Thu, 21 Jan 2021 09:44:20 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l2WZH-0000Td-5R; Thu, 21 Jan 2021 09:47:55 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] Fixes for compiler/smatch/sparse/syzbot warnings (#71008)
Date:   Thu, 21 Jan 2021 09:47:55 +0000
Message-Id: <20210121094755.1792-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87bafb44-360b-204e-068b-f63fd3bd1055@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/87bafb44-360b-204e-068b-f63fd3bd1055@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/86735/
Build time: 00:06:17
Link: https://lore.kernel.org/linux-media/87bafb44-360b-204e-068b-f63fd3bd1055@xs4all.nl

gpg: Signature made Thu 21 Jan 2021 09:23:29 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/14 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-atomisp-pci-hmm-fix-wrong-printk-format.patch:

   checkpatch.pl:
	$ cat patches/0001-atomisp-pci-hmm-fix-wrong-printk-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:13: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0010-usb-dvb-usb-v2-rtl28xxu.c-clean-up-code-to-fix-smatc.patch:

   checkpatch.pl:
	$ cat patches/0010-usb-dvb-usb-v2-rtl28xxu.c-clean-up-code-to-fix-smatc.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:4: WARNING: A patch subject line should describe the change not the tool that found it

patches/0013-atomisp-pci-add-missing-include.patch:

   checkpatch.pl:
	$ cat patches/0013-atomisp-pci-add-missing-include.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

