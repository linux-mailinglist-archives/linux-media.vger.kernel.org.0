Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08991E3DBE
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 11:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgE0JlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 05:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgE0JlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 05:41:10 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0287C061A0F
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 02:41:10 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7CCF4C635E; Wed, 27 May 2020 10:41:07 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2 0/3] IR Toy / IR Droid USB driver
Date:   Wed, 27 May 2020 10:41:04 +0100
Message-Id: <20200527094107.11936-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
 drivers/media/rc/ir_toy.c   | 525 ++++++++++++++++++++++++++++++++++++
 drivers/usb/class/cdc-acm.c |   6 +
 5 files changed, 556 insertions(+)
 create mode 100644 drivers/media/rc/ir_toy.c

-- 
2.26.2

