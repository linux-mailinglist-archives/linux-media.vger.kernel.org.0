Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B4832FC16
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 17:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhCFQwI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 11:52:08 -0500
Received: from www.linuxtv.org ([130.149.80.248]:38218 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230311AbhCFQvv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Mar 2021 11:51:51 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lIa9e-004YOu-7g; Sat, 06 Mar 2021 16:51:50 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lIaDQ-000133-Ou; Sat, 06 Mar 2021 16:55:44 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Venus updates (#71975)
Date:   Sat,  6 Mar 2021 16:55:44 +0000
Message-Id: <20210306165544.3988-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306162903.221668-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210306162903.221668-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/93108/
Build time: 00:12:02
Link: https://lore.kernel.org/linux-media/20210306162903.221668-1-stanimir.varbanov@linaro.org

gpg: Signature made Sat 06 Mar 2021 04:14:50 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 3/10 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0005-media-v4l2-ctrls-Add-control-for-AUD-generation.patch:

   checkpatch.pl:
	$ cat patches/0005-media-v4l2-ctrls-Add-control-for-AUD-generation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:41: WARNING: line length of 105 exceeds 100 columns
	-:61: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0008-media-venus-core-venc-vdec-Fix-probe-dependency-erro.patch:

   checkpatch.pl:
	$ cat patches/0008-media-venus-core-venc-vdec-Fix-probe-dependency-erro.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'Commit aaaa93eda64b ("[media] media: venus: venc: add video encoder files")'
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0010-venus-core-Parse-firmware-name-DT-property.patch:

   checkpatch.pl:
	$ cat patches/0010-venus-core-Parse-firmware-name-DT-property.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: 'Reviewed-by:' is the preferred signature form


Error #512 when building PDF docs

