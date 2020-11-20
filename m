Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67262BAAC6
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 14:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgKTNEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 08:04:49 -0500
Received: from www.linuxtv.org ([130.149.80.248]:41458 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgKTNEs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 08:04:48 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kg65n-002lah-3E; Fri, 20 Nov 2020 13:04:47 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kg68s-0001BT-5l; Fri, 20 Nov 2020 13:07:58 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Add support for SDM630/660 Camera Subsystem (#69172)
Date:   Fri, 20 Nov 2020 13:07:58 +0000
Message-Id: <20201120130758.4510-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cf88ebe9-6898-eb0f-896f-bb8efb8bf301@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/cf88ebe9-6898-eb0f-896f-bb8efb8bf301@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/77846/
Build time: 00:05:56
Link: https://lore.kernel.org/linux-media/cf88ebe9-6898-eb0f-896f-bb8efb8bf301@xs4all.nl

gpg: Signature made Fri 20 Nov 2020 12:54:16 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/7 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-camss-ispif-Correctly-reset-based-on-the-VFE-I.patch:

   checkpatch.pl:
	$ cat patches/0001-media-camss-ispif-Correctly-reset-based-on-the-VFE-I.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:108: CHECK: Alignment should match open parenthesis


Error #512 when building PDF docs

