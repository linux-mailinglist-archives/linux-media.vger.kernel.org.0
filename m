Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E271BA9B6
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 18:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgD0QDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 12:03:39 -0400
Received: from www.linuxtv.org ([130.149.80.248]:56838 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgD0QDj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 12:03:39 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jT6BH-000kXn-IQ; Mon, 27 Apr 2020 16:00:27 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jT6GA-00006B-ID; Mon, 27 Apr 2020 16:05:30 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.8] ImgU driver fixes, cleanups (#63393)
Date:   Mon, 27 Apr 2020 16:05:30 +0000
Message-Id: <20200427160530.338-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427155613.GS934@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/63393/
Build log: https://builder.linuxtv.org/job/patchwork/48496/
Build time: 00:05:20
Link: https://lore.kernel.org/linux-media/20200427155613.GS934@valkosipuli.retiisi.org.uk

gpg: Signature made Mon 27 Apr 2020 03:54:05 PM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 2 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-staging-ipu3-imgu-Move-alignment-attribute-to-field.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-staging-ipu3-imgu-Move-alignment-attribute-to-field.patch
patches/0005-staging-ipu3-imgu-Move-alignment-attribute-to-field.patch:38: WARNING: __aligned(size) is preferred over __attribute__((aligned(size)))

