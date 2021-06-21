Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F3E3AE87F
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 13:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhFUL7N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 07:59:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229699AbhFUL7H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 07:59:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CCBC611CE;
        Mon, 21 Jun 2021 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624276613;
        bh=cJW6ZV/RN425qeMKGfvcGB3bzVvcoiRdk+y2GpVF8Ks=;
        h=From:To:Cc:Subject:Date:From;
        b=uHr54hPd2nruyWRVc4YnUxn/eRx7eTf7OHuF0nFyUqadSaA48/Lgv5PHygxB8E657
         xllRpboBLFih/Jyqr1szLfOQLZgtm9J+P/0cbGVA43Qfjpz1+G3HH1x3WeoWifZtds
         N5aktCSqCcmF2EWvQacfhu/68o73JDuF+s3g29l83qmEqM2HyI/LAOMcy/mxKLEwdE
         6ipFFN8H1EPq3CGWKXlquTN+u27/CUwb19Aop0ItTug7wDCsy+SdakIZLT5E3p7cBp
         ZH/Jp3ymQap5Jyg+boqdMheRQV3JIUThOXjwSWQi+mVS/IDj9eVydy9k9sKvt9NESy
         6AfoA469hgHXg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lvIXq-000Hcd-Q7; Mon, 21 Jun 2021 13:56:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/5] some smatch fixes
Date:   Mon, 21 Jun 2021 13:56:44 +0200
Message-Id: <cover.1624276137.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This 5 patch series addresses a couple of other smatch warnings.

One of the patches seem to be fixing an user-visible bug:

	media: uvc: don't do DMA on stack

Basically, input selection at the UVC driver seems broken, as it
is usind DMA on stack, which stopped working on Kernel 4.9.

In practice, the number of affected devices is probably small, as this
affects UVC devices with multiple inputs. The vast majority of UVC
ones have just one input.

Mauro Carvalho Chehab (5):
  media: dib8000: rewrite the init prbs logic
  media: uvc: don't do DMA on stack
  media: v4l2-flash-led-class: drop an useless check
  media: ivtv: prevent going past the hw arrays
  media: sti: don't copy past the size

 drivers/media/dvb-frontends/dib8000.c         | 56 ++++++++++-----
 drivers/media/pci/ivtv/ivtv-cards.h           | 68 +++++++++++++------
 drivers/media/pci/ivtv/ivtv-i2c.c             | 16 +++--
 drivers/media/platform/sti/delta/delta-ipc.c  |  3 +-
 drivers/media/usb/uvc/uvc_v4l2.c              | 10 ++-
 drivers/media/usb/uvc/uvcvideo.h              |  3 +
 .../media/v4l2-core/v4l2-flash-led-class.c    |  2 +-
 7 files changed, 106 insertions(+), 52 deletions(-)

-- 
2.31.1


