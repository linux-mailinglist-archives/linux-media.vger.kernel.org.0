Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299A71E5D77
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 12:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388018AbgE1KzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 06:55:12 -0400
Received: from gofer.mess.org ([88.97.38.141]:43419 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387926AbgE1KzL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 06:55:11 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 88E34C635B; Thu, 28 May 2020 11:55:08 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v4 0/3] IR Toy / IR Droid USB driver
Date:   Thu, 28 May 2020 11:55:05 +0100
Message-Id: <20200528105508.5183-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

changes since v3:
fix embarassing compilation failure
make driver more robust against malicious fake device

changes since v2:
review comments from Oliver Neukum <oneukum@suse.com>

changes since v1:
v1 was a serio driver, this has now been re-written to be a USB driver.
This requires a blacklist in the usb cdc-acm driver.

This also allows us to feed IR data to the device from the urb callback
handler, which reduces the chance of unwanted gaps in the transmission.

Sean Young (3):
  media: rc: add support for Infrared Toy and IR Droid devices
  USB: cdc-acm: blacklist IR Droid / IR Toy device
  MAINTAINERS: rc core and lirc maintainership

 MAINTAINERS                 |  13 +
 drivers/media/rc/Kconfig    |  11 +
 drivers/media/rc/Makefile   |   1 +
 drivers/media/rc/ir_toy.c   | 509 ++++++++++++++++++++++++++++++++++++
 drivers/usb/class/cdc-acm.c |   6 +
 5 files changed, 540 insertions(+)
 create mode 100644 drivers/media/rc/ir_toy.c

-- 
2.26.2

