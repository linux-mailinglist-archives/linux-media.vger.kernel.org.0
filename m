Return-Path: <linux-media+bounces-56638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yASKDQJpwGlkHgQAu9opvQ
	(envelope-from <linux-media+bounces-56638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:11:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 987AC2EAF99
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7007B302616F
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 22:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EE637E2FC;
	Sun, 22 Mar 2026 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="HHdBm2Wg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C755531F98E
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 22:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217400; cv=none; b=UQ1IwAAIXIxawITBgIcUAH/2B0Umjxytn+LdMSYwk/0tacR0gk99LOsjXY353i6CM+OgCYQv/3eB1Q+vg4gc4f1VjTqjKA0WrRuPQccHJ1Joj7kPVyX6YPffRauC0IHMeVEGQpEEgfRDsqpl5SYiom5alIIMsu+Yc7SvaKRnos8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217400; c=relaxed/simple;
	bh=7wFkGd6VA37qdOsrbmByN9HQYNCM6sLyLCW7T70qvJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxzOF5Pbi3jOpB/vta9tCEWQHC/Sr6W027toxe8xGl5+TrVE8U6qeCGrVmJIWq+ef7xJAI9a89ibKpc5pIo+onsm2T5qEYPlvUh/AMuQN8MxhqAMXo/Rq9S/Ez2HGyFRkptpONq4/+yGBikCXrd2G7jfTRgIpmjLhVOK5hygIc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=HHdBm2Wg; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1273349c56bso2963062c88.0
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774217398; x=1774822198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWjML3pDjgXrTqMQEMMGGoK2UUmjpDjeGQXYnhY9w1Y=;
        b=HHdBm2WgcSeMcWN3yng6TT3UtLAA6elpR4FpFPP2DA4tORBrVvX/aMHC7M9fqIUz3F
         wzyfSnj9kQ+7JHNi0A4J1tPDDc8dzLvGVuVC14gsbBA598MZRLT73SqsAzUFYEFB/uW3
         tgtGZn5EqgvcdyDpBxXY+XVcQfbPCoVVDxTSsYNTwl3sv+Li4K5bfqsyHCph5D7ZkEMy
         AI0xkG9Dg3b/FW+1S2AEZVvuLZ/Q4petdXzVsiqNh+zMaGYhi2QaNmKl4azjqYu9NrKp
         YUgl5kIsX3IOoeTPMzTUOpMEi1VeQ5NYkv+RnTdijwIVT48q3ilBa/l8o7Lj+y4fFPCc
         evZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774217398; x=1774822198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QWjML3pDjgXrTqMQEMMGGoK2UUmjpDjeGQXYnhY9w1Y=;
        b=jHvMF7LmCfav1rfOq3CvPrmTc71HiruEtxn7mtg6rquxSZXgRAqC449q6v3dwTxYtF
         mfQ6tJKwLF07gDb5ZMqbMivNasWgW+NXmjsIbeEPjkLFjl4dBQPtuZsuCBjf/Bon9tLQ
         v1fm8D/IpQv+EMo7i+ToC32mayqwtR0QYLh/6g/Os+6rdXdT1nj49cuP5Ujc31mqEZPy
         z+Yvf2CTY5OU1/jn/QIJpl6C38esLEKdxQLDNmKJl4XnwkSfVBOLocMBqye7LP5X8IGE
         NW5kk/cQ9Rw5EYly566vEeQ//1YTF29xhuGP0sAbKfdvsss/XDCJh2Ce4gUNd/0FAdHq
         L6VQ==
X-Gm-Message-State: AOJu0YzXfN1IuMxGGdqnVGODm9bpJxh028IhoD5NI1Cd9eyCfBHqWWJa
	lvbh20cH39IglaFhJRntOniGI41gMHcxFUUmNb4H2psOH/ymI5NSVhuNRiaXPLzOdg==
X-Gm-Gg: ATEYQzzJPbrJJV4ra+8jTQvy/IppQb0iADGIsXwF1vGQjyhYpkn7uqTfoUrMxJ7wbku
	edqgIQAX+8kY6VS+BspAm25AsRjfcaDgu9WD4KMqAR7xOIIjm18F5C0HSSEYc1RtWR1oUYrp4cZ
	oILqPcspePVVU6SJ3F/ToDxUwLmTcjLXnRYv/mxxjf6uhHhw+cMmdRCHcrARE+K/CJ1Yo3xM66r
	h/59K4lXS9I+fBPehp2gWY1E9ir0nY80sg2ZPF6mb3Aj50beQGYLhXw1zClCNCbAoxe9D9y2GKE
	GQQpPBgKISchItMdvUG1ZO4RDODtJo1BNjJWv2F/xlOitIPE4BE+qzK4ny7zqhvSuq9qfhSojIP
	HIWV0VeEfqiLf3JDiRiHAKLQCHbEfmz+Cw61m9cAYdpR0o2ibwxxEo4erwg42B912sj6n4Lw07D
	uIH7Ug979+
X-Received: by 2002:a05:7022:5f04:b0:128:e693:b61c with SMTP id a92af1059eb24-12a726b29dcmr2149405c88.27.1774217397835;
        Sun, 22 Mar 2026 15:09:57 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm7707766c88.0.2026.03.22.15.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:09:57 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v3 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
Date: Sun, 22 Mar 2026 15:09:40 -0700
Message-ID: <20260322220940.1462189-4-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322220940.1462189-1-jp@jphein.com>
References: <20260322220940.1462189-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56638-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: 987AC2EAF99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
two failure modes that cascade into full xHCI host controller death,
disconnecting every USB device on the bus:

  1. LPM/autosuspend resume: the device fails to reinitialize its UVC
     endpoints on resume, producing EPIPE on SET_CUR. The stalled
     endpoint triggers an xHCI stop-endpoint timeout.

  2. Rapid control transfers: sustained rapid SET_CUR operations
     (hundreds over several seconds) overwhelm the firmware.

Add the device to the UVC driver table with:

  - UVC_QUIRK_CTRL_THROTTLE: rate-limit SET_CUR (50ms interval) and
    skip error-code queries after EPIPE to prevent crash trigger #2.

  - UVC_QUIRK_DISABLE_AUTOSUSPEND: prevent USB autosuspend transitions
    that trigger crash #1. Same approach as Insta360 Link.

  - UVC_QUIRK_NO_RESET_RESUME: avoid the fragile reset-during-resume
    path. Same approach as Logitech Rally Bar.

Cc: stable@vger.kernel.org
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2920,5 +2920,22 @@ static const struct usb_device_id uvc_ids[] = {
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
+
 	/* Kurokesu C1 PRO */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
--
2.43.0

