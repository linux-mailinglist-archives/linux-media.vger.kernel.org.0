Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842321A653A
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 12:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgDMKbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 06:31:40 -0400
Received: from www.linuxtv.org ([130.149.80.248]:47326 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728004AbgDMKbi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 06:31:38 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jNwKY-0005qb-82; Mon, 13 Apr 2020 10:28:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jNwP4-0003LR-Gd; Mon, 13 Apr 2020 10:33:22 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.8] Venus updates (#63004)
Date:   Mon, 13 Apr 2020 10:33:22 +0000
Message-Id: <20200413103322.12816-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200413093000.5567-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63004/
Build log: https://builder.linuxtv.org/job/patchwork/46568/
Build time: 00:03:04
Link: https://lore.kernel.org/linux-media/20200413093000.5567-1-stanimir.varbanov@linaro.org

gpg: Signature made Mon 13 Apr 2020 09:13:46 AM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-venus-vdec-Use-pmruntime-autosuspend.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-venus-vdec-Use-pmruntime-autosuspend.patch
patches/0001-venus-vdec-Use-pmruntime-autosuspend.patch:57: CHECK: struct mutex definition without comment

