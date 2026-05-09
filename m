Return-Path: <linux-media+bounces-60986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJi5EnjB/mn/vwAAu9opvQ
	(envelope-from <linux-media+bounces-60986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:09:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EEC4FE178
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 482DA30125F5
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 05:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5973237647E;
	Sat,  9 May 2026 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nD/dTyuz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4304433BBAD
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 05:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303343; cv=none; b=j1vB3V52cd7s+zfT1Uf1nveqImvC0CfxK1v4fLRYqVDf3xqL0GJE0L16tSD/+LOYgCMj55d1KpgCeRwaTZHP9F02MXtkN1XkOkFdDHQ+sGObTViQsUWVf/kGcB1cgWhRC6P6NrQr5xazoMqaUmkI8vNeGm0WHxKDGn+USu3E1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303343; c=relaxed/simple;
	bh=Tudd6fEgg5gc3yfMcYrSDK3iFdkEFYTP+5gC7wlvQeE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ebfEYQrWaYAEIrV3T7i/PqJ0836TTz2KxCGegO6dRc46v5ormeYkAYkqPqHvFbo0vjcOvn0MZOhC5Rg7mIzODHPpKBblHboajfxx5cRrvP9wDrieXunFZmMV3ryOcBuIQVJZ0mrO+cMQJs4TqEUw0Q+2TzjXQAfQXRKB/+G8Uzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nD/dTyuz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so1577997f8f.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 22:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303340; x=1778908140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MfhRYaG6ZRLEbM7BqKvDDJXeIiIz+hpGcF/7+2fq7g=;
        b=nD/dTyuzydmBIkyZRQWaVusXQIiGtU+YtibSx1diIJyRhHhWnIEMnr5LpzzNmko9Wq
         49CdM6CT8UX/u3XfrLULCCjA8v9jK5OWaiwUTLA5zMnnI66kCBzfHnjUvj+y4WXjLg7E
         uJvBHctaMUu4U5IbVwAb50109YKtWGHAequGR5Sw68H3GpZtHVR12yIpVBHKGjceGj9A
         rgm9KCQVIY/rr3eJ9pOIeDIvrigUMbN9m/QGJZirpRnaP0BZmdf6RjmzD5V7++VvmbeB
         088ueSTo6T19PEB+kBQuNpWc2QtZGHiFMno0K3IEPynSfsEBxfB2xP34jyFRSTj/2Lke
         n1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303340; x=1778908140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MfhRYaG6ZRLEbM7BqKvDDJXeIiIz+hpGcF/7+2fq7g=;
        b=Y4TOHKKuP7IL+swBqd8Y+nYNGchgvq8uBzgq5hT9PfBHFIARW8oPQ1JlULDJjMft07
         GNploR23d0dwH9kPoPWuvxEtmELSD48LFEavJm0mvuVoGyJp5F68sypP9yBAB2tjikSp
         +hu6DvgyN8n7w1eo7hjbQ7igRbd9LWVg77JgL7BT/ErBhRFZG1KkpjzBLUtmNQaapqO/
         2+g+fg3DuvgCUxVvAziB3ken8BMeKXLJbwhWiHbTX4/BNu5jgb73+wsaBLbQs+0CDMTF
         rS5Cy0Ha1OKoJ8sEId6qId7cPH/zD5tpxZJ6ZaA7w3U5/JW6O+nBjd1MiJ/GOTOKyj0q
         nY3w==
X-Gm-Message-State: AOJu0YwTqhKjcQfjjsPn/8E/VUvqdZzuGmI8vY3a5oxQaFpHThO4cLaH
	og6s9BPbamg/go0nSK6anXNvE1CqT0HMXmCTpBZFnOhog0ANNjhYyVQ+
X-Gm-Gg: Acq92OH7J5IYik3XtfAuCvGyq2jfvjvlTUR8lqjDObkgoxBtkpvWkzosg1caMae7h3x
	qswc1Lj8JeYkBJX+z/kVTQiAsUKFVG8SwQs1MCavJXHv2ID1OExjH5RDmE8SMM9XH1mEsgiunzt
	GWHgAqRBaQycMIRvmSWMm8mGdOyHd0q24bHunEiO3Ivm4m19W/MQY4I+R3CyxbHl3mFyuxhEY93
	81ZPeEUS8GNJeM35kZhgEphcPS1bX0eJBykUzRbvMlzQVQYAwPM6jSToLyalIOGEqFv6eT7c2u/
	vgMW2ZUa9np3F1Di4kJVjgsZrzSMNK3ZOqZMTEFnPPwLsTHdr4Gz7MdRM1rs+WCU6RUfChSx/us
	ySQiPGz+et7IsWPSttC7FiAi7NBrftGAC46NJT/763A8WuCpFj1xd7v/oGHWRpZ/qfoUuxvdn6G
	9MigTNsOiVmPpx91iWY3o0ppd7Iwg9Wf+GiOIpDgcd8bz9TpvuYB7EjHDI05hZuw04QXuP8tJ/V
	akvRn6kWA==
X-Received: by 2002:a05:6000:22c4:b0:44f:aeac:5f66 with SMTP id ffacd0b85a97d-4515cc31c2bmr25655234f8f.31.1778303340455;
        Fri, 08 May 2026 22:09:00 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm9721296f8f.12.2026.05.08.22.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:00 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 0/3] media: sun6i-csi: Convert to active state and improve MC support
Date: Sat,  9 May 2026 08:39:18 +0330
Message-Id: <20260509050921.22158-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A4EEC4FE178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60986-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pages.freedesktop.org:url]
X-Rspamd-Action: no action

Hi,

This series modernizes the sun6i-csi driver by aligning the bridge and
capture components with the V4L2 subdev active state API and improving
media controller integration.

The first patch migrates the bridge driver to the V4L2 subdev active
state framework. The private mbus_format field and its associated lock
are removed, with the framework-managed state becoming the single
source of truth. As part of this change, the capture driver no longer
accesses bridge-private data directly and instead resolves the active
format through the subdev pad API. Since the hardware does not perform
format conversion, identical formats are enforced on both pads.

The second patch implements vidioc_enum_framesizes for the capture
device, reporting a stepwise range of even frame sizes within the
hardware limits.

The final patch adds MC-centric format enumeration support by filtering
pixel formats based on the provided mbus code and advertises
V4L2_CAP_IO_MC to reflect the intended usage within a media graph.

Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):

  - Parallel pipeline (csi1):
    ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

  - MIPI pipeline (csi0):
    ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

---
Changes in v3:
  - Fix Media CI robot warnings about open parenthesis
  - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
  - Link to v2: https://patchwork.kernel.org/project/linux-media/list/?series=1091728

Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768

Arash Golgol (3):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-csi: capture: Support MC-centric format enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  88 ++++++++--
 3 files changed, 144 insertions(+), 108 deletions(-)

-- 
2.34.1


