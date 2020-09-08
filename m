Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA8F261EC5
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732480AbgIHTzX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:55:23 -0400
Received: from www.linuxtv.org ([130.149.80.248]:57488 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732481AbgIHTzW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 15:55:22 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kFjc7-001tfF-TW; Tue, 08 Sep 2020 19:49:11 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kFjke-00086T-I1; Tue, 08 Sep 2020 19:58:00 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Miscellaneous UVC changes (#66842)
Date:   Tue,  8 Sep 2020 19:58:00 +0000
Message-Id: <20200908195800.31107-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200908193533.GA9607@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200908193533.GA9607@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/67471/
Build time: 00:16:30
Link: https://lore.kernel.org/linux-media/20200908193533.GA9607@pendragon.ideasonboard.com

gpg: Signature made Tue 08 Sep 2020 07:33:14 PM UTC
gpg:                using RSA key BD94648A8E47ECEDBF199B1862255D299E280B24
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]

Summary: got 1/10 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-uvcvideo-Fix-annotation-for-uvc_video_clock_up.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: ../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:703 is_pipe_valid_to_current_run_mode() warn: ignoring unreachable code.
	../drivers/staging/media/atomisp/pci/sh_css.c:1685:16: warning: assignment left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]

    allyesconfig: return code #0:
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

