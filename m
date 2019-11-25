Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80006108F57
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 14:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbfKYN6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 08:58:50 -0500
Received: from www.linuxtv.org ([130.149.80.248]:34012 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727655AbfKYN6u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 08:58:50 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iZEt5-004uQy-IF; Mon, 25 Nov 2019 13:58:47 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iZEtp-0001vs-Mp; Mon, 25 Nov 2019 13:59:33 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] ti-vpe: cal: maintenance
Date:   Mon, 25 Nov 2019 13:59:33 +0000
Message-Id: <20191125135933.7387-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0bb5cc88-e7a3-498e-0e00-2e63bbb74054@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60361/
Build log: https://builder.linuxtv.org/job/patchwork/26438/
Build time: 00:09:07
Link: https://lore.kernel.org/linux-media/0bb5cc88-e7a3-498e-0e00-2e63bbb74054@xs4all.nl

gpg: Signature made Mon 25 Nov 2019 01:35:04 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0020-dt-bindings-media-cal-convert-binding-to-yaml.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0020-dt-bindings-media-cal-convert-binding-to-yaml.patch
patches/0020-dt-bindings-media-cal-convert-binding-to-yaml.patch:232: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt

