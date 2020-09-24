Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC322772EE
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 15:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgIXNpc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 09:45:32 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48908 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbgIXNp2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 09:45:28 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kLRSi-0050Dc-FJ; Thu, 24 Sep 2020 13:39:04 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kLRbe-0000vp-70; Thu, 24 Sep 2020 13:48:18 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Various fixes, mostly rkisp1 (#67322)
Date:   Thu, 24 Sep 2020 13:48:18 +0000
Message-Id: <20200924134818.3540-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <339ccd6d-9296-084a-d4fb-53fc40f7fd42@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/339ccd6d-9296-084a-d4fb-53fc40f7fd42@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/69719/
Build time: 00:21:32
Link: https://lore.kernel.org/linux-media/339ccd6d-9296-084a-d4fb-53fc40f7fd42@xs4all.nl

gpg: Signature made Sun 20 Sep 2020 12:45:14 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 1/21 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-rcar-csi2-Extend-RAW8-support-to-all-RGB-layouts.patch:

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1909 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

