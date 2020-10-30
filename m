Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AC42A03B5
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgJ3LKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:10:09 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44956 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbgJ3LKJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:10:09 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYSIJ-0079FH-N9; Fri, 30 Oct 2020 11:10:07 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYSLH-0000Z0-97; Fri, 30 Oct 2020 11:13:11 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Various fixes (#68441)
Date:   Fri, 30 Oct 2020 11:13:11 +0000
Message-Id: <20201030111311.2125-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2b144188-65f4-cd83-5b07-c2e84f1f1fd2@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/2b144188-65f4-cd83-5b07-c2e84f1f1fd2@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/74822/
Build time: 00:11:23
Link: https://lore.kernel.org/linux-media/2b144188-65f4-cd83-5b07-c2e84f1f1fd2@xs4all.nl

gpg: Signature made Fri 30 Oct 2020 10:49:45 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/24 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0003-media-pxa_camera-Use-fallthrough-pseudo-keyword.patch:

   checkpatch.pl:
	$ cat patches/0003-media-pxa_camera-Use-fallthrough-pseudo-keyword.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

