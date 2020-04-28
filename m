Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A254B1BBDF9
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 14:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgD1MrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 08:47:12 -0400
Received: from www.linuxtv.org ([130.149.80.248]:55984 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726784AbgD1MrK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 08:47:10 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jTPaf-001mmO-8J; Tue, 28 Apr 2020 12:43:57 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jTPfZ-0006Ca-1E; Tue, 28 Apr 2020 12:49:01 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.8] Add sensor location/rotation support (#63405)
Date:   Tue, 28 Apr 2020 12:49:00 +0000
Message-Id: <20200428124900.23799-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5fb4b0d8-50a6-6d87-72e8-59ddb44812d1@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63405/
Build log: https://builder.linuxtv.org/job/patchwork/48617/
Build time: 00:38:49
Link: https://lore.kernel.org/linux-media/5fb4b0d8-50a6-6d87-72e8-59ddb44812d1@xs4all.nl

gpg: Signature made Tue 28 Apr 2020 11:59:41 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-v4l2-ctrls-Add-camera-location-and-rotation.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-v4l2-ctrls-Add-camera-location-and-rotation.patch
patches/0005-media-v4l2-ctrls-Add-camera-location-and-rotation.patch:48: CHECK: spaces preferred around that '+' (ctx:VxV)
patches/0005-media-v4l2-ctrls-Add-camera-location-and-rotation.patch:53: CHECK: spaces preferred around that '+' (ctx:VxV)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-v4l2-ctrls-Add-helper-to-register-properties.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-v4l2-ctrls-Add-helper-to-register-properties.patch
patches/0009-media-v4l2-ctrls-Add-helper-to-register-properties.patch:35: WARNING: line over 80 characters
patches/0009-media-v4l2-ctrls-Add-helper-to-register-properties.patch:111: WARNING: line over 80 characters

