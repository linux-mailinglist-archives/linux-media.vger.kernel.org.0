Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCB3254E4E
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 21:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgH0T17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 15:27:59 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53932 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726971AbgH0T14 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 15:27:56 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBNTJ-004BJp-Qh; Thu, 27 Aug 2020 19:22:05 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kBNbX-0005hR-36; Thu, 27 Aug 2020 19:30:35 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.10] Venus updates (#66616)
Date:   Thu, 27 Aug 2020 19:30:35 +0000
Message-Id: <20200827193035.21868-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827100710.11967-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200827100710.11967-1-stanimir.varbanov@linaro.org/
Build log: https://builder.linuxtv.org/job/patchwork/65989/
Build time: 00:36:37
Link: https://lore.kernel.org/linux-media/20200827100710.11967-1-stanimir.varbanov@linaro.org

gpg: Signature made Thu 27 Aug 2020 09:51:11 AM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0004-venus-Rework-recovery-mechanism.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0004-venus-Rework-recovery-mechanism.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:60: WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst

Error #256 when running cat patches/0012-venus-Add-debugfs-interface-to-set-firmware-log-leve.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0012-venus-Add-debugfs-interface-to-set-firmware-log-leve.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:84: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

