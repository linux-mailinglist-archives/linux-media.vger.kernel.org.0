Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5200204CF5
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 10:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731786AbgFWIt7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 04:49:59 -0400
Received: from www.linuxtv.org ([130.149.80.248]:46634 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731691AbgFWIt7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 04:49:59 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jneYp-005pWj-JO; Tue, 23 Jun 2020 08:45:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jnef7-0006Aw-Et; Tue, 23 Jun 2020 08:52:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.9] Camera sensor driver patches + MC crash fix (#64820)
Date:   Tue, 23 Jun 2020 08:52:13 +0000
Message-Id: <20200623085213.23697-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200623083202.GC870@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64820/
Build log: https://builder.linuxtv.org/job/patchwork/56637/
Build time: 00:12:02
Link: https://lore.kernel.org/linux-media/20200623083202.GC870@valkosipuli.retiisi.org.uk

gpg: Signature made Tue 23 Jun 2020 08:22:12 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 6 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0010-media-i2c-imx290-Add-configurable-link-frequency-and.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0010-media-i2c-imx290-Add-configurable-link-frequency-and.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:53: CHECK: Please use a blank line after function/struct/union/enum declarations

Error #256 when running cat patches/0011-media-i2c-imx290-Add-support-for-test-pattern-genera.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0011-media-i2c-imx290-Add-support-for-test-pattern-genera.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:73: WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
-:80: WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst

Error #256 when running cat patches/0012-media-i2c-imx290-Add-RAW12-mode-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0012-media-i2c-imx290-Add-RAW12-mode-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:99: CHECK: Lines should not end with a '('

Error #256 when running cat patches/0013-media-i2c-imx290-Add-support-to-enumerate-all-frame-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0013-media-i2c-imx290-Add-support-to-enumerate-all-frame-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:31: CHECK: Unnecessary parentheses around 'fse->code != imx290_formats[0].code'
-:31: CHECK: Unnecessary parentheses around 'fse->code != imx290_formats[1].code'

Error #256 when running cat patches/0014-media-i2c-imx290-Move-the-settle-time-delay-out-of-l.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0014-media-i2c-imx290-Move-the-settle-time-delay-out-of-l.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:31: WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst

