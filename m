Return-Path: <linux-media+bounces-29179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77E5A785C1
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 02:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 140513AF78A
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 00:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516A62E3374;
	Wed,  2 Apr 2025 00:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nlzcb2uz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EFD36D
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 00:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743554298; cv=none; b=KupYPvKQatXevPWyR780CjBFE/HiG1dpcn0WnfCba5l9Nh8kasadZbc7f451wQw2QoJW1pxHUfIbAKwrrvourg43TD7D1HjwMj/+baavU5ZB4WY3uN/sPN9SRvm54W9dKuqKk8sWrxyp0DX82IKKZPupVAJRcv6SOmhxjRoJmPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743554298; c=relaxed/simple;
	bh=z0M9uNd/pSvVj6ex9nzvCEQD7uBUnyIhUAt3OMqzQHU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=ZT2CKmppkZBe6ZpdRL8KaTbQcNx19m1NttzBnfCEYtM7+ItPLCtDoSIwPPTMMsfvnFul9MZkTAbztLwZHUS8LRqSuJQGwq1kMaTfeEpad/jN2jryQwDOhCCWMlEH53ufvBzsvI4Amen7E3rMCCBAKBSD6u+G4lP5eyJiFWNFJHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nlzcb2uz; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8ec399427so50733496d6.2
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 17:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743554294; x=1744159094; darn=vger.kernel.org;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8AWwYoeLIRBS+7sAQHa//FhJUXYT9j+mlCuz/L01liI=;
        b=Nlzcb2uzfBcJiaV1ak6+lQoCfBEtVWL9baAP7837aWWV6V0KjC0uDECuDtxB4+MJrL
         vz50a5Yqw6/GQN9swxpFMbAGpi8no8HTDIJgwEHCYmkQUE+BxiXpZHY/Wfr94WaUuWFY
         UsXQH/vHJpTUFl5oC+/+9Q3mcz5KlF35P5F07wVMtn8YU6734nmBqMiUvxufVDgI3VYo
         +rPDsEUT/rvBw4YBzVjSbTOBIEEL0vVTFKAOapbY/bv4ERAqSoKD/icmuIh0CdwoVLIJ
         ItrS7HdoHRzmdr4UydqvEDCRG3SPfktLBDeiEGQu+q9WZgU2NnZnkB7jxTFkR1cR+iRU
         fkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743554294; x=1744159094;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AWwYoeLIRBS+7sAQHa//FhJUXYT9j+mlCuz/L01liI=;
        b=E+WvuuHx2Y9gqou0yofwXWFraUooivLT34IrwXr79l2ueWkOyIih37vSZoLxcNib+m
         r3DlFs5Fmf9/kDzYyZIChuoEa4hgPqNU0KWVPMB/4ZBr5Oji6zsZxcEWJV76sNVpVV3z
         155QOA6QIJdPM7s68Uu1kVMsQEe9Y7rwHeM0bf6UrPMaX9x6MEYel4tSTzEjsmDVIRCK
         Cz6w9ITvjXDOv8jEYfD2aS8YF4m57eTFHDk06qb2AAu9sg6g45UF+6JY2CnEaRmC2cDZ
         rHGVaWRQ4y8iQ4wMY9TZDpRBtNYuqsy8UQsGooVqHzzMs5pS1njKDicYP19sCu/VC5sd
         Bahw==
X-Gm-Message-State: AOJu0Yz1/+f5NC0O5cyA4DoZHVGhFBtQwst1zGVRCzGf9vGfWCM6juEY
	ZcbFwZbP3xOuTIhbGbg/y68Swm5UoDlo8Oq3bk405iYsHXruabvOT35OYBB6BQs=
X-Gm-Gg: ASbGnctkFqwmG0hwczWKX5gm3QWABNumL8ihqFHwid9OMlQaIOSvAP1de5K8Em+6vbf
	adZ9oWTpn2V3CkISzNzSfVK2A0BCaFryKlck6jhIeNcULcFQUbbzt/3AuglIBv41Sw2V/kQjo9N
	zPwbBZKNs5OHIuTGRewEfQRb456Pbh/ucFvHXsatP5KA4Xuh+Nzb2VzQE21FhpCyG1fbSCMs88q
	K/INDvAJS1Kk/LmzrWKpBvwOAf6rVlO1fX2PJOyRGAWgk8ls4T8uOg+aLtMNOOcqedGWTi4P6+F
	6onD1Uf5Fgjv8O05QjPSS3LhIXlolgMOvlg+3UqiyyiU9w==
X-Google-Smtp-Source: AGHT+IFEhiCS8eCnq8NYUvlP8USM+0CMd1MK5pPBJtdugFm6EBu/miHksDoPGhJavjzTu8ZXzEqMxA==
X-Received: by 2002:a05:6214:268f:b0:6e6:646e:a0f0 with SMTP id 6a1803df08f44-6ef02bc43c1mr10828756d6.12.1743554294073;
        Tue, 01 Apr 2025 17:38:14 -0700 (PDT)
Received: from [127.0.1.1] ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9627e9bsm68240356d6.15.2025.04.01.17.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 17:38:13 -0700 (PDT)
Message-ID: <67ec86f5.d40a0220.2fb67c.97f0@mx.google.com>
Date: Tue, 01 Apr 2025 17:38:13 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2284820769746903825=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-media@vger.kernel.org
Cc: 
 linux-staging@lists.linux.dev,slongerbeam@gmail.com,p.zabel@pengutronix.de,mchehab@kernel.org,gregkh@linuxfoundation.org,skhan@linuxfoundation.org,kernelmentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media: Remove unnecessary braces for single

--===============2284820769746903825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From 2414aa327e8a2b2f8b7cb5673c20bcdea3c5763e Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 1 Apr 2025 20:22:22 -0400
Subject: [PATCH] staging: media: Remove unnecessary braces for single
 statement block

Remove unnecessary braces in single statement block to comply with kernel
coding style.
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


--===============2284820769746903825==--

