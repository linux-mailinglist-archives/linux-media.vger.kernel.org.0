Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB85C254D48
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 20:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgH0SvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 14:51:06 -0400
Received: from www.linuxtv.org ([130.149.80.248]:49822 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgH0SvG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 14:51:06 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBMtg-0048mC-EB; Thu, 27 Aug 2020 18:45:16 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBN1t-0004Yl-KX; Thu, 27 Aug 2020 18:53:45 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] H.264 API cleanup patches (#66556)
Date:   Thu, 27 Aug 2020 18:53:45 +0000
Message-Id: <20200827185345.17486-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7e9fe6a3-fb71-c6e8-03f7-06d009739368@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7e9fe6a3-fb71-c6e8-03f7-06d009739368@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/65989/
Build time: 01:98:58
Link: https://lore.kernel.org/linux-media/7e9fe6a3-fb71-c6e8-03f7-06d009739368@xs4all.nl

gpg: Signature made Tue 25 Aug 2020 09:04:18 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0003-media-uapi-h264-Split-prediction-weight-parameters.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0003-media-uapi-h264-Split-prediction-weight-parameters.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:79: WARNING: line length of 102 exceeds 100 columns
-:150: CHECK: Alignment should match open parenthesis
-:192: CHECK: spaces preferred around that '+' (ctx:VxV)
-:209: CHECK: Macro argument reuse 'pps' - possible side-effects?
-:209: CHECK: Macro argument reuse 'slice' - possible side-effects?

