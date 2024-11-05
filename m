Return-Path: <linux-media+bounces-20962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 695229BD96A
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 00:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD931F23AF6
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 23:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D081216454;
	Tue,  5 Nov 2024 23:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="er5rEkg6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6010C216200;
	Tue,  5 Nov 2024 23:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847854; cv=none; b=rLto42+OqHyogVoj7HhYVy6VbfXC0HAuRbx39pn7us1MRt2pGCx+MPfWkXSVn39NBL+VjV1xFI3HPSUjq8f5k8fGRXt4woh9KZMxj+c9GGRDDtKYjGtkMeFEh8dtMzTQn2gEGlNpr8i1cjEZKSB7ZfDLvcQJyiSW/6b+cwsJwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847854; c=relaxed/simple;
	bh=//V20indKmgf7C9J9/JlcUQ2ooGXHUvhXCVqQV7w4QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IeH5viZA62kl/tA0RFEL5mXoiyi9bDAIIQRGhIFRD9SeFreI1WYdSEyX64uwmJvhSk8Fpmso9iIZcGXdqruUqeAJxufItdXUQ/uZPxu29rvd7q0f4dkw+KwguxJZGKrGeAieh5ocbEzL0vNheJ6VcSVSpXJziCHRwD2Pk9ZWLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=er5rEkg6; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a3aeb19ea2so22419935ab.0;
        Tue, 05 Nov 2024 15:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730847852; x=1731452652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQtZxoc/EdMh+UvpSaz0TXXDGMSstjpIMHUo0smfcAs=;
        b=er5rEkg6dJZoL5dBvqFT19CC2EQc8SFE2cmUh7QLqGfmkvnILyHZL/JFALR8olZdww
         UyHNMZrHNrecadDcytzlumg/QN+kLHNB+vBvJswg4Add78FRHRaVVL5Fzl64qzPqOhV0
         MJRtbDJSEcYFTOv0Hp7n33rT01Njc7XeuuxofXj3+e2vlZpPuA8CKslbbWjrIDHPMoMp
         y17/8S6cwn05c2Zx9V+YuV/abKefH1mYOQEXtex6FiCiAfJpJPZ18k5xieS2tS6vKpEx
         DK6bCdp/e2Mo7qmrdOpz//Du5nNVfGIL7sUJ9v7ldprlJvaom1dQdVBLdEb7eFK6VY0v
         QxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730847852; x=1731452652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQtZxoc/EdMh+UvpSaz0TXXDGMSstjpIMHUo0smfcAs=;
        b=potVCqYE3EFu5eMNOPk/5ltBmwJlPK4q660H08e5pzWNAvRg8gEESXe57726L4lb8w
         TpeQweGRyBLtf1wTWIXD9+pw4Y2pVa86K8PjxRAF3nG8tFHu4OYe18AOiPBV7464hrV5
         I9vVKZvV2SbBsgSisytI9HpXwMkMPVmbF//seRfrltRZhUSicnxgiFpZplwXU7OljNJ1
         KOBjzE7lTgK3b2Q/jLcoXly0ni1LHC7KthWW/Z6U69xkh46DufkOgr+gYK4fJdpIDD5T
         CYijuD9a9aN+NFjQvicm/Z2EY7BWsgOvG+eOn88dQhcnF3EBWbQipm+lSSHnyf+UVE7i
         w2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWQv4mcBQPEWYA+lqMi63IZx6AkXFFYtqBZAh7zfQR382cl+vm8xVAdAvoSc85X2NC8/mbDisR7QVPT3a0=@vger.kernel.org, AJvYcCWf8D6T8eL3FVzaMKomStuZP9gA7Xcj8sX4usXJd9eqr9a068A/fXeNl3as0JL/u6H8oNjr5nWkh613rVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQKIEdURVDkIrvtVtp5hYoI6Rjove6jtY0Ml+OLEWkWG5BfRqC
	nO54qQ2hokd9vnZigYXOMFZ9M5A4eKpC0VrFTWAz+CMYmXQinDLQp9/8aoUhImQ=
X-Google-Smtp-Source: AGHT+IHtbapkF7BlMFXreX8/zweT9WEH4j4B1oUsWyiIIhq2efChsxKOmyrgklSveigASJUNEqrS2g==
X-Received: by 2002:a05:6e02:1c28:b0:3a4:eb9b:650 with SMTP id e9e14a558f8ab-3a4ed2de153mr394679005ab.17.1730847852386;
        Tue, 05 Nov 2024 15:04:12 -0800 (PST)
Received: from localhost.localdomain (syn-047-227-172-032.res.spectrum.com. [47.227.172.32])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6a9a2a298sm30675815ab.56.2024.11.05.15.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 15:04:12 -0800 (PST)
From: Chase Knowlden <haroldknowlden@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Chase Knowlden <haroldknowlden@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] This is a test
Date: Tue,  5 Nov 2024 18:03:49 -0500
Message-ID: <20241105230350.74707-1-haroldknowlden@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chase Knowlden <haroldknowlden@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 0fac689c6350..58a32d27e508 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2106,6 +2106,8 @@ static int uvc_probe(struct usb_interface *intf,
 	int function;
 	int ret;
 
+	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
+
 	/* Allocate memory for the device and initialize it. */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
-- 
2.43.0


