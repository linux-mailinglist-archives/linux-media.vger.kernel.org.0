Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4664415D6
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 10:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhKAJJB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 05:09:01 -0400
Received: from www.linuxtv.org ([130.149.80.248]:60642 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231386AbhKAJJA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 05:09:00 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mhTGs-00AVMr-F9; Mon, 01 Nov 2021 09:06:26 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mhTGp-00BrYa-EY; Mon, 01 Nov 2021 09:06:23 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.16-rc1] media updates (#78131)
Date:   Mon,  1 Nov 2021 09:06:23 +0000
Message-Id: <20211101090623.2827434-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211101085616.023abb03@sal.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20211101085616.023abb03@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/153008/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20211101085616.023abb03@sal.lan

gpg: Signature made Mon 01 Nov 2021 08:42:53 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [unknown]
gpg:                 aka "[jpeg image of size 3594]" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F909 AE68 FC11 DF09 C175  5C00 085F 3EBD 8EE4 E115


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-dt-bindings-media-renesas-csi2-Add-r8a779a0-su.patch doesn't apply:
Applying patch patches/0001-media-dt-bindings-media-renesas-csi2-Add-r8a779a0-su.patch
patching file Documentation/devicetree/bindings/media/renesas,csi2.yaml
Hunk #1 FAILED at 30.
1 out of 1 hunk FAILED -- rejects in file Documentation/devicetree/bindings/media/renesas,csi2.yaml
Patch patches/0001-media-dt-bindings-media-renesas-csi2-Add-r8a779a0-su.patch can be reverse-applied

