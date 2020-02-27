Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C312171786
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 13:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgB0MhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 07:37:17 -0500
Received: from www.linuxtv.org ([130.149.80.248]:55210 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728994AbgB0MhR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 07:37:17 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j7IO1-00CVSW-TB; Thu, 27 Feb 2020 12:35:29 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j7IR8-00010Z-7t; Thu, 27 Feb 2020 12:38:42 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] Various fixes (#61841)
Date:   Thu, 27 Feb 2020 12:38:42 +0000
Message-Id: <20200227123842.3834-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <fb6dde22-ab34-72e8-64e9-4c612de7363c@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61841/
Build log: https://builder.linuxtv.org/job/patchwork/39958/
Build time: 00:08:32
Link: https://lore.kernel.org/linux-media/fb6dde22-ab34-72e8-64e9-4c612de7363c@xs4all.nl

gpg: Signature made Thu 27 Feb 2020 12:18:32 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-aspeed-add-AST2600-support.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-aspeed-add-AST2600-support.patch
patches/0001-media-aspeed-add-AST2600-support.patch:65: WARNING: line over 80 characters

