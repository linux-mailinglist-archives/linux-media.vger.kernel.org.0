Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C0C333B33
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 12:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhCJLOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 06:14:38 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48532 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231248AbhCJLOh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 06:14:37 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lJwnU-00ADZa-Le; Wed, 10 Mar 2021 11:14:36 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lJwrI-0001C2-Uv; Wed, 10 Mar 2021 11:18:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.12] coda: fix macroblocks count control usage (#72027)
Date:   Wed, 10 Mar 2021 11:18:32 +0000
Message-Id: <20210310111832.4545-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <9e1a6ca6-7a52-0fc4-1ae5-ca73a0ff493a@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/9e1a6ca6-7a52-0fc4-1ae5-ca73a0ff493a@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/93649/
Build time: 00:02:37
Link: https://lore.kernel.org/linux-media/9e1a6ca6-7a52-0fc4-1ae5-ca73a0ff493a@xs4all.nl

gpg: Signature made Wed 10 Mar 2021 10:54:26 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 0/1 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:


Error #512 when building PDF docs

