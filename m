Return-Path: <linux-media+bounces-21327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D2C9C5F10
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 18:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0CF1F23CAD
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 17:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A95217476;
	Tue, 12 Nov 2024 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EYkR0ynE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27E9215C73
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432668; cv=none; b=V42I2/2cqbhHKHcdRExBKPVWuOelbOvWIHeHvGY+8hiJ/5pqJlu8ZBHSsiWj7eQ18SsrOdv/xKPNy2lOiDSIHvFwsxptERyPcbcWTX+8B8oI/2smaPFwF2buuZscJDkFBtFKEUy4XJ3wNNlV1MugcXG+MXIwockweEVpkm0soTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432668; c=relaxed/simple;
	bh=aNTUZZhZyqVU9gy8l8yK7jgccZ+2XSUjodsCiy8OgCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CeV0ia6XfJCV6//g0smqpktydgr4CP7Fy8xbvE6oieQy/eqDY/l4GyOxGh1mUcBfDuryEomc+DwTH+ZSKnoivGGdFnBkDdrfUTmWCXMb1xdOydTiTFrLguACTn0KsnZN47iQI5CXstfBtneg2Z/+31uTprCHWU48o1/DOutaf50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EYkR0ynE; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b154f71885so471959485a.0
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731432666; x=1732037466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mtTXn3udpu62k3Atn4vt+FxsonuY7lt9lS81AKORGg=;
        b=EYkR0ynEli2+3e3OFpywcuIUZJ1YAnWx+QLl0GZI4lsqRKajq0YgXe+vP3VwX5qBzo
         fvAG/jxAwRuGzcscyuqZY5o0i6B0kPpsQRBKm7Yb79zkEpglOm91sm8rW7NCVxyxHyGp
         mNRRyOVpBBkvbB508eQw46kYcGoMPThGMqqr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731432666; x=1732037466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mtTXn3udpu62k3Atn4vt+FxsonuY7lt9lS81AKORGg=;
        b=VkYPitUXlJ9nRIDoV/WBFwOHhL2gs3YW7kJnC7dzCbXh+XpEFcP3v+W41eTYaOLNJd
         zpqBDobBtCAQYd43pdt0hI65uyx5AH7XuNcCIgqrRu4eXRxuJmdFB7/OdNtK75SftcBr
         ohWCeX/kCEgIFr+t5MP0WcTnzBhR8eQRfxSzE+EU5bjU0q/nxp2NhPTsGblBGTsVJ4iH
         SLvy9qlK17PgLZvfDgVf44uZPhofgqR0DUXhOcKPbWrfqAUxS1qcAAU5ocpvqii3Asoj
         xDhQLpESncU929eHveFSqPnCSwRvz4ZkrvSMylbabY4HpzMfKB+3BvhGI/wBwGNKSXi7
         ysRA==
X-Forwarded-Encrypted: i=1; AJvYcCUvE/L+/EyjX/LbGC7Fv0b3vjWeaOL2qFuKlbGor1uue4urfDVDRu8RgZ0BvQKuNRkEsvpJWIBnYDT/Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMOtCOGBEfJIb3QYzT6dQiOtARosKbBYEZ8il0d6OzLBywTQb
	sVzzcCQd08QPy0tpqk0MSZ8Z04y5xATnUjUsiyJH1NEzks6KxAde2KfBThJMnw==
X-Google-Smtp-Source: AGHT+IE6DeF9yyQEoLuMSjlzOxCp8Mz1HxU1DGwfXvz8Qk3lJu0bxx+avH9OkExkGfDmegsKe4Wd4Q==
X-Received: by 2002:a05:620a:290f:b0:7a9:b2dc:99a6 with SMTP id af79cd13be357-7b331eb6d20mr2147972285a.24.1731432665768;
        Tue, 12 Nov 2024 09:31:05 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac2dcebsm608292285a.7.2024.11.12.09.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:31:05 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 Nov 2024 17:30:48 +0000
Subject: [PATCH v3 5/8] media: uvcvideo: Create ancillary link for GPIO
 subdevice
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-uvc-subdev-v3-5-0ea573d41a18@chromium.org>
References: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
In-Reply-To: <20241112-uvc-subdev-v3-0-0ea573d41a18@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Make an ancillary lik between the streaming subdev and the GPIO subdev.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_entity.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index c1b69f9eaa56..7b8fb85d8c03 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -53,6 +53,17 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
 			return ret;
 	}
 
+	/* Create ancillary link for the GPIO. */
+	if (chain->dev->gpio_unit &&
+	    UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
+		struct media_link *link;
+
+		link = media_create_ancillary_link(sink,
+						   &chain->dev->gpio_unit->subdev.entity);
+		if (IS_ERR(link))
+			return PTR_ERR(link);
+	}
+
 	return 0;
 }
 

-- 
2.47.0.277.g8800431eea-goog


