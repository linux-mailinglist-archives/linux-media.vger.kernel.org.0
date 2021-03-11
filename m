Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE143370EE
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 12:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbhCKLOo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 06:14:44 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46026 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232601AbhCKLOS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 06:14:18 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lKJGi-00Bdf6-Vs; Thu, 11 Mar 2021 11:14:16 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lKJKW-0005mQ-Va; Thu, 11 Mar 2021 11:18:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder (#72071)
Date:   Thu, 11 Mar 2021 11:18:12 +0000
Message-Id: <20210311111812.22046-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <42aa5be6-df5b-09bc-32fb-5be7e8e3932c@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/42aa5be6-df5b-09bc-32fb-5be7e8e3932c@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/93793/
Build time: 00:07:03
Link: https://lore.kernel.org/linux-media/42aa5be6-df5b-09bc-32fb-5be7e8e3932c@xs4all.nl

gpg: Signature made Thu 11 Mar 2021 10:57:54 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/7 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l-Add-packed-YUV444-24bpp-pixel-format.patch:

   checkpatch.pl:
	$ cat patches/0001-media-v4l-Add-packed-YUV444-24bpp-pixel-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:51: ERROR: trailing statements should be on next line

patches/0002-media-dt-bindings-Add-bindings-for-i.MX8QXP-QM-JPEG-.patch:

   checkpatch.pl:
	$ cat patches/0002-media-dt-bindings-Add-bindings-for-i.MX8QXP-QM-JPEG-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0006-media-imx-jpeg-Add-V4L2-driver-for-i.MX8-JPEG-Encode.patch:

   checkpatch.pl:
	$ cat patches/0006-media-imx-jpeg-Add-V4L2-driver-for-i.MX8-JPEG-Encode.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:68: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

