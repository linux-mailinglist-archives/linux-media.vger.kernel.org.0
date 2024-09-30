Return-Path: <linux-media+bounces-18885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4CD98B0CF
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 01:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11030B20D4C
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 23:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE651925B8;
	Mon, 30 Sep 2024 23:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWvbYtwE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83359189525;
	Mon, 30 Sep 2024 23:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727738730; cv=none; b=dOVsTGRaM5Vz+Jh6/3Bf4crK/PyrTAizR3RlTQsa0iMurNhFK7nc1GxzmWl1futgagD+Ys0lqAXwPTRaF9WvLV1MA1lCiRegG1Om8divSRsTkXPAVJ/ob6XXxDmmxCCs2qIZP7IyhZGhrZZ+2IgChuUKzcsTxfSFe3UcOkMEVc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727738730; c=relaxed/simple;
	bh=vdadp3w0ZndLd/AU8pPOP+RMAlcwpwoNKHgB1DPUHVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THCYxZ3VKt9PMEUX/ZL347cr7vzqYuinK8e45XZRGf6N2MuCWkvRhHgPh8UVaSufpirLf+8HjT8nShxmQ199e3keQjvOjVcuKfkS8qQwTdrXrxMaWvPTMqx6Jtd8359uHH5wgkqBzDWGRL89QrY9LvwTe75IMkgNc8j2lomlkHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWvbYtwE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b0b5cdb57so38976405ad.1;
        Mon, 30 Sep 2024 16:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727738728; x=1728343528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2l/INc1G6hGl42jJZMjqWTMmdh1MqpMdLpE6m9LxGY=;
        b=GWvbYtwEJBIQeT4wEXgNxOYPQjFu205rybFTA5o7bdFlZuqhh8YN1SflGGSe+u+9il
         5IpqpHdoKnA72M8eJkmlpKhi2SP62LIaXAJlLG9JQuEX35RY2mfC62LhGpVH1WH9RooZ
         DjqQr56aMhcbEb5M0ex/hKNVKf1t3kaG6Pg5dYzW3JNFSrq4LSDshqxSA8ILNRDBkYpm
         djjRn9QLUvm60qFzFVRDpyctMPax0tBpq2Oj/nxjyKWyoA+41hr4lzyjGf5gh3XD4GeZ
         1dETVysiIjCcXjV7WgxDxsXHQe2iow08oCBw9Y1q0TsVnTYf/WjVqmKJ3iO5bB15mi51
         njlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727738728; x=1728343528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2l/INc1G6hGl42jJZMjqWTMmdh1MqpMdLpE6m9LxGY=;
        b=r1CjlLwwq3ttXj5pU5kQIthq/PBxf2Cx6QoK9/BJ6NMaPE4vtfA4JGkJbVHwJ/wZCZ
         M4jFwosmY8Q2ygHUwqYnfUqiJxQjTXXLtKoFX77UfDp2DhdLioD1WNnnRcZMjPC4uoOu
         r7+2yQjb7ZPqL2RuzjdDmZ/4BDuKQF65zWZ3Ft4LcTATCFdnUuSeCdgNSp6EbZT4/x//
         yAzllx94kjIQJnbO8RhLOIBT1yNYdbE3pNBL5t76SWkNpmVdL1OModzxCUmIOpAAZzAX
         4GUA+4bUDJknF1YYpXohewA1rUfQHlzjpbJCqTZ22GFm7zwfFqqnkuTG7eOE9hP1lGSr
         MFjw==
X-Forwarded-Encrypted: i=1; AJvYcCXQerbanHoU25kvhAWN3T4g0f3bbpG9CknvBo0g+tLd+0pmMM21f/8t999MCoQqAs9FZNecvCm2i/4kwu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMqbmNU9bqN73veqRz/YpzZg0yiglzR4/yx/1g5Yf6EHdsi9p
	fwRRr/+x8dFALCQt8K7cChTvUUjnRnY9z23PvL2/4C+D8wdMSW14
X-Google-Smtp-Source: AGHT+IFxQCnTkI/10QO/SwLIHejO9Ai2n1epW19WOKy3mNuQBfLgXAzzRkOLwniFyBlRx0KPlhl02g==
X-Received: by 2002:a17:902:c403:b0:207:1845:bc48 with SMTP id d9443c01a7336-20ba9f3023emr15528665ad.30.1727738728377;
        Mon, 30 Sep 2024 16:25:28 -0700 (PDT)
Received: from localhost.localdomain (n203-164-232-111.bla21.nsw.optusnet.com.au. [203.164.232.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b50423894sm46892245ad.207.2024.09.30.16.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 16:25:28 -0700 (PDT)
From: Rohan Barar <rohan.barar@gmail.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rohan Barar <rohan.barar@gmail.com>
Subject: [PATCH v2] media: cx231xx: Add support for a new 'Dexatek' device (USB ID: 1d19:6108)
Date: Tue,  1 Oct 2024 09:25:01 +1000
Message-ID: <20240930232500.1700330-2-rohan.barar@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240926235048.283608-2-rohan.barar@gmail.com>
References: <20240926235048.283608-2-rohan.barar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for a Dexatek Technology Ltd Video Grabber (USB ID: 1d19:6108) to the `cx231xx` driver.

This device, sold under the name "BAUHN DVD Maker (DK8723)" by ALDI in Australia, is similar to the device with USB ID `1d19:6109`.

The latter is already supported in the `cx231xx` driver.

Both video and audio capture have been tested and confirmed to work after compiling, signing, and loading the patched driver.

For evidence of the device functioning correctly, refer to: https://github.com/KernelGhost/TapeShift

Signed-off-by: Rohan Barar <rohan.barar@gmail.com>

---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 92efe6c1f..bda729b42 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -994,6 +994,8 @@ const unsigned int cx231xx_bcount = ARRAY_SIZE(cx231xx_boards);

 /* table of devices that work with this driver */
 struct usb_device_id cx231xx_id_table[] = {
+	{USB_DEVICE(0x1D19, 0x6108),
+	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x1D19, 0x6109),
 	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x0572, 0x5A3C),
--
2.46.1

