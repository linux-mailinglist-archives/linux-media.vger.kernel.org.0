Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED25CDC95
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 09:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbfJGHwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 03:52:34 -0400
Received: from www.linuxtv.org ([130.149.80.248]:50805 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbfJGHwe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 03:52:34 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iHNog-0006Bq-19; Mon, 07 Oct 2019 07:52:26 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iHNp3-0004Rm-B1; Mon, 07 Oct 2019 07:52:50 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.4] Regression fix for meson CEC drivers
Date:   Mon,  7 Oct 2019 07:52:48 +0000
Message-Id: <20191007075248.17053-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <19c02424-d128-2f56-8e4e-04f11e9e381c@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59240/
Build log: https://builder.linuxtv.org/job/patchwork/19353/
Build time: 00:02:30
Link: https://lore.kernel.org/linux-media/19c02424-d128-2f56-8e4e-04f11e9e381c@xs4all.nl

gpg: Signature made Mon 07 Oct 2019 07:41:59 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-meson-ao-cec-move-cec_notifier_cec_adap_regist.patch

