Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48850375401
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhEFMpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:45:55 -0400
Received: from gofer.mess.org ([88.97.38.141]:49033 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229777AbhEFMpz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 08:45:55 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C358BC64B8; Thu,  6 May 2021 13:44:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620305095; bh=cPfx/qDZ0S71snWeYRRk51c1rj8E/i1q8heRsXzn740=;
        h=From:To:Subject:Date:From;
        b=A9B/IGwVIgKxYI9+xGcpHHEhm2XwZ9Pjtni6KxhYkJU7G119miFikuOMy+nQ98WjA
         nVZNeQrSSJjZR1rSsqxxgK3G72/3Ei35luJvgvT2LZAUAh8cOnXIy+h71ELTdnTiH+
         PVLotGdSbhZOjr9UFGq9hWFxqfBMT8Td7fMRBzxFhXSjqgSHB/VCndjxadZ1CWgzUj
         t61o4A9cGftyiDmXqDODHpw3kqwK5HmByqAihfvXcPCmigonU6QksQ1EQHQp6uYfVu
         DaOD76KonHGldJDIrGYd1uehoEhraCYxjjynhEggvi3N6TA4DxNPLjUPZCAWuu/UOo
         sabjoVuq7iM/w==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v3 0/3] IR driver for USB-UIRT device
Date:   Thu,  6 May 2021 13:44:52 +0100
Message-Id: <cover.1620304986.git.sean@mess.org>
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

Changes since v2:
 - Fixed race condition is disconnect
 - Removed superfluous kmalloc in short tx

Changes since v1:
 - Review comments from Oliver Neukum
 - Simplified wideband read function

Sean Young (3):
  USB: serial: move ftdi_sio.h into include directories
  media: rc: new driver for USB-UIRT device
  USB: serial: blacklist USB-UIRT when driver is selected

 drivers/media/rc/Kconfig                      |  11 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/uirt.c                       | 723 ++++++++++++++++++
 drivers/usb/serial/ftdi_sio.c                 |  10 +-
 .../serial => include/linux/usb}/ftdi_sio.h   |   0
 5 files changed, 744 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/rc/uirt.c
 rename {drivers/usb/serial => include/linux/usb}/ftdi_sio.h (100%)

-- 
2.31.1

