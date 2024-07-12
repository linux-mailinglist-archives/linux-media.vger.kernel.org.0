Return-Path: <linux-media+bounces-14979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB79301A4
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 23:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7034AB220A9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 21:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAC44D8AD;
	Fri, 12 Jul 2024 21:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha+GnrHY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5957D1BDD5;
	Fri, 12 Jul 2024 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720819966; cv=none; b=LKKv1IOF1PJXAXrGfkrVkw48WAjfuE7ZvAa2A5MoI+WCptebRPnNVchFMWMPyRPeuBwg6oVXDT4G8ThYSc5/xp0EsSD2qC9kxfsm+LdfABIs1vjmjWvMe9+pQ8wwTj9jxHokmzdw+OyLxzZRQKQjmmuFqK5vyk9relF8uKwljis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720819966; c=relaxed/simple;
	bh=4yV+Y+Isy4NlODiQmLxepE/5olCq+aVwhhCjsJEBfoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KDuTbDAC/GCt0ezEhTJBTryAZUUK5ozk0vQnz6xIP96y1IbSB12vAp1W5fqpnXeqRZZYR14/ysW+nUzmZHB5I/Ik9XFtjXGd7WvAqoN+XfIJK2bF2ozQC5zWXU3kGRRDkXhIwfdng6w+xY46b2V/9JIBbIVEkmSytt3MyomteCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha+GnrHY; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-78512d44a13so1696260a12.1;
        Fri, 12 Jul 2024 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720819964; x=1721424764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdb8iLY8j3LfEYpNrsOtjdWoyeeoNEdGzwsVwa4WdIk=;
        b=ha+GnrHYrS5qkAEPMi8VEjlOdxd8gV9T9y5hDTf18AfrcW/NVHOODpCj8agZGM7Sro
         FnQOlI3J3ow/+r/lfzyxeBY6qWHrhRNaTQkmcvvWJrWWdxtr8o7PkVxbZEkjw9qfKPNj
         rOy/1J5ZIr2E6FAOvMsTXmc88zdQ5sc5SwSOLt/n40MmXfSNL3BICWeUdJ6hMfOg298d
         AM2pf8H1J+pmBY5fAQ7JxObS6Zh/BXVnWL8IdRjTcjCHbbH6isHccb7oMUSsvp5JqqDs
         cZrXomGEA8/hgw66BsT5EmDY/w1CX3zTf8YExWKr3d+rIROEcH8ocxXmBOzNdvIsYPBr
         Mdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720819964; x=1721424764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdb8iLY8j3LfEYpNrsOtjdWoyeeoNEdGzwsVwa4WdIk=;
        b=OlzCAXAB0+mrC/2hRtLs23sGHDjYNyiOo4+piRB38L1/eMRVtUwgoOu9oeBhiM+Kom
         2sImpQD4z+IYNKbagE795WTEjA+58qo/ZvftqpnvUGCnOTBZoyEizqTkfkkVZebTNO9O
         CZIvq+sPyaNXnf7C6x6yFSDd8nsMgKeXpGOSpJ5bf/TsjsGOEHwfmxYxeHTzHNDD6XCE
         wEpsk7dPTw7hva59qfhrdUQb2EE3aOkX2ct3zHZzM8FIujFgbtkkgTZZooRvdabT0nXb
         Qm0YITyG22BAZ+MxXXgs+h4ehHjDY+gtwanreg0ul9S/0zfBQN0fFR32MJQCKUiv71UV
         jRAA==
X-Forwarded-Encrypted: i=1; AJvYcCUT0i8wJqEbVRIms+3I149xXzv4xfoRZ2xf9EyDWm0YxjCE2QUzuW8uNJ4MRPnTOEuS9AHnqXdUEPmhSI2L+/Ikf/bDiMVvvCY2rEvc
X-Gm-Message-State: AOJu0YwC0T7kT1fqeBSBiKu12ASPvvBl4YX17NjQFBeK9ruIOD+MT/C9
	WFkSy04rDWezUb/Qevw2wnmPFNfgNSpKpniyYYsH9oCFYRnnHWTRgqIMnWmI4hA=
X-Google-Smtp-Source: AGHT+IFyu37Mh3VjGkOV5stHrdrcwAkFDKg3F2UO3btSPW4wGqPztITaV3Xg/SVo0WV8/nAkgFOn9Q==
X-Received: by 2002:a05:6a20:3941:b0:1be:d1bf:a371 with SMTP id adf61e73a8af0-1c2982430e4mr15656377637.33.1720819964483;
        Fri, 12 Jul 2024 14:32:44 -0700 (PDT)
Received: from lenovo.. ([2405:201:e000:8836:de69:176a:52b:96cc])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-70b54ec749esm5443239b3a.52.2024.07.12.14.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 14:32:44 -0700 (PDT)
From: aditya-chari25 <adi25charis@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aditya-chari25 <adi25charis@gmail.com>
Subject: [PATCH] Drivers: media: usb: uvc: added kernel log msg
Date: Sat, 13 Jul 2024 03:02:22 +0530
Message-Id: <20240712213222.43185-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added a kernel log msg using fn pr_info

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 91a41aa3ced2..6e25c5d7d7c0 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2096,6 +2096,7 @@ static int uvc_probe(struct usb_interface *intf,
 	int function;
 	int ret;
 
+	pr_info("I changed uvcvideo driver in the Linux Kernel \n");
 	/* Allocate memory for the device and initialize it. */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
-- 
2.34.1


