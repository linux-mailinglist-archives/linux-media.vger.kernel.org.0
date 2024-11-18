Return-Path: <linux-media+bounces-21500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D283F9D0AFB
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 09:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97AD4282882
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 08:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFA119258C;
	Mon, 18 Nov 2024 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcy3lr/y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC58191F8A;
	Mon, 18 Nov 2024 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731918477; cv=none; b=mY3oM3YEWwW0Q95NTjxBiNm6sRX9NftbQJNJet/zQBxXgaMM9Dm6J4vGlaoXRNHDh4skYD53jB9zuQ7IoiYuyxqlwZjalEq4aEnI5Np+KmjjTl96n3Pc5J0WYIOeVUbjVOE6lDl3I3z0ZR50cHRKpj5c/HWXrmjtXj54kcPVejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731918477; c=relaxed/simple;
	bh=6Wk3gQnZoe26GhCRpccJfdNelj4igrBdNGca3iwE+To=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FcTm+dyo/0MVBdieQu+qt2YnFKDkzea6JivlhQD368YE96MpxDUsFRs8jVfpgH6UYHHqiv+HZC6cbNYJNc25VTkElNgiOkZcbqT8KxjQrWQtyAZGLde4xNTEcUPwn5+bPM0oJrZD9t6dm9y7ZgKJoiryIxTA/XJkUMLuA/NJGH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcy3lr/y; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cb7139d9dso36497165ad.1;
        Mon, 18 Nov 2024 00:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731918476; x=1732523276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5+U0kq1b3c+GGw5rsDzUNZuSYw2uDdPwqKTihhZOLBE=;
        b=jcy3lr/y4gJDwHqsG5LY/kD5M8fhoxvSlWIKEXLusFNK7ZNaQuQPlxYKyF0ttXeaCF
         qg9xRHt75fZjfsu0lAgI3WgzF+yz90I1CCA3L3MVoTR/OZmFIpjLz3+HKzXj9X5pZz7h
         tDIGM7LJOi6R5Sag6apeMRTTVqdpSggGFsbz63ejZUKNOCv5HK3oJrHIFVu1AFuUaEMv
         z7wNFK7dRs1J9Orp/b7MXJUdpahDug0ENA5SR4RUz9vRMl2JHIa16BOkbyc43B6Rl0Rp
         b2TM1IPrLOiRbh/fVy26So0lhS3nbwCUio3QJCedp/TD1f88GQnXrY1BpI8gahcQhjEy
         umkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731918476; x=1732523276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+U0kq1b3c+GGw5rsDzUNZuSYw2uDdPwqKTihhZOLBE=;
        b=rH9fKaFcBh+OdTCMYySdhPn6Kgfwc6ipG6TAkcsQVFx1dlH53gOh0VLs1xjapCljCi
         HwxC9dK8wp503AbRCfA7XTJoe0yUrxSF+498/7oTaWyXyfYJdkOU5HkF5D9KaOTWPXyX
         uhpzmlMd7PWjjWlr3nEXbasNlRWtx39SDf68s0/lbXpbv1uQYXAOhVnLC0xe47aQ2M3e
         5vbOfDUh8Vd0ZcTvb0utaBYr0aL0pKSVB4QnMhEUUJHmB+1DBA1W9zeOi8T8HOPf3MuX
         2pz0254M18ZmLmifhyqLh5ky9g+hceX8oH09lIZficaViidzyH/yJ8E88iSco8rJqu5q
         2PGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8438hpTtEicQL9JkXfIEfNvijuKsAdCLEbX72vb9Sk1zCUlrlxVxkVjcwbO4zcBWBKwWP+nBgf1WARFE=@vger.kernel.org, AJvYcCWDehglyFhKGEHzJr5Ku6BeVxCIhHMvMpjXsXgFejZGyOsKBl/3khYyXKn+6OTJm7RVND00tKn6cABnWB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVFfaW+aVANeHhpSRn4LAlmEY5ND+wyJbNNpzOIdWVbfaZCpBV
	/4z0ndaUdOw1D7+BTxYFGTzcdjlSj0d7RMqwfWze0UNz1EvWEe9z
X-Google-Smtp-Source: AGHT+IGw0jQZ/MrW6S/RKnnf4ocslcGhBOa1jrlZ+Hoh+2XZUAiXC2Jr/ZqOqYkR1RF0H0FBVXczxQ==
X-Received: by 2002:a17:903:2452:b0:20e:5997:c107 with SMTP id d9443c01a7336-211d0ec2dbfmr159737005ad.39.1731918475894;
        Mon, 18 Nov 2024 00:27:55 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21213a94970sm19695165ad.39.2024.11.18.00.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:27:55 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH media-next] media: rkisp1: Fix unused value issue
Date: Mon, 18 Nov 2024 13:57:49 +0530
Message-Id: <20241118082749.55233-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes an unused value issue detected by Coverity (CID
1519008). If ret is set to an error value in the switch statement, it is not
handled before being overwritten later.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index dd114ab77800..9ad5026ab10a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 			break;
 		}
 
+		if (ret)
+			break;
+
 		/* Parse the endpoint and validate the bus type. */
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		if (ret) {
-- 
2.34.1


