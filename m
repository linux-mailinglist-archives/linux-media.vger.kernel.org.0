Return-Path: <linux-media+bounces-29082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51AA76C15
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 18:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578D218855A5
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80389214A88;
	Mon, 31 Mar 2025 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MgIStzQW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384602144A3
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439127; cv=none; b=Jda0T03gUmV19lEVtruAH7TkhqzGY2xcARJ0ltL1FFjqWJ6aew6FQkpAsR2X9LGhJukuKSSeb/bUzIGEm1BEAr9FS+uWqzrLe5Xvj2tY4u8+g6w1f94W0hhQFv99VCkypXHA5OKn3dkqL5RD8C02vxmTvsAl0sRcyH//P9A5YVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439127; c=relaxed/simple;
	bh=Rz8niDCP/S5JHtYvlTHJaNeGsovQc9YWcOjL+l34xdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTglA5+90PUVlhBsN+BUNw8Oy7Xb83cImUtP3Khy6mScZDIQTLqEKxfteqv2tEV1U44PPUcFJeYZd6WybzNzJVt6Vnbc+2wd5RlunVceeulmYe4Iur/M+durbYmsgxUlUbGBsZboRus2pAxdqgIRaVD1oabQZBEJ6jugvA8DmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MgIStzQW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54993c68ba0so199696e87.2
        for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439124; x=1744043924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sS86lAWptOcn7UzG4ho8/rTQhup+4bcETIY9n4NgIPI=;
        b=MgIStzQWObVFKalBHdOO12lg5yObw7rP6Ej2ynhnSMHMOjgIEk/HjXpmcDUoBJHany
         BLfDmaoXoiXIo1pis7/91qdlZuxwysYisyeLyeJSL3Eo2WE29jCQBF/BymSTQz2yd1wU
         JvN/rGhGiO3dw+NxcdZQvVJ1xG3DLb/EwT/c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439124; x=1744043924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sS86lAWptOcn7UzG4ho8/rTQhup+4bcETIY9n4NgIPI=;
        b=bChCmZzUxZ5rANZOdwIlUFv9oKkMZQBs0Fo3lyGaXb7OicNUmPX+KUdtC2ozD7+FG1
         v+eS8vNjIojcBF5ApAdrZkuOsx+z0aKd8ug5jlxJ1qxhouCO1P423Peo/fYZhMwYp3HP
         4dNPyemG923StFXLJq8v56d5e+C+W0yhhVYjQBUQirvbqXoLq8Xr4scci0DO3x2/Pg8p
         inGvKDTQq32G0LgleZwcUfo3xUQYhodweFXUwaYEqASwbuRFUvpFOP2aGkGOQvssqYiA
         0OtE44Pch/tv6QiWmlS/HG2vWBqSqj4GAvA/HXGXJpxU/DV2WpnJxG2M4IfKmnBUvfAM
         wwBw==
X-Gm-Message-State: AOJu0Ywvhmzw1OZ/P2bP0YyqHO7tzxIkbbRss3CWxTCAOaFqhTwF0t77
	6qLhuiZeicnh11vS1nWGz/H0zRd5CBqHLRJQ35NaKpJ+4xZpDwM1QMdYJ4D9eg==
X-Gm-Gg: ASbGncukxlBuCaviLI1t7mndbc3o+WXZYMdsgIvA7Iv++HWyFqtkkFdQlFcgD1NCHSX
	IRR4yND7af85hBlJRXxHbyeFKSUCs6HFkvs4z+mn1r3YqWbwGpAmnkRB0g8P0xa026leBY5zicA
	kTa/PtPfB7ibhMlNEBrc6vGjD2dFleSSkMMm8zR9PDGcWrMnzzqMWzRVz3T8kD7TdkUo7Y+nGzn
	6YovWw3Au0GrgeeIcPRO7lhD1EBJmc9uQS1ZtKBSsWMMRsfbZ2QLr2XBjr7yZmgHKTsKEWBsZSo
	xJcART/8GzJ9vNOk9m8vqbQA7HUJLdoFc7KajLGz81uof5aBTmOl68kFSbCLN1PHWJwzc/beyVp
	V3y0rYGUXcsn9JrBYdl3fM2MP
X-Google-Smtp-Source: AGHT+IHpyPMTl053/x1sB7ty7XO6/dSpV7J8c+JWgkb/ZJBprjEK8fsvW1T+8vB31EfEBwm4+jJmQQ==
X-Received: by 2002:a05:6512:3b14:b0:54a:cc76:1676 with SMTP id 2adb3069b0e04-54b1113d115mr2459354e87.44.1743439124261;
        Mon, 31 Mar 2025 09:38:44 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590fd3sm1151796e87.188.2025.03.31.09.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:38:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Mar 2025 16:38:42 +0000
Subject: [PATCH 1/2] media: cec: extron-da-hd-4k-plus: Fix
 Wformat-truncation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-v614-v1-1-9bc69a873720@chromium.org>
References: <20250331-v614-v1-0-9bc69a873720@chromium.org>
In-Reply-To: <20250331-v614-v1-0-9bc69a873720@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Convince gcc8 that the port, initiator and destination fits in a single
char, despite the fact that they are 4 bits wide.

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e67fec9434aa6852ab465ad8c11225..e1a2a676bcaf9c313041ce8074c85636cfe4b2da 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1012,8 +1012,9 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	for (i = 0; i < msg->len - 1; i++)
 		sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
 	snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
-		 port->direction, port->port.port,
-		 cec_msg_initiator(msg), cec_msg_destination(msg), buf);
+		 port->direction, port->port.port % 10,
+		 cec_msg_initiator(msg) % 10, cec_msg_destination(msg) % 10,
+		 buf);
 	return extron_send_and_wait(port->extron, port, cmd, NULL);
 }
 

-- 
2.49.0.472.ge94155a9ec-goog


