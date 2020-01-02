Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C4612E6F1
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2020 14:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbgABNyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jan 2020 08:54:06 -0500
Received: from www.linuxtv.org ([130.149.80.248]:58200 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728342AbgABNyG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jan 2020 08:54:06 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1in0uf-008yff-Dx; Thu, 02 Jan 2020 13:53:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1in0wN-0000vO-8u; Thu, 02 Jan 2020 13:55:07 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.6] Smiapp PM patches and omap3isp fixes
Date:   Thu,  2 Jan 2020 13:55:07 +0000
Message-Id: <20200102135507.3512-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200102134658.GH5050@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60967/
Build log: https://builder.linuxtv.org/job/patchwork/31904/
Build time: 00:04:57
Link: https://lore.kernel.org/linux-media/20200102134658.GH5050@valkosipuli.retiisi.org.uk

gpg: Signature made Thu 02 Jan 2020 01:42:43 PM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-smiapp-Avoid-maintaining-power-state-information.patch
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:114: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:120: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:132: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:139: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:146: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:152: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:158: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:164: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:170: CHECK: Lines should not end with a '('
patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:268: WARNING: Avoid multiple line dereference - prefer 'sensor->pixel_array->ctrl_handler'

