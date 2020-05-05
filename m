Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E2D1C538A
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgEEKpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:45:03 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48432 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgEEKpC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:45:02 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jVv1C-00CbqP-5l; Tue, 05 May 2020 10:41:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jVv6H-0006HF-7o; Tue, 05 May 2020 10:46:57 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Various fixes (#63605)
Date:   Tue,  5 May 2020 10:46:57 +0000
Message-Id: <20200505104657.24088-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0d19d00a-f419-fd67-d844-776720da2613@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63605/
Build log: https://builder.linuxtv.org/job/patchwork/49612/
Build time: 00:06:45
Link: https://lore.kernel.org/linux-media/0d19d00a-f419-fd67-d844-776720da2613@xs4all.nl

gpg: Signature made Tue 05 May 2020 10:35:23 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0019-media-cec-silence-shift-wrapping-warning-in-__cec_s_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0019-media-cec-silence-shift-wrapping-warning-in-__cec_s_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:30: WARNING: line over 80 characters

