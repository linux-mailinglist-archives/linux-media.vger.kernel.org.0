Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30D1424FAA
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 11:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240381AbhJGJGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 05:06:36 -0400
Received: from www.linuxtv.org ([130.149.80.248]:55826 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240339AbhJGJGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 05:06:35 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mYPKT-008x4i-K3; Thu, 07 Oct 2021 09:04:41 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mYPKR-000Fep-6e; Thu, 07 Oct 2021 09:04:39 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.16] Camera sensor and IPU3 driver patches (#77524)
Date:   Thu,  7 Oct 2021 09:04:39 +0000
Message-Id: <20211007090439.60141-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YV6x+qscgN5/pcaY@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YV6x+qscgN5/pcaY@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/145862/
Build time: 00:22:05
Link: https://lore.kernel.org/linux-media/YV6x+qscgN5/pcaY@valkosipuli.retiisi.eu

gpg: Signature made Thu 07 Oct 2021 08:32:51 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
     Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA

Summary: got 3/16 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-ipu3-cio2-Parse-sensor-orientation-and-rotation.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	SPARSE:../drivers/media/rc/ir_toy.c ../drivers/media/rc/ir_toy.c:321:20: warning: incorrect type in assignment (different base types)
	SPARSE:../drivers/media/rc/ir_toy.c ../drivers/media/rc/ir_toy.c:321:20:    expected restricted __be16 [usertype]
	SPARSE:../drivers/media/rc/ir_toy.c ../drivers/media/rc/ir_toy.c:321:20:    got int
	../drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor() warn: missing error code 'ret'
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-ipu3-cio2-Parse-sensor-orientation-and-rotation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:93: CHECK: Lines should not end with a '('
	-:97: CHECK: Lines should not end with a '('

patches/0003-dt-bindings-media-document-SK-Hynix-Hi-846-MIPI-CSI-.patch:

   checkpatch.pl:
	$ cat patches/0003-dt-bindings-media-document-SK-Hynix-Hi-846-MIPI-CSI-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0009-media-ipu3-cio2-Check-num_planes-and-sizes-in-queue_.patch:

   checkpatch.pl:
	$ cat patches/0009-media-ipu3-cio2-Check-num_planes-and-sizes-in-queue_.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

