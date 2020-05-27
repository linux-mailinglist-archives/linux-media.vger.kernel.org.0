Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1AEF1E46CD
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 17:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389475AbgE0PD4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 11:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389451AbgE0PD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 11:03:56 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA254C03E97D;
        Wed, 27 May 2020 08:03:55 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A0F25C635E; Wed, 27 May 2020 16:03:52 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v3 0/3] IR Toy / IR Droid USB driver
Date:   Wed, 27 May 2020 16:03:49 +0100
Message-Id: <20200527150352.18840-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
 drivers/media/rc/ir_toy.c   | 493 ++++++++++++++++++++++++++++++++++++
 drivers/usb/class/cdc-acm.c |   6 +
 5 files changed, 524 insertions(+)
 create mode 100644 drivers/media/rc/ir_toy.c

-- 
2.26.2

