Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF9A27720B
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 15:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgIXNVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 09:21:33 -0400
Received: from www.linuxtv.org ([130.149.80.248]:45624 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727800AbgIXNVd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 09:21:33 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kLR5Z-004yrG-Bs; Thu, 24 Sep 2020 13:15:09 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kLRET-0001ZM-I8; Thu, 24 Sep 2020 13:24:21 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.9-rc7] media fixes (#67321)
Date:   Thu, 24 Sep 2020 13:24:20 +0000
Message-Id: <20200924132420.5991-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200924143834.79ef0744@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200924143834.79ef0744@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/69718/
Build time: 00:31:31
Link: https://lore.kernel.org/linux-media/20200924143834.79ef0744@coco.lan

gpg: Signature made Thu 24 Sep 2020 12:21:43 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]

Summary: got 3/3 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-cec-adap.c-don-t-use-flush_scheduled_work.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-media-v4l2-remove-V4L2_FLAG_MEMORY_NON_CONSIST.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-media-dt-bindings-media-imx274-Convert-to-json-schem.patch:

   checkpatch.pl:
	$ cat patches/0003-media-dt-bindings-media-imx274-Convert-to-json-schem.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:27: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:67: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst


Error #512 when building PDF docs

