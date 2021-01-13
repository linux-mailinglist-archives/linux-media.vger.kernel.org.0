Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E9D2F4F19
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 16:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbhAMPqd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 10:46:33 -0500
Received: from gofer.mess.org ([88.97.38.141]:40821 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbhAMPqc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 10:46:32 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id F0F2BC6378; Wed, 13 Jan 2021 15:45:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610552751; bh=EvjBZGXjfDkQfDSWeQsfJ27FWEt2Eqt87BZKRuX0kp4=;
        h=Date:From:To:Subject:From;
        b=KVqj1TL8v3IzD6l5fdsKYtVpERTtyGmtaWDVhGUxJw8aUE8RG7JufRZFBnpm12CHR
         EguV3DdQbgkhwTW1qYkxa0iI4/1xsHMybHKDDvOiBJSsMIFt/NMywMq0BfxO83+gSl
         UaROJl89EVRh2Nma2tHiNgLVNze8tzCtaHCAxItzFXyuQRQuPdDFnmKRcsswI26fef
         m4qeaI0b3OitDWrfZu7QpHR0FWsPEVU7CEIlA+XVREsosxHhsGcGBRoFxifXif9Z8f
         zJfFn3ZK1SaCggErOU7m/ckds3SyYnw8lOlWOy6VTpeeFakEZIYuIx31kstndbmDFY
         CFOruieG8HMZg==
Date:   Wed, 13 Jan 2021 15:45:50 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.12] Minor rc/dvb updates
Message-ID: <20210113154550.GA9374@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Some very minor patches. Note that the ir_toy patch depends on a usb cdc
patch which Greg KH has already merged to trees, including a bunch of stable
trees. Hence the `Cc: stable@vger.kernel.org`.

Thanks

Sean

The following changes since commit 7371093f983d35d60a7fac3a6f082de7fefe3648:

  media: venus: helpers: Wire up hfi platform buffer requirements (2021-01-13 09:20:55 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.12a

for you to fetch changes up to 7d340fa38016df2a100231dd6c2aab69b3b0b1f3:

  media: cxd2841er: use DIV_ROUND_UP to calculate timeout (2021-01-13 14:55:58 +0000)

----------------------------------------------------------------
v5.12a

----------------------------------------------------------------
James Reynolds (1):
      media: mceusb: Fix potential out-of-bounds shift

Sean Young (1):
      media: ir_toy: add another IR Droid device

Zheng Yongjun (1):
      media: cxd2841er: use DIV_ROUND_UP to calculate timeout

 drivers/media/dvb-frontends/cxd2841er.c | 2 +-
 drivers/media/rc/ir_toy.c               | 1 +
 drivers/media/rc/mceusb.c               | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

