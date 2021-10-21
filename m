Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D84436725
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhJUQDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 12:03:55 -0400
Received: from www.linuxtv.org ([130.149.80.248]:51630 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhJUQDz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 12:03:55 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mdaVe-00BzxA-Cv; Thu, 21 Oct 2021 16:01:38 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mdaVc-00Fi5Z-97; Thu, 21 Oct 2021 16:01:36 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] v2: Add support for DMA2D of STMicroelectronics (#77909)
Date:   Thu, 21 Oct 2021 16:01:36 +0000
Message-Id: <20211021160136.3744351-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <8270d145-882d-82e4-307f-6a0f058cb0cf@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/8270d145-882d-82e4-307f-6a0f058cb0cf@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/149932/
Build time: 00:29:26
Link: https://lore.kernel.org/linux-media/8270d145-882d-82e4-307f-6a0f058cb0cf@xs4all.nl

gpg: Signature made Thu 21 Oct 2021 02:58:12 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 5/7 patches with issues, being 3 at build time

Error/warnings:

patches/0001-media-admin-guide-add-stm32-dma2d-description.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor() warn: missing error code 'ret'
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

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

   checkpatch.pl:
	$ cat patches/0006-media-v4l2-ctrls-Add-RGB-color-effects-control.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:87: CHECK: spaces preferred around that '+' (ctx:VxV)
	-:91: CHECK: spaces preferred around that '+' (ctx:VxV)

patches/0007-media-stm32-dma2d-STM32-DMA2D-driver.patch:

   checkpatch.pl:
	$ cat patches/0007-media-stm32-dma2d-STM32-DMA2D-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:42: WARNING: please write a paragraph that describes the config symbol fully
	-:78: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

