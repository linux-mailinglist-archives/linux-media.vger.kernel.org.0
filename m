Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED3C43663F
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 17:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhJUPbo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 11:31:44 -0400
Received: from www.linuxtv.org ([130.149.80.248]:47362 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhJUPbo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 11:31:44 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mda0V-00By44-1G; Thu, 21 Oct 2021 15:29:27 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mda0S-00Ehv7-RG; Thu, 21 Oct 2021 15:29:24 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] Add support for DMA2D of STMicroelectronics (#77908)
Date:   Thu, 21 Oct 2021 15:29:24 +0000
Message-Id: <20211021152924.3505375-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <126f13fc-1d37-8bef-3411-4553864fe5be@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/126f13fc-1d37-8bef-3411-4553864fe5be@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/149931/
Build time: 00:37:00
Link: https://lore.kernel.org/linux-media/126f13fc-1d37-8bef-3411-4553864fe5be@xs4all.nl

gpg: Signature made Thu 21 Oct 2021 02:44:48 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 5/8 patches with issues, being 3 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-admin-guide-add-stm32-dma2d-description.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor() warn: missing error code 'ret'
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-dt-bindings-media-add-document-for-STM32-DMA2d.patch:

   checkpatch.pl:
	$ cat patches/0002-media-dt-bindings-media-add-document-for-STM32-DMA2d.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0003-media-v4l2-mem2mem-add-v4l2_m2m_get_unmapped_area-fo.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)

patches/0006-media-v4l2-ctrls-Add-RGB-color-effects-control.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor() warn: missing error code 'ret'
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0006-media-v4l2-ctrls-Add-RGB-color-effects-control.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:87: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:91: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0008-media-stm32-dma2d-STM32-DMA2D-driver.patch:

   checkpatch.pl:
	$ cat patches/0008-media-stm32-dma2d-STM32-DMA2D-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:42: WARNING: please write a paragraph that describes the config symbol fully
	-:78: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

