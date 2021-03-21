Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3423F3431E8
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 10:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCUJxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 05:53:01 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53450 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229766AbhCUJwj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 05:52:39 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lNulC-008cDV-80; Sun, 21 Mar 2021 09:52:38 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lNup4-0006w3-Sj; Sun, 21 Mar 2021 09:56:38 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Various fixes (#72532)
Date:   Sun, 21 Mar 2021 09:56:38 +0000
Message-Id: <20210321095638.26618-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <dc47d8d9-f12c-d583-5b0e-a3039188cbf0@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/dc47d8d9-f12c-d583-5b0e-a3039188cbf0@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/95225/
Build time: 00:05:26
Link: https://lore.kernel.org/linux-media/dc47d8d9-f12c-d583-5b0e-a3039188cbf0@xs4all.nl

gpg: Signature made Sun 21 Mar 2021 09:35:06 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/11 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0009-media-rkvdec-Remove-of_match_ptr.patch:

   checkpatch.pl:
	$ cat patches/0009-media-rkvdec-Remove-of_match_ptr.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

