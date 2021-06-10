Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE18D3A2925
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 12:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhFJKSa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 06:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhFJKS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 06:18:27 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9FFC061574;
        Thu, 10 Jun 2021 03:16:30 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C6A60C6487; Thu, 10 Jun 2021 11:16:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1623320185; bh=4c4vPRfWI8VRrMb/dMhFPjKz7AoHtSI7QjQvbg/dTJQ=;
        h=From:To:Subject:Date:From;
        b=sctVbxvvQT4MNbzj5/Q7xAaeb4qU3AYaPJbv8WedbqlU25CLrgjblaSR9MkOR/T4m
         rCz3AvVAPNenK4yqavacJx4C7Ind/JfBZ4uS5Ou4pAkQQALwJ6tsk98ZiHBNMqcU/N
         dmhWL9RDzt72/DltBAcCeotbp3+Qjx0521x0TNSAdqVChMnA1NnT71MOSC5Dxrb3HO
         8Hf6gwCHGDieJyw3mc1YZruvT2csLYxftrU84WWkfxpM6BeIp5rs2i+Kzpcf4J2ukp
         N3AL3uKnQnb+O7oVYXMF7CmdhV1q0xSqB+20Yc7s+eH0cOh5UZqnWV0LP7PBUSeVHs
         kRS68MXeKR/VQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v4 0/2] IR driver for USB-UIRT device
Date:   Thu, 10 Jun 2021 11:16:23 +0100
Message-Id: <cover.1623318855.git.sean@mess.org>
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
 drivers/media/rc/uirt.c       | 740 ++++++++++++++++++++++++++++++++++
 drivers/usb/serial/ftdi_sio.c |   6 +-
 4 files changed, 756 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/rc/uirt.c

-- 
2.31.1

