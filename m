Return-Path: <linux-media+bounces-22173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB029DA783
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5748E1634BA
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2991FBCBA;
	Wed, 27 Nov 2024 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FLlPEqIk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6326D1FAC33
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709699; cv=none; b=PNgIumPtwfJNNDvgGGOmsZRpyWUl3/rp4huplQfNBZYUVRDt1Djcdk3Feau1RGTyyKRQfcggn3WgTBBKsuKcMDgIAX200j1Oz8BOpJUz7HidrNqLrbAmeqlZASieCfgqRSG0U692u1QSg1+eReFmAgLU8t3m/QUkPnDyCTc+G5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709699; c=relaxed/simple;
	bh=HDmorQEfW2XPixchfeHjntv/qaXLNSwyu9JUTNt1sAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MNTmtVnt1PqLcWmkTahcceA+YuY8MzWBU7BJExez0MNtvLjK6SYYI89+Domt7beQ+NG6n/6RnC1vZHbcYjThd6gbrXy+OlqpBxt2wNRNpvFUo+ymrFX/mcuuqLebUpyLDgUNDoPKyYcF/4MFbSqlSmO8+z4USkRbBeQWPKq5uaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FLlPEqIk; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b66d5f6ec8so190338485a.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732709696; x=1733314496; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NHAqR0O4B/h7tBHgfojqr74MrYVPUr3J/E8o3WW29Xo=;
        b=FLlPEqIkivYBHd6FEI3ngEE5PDPBACdYrSe+xB8M/TxZuVu/79TovxslNmXEf/sy99
         Ig58yyREH2Mq2711WhYrojHEXCJ8jJCI0lRvqBO2q+KsTpZ7Wo2Lho20LdpSgjJDzTLT
         ggk6kyt+YUsmD5l1x1TORJqrC3OOSWJ6EQTGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732709696; x=1733314496;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHAqR0O4B/h7tBHgfojqr74MrYVPUr3J/E8o3WW29Xo=;
        b=f/P0cQ2178aBtFbS15ihwM9zxGYDNzWvmFNZekAQgZdOXSbdeqAtNGmmoueLRhQXMW
         AP5+bNslzExnWxFgjpfrDVWsnNzrihflrbXm9xqm1BVuDTGhvSWa1CdHIkAc2QObBCgX
         9fU22UkcYx/p4qrL2gwmMyMCub4Dl4XxGFQvw4mBbpkC2O/4vJt/Mx11h3KyLu4haV4a
         53XWXXq+T5RE5vCLSaJhmmB6TtXxbr+5dvwtMkQg78l3PVLgn2lEXaHxyir7dZcBMZMn
         HSvqHInEroSi2zy9GVJD8Dti5BsW6tb3YXKEO+K5FP78RhIF2MfAdAJpEFa+3UKKZcR0
         RMzw==
X-Forwarded-Encrypted: i=1; AJvYcCWot1IFSXA0fXyFkyNhhjAh+toqaiklaA8IphXje4cu/m0I19yJ9wruDjW20Za0Wq0YoB4Du6RLmrBJIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwslA1oDqsSycQCUbXOXv/t5vx5rbo6FCCeO8eoN9hcU3BESMIb
	Tf9+d0WBj0BAGL6YtcohCAX+26EZSOJJjXM1H+SVS+gb/751f/K+q5dbPSJEiw==
X-Gm-Gg: ASbGncvgHWUizHoaKctMuTIxcOcKHc7fECac8LYOhxwjg4qTAGud1u3+DfFhjbiYVji
	2S1KWQ2fbmOSB4LdQG/Yaoge87KXFuEW/RwJMBUySuhw5rUA9r/Ixu7dhm/nNHYv6LrbuVI9P0Y
	76EU883YvRba3EPRntVfc3t4dq3rK2nfoMJeouwninlnCFP6ihIjMMpXbCtmZYGfKA/oE9pQ8fw
	aQ3RVNnfHQJ/9A7HUjHaap1WNbhSrThKMBXdGaHipsan8KwYYVpcRjMMiH0NF1MXjM4yvjWPrb9
	Uo7QY2QPbGh9BYMI+u0++ppN
X-Google-Smtp-Source: AGHT+IH4+uKa+77UNQwZcJatFS4vQ1w4uV2b74frXTYxzqW4RQUwyV/UPMqAQ5OxPsxv6kOhvWcsRg==
X-Received: by 2002:a05:620a:394f:b0:7b6:6c3b:64ba with SMTP id af79cd13be357-7b67c4aac3fmr465478585a.62.1732709696175;
        Wed, 27 Nov 2024 04:14:56 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466be77cf7bsm371171cf.89.2024.11.27.04.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:14:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/4] media: uvcvideo: Two fixes for async controls
Date: Wed, 27 Nov 2024 12:14:48 +0000
Message-Id: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgNR2cC/3WMQQ6CMBBFr0Jm7ZjOUEN15T0MCyiVzgJqWmkkh
 Ltb2bt8/+e9DZKL4hLcqg2iy5IkzAX4VIH13Tw6lKEwsGJNxA0u2eJTPtildbbI9jpopanuBgP
 FeUVXzqP3aAt7Se8Q1yOf6bf+K2VCha43DfOlpt7Yu/UxTLJM5xBHaPd9/wJfwnk1rQAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This patchset fixes two bugs with the async controls for the uvc driver.

They were found while implementing the granular PM, but I am sending
them as a separate patches, so they can be reviewed sooner. They fix
real issues in the driver that need to be taken care.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Annotate lockdep
- ctrl->handle != handle
- Change order of patches
- Move documentation of mutex
- Link to v1: https://lore.kernel.org/r/20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org

---
Ricardo Ribalda (4):
      media: uvcvideo: Remove dangling pointers
      media: uvcvideo: Do not set an async control owned by other fh
      media: uvcvideo: Annotate lock requirements for uvc_ctrl_set
      media: uvcvideo: Remove redundant NULL assignment

 drivers/media/usb/uvc/uvc_ctrl.c | 48 +++++++++++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
 drivers/media/usb/uvc/uvcvideo.h |  8 ++++++-
 3 files changed, 52 insertions(+), 6 deletions(-)
---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241127-uvc-fix-async-2c9d40413ad8

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


