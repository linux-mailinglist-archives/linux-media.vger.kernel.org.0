Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF2E140752
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 11:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgAQKGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 05:06:37 -0500
Received: from www.linuxtv.org ([130.149.80.248]:35832 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbgAQKGh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 05:06:37 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1isNv6-00CrSQ-Gu; Fri, 17 Jan 2020 09:28:00 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1isNxB-0006Vd-Po; Fri, 17 Jan 2020 09:30:09 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.6] Sensor and ImgU driver patches
Date:   Fri, 17 Jan 2020 09:30:09 +0000
Message-Id: <20200117093009.24980-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117091051.GI793@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61211/
Build log: https://builder.linuxtv.org/job/patchwork/34036/
Build time: 00:09:58
Link: https://lore.kernel.org/linux-media/20200117091051.GI793@valkosipuli.retiisi.org.uk

gpg: Signature made Fri 17 Jan 2020 08:54:16 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-Revert-media-staging-intel-ipu3-make-imgu-use-fixed-.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-Revert-media-staging-intel-ipu3-make-imgu-use-fixed-.patch
patches/0003-Revert-media-staging-intel-ipu3-make-imgu-use-fixed-.patch:112: WARNING: line over 80 characters

