Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F00D3AC8A5
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 12:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbhFRKVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 06:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbhFRKVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 06:21:00 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B70C061574;
        Fri, 18 Jun 2021 03:18:50 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BE411C63DD; Fri, 18 Jun 2021 11:18:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1624011527; bh=3CYkxaPrtSAsMP1hfgeEp4xBfJ40V95crN5G3qJ8grE=;
        h=From:To:Subject:Date:From;
        b=YoXvJ1hm8jj2hXXmc8Kvn/GB7H02dj8x75GldwDPJt+ll4srfvvSgExYZp/0sOpD4
         u3FZWFtIOPnSQNZx03+cI9pS/fM32jPHiZvG1AMRk89SXEULWq1plyY/iwa4AiA7pW
         m1T1fQJN1q6CDgd1ICTW0LXy2ka7jtNBHUT0XFaVlNeg5SIWp9osTPA2ddObQ5oRjk
         RvNfQh9cNFs8ppG2PeKyFEAWpYGy0nZ0QifkEgz4z9XpodIdbKxPBNXyPp/0s8bRUv
         rA4Ip0dEWm0hR7hikq9WE36nu6gJOlq9s/kUQ/Whl4u+dH9oIw9z5/TQ+q+Z7KRsLH
         Ot0nnUBD7vUTg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v5 0/2] IR driver for USB-UIRT device
Date:   Fri, 18 Jun 2021 11:18:45 +0100
Message-Id: <cover.1624006513.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a new rc-core driver for the USB-UIRT which you can see here
http://www.usbuirt.com/

This device is supported in lirc, via the usb serial kernel driver. This
driver is both for rc-core, which means it can use kernel/BPF decoding
ec. Also this implement is superior because it can:
 - support learning mode
 - setting transmit carrier
 - larger transmits using streaming tx command
 - Much better latency since it is a kernel driver

Changes since v4:
 - Fixed clang warning/uninitialized variable usage
 - Some cosmetic changes

Changes since v3:
 - Review comments from Johan Hovold
 - Do not move the ftdi_sio.h file an copy FTDI_* definitions instead

Changes since v2:
 - Fixed race condition is disconnect
 - Removed superfluous kmalloc in short tx

Changes since v1:
 - Review comments from Oliver Neukum
 - Simplified wideband read function

Sean Young (2):
  media: rc: new driver for USB-UIRT device
  USB: serial: blacklist USB-UIRT when driver is selected

 drivers/media/rc/Kconfig      |  11 +
 drivers/media/rc/Makefile     |   1 +
 drivers/media/rc/uirt.c       | 744 ++++++++++++++++++++++++++++++++++
 drivers/usb/serial/ftdi_sio.c |   6 +-
 4 files changed, 760 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/rc/uirt.c

-- 
2.31.1

