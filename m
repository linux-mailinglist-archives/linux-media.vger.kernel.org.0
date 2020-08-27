Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DB1254A28
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 18:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgH0QEY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 12:04:24 -0400
Received: from www.linuxtv.org ([130.149.80.248]:55998 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgH0QEY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 12:04:24 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBKIM-003yfW-E4; Thu, 27 Aug 2020 15:58:34 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBKQZ-0000GO-FF; Thu, 27 Aug 2020 16:07:03 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Add support for mt2701 JPEG ENC support (#66412)
Date:   Thu, 27 Aug 2020 16:07:03 +0000
Message-Id: <20200827160703.969-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e568cde0-ebaf-d649-4c99-b99e15542b36@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/e568cde0-ebaf-d649-4c99-b99e15542b36@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/65989/
Build time: 00:24:05
Link: https://lore.kernel.org/linux-media/e568cde0-ebaf-d649-4c99-b99e15542b36@xs4all.nl

gpg: Signature made Wed 19 Aug 2020 11:32:32 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 7 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0007-media-v4l2-mem2mem-add-v4l2_m2m_suspend-v4l2_m2m_res.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-media-v4l2-mem2mem-add-v4l2_m2m_suspend-v4l2_m2m_res.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:32: CHECK: Prefer using the BIT macro
-:34: CHECK: Please don't use multiple blank lines

Error #256 when running cat patches/0019-media-platform-Refactor-mtk_jpeg_find_format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0019-media-platform-Refactor-mtk_jpeg_find_format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:134: CHECK: Alignment should match open parenthesis

Error #256 when running cat patches/0024-media-dt-bindings-Add-jpeg-enc-device-tree-node-docu.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0024-media-dt-bindings-Add-jpeg-enc-device-tree-node-docu.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
-:18: WARNING: DT bindings should be in DT schema format. See: Documentation/devicetree/writing-schema.rst

Error #256 when running cat patches/0025-media-platform-Rename-jpeg-dec-file-name.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0025-media-platform-Rename-jpeg-dec-file-name.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:15: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running cat patches/0026-media-platform-Rename-existing-functions-defines-var.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0026-media-platform-Rename-existing-functions-defines-var.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:172: CHECK: Alignment should match open parenthesis

Error #256 when running cat patches/0028-media-platform-Add-jpeg-enc-feature.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0028-media-platform-Add-jpeg-enc-feature.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:618: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

