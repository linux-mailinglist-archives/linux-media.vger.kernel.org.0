Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A251250B73
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 00:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgHXWLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 18:11:18 -0400
Received: from www.linuxtv.org ([130.149.80.248]:56698 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbgHXWLR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 18:11:17 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kAKao-00053e-Su; Mon, 24 Aug 2020 22:05:30 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kAKix-0000lK-J4; Mon, 24 Aug 2020 22:13:55 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR 5.10] V4L2 fixes, cleanups and documentation (#20200821164103)
Date:   Mon, 24 Aug 2020 22:13:55 +0000
Message-Id: <20200824221355.2889-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821164103.GN7145@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200821164103.GN7145@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/65618/
Build time: 00:10:20
Link: https://lore.kernel.org/linux-media/20200821164103.GN7145@valkosipuli.retiisi.org.uk

gpg: Signature made Fri 21 Aug 2020 04:35:46 PM UTC
gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: 3 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running cat patches/0005-dt-bindings-media-ov5647-Convert-to-json-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0005-dt-bindings-media-ov5647-Convert-to-json-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:25: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
-:62: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

Error #256 when running cat patches/0016-Documentation-media-Document-how-to-write-camera-sen.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict:
$ cat patches/0016-Documentation-media-Document-how-to-write-camera-sen.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

