Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B6640A7A4
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 09:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241276AbhINHha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 03:37:30 -0400
Received: from www.linuxtv.org ([130.149.80.248]:54176 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240656AbhINHg5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 03:36:57 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mQ2yh-009Zko-2S; Tue, 14 Sep 2021 07:35:39 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mQ2ye-0063dn-TC; Tue, 14 Sep 2021 07:35:37 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] Various fixes/enhancements (#76988)
Date:   Tue, 14 Sep 2021 07:35:36 +0000
Message-Id: <20210914073536.1443917-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <d91f4ecb-8aa7-9faf-a21b-4d4d274abb81@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/d91f4ecb-8aa7-9faf-a21b-4d4d274abb81@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/139254/
Build time: 00:22:28
Link: https://lore.kernel.org/linux-media/d91f4ecb-8aa7-9faf-a21b-4d4d274abb81@xs4all.nl

gpg: Signature made Tue 14 Sep 2021 07:04:45 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 4/24 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-staging-media-atomisp-code-formatting-changes-atomis.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

patches/0009-media-i2c-ths8200-needs-V4L2_ASYNC.patch:

   checkpatch.pl:
	$ cat patches/0009-media-i2c-ths8200-needs-V4L2_ASYNC.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0017-media-vimc-Enable-set-resolution-at-the-scaler-src-p.patch:

   checkpatch.pl:
	$ cat patches/0017-media-vimc-Enable-set-resolution-at-the-scaler-src-p.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0018-media-rcar_drif-select-CONFIG_V4L2_ASYNC.patch:

   checkpatch.pl:
	$ cat patches/0018-media-rcar_drif-select-CONFIG_V4L2_ASYNC.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

