Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 180DDC9D22
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbfJCLXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:23:53 -0400
Received: from www.linuxtv.org ([130.149.80.248]:55301 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729304AbfJCLXw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 07:23:52 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFzCz-0003au-Ny; Thu, 03 Oct 2019 11:23:45 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFzDM-0000Ez-D7; Thu, 03 Oct 2019 11:24:08 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] Two cec fixes
Date:   Thu,  3 Oct 2019 11:24:08 +0000
Message-Id: <20191003112408.884-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <df1e93e3-25d9-6ff3-4ad2-2293c2feeddc@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59161/
Build log: https://builder.linuxtv.org/job/patchwork/18798/
Build time: 00:03:26
Link: https://lore.kernel.org/linux-media/df1e93e3-25d9-6ff3-4ad2-2293c2feeddc@xs4all.nl

gpg: Signature made Thu 03 Oct 2019 11:08:51 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-cec-funcs.h-add-status_req-checks.patch

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-cec-funcs.h-use-new-CEC_OP_UI_CMD-defines.patch

