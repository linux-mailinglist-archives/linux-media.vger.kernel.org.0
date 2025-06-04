Return-Path: <linux-media+bounces-34056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E0ACDDAA
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 14:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43DA27A1CE1
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 12:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE56028F921;
	Wed,  4 Jun 2025 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vwhzcscz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A428E61C
	for <linux-media@vger.kernel.org>; Wed,  4 Jun 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039369; cv=none; b=jxSlXNXDxOAt9qGOjUlaYqKrvOpKjaPLBYmPRfB2VulM+erzKYNyVbCH+QzG2TYfl6TId10QSC2V+fJrU++ofNhHBsmdklAwmHm5vBY0vlfxhQoklidvHu7MOV42TzJV58jOtT1czN7XIZ9Mo+4XZQ92vurLY9tHExTUyt2SPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039369; c=relaxed/simple;
	bh=R9poar0IHwcvjb7X94DIxPbqfZnQbM35tbbAXoVZYLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6H4Dxix4xEiLxR+ZG2tdh8hvkRHz6+EgRzXR6axVg/ljZ4AfABCqc7+P6r7MNgiJfuCDEoywqxf0HoFIKEp5LayrUqCn5NIa9epaNAaccUi/AyqVXR2Cr7C1JoNc13PWGjUEVNVu4/coC63eaJSb+vwxkfbnWmxLQ9c3Kej95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vwhzcscz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d98aa5981so9123806e87.0
        for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749039365; x=1749644165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U65dM4LWKHoC7xW4BA72z8M8lPtxis+hazmUzV/TgxQ=;
        b=VwhzcscznEi8l5eb9HAbb9nZZHVFk4PLxSHZ9FRj2276NlAmZm2eh+1kin53N0wQWR
         ofixgFEZeSMUls7eB/6jRB8duaVLT5hQM3ZKM928w8WCmzuQdS6sePdC1FmULqA7c5km
         ZluFNFVRGJCc1wD4rx4vDV6a54n+6VY096nuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039365; x=1749644165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U65dM4LWKHoC7xW4BA72z8M8lPtxis+hazmUzV/TgxQ=;
        b=nv1GedkYfT2iXB6KRJPFQKGq1whiAg7KeKxrn73qtW34FF4TRs3QnyaZztJSbtYHKF
         sY1KxJz6iuZjnNtj5o/Q2nq5T3KlsfPQmdv/PYmyDwtm7nx1bBp9yZ28v6Y/txaJG/iE
         zrP34oYzEdcuz80uQo/CKVlHUiYRWeZk2WTcmLfTp8wybl+l6WaQ43ZA4nzzfBy3BscQ
         zBEuq5AKeJSAPLY90XGzcJSF3ribfMqpExKooyiHyrsWSZJrEfOR+3vslcdyBkKNHc64
         sOPTp+844h67GYkvKlr0sH+UYpXpMHlKyN9PG9UexppLkJtt4H9iBlRxWBDE0Tl07EyZ
         ieug==
X-Gm-Message-State: AOJu0Yxs+AWwznqu/yp0Ynf9QFabtwsGSdE6QI9HTURdAkEezcnqoL8S
	IHQph9MsQ2EXAxvvLKB4G/GHsdCNSYI/+jJYBM1rSNaR0Ignc/eoBF0XaN/eu9MrUw==
X-Gm-Gg: ASbGncvGy6vVtN2rb1bRlrWwOAUt0k+X2VW6LzVTGIA9r4eCPs3DS7sIWyfLWWSMoiq
	BkA0tEc59cmwqumIqEgu5o09gOGIEVLaJKYSKofvjvoS9akCUcM3LRpsrzIT5TViQ8VdD/mnqCs
	IzQylNIK52mlHeB+IxfU/o3xObZaIFQr9B0iwHI2M0Po9ibJ3A53FlhoHKe25f3GYsxKQ4RoiXX
	UytjAOGG9BppWj1h+k1ryfImsY4jmU5FvWaw54JhzFWUNvJ6L6B/gqhZN3z5V9+Rvw94SPvBVWh
	lYHxN/YL1y2/Lo+25uf4prYL01FSgR6/JcbxJLXvCiUAApCXX0YoWz73+GQeH4lTgtyNYD6VTJt
	/xKm/ZtxrcYdqN2Y92My5MkT0QZm7aHa32Avh
X-Google-Smtp-Source: AGHT+IGBrBRDYdNS9IdYcZYK7RO2DqQLHlV/qfBzNERuIj/o5XcOQ3QVU/1bYU8eKuGEsinUybydhQ==
X-Received: by 2002:a05:6512:3d9e:b0:553:2e42:fffb with SMTP id 2adb3069b0e04-55356bfb72cmr664186e87.33.1749039365318;
        Wed, 04 Jun 2025 05:16:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a12ecsm2289134e87.90.2025.06.04.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:16:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 04 Jun 2025 12:16:03 +0000
Subject: [PATCH v6 2/4] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-uvc-meta-v6-2-7141d48c322c@chromium.org>
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
In-Reply-To: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..4c05e9e54683a2bf844ddf26f99d0d9713ef05de 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of this value, for V4L2_META_FMT_UVC the kernel will never
+        copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


