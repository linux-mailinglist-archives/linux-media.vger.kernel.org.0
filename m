Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E200E30031A
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 13:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbhAVMdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 07:33:19 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54704 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727943AbhAVMc0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 07:32:26 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l2vbG-008tDz-M9; Fri, 22 Jan 2021 12:31:38 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1l2vel-0000Fe-6S; Fri, 22 Jan 2021 12:35:15 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.11] rkisp1: uAPI fixes (#71033)
Date:   Fri, 22 Jan 2021 12:35:15 +0000
Message-Id: <20210122123515.925-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <f2acebbb-5d2a-e609-817b-58750dda82c8@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/f2acebbb-5d2a-e609-817b-58750dda82c8@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/86896/
Build time: 00:04:08
Link: https://lore.kernel.org/linux-media/f2acebbb-5d2a-e609-817b-58750dda82c8@xs4all.nl

gpg: Signature made Fri 22 Jan 2021 12:06:14 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/6 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0006-media-rockchip-rkisp1-extend-uapi-array-sizes.patch:

   checkpatch.pl:
	$ cat patches/0006-media-rockchip-rkisp1-extend-uapi-array-sizes.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:108: WARNING: line length of 101 exceeds 100 columns


Error #512 when building PDF docs

