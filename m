Return-Path: <linux-media+bounces-25577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD502A258D7
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2E561677F3
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94906207A00;
	Mon,  3 Feb 2025 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BuHiA6+t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363EE206F23
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583778; cv=none; b=r+sY/iEn4lBlaJraRxpe0wwWkot4y5iakXxTrK1XUgaqDnHC/P2n2GWqxglpa5utcii0aRYJZ0X1QnofsF9mGzaykP1dEHSyfuAI/E1KCFPcF0s8RdPLjDRfyh14Mc5zBiy1nNqvWNUAS7ACXV3rh0Xpo02KgqBWmoxjOxAin1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583778; c=relaxed/simple;
	bh=KB4ZUGflb08SBeygnOriQPhddguTjGuBK5bS60Mly+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zk6aDLBaN2cI43JwuoKOLhYHC1LF3HM/8rCn1rSiAEFyMtMznCiCBxdSxXt/LvsLoZhR4npjCHxaK2/U2Wfb4x4S5ANmnQ/KRmuodzeIrKL2p6akP0QyiqDIDP8LLcyDtkaudIclqgYlNy0RkMJqp0452R3SAvd2ThYcdoF6jgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BuHiA6+t; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso2246718241.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 03:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738583774; x=1739188574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVo9C3QqUMMv3jC7pdvKHUdadHQxzjv5Xy2z0Ro/wJ8=;
        b=BuHiA6+tCAkTp5VWxnnrfZk6zYzFhBEdAAmmjlesZr+wjiGXlHybfttiHIol3jXSFx
         43FL+n/fqZ8BgkzMdWB5ciKZtoec8MjcXpMY3EiR4KsHL/xnEh34MqPq19ZY083W4s3R
         GOcET6Bv5OCsqZNExw72bcO8VrCa0KnUGTSaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583774; x=1739188574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVo9C3QqUMMv3jC7pdvKHUdadHQxzjv5Xy2z0Ro/wJ8=;
        b=HpDottU9fiivYZ4NkB4+1Z1s0sxr9NtRbqKd/Vw+WqYmUKrL3RiHpt98PZ3b7StJGK
         p1oolPiLv1VCWrdmC7qohUaLRnZlcpEMSWFBn3JTM+FHZ8qzcFi8Fa0YU6Pz3IcJsEcw
         gj2pYBmWuBhjOHqXrr7V0ra2CBRDg/gy0zi+EBFLvYNnzncAN0G+gCl/DSlvaIqB7O53
         32gVdqZklog0EV7c8+/NECmPREuSkKfaQ4KBLou7GmTf+OsXJ8/lOOalH6T3c1u4lvZp
         pLOsv9TCmFT8WPMVGtgKxEjuUqLiSzG2DuSNYwTkCTRj9Vx8Ynbwz4qTAppqw80B4lXn
         Q1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUjn3M+zNUCa5cpORnLox2s2VruuCpFvktIINLoFSr03mI0S93frFM0rB4r9r66GnWw5zIWuP28J4LmkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZM2m27MAVmtGZHqy0UxXZlkxtZoMRvVZE5I/a5lmC3CwN2rYu
	4H+UTXofr44tTgKrCxgSWOWwS/lIeGRUXqtR3p25/AhIe/cwEpHQ/Wj29BRIRg==
X-Gm-Gg: ASbGncsNgrZphge1B4F3FJ6R5G5ss7K2/Tiac2Q2zcyvn0qA4NDmmzembDqloitORRE
	/zr1n0JyFrlxYLchJfKGjJ0RBxj/KqOm5DIkfcRB43oPUqaEEbZOwEIPIpKQ7nnb5J44IgJr3OJ
	7+V0Hr7+PI6om3j42PY9cWzDeyOvT1cLnvNJIuIuGLNRnkvQsLGxZsum0mCmrC3ThGx417RCrI4
	x9B6QORUBdaD4KdzJmcGlAaoY+UP7Y2Y4/o4XXA9BQt/aAbW38XKUtNm4V31sp58vQ37Ucm744a
	IeJdxYHo0Uvh54oLMzds0WQW/O9Q2rV7+OvheFbnkyuxrtRDfWO/YWF6dVnKT9EQzA==
X-Google-Smtp-Source: AGHT+IHjiL4llIOfHY0i/Ml1ATfZuAes12e1J4qhFMEy3cP2BZEcsCtof6ekuCPTEJTO80oewTtWfw==
X-Received: by 2002:a05:6102:1041:b0:4ba:b6:647c with SMTP id ada2fe7eead31-4ba00b68182mr209477137.10.1738583774051;
        Mon, 03 Feb 2025 03:56:14 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm1592770137.12.2025.02.03.03.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:12 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 11:55:51 +0000
Subject: [PATCH v17 15/17] media: uvcvideo: Add sanity check to
 uvc_ioctl_xu_ctrl_map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-roi-v17-15-5900a9fed613@chromium.org>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
In-Reply-To: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

Do not process unknown data types.

Tested-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 41430720ed47..d56f482723d3 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -108,6 +108,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 	struct uvc_control_mapping *map;
 	int ret;
 
+	if (xmap->data_type > UVC_CTRL_DATA_TYPE_BITMASK) {
+		uvc_dbg(chain->dev, CONTROL,
+			"Unsupported UVC data type %u\n", xmap->data_type);
+		return -EINVAL;
+	}
+
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map == NULL)
 		return -ENOMEM;

-- 
2.48.1.362.g079036d154-goog


