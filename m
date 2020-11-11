Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27EC72AEF60
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 12:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgKKLPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 06:15:45 -0500
Received: from www.linuxtv.org ([130.149.80.248]:41134 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgKKLPo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 06:15:44 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kco6J-007CB8-2G; Wed, 11 Nov 2020 11:15:43 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kco9K-0004tP-Vh; Wed, 11 Nov 2020 11:18:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] rockchip: rkisp1: destage Rockchip ISP1 driver (#68816)
Date:   Wed, 11 Nov 2020 11:18:50 +0000
Message-Id: <20201111111850.18766-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <8ff17e72-34b8-58f8-9b3e-47453a79e6e5@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/8ff17e72-34b8-58f8-9b3e-47453a79e6e5@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/76549/
Build time: 00:07:02
Link: https://lore.kernel.org/linux-media/8ff17e72-34b8-58f8-9b3e-47453a79e6e5@xs4all.nl

gpg: Signature made Wed 11 Nov 2020 10:55:13 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/3 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-media-videodev2.h-v4l2-ioctl-add-rkisp1-meta-buffer-.patch:

   checkpatch.pl:
	$ cat patches/0002-media-videodev2.h-v4l2-ioctl-add-rkisp1-meta-buffer-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:29: ERROR: trailing statements should be on next line
	-:30: ERROR: trailing statements should be on next line
	-:58: WARNING: line length of 105 exceeds 100 columns
	-:59: WARNING: line length of 105 exceeds 100 columns

patches/0003-media-rockchip-rkisp1-destage-Rockchip-ISP1-driver.patch:

   checkpatch.pl:
	$ cat patches/0003-media-rockchip-rkisp1-destage-Rockchip-ISP1-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:66: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst


Error #512 when building PDF docs

