Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D546D13700C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 15:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgAJOyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 09:54:06 -0500
Received: from www.linuxtv.org ([130.149.80.248]:60258 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbgAJOyG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 09:54:06 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ipvey-003FjC-UO; Fri, 10 Jan 2020 14:53:12 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ipvgt-0002ID-BE; Fri, 10 Jan 2020 14:55:11 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.6] Venus updates
Date:   Fri, 10 Jan 2020 14:55:11 +0000
Message-Id: <20200110145511.8772-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110144017.16648-1-stanimir.varbanov@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61112/
Build log: https://builder.linuxtv.org/job/patchwork/33062/
Build time: 00:05:03
Link: https://lore.kernel.org/linux-media/20200110144017.16648-1-stanimir.varbanov@linaro.org

gpg: Signature made Fri 10 Jan 2020 02:33:09 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2

Summary: 6 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-venus-redesign-clocks-and-pm-domains-control.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-venus-redesign-clocks-and-pm-domains-control.patch
patches/0003-venus-redesign-clocks-and-pm-domains-control.patch:679: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-dt-bindings-media-venus-Convert-msm8916-to-DT-schema.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-dt-bindings-media-venus-Convert-msm8916-to-DT-schema.patch
patches/0007-dt-bindings-media-venus-Convert-msm8916-to-DT-schema.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-dt-bindings-media-venus-Convert-msm8996-to-DT-schema.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-dt-bindings-media-venus-Convert-msm8996-to-DT-schema.patch
patches/0008-dt-bindings-media-venus-Convert-msm8996-to-DT-schema.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-dt-bindings-media-venus-Convert-sdm845-to-DT-schema.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-dt-bindings-media-venus-Convert-sdm845-to-DT-schema.patch
patches/0009-dt-bindings-media-venus-Convert-sdm845-to-DT-schema.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-dt-bindings-media-venus-Add-sdm845v2-DT-schema.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-dt-bindings-media-venus-Add-sdm845v2-DT-schema.patch
patches/0010-dt-bindings-media-venus-Add-sdm845v2-DT-schema.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-dt-bindings-media-venus-delete-old-binding-document.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-dt-bindings-media-venus-delete-old-binding-document.patch
patches/0012-dt-bindings-media-venus-delete-old-binding-document.patch:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0012-dt-bindings-media-venus-delete-old-binding-document.patch:20: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt

