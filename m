Return-Path: <linux-media+bounces-58313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIe0N+BY12lqMwgAu9opvQ
	(envelope-from <linux-media+bounces-58313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:44:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FE3C7316
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B00D300B5A9
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 07:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04AF3806DD;
	Thu,  9 Apr 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="wrEL+2Ys"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A9A37D10A
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720668; cv=none; b=dQic2qdNiL/ZacFWc4aXXs0VNSdfUdZLiqVH6uXKHhQi9gpU/daCbRpLu+o3ffM72M5QFsMy88ySaSOysBSC+G5DjHoSYZ8iap8bPNTM6D4Febc9bNCuov76UMTbL/jQuYaG3NJsqs9nqUaPnjsW8gmxEp5UiXu0ZoH8zgsH6bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720668; c=relaxed/simple;
	bh=QrSYNvXh2wXLnW75TWrFH5t3O+TLIeNU2iihmoOVqc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWQ6FtUnzi2s/P31JdrG9iFr8YSP3cQ0YbboCID/luDkXBYqFzesT9lBx8gNALIYIirnBSXlUhD9repBzDLVQq1rh7Zt/ng/nWu/bt71VV0kpt3NnzNvDMWVuqZsZXQdjplW0J9GGUKmrlynfZm4kNIPI6K/11BFVOtZVineNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=wrEL+2Ys; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1279eced0b9so580749c88.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775720664; x=1776325464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkEUDpcp53kG6RLHdhTm2NdnLD2U7kBdsPvFSJ99X1E=;
        b=wrEL+2YseNhUTXjFfZx3p7vZl1b4e1Mn5hGjFXVX6Y4J5pIGwhX91JhJZqhdB2S520
         T0wJNSM8EVlsxrw0XKCf7oCPgZ4OxlF/N6DgRNl2IF6TTVxUWDctplVx5vckv22UOETm
         EfceU4X9QFDSx4Y0CZqc1adfcJ602hxyPxET/TuxOM3jPN+kFpZU2z1BT8shU9Oa475d
         59UpkAWO0jamd54BgHpHm/HvlewO3DXbrsm3A3nllhz/XstmcTEH43VYIpKwoZbetRE1
         1FrnxDuUw1eXBpW+cJtZ0gdlsPdzvs2mdrjK/Xkac2yaDaDK6flSUo6WXMQ2hPuo3bgk
         +rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720664; x=1776325464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nkEUDpcp53kG6RLHdhTm2NdnLD2U7kBdsPvFSJ99X1E=;
        b=YLQb7uE/x0bs/aotrsCxxgLYDpc5RTHg3rGK/BuZfPCOq5z5eLTqKcqeBFtirjDXLP
         F+LtHAZVUyJ0dDEQHqR3CURLVPvFkwvvSWc3vyb50OhDsMQaMQ6ye/q1djUW4kHTpiIs
         mEc2sdkRloGM/giSdsrD0t+iyRAGPQM6mFQ+OEwoxmxWJgdXPqMsGyJ3Jvi7bozX1cgC
         8a2i1hnzO1O1NdpyZYv32jKn0B6RSWbnS1/5w0xEt3+8CC5BCyr1573lq2KJCEkOBtM7
         j1SsADeAjdivv54UOLPshrlOHzQIR66yVu3nFUku3drSX7WwmjBnnZKMP62pU4oHdaQm
         IzSg==
X-Gm-Message-State: AOJu0YwZdswad21CxEqRLQK2oTjdAKHnAlFVG+67/KVj0zLwrzrgvce/
	/6eY3R/rWDArIFuIfPhmN8Di7qsBE45NZ3vbxG2Igw48fQD86hREUX6ZW+uNsVAYig==
X-Gm-Gg: AeBDietI3S8z+tDsCrIjdq9YEUBB+5RcZtrrJmqxvACHWwWNKDygxwi7IXNjsdcLiUA
	tTxy/wBM+JGMLCM+2Dk7L2YZjFKCN1yrJg/j8CabxH/qLkr9wC80tGrGozMIVXtE561s9RPX+on
	jHZA+f3qK1Dh5Q4cR504bZtg1m3bmEtin0JZwt2DVSnaQ4uvE0UOIALo3ZDad3szd5n7SKBHiRq
	9C3XlZxpaY4vjXTf1XYnAnMgNOl8g0v+EUbvoLh3KxELW7VyJfOqNdGLxozsER+LIzeK6s+SZst
	0+Vf7UbpBi51FWJodH7XSUQnjJVRAvGsHMpCTFzP7EugWNdLHcv4Y8Y4LlM580gxRd4N61JBffN
	uIE69SuLt1GtooQW8fczbabetzuXiKZ58bdpkXh9zo9vG1LUdNtVSteUGFIDVzLyq1AemaowdUN
	PvzLbe1MOXTCPbAYEq6fJfkrhcAH1CBeHVhep1pQ==
X-Received: by 2002:a05:7022:fa03:b0:12b:ed30:5a32 with SMTP id a92af1059eb24-12c28b7f751mr1417693c88.5.1775720663818;
        Thu, 09 Apr 2026 00:44:23 -0700 (PDT)
Received: from katana.dragonfish-mirfak.ts.net ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bf90973b6sm25154047c88.9.2026.04.09.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:44:23 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v6 2/2] media: uvcvideo: add Razer Kiyo Pro to device info table
Date: Thu,  9 Apr 2026 00:42:42 -0700
Message-ID: <20260409074242.2115657-3-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409074242.2115657-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
 <20260409074242.2115657-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58313-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: A54FE3C7316
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a device entry for the Razer Kiyo Pro (1532:0e05) with quirks to
work around firmware bugs that crash the xHCI host controller:

  UVC_QUIRK_CTRL_THROTTLE   - rate-limit control transfers and skip
                               error-code queries after EPIPE
  UVC_QUIRK_DISABLE_AUTOSUSPEND - prevent runtime suspend
  UVC_QUIRK_NO_RESET_RESUME - skip post-reset reinitialization

The firmware (v1.5.0.1) has two failure modes: it stalls endpoints
under rapid control transfers (~25 without delay), and it fails to
reinitialize properly after USB power state transitions. Both can
cascade into xHCI controller death, disconnecting all USB devices on
the bus.

Bug reproduced on two separate Kiyo Pro units running simultaneously,
confirming the issue is not unit-specific.

lsusb -v:
  Bus 002 Device 002: ID 1532:0e05 Razer USA, Ltd Razer Kiyo Pro
  Device Descriptor:
    bLength                18
    bDescriptorType         1
    bcdUSB               3.20
    bDeviceClass          239 Miscellaneous Device
    bDeviceSubClass         2 [unknown]
    bDeviceProtocol         1 Interface Association
    bMaxPacketSize0         9
    idVendor           0x1532 Razer USA, Ltd
    idProduct          0x0e05 Razer Kiyo Pro
    bcdDevice            8.21
    iManufacturer           1 Razer Inc
    iProduct                2 Razer Kiyo Pro
    iSerial                 0

Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 775bede..9b6df8e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2880,6 +2880,22 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+
+	/*
+	 * Razer Kiyo Pro -- firmware crashes under rapid control transfers
+	 * and on LPM/autosuspend resume, cascading into xHCI controller
+	 * death that disconnects all USB devices on the bus.
+	 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1532,
+	  .idProduct		= 0x0e05,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROTTLE
+					| UVC_QUIRK_DISABLE_AUTOSUSPEND
+					| UVC_QUIRK_NO_RESET_RESUME) },
 	/* Kurokesu C1 PRO */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.43.0


