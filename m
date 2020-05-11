Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FEF1CD655
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 12:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgEKKTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 06:19:38 -0400
Received: from www.linuxtv.org ([130.149.80.248]:41694 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729046AbgEKKTK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 06:19:10 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jY5TD-003b9Z-E3; Mon, 11 May 2020 10:15:35 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jY5YR-000250-Ex; Mon, 11 May 2020 10:20:59 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Report camera properties (#63733)
Date:   Mon, 11 May 2020 10:20:59 +0000
Message-Id: <20200511102059.7953-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <6ad6a156-8a13-d093-b554-7edb1012ad2f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63733/
Build log: https://builder.linuxtv.org/job/patchwork/50465/
Build time: 00:40:32
Link: https://lore.kernel.org/linux-media/6ad6a156-8a13-d093-b554-7edb1012ad2f@xs4all.nl

gpg: Signature made Mon 11 May 2020 09:25:11 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 4 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0005-media-v4l2-ctrls-Add-camera-orientation-and-rotation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0005-media-v4l2-ctrls-Add-camera-orientation-and-rotation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:78: CHECK: spaces preferred around that '+' (ctx:VxV)
-:83: CHECK: spaces preferred around that '+' (ctx:VxV)

Error #256 when running cat patches/0006-media-v4l2-fwnode-Add-helper-to-parse-device-propert.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0006-media-v4l2-fwnode-Add-helper-to-parse-device-propert.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:45: WARNING: line over 80 characters

Error #256 when running cat patches/0009-media-v4l2-ctrls-Add-helper-to-register-properties.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0009-media-v4l2-ctrls-Add-helper-to-register-properties.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:35: WARNING: line over 80 characters
-:111: WARNING: line over 80 characters

