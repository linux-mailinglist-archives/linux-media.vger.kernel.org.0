Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05722A8043
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 15:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbgKEOBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 09:01:55 -0500
Received: from www.linuxtv.org ([130.149.80.248]:37496 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730465AbgKEOBy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 09:01:54 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kafpp-00GAfy-7E; Thu, 05 Nov 2020 14:01:53 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kafsp-0008Sj-0K; Thu, 05 Nov 2020 14:04:59 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Various fixes (#68659)
Date:   Thu,  5 Nov 2020 14:04:58 +0000
Message-Id: <20201105140458.32488-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <01dbfda7-c126-8b8b-4af5-2cc767b34e19@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/01dbfda7-c126-8b8b-4af5-2cc767b34e19@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/75701/
Build time: 00:12:23
Link: https://lore.kernel.org/linux-media/01dbfda7-c126-8b8b-4af5-2cc767b34e19@xs4all.nl

gpg: Signature made Thu 05 Nov 2020 01:46:31 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/15 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0009-coda-Add-a-V4L2-user-for-control-error-macroblocks-c.patch:

   checkpatch.pl:
	$ cat patches/0009-coda-Add-a-V4L2-user-for-control-error-macroblocks-c.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:95: CHECK: Alignment should match open parenthesis


Error #512 when building PDF docs

