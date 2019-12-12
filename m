Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4168711CD57
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 13:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbfLLMin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 07:38:43 -0500
Received: from www.linuxtv.org ([130.149.80.248]:45910 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729092AbfLLMin (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 07:38:43 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifNjZ-00A62H-E6; Thu, 12 Dec 2019 12:38:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ifNkk-0004wP-FU; Thu, 12 Dec 2019 12:39:34 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.5 (v2)] cec: four fixes
Date:   Thu, 12 Dec 2019 12:39:34 +0000
Message-Id: <20191212123934.18952-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <adef53aa-ee1c-392e-4961-f6b39d662dcd@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60681/
Build log: https://builder.linuxtv.org/job/patchwork/28878/
Build time: 00:13:05
Link: https://lore.kernel.org/linux-media/adef53aa-ee1c-392e-4961-f6b39d662dcd@xs4all.nl

gpg: Signature made Thu 12 Dec 2019 08:47:42 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-cec-check-transmit_in_progress-not-transmitting.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-cec-check-transmit_in_progress-not-transmitting.patch
patches/0003-cec-check-transmit_in_progress-not-transmitting.patch:61: WARNING: line over 80 characters
patches/0003-cec-check-transmit_in_progress-not-transmitting.patch:68: WARNING: line over 80 characters

