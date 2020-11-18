Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB16B2B7C02
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgKRLAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:00:11 -0500
Received: from www.linuxtv.org ([130.149.80.248]:50520 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727334AbgKRLAL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:00:11 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kfLC6-00HRqE-9b; Wed, 18 Nov 2020 11:00:10 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kfLFA-0000nT-T5; Wed, 18 Nov 2020 11:03:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for 5.11] V4L2 sensor and CSI-2 driver patches (#69036)
Date:   Wed, 18 Nov 2020 11:03:20 +0000
Message-Id: <20201118110320.3022-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118104121.GE867@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201118104121.GE867@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/77545/
Build time: 00:08:16
Link: https://lore.kernel.org/linux-media/20201118104121.GE867@valkosipuli.retiisi.org.uk

gpg: Signature made Wed 18 Nov 2020 10:33:24 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 4/12 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-media-i2c-Add-ov9734-image-sensor-driver.patch:

   checkpatch.pl:
	$ cat patches/0002-media-i2c-Add-ov9734-image-sensor-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: WARNING: Possible repeated word: 'git'

patches/0009-dt-bindings-ov2680-convert-bindings-to-yaml.patch:

   checkpatch.pl:
	$ cat patches/0009-dt-bindings-ov2680-convert-bindings-to-yaml.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:73: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0010-dt-bindings-imx7-csi-convert-bindings-to-yaml.patch:

   checkpatch.pl:
	$ cat patches/0010-dt-bindings-imx7-csi-convert-bindings-to-yaml.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:69: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0011-dt-bindings-imx7-mipi-csi2-convert-bindings-to-yaml.patch:

   checkpatch.pl:
	$ cat patches/0011-dt-bindings-imx7-mipi-csi2-convert-bindings-to-yaml.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:25: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:117: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst


Error #512 when building PDF docs

