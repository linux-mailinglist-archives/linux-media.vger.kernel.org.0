Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F6217E30E
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 16:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgCIPFG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 11:05:06 -0400
Received: from www.linuxtv.org ([130.149.80.248]:60594 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgCIPFG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 11:05:06 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jBJvu-008Z5p-Rq; Mon, 09 Mar 2020 15:03:06 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jBJzI-0003C7-QG; Mon, 09 Mar 2020 15:06:36 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.7] Venus updates - part2 (#62002)
Date:   Mon,  9 Mar 2020 15:06:36 +0000
Message-Id: <20200309150636.12238-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309145638.28136-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/62002/
Build log: https://builder.linuxtv.org/job/patchwork/41557/
Build time: 00:06:24
Link: https://lore.kernel.org/linux-media/20200309145638.28136-1-stanimir.varbanov@linaro.org

gpg: Signature made Mon 09 Mar 2020 02:08:59 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-venus-vdec-Fix-smatch-warning-in-start-streaming.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-venus-vdec-Fix-smatch-warning-in-start-streaming.patch
patches/0001-venus-vdec-Fix-smatch-warning-in-start-streaming.patch:4: WARNING: A patch subject line should describe the change not the tool that found it

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-venus-support-frame-rate-control.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-venus-support-frame-rate-control.patch
patches/0002-venus-support-frame-rate-control.patch:72: CHECK: Alignment should match open parenthesis

