Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA1E1301AA
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 10:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgADJx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 04:53:58 -0500
Received: from www.linuxtv.org ([130.149.80.248]:37628 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgADJx5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Jan 2020 04:53:57 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ing7K-00BQSO-Vf; Sat, 04 Jan 2020 09:53:10 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ing95-00075X-W6; Sat, 04 Jan 2020 09:55:00 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] More RC & DVB
Date:   Sat,  4 Jan 2020 09:54:59 +0000
Message-Id: <20200104095459.27206-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200104093154.GA10172@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60979/
Build log: https://builder.linuxtv.org/job/patchwork/32167/
Build time: 00:14:48
Link: https://lore.kernel.org/linux-media/20200104093154.GA10172@gofer.mess.org

gpg: Signature made Sat 04 Jan 2020 09:19:06 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-dib0070-incorrect-format-specifiers-detected-b.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-dib0070-incorrect-format-specifiers-detected-b.patch
patches/0003-media-dib0070-incorrect-format-specifiers-detected-b.patch:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0003-media-dib0070-incorrect-format-specifiers-detected-b.patch:119: CHECK: Avoid CamelCase: <Rest>

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-dib0090-incorrect-format-specifier-detected-by.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-dib0090-incorrect-format-specifier-detected-by.patch
patches/0004-media-dib0090-incorrect-format-specifier-detected-by.patch:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0004-media-dib0090-incorrect-format-specifier-detected-by.patch:35: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-dvb_dummy_fe-Fix-ERROR-POINTER_LOCATION-AVOID_.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-dvb_dummy_fe-Fix-ERROR-POINTER_LOCATION-AVOID_.patch
patches/0005-media-dvb_dummy_fe-Fix-ERROR-POINTER_LOCATION-AVOID_.patch:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

