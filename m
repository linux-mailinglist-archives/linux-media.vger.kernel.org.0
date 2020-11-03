Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C5D2A4A00
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 16:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgKCPgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 10:36:49 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54258 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgKCPgt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 10:36:49 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZyMZ-00DJW9-8d; Tue, 03 Nov 2020 15:36:47 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZyPY-00052O-78; Tue, 03 Nov 2020 15:39:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.10] Various fixes for v5.10 (#68563)
Date:   Tue,  3 Nov 2020 15:39:51 +0000
Message-Id: <20201103153951.19323-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <fbf7c3ed-5dea-ada3-f09d-bab2e24a3183@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/fbf7c3ed-5dea-ada3-f09d-bab2e24a3183@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/75423/
Build time: 00:06:17
Link: https://lore.kernel.org/linux-media/fbf7c3ed-5dea-ada3-f09d-bab2e24a3183@xs4all.nl

gpg: Signature made Tue 03 Nov 2020 03:13:55 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/4 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-mtk-vcodec-move-firmware-implementations-into-.patch:

   checkpatch.pl:
	$ cat patches/0001-media-mtk-vcodec-move-firmware-implementations-into-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:298: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

