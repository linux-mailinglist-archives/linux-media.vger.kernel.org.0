Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB6650A04F
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 15:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiDUNHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 09:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiDUNHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 09:07:32 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1085344C7
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 06:04:42 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nhWUD-00AjIe-73; Thu, 21 Apr 2022 13:04:41 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nhWUB-00BwM0-0n; Thu, 21 Apr 2022 13:04:39 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] Various fixes/enhancements (#82580)
Date:   Thu, 21 Apr 2022 13:04:37 +0000
Message-Id: <20220421130437.2845874-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <b67231da-dcec-f785-02af-da3d5e917127@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/b67231da-dcec-f785-02af-da3d5e917127@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/201426/
Build time: 00:26:26
Link: https://lore.kernel.org/linux-media/b67231da-dcec-f785-02af-da3d5e917127@xs4all.nl

gpg: Signature made Thu 21 Apr 2022 12:28:06 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 4/25 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-coda-disable-encoder-cmd-ioctl-on-decoder-and-.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2894 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-media-coda-disable-stateful-encoder-ioctls-for-jpeg-.patch:

   checkpatch.pl:
	$ cat patches/0003-media-coda-disable-stateful-encoder-ioctls-for-jpeg-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0022-media-hantro-Add-support-for-Hantro-G1-on-RK356x.patch:

   checkpatch.pl:
	$ cat patches/0022-media-hantro-Add-support-for-Hantro-G1-on-RK356x.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:36: WARNING: DT compatible string "rockchip,rk3568-vpu" appears un-documented -- check ./Documentation/devicetree/bindings/

patches/0023-dt-bindings-media-rockchip-vpu-Add-RK3568-compatible.patch:

   checkpatch.pl:
	$ cat patches/0023-dt-bindings-media-rockchip-vpu-Add-RK3568-compatible.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:15: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

