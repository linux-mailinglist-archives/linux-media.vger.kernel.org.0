Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970D02E42DD
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 16:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392765AbgL1P3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 10:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392762AbgL1P3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 10:29:14 -0500
X-Greylist: delayed 436 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Dec 2020 07:28:34 PST
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AA3C061796
        for <linux-media@vger.kernel.org>; Mon, 28 Dec 2020 07:28:33 -0800 (PST)
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 8651826009E
        for <linux-media@vger.kernel.org>; Mon, 28 Dec 2020 16:21:16 +0100 (CET)
To:     linux-media@vger.kernel.org
From:   Hans Petter Selasky <hps@selasky.org>
Subject: [PATCH] Bad IOCTLs - time to fix them?
Message-ID: <a957de07-96f9-b1cd-31e5-19c096e5f974@selasky.org>
Date:   Mon, 28 Dec 2020 16:21:05 +0100
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

For some years now, FreeBSD's webcamd project at GitHub has carried 
patches to fix up IOCTL's in the Linux Kernel and I'm reaching out once 
again, that the bad read/write bits for certain IOCTLs may be seen as a 
security issue and should be fixed. These are:

diff --git a/include/uapi/linux/dvb/ca.h b/include/uapi/linux/dvb/ca.h
index dffa59e95ebb..c4533a16d93e 100644
--- a/include/uapi/linux/dvb/ca.h
+++ b/include/uapi/linux/dvb/ca.h
@@ -134,9 +134,17 @@ struct ca_descr {

  #define CA_RESET          _IO('o', 128)
  #define CA_GET_CAP        _IOR('o', 129, struct ca_caps)
+/*
+ * At least CA_GET_SLOT_INFO and CA_GET_MSG need to be _IOWR not _IOR.
+ * This is wrong on Linux too but there the driver doesn't care.
+ *
  #define CA_GET_SLOT_INFO  _IOR('o', 130, struct ca_slot_info)
  #define CA_GET_DESCR_INFO _IOR('o', 131, struct ca_descr_info)
  #define CA_GET_MSG        _IOR('o', 132, struct ca_msg)
+*/
+#define CA_GET_SLOT_INFO  _IOWR('o', 130, struct ca_slot_info)
+#define CA_GET_DESCR_INFO _IOR('o', 131, struct ca_descr_info)
+#define CA_GET_MSG        _IOWR('o', 132, struct ca_msg)
  #define CA_SEND_MSG       _IOW('o', 133, struct ca_msg)
  #define CA_SET_DESCR      _IOW('o', 134, struct ca_descr)

diff --git a/include/uapi/linux/dvb/frontend.h 
b/include/uapi/linux/dvb/frontend.h
index 4f9b4551c534..a5e950404072 100644
--- a/include/uapi/linux/dvb/frontend.h
+++ b/include/uapi/linux/dvb/frontend.h
@@ -908,7 +908,8 @@ struct dtv_properties {
  #define FE_DISHNETWORK_SEND_LEGACY_CMD _IO('o', 80) /* unsigned int */

  #define FE_SET_PROPERTY		   _IOW('o', 82, struct dtv_properties)
-#define FE_GET_PROPERTY		   _IOR('o', 83, struct dtv_properties)
+#define FE_GET_PROPERTY		   _IOW('o', 83, struct dtv_properties)
+#define FE_GET_PROPERTY_OLD	   _IOR('o', 83, struct dtv_properties)

  #if defined(__DVB_CORE__) || !defined(__KERNEL__)

diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 9a61c28ed3ae..94cc0a7cb0a5 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -131,8 +131,12 @@ struct input_mask {
  #define EVIOCGREP		_IOR('E', 0x03, unsigned int[2])	/* get repeat 
settings */
  #define EVIOCSREP		_IOW('E', 0x03, unsigned int[2])	/* set repeat 
settings */

-#define EVIOCGKEYCODE		_IOR('E', 0x04, unsigned int[2])        /* get 
keycode */
-#define EVIOCGKEYCODE_V2	_IOR('E', 0x04, struct input_keymap_entry)
+/*
+ * These two need to be _IOWR not _IOR (they're wrong on Linux too but
+ * there the driver doesn't care.)
+ */
+#define EVIOCGKEYCODE		_IOWR('E', 0x04, unsigned int[2])       /* get 
keycode */
+#define EVIOCGKEYCODE_V2	_IOWR('E', 0x04, struct input_keymap_entry)
  #define EVIOCSKEYCODE		_IOW('E', 0x04, unsigned int[2])        /* set 
keycode */
  #define EVIOCSKEYCODE_V2	_IOW('E', 0x04, struct input_keymap_entry)

@@ -165,7 +169,7 @@ struct input_mask {
   *
   * If the request code is not an ABS_MT value, -EINVAL is returned.
   */
-#define EVIOCGMTSLOTS(len)	_IOC(_IOC_READ, 'E', 0x0a, len)
+#define EVIOCGMTSLOTS(len)	_IOC(_IOC_READ|_IOC_WRITE, 'E', 0x0a, len)

  #define EVIOCGKEY(len)		_IOC(_IOC_READ, 'E', 0x18, len)		/* get global 
key state */
  #define EVIOCGLED(len)		_IOC(_IOC_READ, 'E', 0x19, len)		/* get all 
LEDs */
@@ -177,11 +181,11 @@ struct input_mask {
  #define EVIOCSABS(abs)		_IOW('E', 0xc0 + (abs), struct input_absinfo) 
/* set abs value/limits */

  #define EVIOCSFF		_IOW('E', 0x80, struct ff_effect)	/* send a force 
effect to a force feedback device */
-#define EVIOCRMFF		_IOW('E', 0x81, int)			/* Erase a force effect */
+#define EVIOCRMFF		_IOWINT('E', 0x81)			/* Erase a force effect */
  #define EVIOCGEFFECTS		_IOR('E', 0x84, int)			/* Report number of 
effects playable at the same time */

-#define EVIOCGRAB		_IOW('E', 0x90, int)			/* Grab/Release device */
-#define EVIOCREVOKE		_IOW('E', 0x91, int)			/* Revoke device access */
+#define EVIOCGRAB		_IOWINT('E', 0x90)			/* Grab/Release device */
+#define EVIOCREVOKE		_IOWINT('E', 0x91)			/* Revoke device access */

  /**
   * EVIOCGMASK - Retrieve current event mask
@@ -212,7 +216,7 @@ struct input_mask {
   * if the receive-buffer points to invalid memory, or EINVAL if the kernel
   * does not implement the ioctl.
   */
-#define EVIOCGMASK		_IOR('E', 0x92, struct input_mask)	/* Get 
event-masks */
+#define EVIOCGMASK		_IOW('E', 0x92, struct input_mask)	/* Get 
event-masks */

  /**
   * EVIOCSMASK - Set event mask
-- 
2.29.2
