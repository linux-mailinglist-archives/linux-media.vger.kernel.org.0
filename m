Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64ABA2F7CD0
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 14:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729409AbhAONhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 08:37:12 -0500
Received: from www.linuxtv.org ([130.149.80.248]:47604 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727357AbhAONhM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 08:37:12 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l0PHC-00GGKm-4p; Fri, 15 Jan 2021 13:36:30 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l0PKd-0007Px-AS; Fri, 15 Jan 2021 13:40:03 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.12] allegro: add HEVC support (#70810)
Date:   Fri, 15 Jan 2021 13:40:03 +0000
Message-Id: <20210115134003.28472-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <6918c2b2-d559-8024-add6-88cc25547b13@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/6918c2b2-d559-8024-add6-88cc25547b13@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/85903/
Build time: 00:08:09
Link: https://lore.kernel.org/linux-media/6918c2b2-d559-8024-add6-88cc25547b13@xs4all.nl

gpg: Signature made Fri 15 Jan 2021 01:13:30 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/18 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-allegro-extract-RBSP-handler-from-H.264-NAL-ge.patch:

   checkpatch.pl:
	$ cat patches/0001-media-allegro-extract-RBSP-handler-from-H.264-NAL-ge.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:437: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0003-media-allegro-add-HEVC-NAL-unit-generator.patch:

   checkpatch.pl:
	$ cat patches/0003-media-allegro-add-HEVC-NAL-unit-generator.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:37: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

