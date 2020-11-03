Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6E42A3FFB
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 10:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgKCJ2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 04:28:18 -0500
Received: from www.linuxtv.org ([130.149.80.248]:59540 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgKCJ2R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 04:28:17 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZsbw-00Cwba-JT; Tue, 03 Nov 2020 09:28:16 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kZsev-0002c5-Ar; Tue, 03 Nov 2020 09:31:21 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] media: v4l2: simplify compat ioctl handling (#68550)
Date:   Tue,  3 Nov 2020 09:31:21 +0000
Message-Id: <20201103093121.10004-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b16da527-86f2-e28b-0116-997094042142@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/b16da527-86f2-e28b-0116-997094042142@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/75386/
Build time: 00:08:29
Link: https://lore.kernel.org/linux-media/b16da527-86f2-e28b-0116-997094042142@xs4all.nl

gpg: Signature made Tue 03 Nov 2020 09:05:44 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/8 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0006-media-v4l2-convert-v4l2_format-compat-ioctls.patch:

    allmodconfig: return code #0:
	../drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1321:6: warning: unused variable ‘aux_space’ [-Wunused-variable]
	../drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1320:15: warning: unused variable ‘aux_buf’ [-Wunused-variable]

patches/0007-media-v4l2-remaining-compat-handlers.patch:

    allmodconfig: return code #0:
	../drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1357:6: warning: unused variable ‘aux_space’ [-Wunused-variable]
	../drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1356:15: warning: unused variable ‘aux_buf’ [-Wunused-variable]
	At top level:
	../drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1324:12: warning: ‘alloc_userspace’ defined but not used [-Wunused-function]


Error #512 when building PDF docs

