Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9890C44C1C6
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 14:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbhKJNEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 08:04:06 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36604 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231904AbhKJNEF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 08:04:05 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mknE4-007KSx-2z; Wed, 10 Nov 2021 13:01:16 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mknE2-004G0m-2P; Wed, 10 Nov 2021 13:01:14 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.17] Various fixes/enhancements (#78322)
Date:   Wed, 10 Nov 2021 13:01:13 +0000
Message-Id: <20211110130113.1014812-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <734bd659-3f59-63a1-dbf8-28e50ff733e4@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/734bd659-3f59-63a1-dbf8-28e50ff733e4@xs4all.nl/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/734bd659-3f59-63a1-dbf8-28e50ff733e4@xs4all.nl

gpg: Signature made Wed 10 Nov 2021 10:02:56 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5


Build aborted due to a fatal error:
FAILED: patch patch patches/0002-media-gspca-Make-use-of-the-helper-macro-kthread_run.patch doesn't apply:

