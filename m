Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 126B01559A6
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 15:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgBGOcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 09:32:36 -0500
Received: from www.linuxtv.org ([130.149.80.248]:51642 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726674AbgBGOcf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Feb 2020 09:32:35 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j04f0-005sDA-Bz; Fri, 07 Feb 2020 14:31:10 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1j04hc-0002Oe-DT; Fri, 07 Feb 2020 14:33:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.7] Rename VFL_TYPE_GRABBER to _VIDEO
Date:   Fri,  7 Feb 2020 14:33:52 +0000
Message-Id: <20200207143352.9171-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ff5b3536-840d-4227-1990-897b0b6402b6@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61558/
Build log: https://builder.linuxtv.org/job/patchwork/37089/
Build time: 00:23:40
Link: https://lore.kernel.org/linux-media/ff5b3536-840d-4227-1990-897b0b6402b6@xs4all.nl

gpg: Signature made Fri 07 Feb 2020 01:59:07 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 4 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch
patches/0001-media-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:18: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-usb-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-usb-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch
patches/0006-media-usb-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:231: ERROR: space required after that ',' (ctx:VxV)
patches/0006-media-usb-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:231: ERROR: space required after that ',' (ctx:VxV)
patches/0006-media-usb-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:336: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:298: ERROR: space required after that ',' (ctx:VxV)
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:311: ERROR: space required after that ',' (ctx:VxV)
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:324: WARNING: line over 80 characters
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:337: WARNING: line over 80 characters
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:337: WARNING: Comparisons should place the constant on the right side of the test
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:350: WARNING: line over 80 characters
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:415: WARNING: line over 80 characters
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:428: WARNING: line over 80 characters
patches/0009-media-pci-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:428: ERROR: do not use assignment in if condition

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-platform-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-platform-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch
patches/0010-media-platform-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:831: WARNING: line over 80 characters
patches/0010-media-platform-rename-VFL_TYPE_GRABBER-to-_VIDEO.patch:840: WARNING: line over 80 characters

