Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECCE12F6FC
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2020 12:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgACLGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 06:06:00 -0500
Received: from www.linuxtv.org ([130.149.80.248]:39826 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbgACLGA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jan 2020 06:06:00 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1inKlW-00A9al-Lo; Fri, 03 Jan 2020 11:05:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1inKnG-0002AM-7h; Fri, 03 Jan 2020 11:07:02 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.6] Sensor and bridge driver patches
Date:   Fri,  3 Jan 2020 11:07:01 +0000
Message-Id: <20200103110701.8284-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103104802.GK5050@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60969/
Build log: https://builder.linuxtv.org/job/patchwork/32031/
Build time: 00:06:52
Link: https://lore.kernel.org/linux-media/20200103104802.GK5050@valkosipuli.retiisi.org.uk

gpg: Signature made Fri 03 Jan 2020 10:44:15 AM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-media-sun4i-csi-Add-support-for-A10-CSI1-camera-sens.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-media-sun4i-csi-Add-support-for-A10-CSI1-camera-sens.patch
patches/0012-media-sun4i-csi-Add-support-for-A10-CSI1-camera-sens.patch:97: WARNING: line over 80 characters
patches/0012-media-sun4i-csi-Add-support-for-A10-CSI1-camera-sens.patch:98: WARNING: line over 80 characters

