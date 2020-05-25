Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917F41E08BB
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 10:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731284AbgEYIY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 04:24:29 -0400
Received: from www.linuxtv.org ([130.149.80.248]:39944 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgEYIY2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 04:24:28 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jd8Ll-0045HO-Mk; Mon, 25 May 2020 08:20:45 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jd8RK-0002sO-QJ; Mon, 25 May 2020 08:26:30 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.8] More camera sensor, documentation patches (#64035)
Date:   Mon, 25 May 2020 08:26:30 +0000
Message-Id: <20200525082630.11015-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525081642.GA8214@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/64035/
Build log: https://builder.linuxtv.org/job/patchwork/52470/
Build time: 00:06:15
Link: https://lore.kernel.org/linux-media/20200525081642.GA8214@valkosipuli.retiisi.org.uk

gpg: Signature made Mon 25 May 2020 08:14:38 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0007-Documentation-media-Refer-to-mbus-format-documentati.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0007-Documentation-media-Refer-to-mbus-format-documentati.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:27: ERROR: trailing whitespace

