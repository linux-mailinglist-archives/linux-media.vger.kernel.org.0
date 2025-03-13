Return-Path: <linux-media+bounces-28145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5783A5F427
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 13:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9DC17E761
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D352676C6;
	Thu, 13 Mar 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U2WY8X+1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F91EE7A8
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868443; cv=none; b=tRH/A+1qOowA6FedcGRZaU5erhTarHghXumohqmjbCK7M7bWU83Sok6vPqHi0Q93d+V4RY/IdPQYhKVuvdIY826OCWzpehFkTPzWJ8SDCcIS62MzkjKEvj/f3/UnBR+W/2nl0HvZ2BthX+LkNE+MhdloaDyGK5aQMnT2x+piDHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868443; c=relaxed/simple;
	bh=vWTi3LR9hJZNwt3nMvFrGfBx1tozG7F0KblReapEJjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QwMnzgvVlQ9ZXt+0SlQ2kfJlF5pvvtiobceORIEoiMYCvXq6FjDf5zsAfsZFbKj0NA+MDzd8miR8dcCWnZnOEZIbkvEUj/0qurGeC6lY2xCYvaJsa3r8V6E9a/fuW6x8E2bCvHaUYSyVBe+4ZQ859jcfgFJGEdwWv+vwwnm2Ed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U2WY8X+1; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so17556746d6.0
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 05:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741868440; x=1742473240; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eABKFzeZYScxgYja+KDOHU4gTOLr6uHZM4XhISuduUM=;
        b=U2WY8X+1+8hBKhqS2d5jL1tVE+XJVgGeNker7Z/pO/NpAj7R9tuG+EH2la979IWLUe
         P8b6M1S3qpZgg2Q16pxnCKETRdAvGuMciVbmk/G4/SJch7ypnHXeJUUp/AXtYkLwIz4h
         x1ObV+qKEGlN7A4cYVFZKJKJk89vZlS6ZTYFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868440; x=1742473240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eABKFzeZYScxgYja+KDOHU4gTOLr6uHZM4XhISuduUM=;
        b=gDVX+pu33YSuoLgnwvC9kyW80XHz9SRHUU1IRHdtem3/EoJW8WBxNWOe2hBwLpj9o8
         Dj8tx5M/ZuP9TawAIDVhTrICXQHP7m7GOY4nyjcdqHYj2D8mGRj5izpalVwbBTZE2CNb
         NDOKFUV8rIU1bYunmm+zlkFpZ3CyUqDK/iCQkHNa5nl7UCNiPln+AUkOu/UwRXPJsNCa
         FpCH9uVJLI7I5t9tLjT3IpKStwgQOhNuTmN1jMfCrkq1uwLGqHLYJ5TgmiQA6Mni4fAJ
         CSAkIDzKkRYFgcfieLgUIuFsZvp5pY2Gu//G1lfX7KAgdwm/nd3HHJbVv8/6op4RG9HZ
         fczA==
X-Forwarded-Encrypted: i=1; AJvYcCWsdnJQrItbRkRV0WQ1Dh/IgY38VcFd0AKEI/1GPCJTMp+cb1jNvif2ddEMDGku+cO2FmgyndBGjW6Dzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFmQ9TdAKnk1VtfA3VCmhSsl93RCk6h6DswGpclxeo3H8a+r8m
	ci24PDqNv22MsYN/Z2Jv0bBRHsqY3YbRWXHL9iuVPmOkLFynInf/ww28nCDFbA==
X-Gm-Gg: ASbGncsj4NFyVyeaRtaBhlMQyuVRs9cfen4z9vcotNT6idhX9ajA+Jxz66/5zRpTiLC
	xTCWDJqWIBVhpQrwWoiaft8999bVpD2jqs0GLvXTS5EA7xxJ8HXLUmwdDCf2RvE4CBVqsJwY1nL
	FPMf6SXx5I48ajOi9plNKX9XNduReLD2NKq9P0AAwVKcZTp5Q2SjgtxnW42RjSA3u9RYvSzdKzj
	pBNdXsCObTkzDLo6/MNkgGgcgwJ/CgR8cE4X4duBembwCu3s+o4RjX+PzotmAUUFJNLEAKHYLRx
	/UjC30p8gq76P+xE6XLkt9U34lQngH2sGmGq1UH68vSpuONCLwTx337OEAT9iqK6vjBg2r//xYu
	325clO+e/fXjXQ/VIe4dbWg==
X-Google-Smtp-Source: AGHT+IFbg5j8PXxdID945dtHure5/GdfhUiyt/sO6UjxT+wwZ4ooK4hNtTzwXvCSsIxBoX2VJ0H9mw==
X-Received: by 2002:a05:6214:3c9b:b0:6e8:903c:6e5b with SMTP id 6a1803df08f44-6eaddf21d4cmr36484256d6.9.1741868440714;
        Thu, 13 Mar 2025 05:20:40 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade235f9bsm9038616d6.29.2025.03.13.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:20:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/2] media: uvcvideo: Fix Fix deferred probing error
Date: Thu, 13 Mar 2025 12:20:38 +0000
Message-Id: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbN0mcC/3XNTQ6CMBCG4auYrh1TWn7ElfcwLuh0gC6gZCqNh
 nB3CxsTjcv3S+aZRQRiR0FcDotgii44P6bQx4PAvhk7AmdTCyVVITNVwxwRaGJvyFJLDKYgY3J
 rSo0o0tXE1LrnLt7uqXsXHp5f+4OYbet/K2aQQZlro0qpUVp1xZ794Obh5LkTGxfVh9BS/xIKJ
 BiqsD5XiBqbL2Jd1zesVZ6g9AAAAA==
X-Change-ID: 20250129-uvc-eprobedefer-b5ebb4db63cc
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
have not yet been probed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Remove duplicated error messages in uvc_probe()
- Link to v2: https://lore.kernel.org/r/20250303-uvc-eprobedefer-v2-0-be7c987cc3ca@chromium.org

Changes in v2:
- Add follow-up patch for using dev_err_probe
- Avoid error_retcode style
- Link to v1: https://lore.kernel.org/r/20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Fix deferred probing error
      media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional

 drivers/media/usb/uvc/uvc_driver.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)
---
base-commit: f4b211714bcc70effa60c34d9fa613d182e3ef1e
change-id: 20250129-uvc-eprobedefer-b5ebb4db63cc

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


