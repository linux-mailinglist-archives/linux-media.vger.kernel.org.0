Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953DD3E2E2F
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 18:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhHFQNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 12:13:45 -0400
Received: from gofer.mess.org ([88.97.38.141]:39727 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229552AbhHFQNn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Aug 2021 12:13:43 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 09E6FC6385; Fri,  6 Aug 2021 17:13:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1628266405; bh=3nQraI2a7wSlLN6K8YSX6n6020S1hVX07Plxk2tRt7o=;
        h=Date:From:To:Subject:From;
        b=rR9yJCdCzdhysuThuJd4XkoXH15mxUbHfKqc9p1X8N5nsDSbjwAFpHG3wtNYb0Zsg
         H3Lb3cZ+9q4CZNX4UP65P98mFumACcB5FZxGlw6Ze4WXZWYsB8DckOXQ4NM/zjEytr
         VZbtLswc/bz3OvVG4ixDzA+yKIe471lAdWa5fJwp4KWriDezC8EYJv4ICw9aNzYVQx
         BR4GDV4B2y9XdRX960q8L8KlykluBSjh09JOHp9whdbaRW9MawM6E2WsjmGhjVgxll
         fIg+4biT5E64HzLlGxxq//mTu8P9hfajq240s7IZFhpLBfFJ+00AdEDqHWQ1iwihwZ
         lcrqIAYADY7cQ==
Date:   Fri, 6 Aug 2021 17:13:24 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.15] Small fixes
Message-ID: <20210806161324.GA25660@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6daa9f32282ac76b8996f5291fb387d685786288:

  media: Clean V4L2_PIX_FMT_NV12MT documentation (2021-08-06 10:54:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.15c

for you to fetch changes up to 75b276f90587f41b926e5a8a8d75ed099912e54d:

  media: tuners: mxl5007t: Removed unnecessary 'return' (2021-08-06 16:14:26 +0100)

----------------------------------------------------------------
v5.15c

----------------------------------------------------------------
Colin Ian King (1):
      media: cxd2880-spi: Fix a null pointer dereference on error handling path

Evgeny Novikov (1):
      media: ttusb-dec: avoid release of non-acquired mutex

Sean Young (2):
      media: mceusb: ensure rx resolution can be retrieved
      media: streamzap: ensure rx resolution can be retrieved

lijian (1):
      media: tuners: mxl5007t: Removed unnecessary 'return'

 drivers/media/rc/mceusb.c               |  1 +
 drivers/media/rc/streamzap.c            |  1 +
 drivers/media/spi/cxd2880-spi.c         |  2 +-
 drivers/media/tuners/mxl5007t.c         |  9 ---------
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 10 +++++-----
 5 files changed, 8 insertions(+), 15 deletions(-)
