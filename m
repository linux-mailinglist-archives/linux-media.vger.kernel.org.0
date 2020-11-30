Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803632C822B
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgK3KaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:30:04 -0500
Received: from gofer.mess.org ([88.97.38.141]:37667 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726498AbgK3KaC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:30:02 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B6652C6399; Mon, 30 Nov 2020 10:29:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606732160; bh=HEYHW8fx5698GR74Crlxfp0vY5BEuiHSBURGyPPPSxs=;
        h=Date:From:To:Subject:From;
        b=AlneGjx+Y+r0OBKum1GaHPsyeHXMSvlv4W5ZZuZJ3v0NtrHxJS7Oh0Z3VWDbVEw8k
         J5MXpPndiiL3rKel+fDiw16SgdE2Upck3NEYvrM5lmN6mDkJ/3zue7MmZ/cImQ5ti4
         Ifpd9w2/22tR+tVncMN2Vw2ABh7I5BB2LrWSCPydXLSd4/tBKp/Wd2bys6+11NWnNe
         UKFsrTR401LjrG8jcgUZ+q7S1n65nCrWrri/1W0m/87YlK6nssectvfuRxTgFCiWIl
         ENM0E1wO64y7qX/lowMaP/er7ElIbE3MArrLAo07sH0wyE4BU/3y8Czmi+yJDYzuef
         ODH6sFpoutSIw==
Date:   Mon, 30 Nov 2020 10:29:20 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v5.10] mtk-cir fixes
Message-ID: <20201130102920.GA3319@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This fixes a regression in the mtk-cir driver. The regression was
introduced in v5.10.

Thanks

Sean

The following changes since commit 44f28934af141149959c4e6495bb60c1903bda32:

  media: vidtv.rst: add kernel-doc markups (2020-11-26 08:05:24 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.10d

for you to fetch changes up to 42fb0509bd69a6e7d75f575ec9df4fe02da7f27f:

  media: mtk-cir: fix calculation of chk period (2020-11-30 10:01:48 +0000)

----------------------------------------------------------------
v5.10d

----------------------------------------------------------------
Sean Young (1):
      media: mtk-cir: fix calculation of chk period

 drivers/media/rc/mtk-cir.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
