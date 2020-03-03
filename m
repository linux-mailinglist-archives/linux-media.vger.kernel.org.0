Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6CEE177A65
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 16:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729855AbgCCP1h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 10:27:37 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48642 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729819AbgCCP1g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Mar 2020 10:27:36 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j99QV-001Efl-Kk; Tue, 03 Mar 2020 15:25:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j99Tk-0007vy-7w; Tue, 03 Mar 2020 15:29:04 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] Various fixes (#61923)
Date:   Tue,  3 Mar 2020 15:29:04 +0000
Message-Id: <20200303152904.30457-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ed35bc9d-e18f-d4de-3a0f-d1725ebd8f0b@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61923/
Build log: https://builder.linuxtv.org/job/patchwork/40694/
Build time: 00:18:51
Link: https://lore.kernel.org/linux-media/ed35bc9d-e18f-d4de-3a0f-d1725ebd8f0b@xs4all.nl

gpg: Signature made Tue 03 Mar 2020 03:04:38 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-v4l2-ctrls-v4l2_ctrl_request_complete-should-always-.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-v4l2-ctrls-v4l2_ctrl_request_complete-should-always-.patch
patches/0012-v4l2-ctrls-v4l2_ctrl_request_complete-should-always-.patch:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

