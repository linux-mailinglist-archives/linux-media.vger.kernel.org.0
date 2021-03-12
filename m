Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA45A338875
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 10:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhCLJUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 04:20:11 -0500
Received: from www.linuxtv.org ([130.149.80.248]:59238 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232511AbhCLJTn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 04:19:43 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lKdxO-00CtrJ-46; Fri, 12 Mar 2021 09:19:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lKe1D-0005Kb-3m; Fri, 12 Mar 2021 09:23:39 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] v2: Venus updates (#72161)
Date:   Fri, 12 Mar 2021 09:23:38 +0000
Message-Id: <20210312092338.20450-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312085716.2435846-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210312085716.2435846-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/93925/
Build time: 00:11:32
Link: https://lore.kernel.org/linux-media/20210312085716.2435846-1-stanimir.varbanov@linaro.org

gpg: Signature made Fri 12 Mar 2021 08:44:25 AM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: got 1/10 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0005-media-v4l2-ctrls-Add-control-for-AUD-generation.patch:

   checkpatch.pl:
	$ cat patches/0005-media-v4l2-ctrls-Add-control-for-AUD-generation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:41: WARNING: line length of 105 exceeds 100 columns
	-:61: CHECK: spaces preferred around that '+' (ctx:VxV)


Error #512 when building PDF docs

