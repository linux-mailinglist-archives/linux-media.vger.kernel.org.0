Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01E41CC4DE
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2020 00:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgEIWIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 18:08:24 -0400
Received: from www.linuxtv.org ([130.149.80.248]:58738 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728011AbgEIWIY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 May 2020 18:08:24 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jXXac-001Xwz-Ho; Sat, 09 May 2020 22:04:58 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jXXfo-0005zp-1D; Sat, 09 May 2020 22:10:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.8] V4L2 fwnode improvements, sensor driver patches (#63718)
Date:   Sat,  9 May 2020 22:10:19 +0000
Message-Id: <20200509221019.23008-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509212606.GV867@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63718/
Build log: https://builder.linuxtv.org/job/patchwork/50251/
Build time: 00:40:08
Link: https://lore.kernel.org/linux-media/20200509212606.GV867@valkosipuli.retiisi.org.uk

gpg: Signature made Fri 08 May 2020 03:36:32 PM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0006-media-video-mux-Parse-information-from-firmware-with.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0006-media-video-mux-Parse-information-from-firmware-with.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:70: CHECK: Lines should not end with a '('
-:82: CHECK: Lines should not end with a '('

Error #256 when running cat patches/0007-media-imx-Parse-information-from-firmware-without-us.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-media-imx-Parse-information-from-firmware-without-us.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:94: CHECK: Lines should not end with a '('
-:211: CHECK: Lines should not end with a '('
-:304: CHECK: Lines should not end with a '('
-:448: CHECK: Lines should not end with a '('

