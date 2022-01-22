Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB85496B26
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 10:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbiAVJLF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 04:11:05 -0500
Received: from www.linuxtv.org ([130.149.80.248]:46408 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231895AbiAVJLF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 04:11:05 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nBCQJ-002jY8-VA; Sat, 22 Jan 2022 09:11:03 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nBCQH-0045eR-Ku; Sat, 22 Jan 2022 09:11:01 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] Clean up "mediatek,larb" (#80204)
Date:   Sat, 22 Jan 2022 09:11:01 +0000
Message-Id: <20220122091101.974989-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <7af52d61-47c7-581d-62ed-76a7f8315b16@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7af52d61-47c7-581d-62ed-76a7f8315b16@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/176253/
Build time: 00:19:40
Link: https://lore.kernel.org/linux-media/7af52d61-47c7-581d-62ed-76a7f8315b16@xs4all.nl

gpg: Signature made Sat 22 Jan 2022 08:20:52 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/13 patches with issues, being 1 at build time

Error/warnings:

patches/0001-dt-bindings-mediatek-convert-mtk-jpeg-decoder-encode.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov8865.c: ../drivers/media/i2c/ov8865.c:2843 ov8865_get_selection() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-dt-bindings-mediatek-convert-mtk-jpeg-decoder-encode.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:26: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:66: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:165: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:202: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0004-iommu-mediatek-v1-Free-the-existed-fwspec-if-the-mas.patch:

   checkpatch.pl:
	$ cat patches/0004-iommu-mediatek-v1-Free-the-existed-fwspec-if-the-mas.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:36: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0007-iommu-mediatek-Add-device_link-between-the-consumer-.patch:

   checkpatch.pl:
	$ cat patches/0007-iommu-mediatek-Add-device_link-between-the-consumer-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:47: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

