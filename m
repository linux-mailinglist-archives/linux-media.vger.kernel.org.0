Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9151278C86
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 17:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgIYPYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 11:24:23 -0400
Received: from www.linuxtv.org ([130.149.80.248]:36194 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728678AbgIYPYX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 11:24:23 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kLpTy-006Mtq-0i; Fri, 25 Sep 2020 15:17:58 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kLpcu-00086y-7J; Fri, 25 Sep 2020 15:27:12 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Various small fixes (#67358)
Date:   Fri, 25 Sep 2020 15:27:12 +0000
Message-Id: <20200925152712.31139-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925145951.GA7907@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200925145951.GA7907@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/69873/
Build time: 00:15:38
Link: https://lore.kernel.org/linux-media/20200925145951.GA7907@gofer.mess.org

gpg: Signature made Fri 25 Sep 2020 02:47:39 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 2/8 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-dvb-frontends-rtl2832_sdr-set-error-code-in-pr.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0006-media-dvb-frontends-tda18271c2dd-Constify-static-str.patch:

   checkpatch.pl:
	$ cat patches/0006-media-dvb-frontends-tda18271c2dd-Constify-static-str.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:14: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:118: CHECK: Avoid CamelCase: <m_StandardTable>
	-:127: CHECK: Avoid CamelCase: <m_BP_Filter_Map>
	-:136: CHECK: Avoid CamelCase: <m_RF_Cal_Map>
	-:145: CHECK: Avoid CamelCase: <m_KM_Map>
	-:154: CHECK: Avoid CamelCase: <m_Main_PLL_Map>
	-:163: CHECK: Avoid CamelCase: <m_Cal_PLL_Map>
	-:172: CHECK: Avoid CamelCase: <m_GainTaper_Map>
	-:181: CHECK: Avoid CamelCase: <m_RF_Cal_DC_Over_DT_Map>
	-:190: CHECK: Avoid CamelCase: <m_IR_Meas_Map>
	-:198: CHECK: Avoid CamelCase: <m_CID_Target_Map>
	-:207: CHECK: Avoid CamelCase: <m_RF_Band_Map>


Error #512 when building PDF docs

