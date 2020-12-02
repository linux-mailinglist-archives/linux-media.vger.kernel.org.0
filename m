Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CC82CBB67
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 12:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbgLBLSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 06:18:23 -0500
Received: from www.linuxtv.org ([130.149.80.248]:56124 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgLBLSX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 06:18:23 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkQ8j-001uNF-Ht; Wed, 02 Dec 2020 11:17:41 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkQBt-0007C7-DV; Wed, 02 Dec 2020 11:20:57 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.10] vb2: set cache sync hints when init buffers (#69615)
Date:   Wed,  2 Dec 2020 11:20:57 +0000
Message-Id: <20201202112057.27614-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <be02c22a-f164-d30b-4a17-774d819ea60f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/be02c22a-f164-d30b-4a17-774d819ea60f@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/79560/
Build time: 00:02:59
Link: https://lore.kernel.org/linux-media/be02c22a-f164-d30b-4a17-774d819ea60f@xs4all.nl

gpg: Signature made Wed 02 Dec 2020 10:42:55 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 0/1 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:


Error #512 when building PDF docs

