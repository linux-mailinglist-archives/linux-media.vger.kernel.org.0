Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E21C353791
	for <lists+linux-media@lfdr.de>; Sun,  4 Apr 2021 11:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhDDJAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Apr 2021 05:00:44 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44940 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbhDDJAn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Apr 2021 05:00:43 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lSycY-00BUWn-Ec; Sun, 04 Apr 2021 09:00:38 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lSygN-0005kS-S8; Sun, 04 Apr 2021 09:04:37 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Venus updates - part3 (#72913)
Date:   Sun,  4 Apr 2021 09:04:35 +0000
Message-Id: <20210404090435.22055-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210404084223.2141401-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210404084223.2141401-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/97233/
Build time: 00:11:46
Link: https://lore.kernel.org/linux-media/20210404084223.2141401-1-stanimir.varbanov@linaro.org

gpg: Signature made Sun 04 Apr 2021 07:18:22 AM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 3/25 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-media-venus-core-pm-Add-handling-for-resets.patch:

   checkpatch.pl:
	$ cat patches/0002-media-venus-core-pm-Add-handling-for-resets.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Duplicate signature

patches/0003-media-venus-core-add-sm8250-DT-compatible-and-resour.patch:

   checkpatch.pl:
	$ cat patches/0003-media-venus-core-add-sm8250-DT-compatible-and-resour.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:86: WARNING: DT compatible string "qcom,sm8250-venus" appears un-documented -- check ./Documentation/devicetree/bindings/

patches/0025-media-venus-vdec-Fix-decoder-cmd-STOP-issue.patch:

   checkpatch.pl:
	$ cat patches/0025-media-venus-vdec-Fix-decoder-cmd-STOP-issue.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:15: WARNING: Duplicate signature


Error #512 when building PDF docs

