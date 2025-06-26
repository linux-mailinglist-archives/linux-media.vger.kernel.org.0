Return-Path: <linux-media+bounces-36028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC32AEA472
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 19:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9531C263A4
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 17:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5BE2ECEA6;
	Thu, 26 Jun 2025 17:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a52VXkw3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BF92ECE80;
	Thu, 26 Jun 2025 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959217; cv=none; b=Ai7/xfLJ+IjvdODNQktNoyYLdWqYdnS2zEQTP88KuOjttHrCw5WUneJddagLOYt54Q7I0C9gspo+L/ZT15v5n3Syz1XK0YoF5W/A6Cz2Jms/jw1XeWZoiK+ZlYHCK057T0hs9AukzQ+QmEUep/DV9lC4UNURkJSb7i80RUxBejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959217; c=relaxed/simple;
	bh=AQiq4z0xA88o3HSFvbhcfQRTGqMXtRqE6hPl7TrS0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMH58I1Zitp19xlvt5tCwhP3Fq3ODoT0li+P96EetrfSFLcD/czC4l62xjvyX7j2dCPr/gy6WbqNIB9VvvXErJETJWlrhhGPR9oY1ddWqmPsxcCjXewhTgnf4iD5aWhij3QEMeSOS4gOn/n0pOGOgqYyhs29DvHOe8f99HYXDMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a52VXkw3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747c2cc3419so1219803b3a.2;
        Thu, 26 Jun 2025 10:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750959214; x=1751564014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=a52VXkw3rDIYQbIuhbx3mjYgEx/2JqZWgxiLpUxW9MXxkB7nDQi4j+sbc5Mu4GI4rs
         jbleitE9No5BhliykIocfNnhNbcdjvaPIkjUzRQugwpVvVdjnzbJyLTefdU9Qt2Z6CYJ
         e6D6EFCEyof3bCK8gssCBXQK9TXwXxVDf5nhDnwipgDOTMFTKVn/ru0EMSjSm+qNG+2F
         mjP+UwWWFp6uf7SgPfgiDWi4ahDlKhI8snByPTeFA76HFnz2kZXAhhjRq3sEMdMTu6J9
         LbJ+DHXLV5BODWMx1djLzADwSDJe317CKzEFtkuaG9252itHxZOCMKuzZborfvhkJyjL
         ZGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959214; x=1751564014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=cwPB2tMgv98fh4AscedMxiAvTb+XTNSZcfmKA0s9DLRsGg2xHAyYetSbvNWRckB4gF
         eiEsePxW8xqGb1ZIH1SnDYp0pbHggDDSDEkvrqBx6DNNMPbVkk5E2O44J4niCECQZGhh
         wMVtTlcjTp5V+ieTyEzOXDYNUe4R/byJwnUXjOsbGx5x2O7nHmzXGImtnPyutRm8iKPg
         GqVJBXo9ziSSmgDo/ewYhnzXNxKq7IfFWUXsjkRIUjfsFnwH2dBV14WtTEidhljmylGC
         Ot2nxi6sK4ZbeVtDlcUwj8HcKC3aeYzaHZFTEjxW5Jp6yP9CaFS5bjxMn6x+bYhzXB+b
         r5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV8KwrcUzgEbF8iZ391wJPDpEp+J/u/10bJuxJoWDqz7C1En/asxJ0M06W1m23RQDJz/SI7/Y4PlRpT43w=@vger.kernel.org, AJvYcCX7T4UZWt1BWJkOvmJIlsXIHBTBfnutgEbmCRuNc6DH1XnhscJzfKz2GjQVoB2sqQ9n4d8MdAEbGEG471c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1lFwmQvsJyAFVJdNzn1BTzYUp9iRDfTat7clyf+fcLBC227hK
	heHRBaAT3SvjM+3/RBiV85NSamYN0KNeygL76EFRD263HhpKR19/zYLC
X-Gm-Gg: ASbGncs1kAqfLocxFDn9JpVAKFeANfyWF5lSnLYj9bZ71f9qTgxKMaMCCmJwMzYVvuN
	fPQBQMR+U8Oi2gDZXDSpvYjDpdb6xNpgJfXCcuQhs4qIlWZpG+84OK58UXiVOXfYKOBYECAt/3e
	uDHiktpMRpCQzMOjK1jO5WXDcqPFnwUS3tz9SOTa9pbqTAY8p5JhMMGoUwJq3yNxDNpDJUhj1sM
	n+D183jwB66YU50SYbtdF2H/B+ZFIOPDQmFIQnMVNJvw7IxmlCDiDinvgUPSDdkrGILcC3D66gW
	sMVuUUg34ySR+tsbtBEr1AOpAqUioG05xKlrpngqVbmh1Wj8tlGbs1fybr0/Y/tzlA==
X-Google-Smtp-Source: AGHT+IG1DAgBupnSqQgcHCQfLJdAyinWnaEnkp06DOFnaLcpFpHJqPABegrTjg5EqIcIrnhafsbaBQ==
X-Received: by 2002:a05:6a21:170f:b0:21f:54e0:b09a with SMTP id adf61e73a8af0-2207f1bb117mr13924042637.15.1750959214258;
        Thu, 26 Jun 2025 10:33:34 -0700 (PDT)
Received: from icarus.. ([45.64.160.138])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c4472eafsm2172155a12.53.2025.06.26.10.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:33:33 -0700 (PDT)
From: Pratibimba Khadka <pratibimbakhadka@gmail.com>
To: mchehab@kernel.org
Cc: Pratibimba Khadka <pratibimbakhadka@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: media: av7110: Replace msleep() with usleep_range() in tuner function
Date: Thu, 26 Jun 2025 23:17:25 +0545
Message-ID: <20250626173229.10967-1-pratibimbakhadka@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
waiting loop of nexusca_stv0297_tuner_set_params().

usleep_range() is preferred over msleep() for short delays (< 20ms) as
it provides better accuracy and allows the scheduler flexibility for
power management optimizations. The 10-12ms range maintains the same
timing behavior while giving the kernel scheduler room to optimize.

This change improves timing precision during the PLL lock detection
phase without affecting the overall functionality of the tuner
configuration process.

Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index bc9a2a40afcb..7f6c610579c8 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1827,7 +1827,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
 			if (data[0] & 0x40)
 				break;
-		msleep(10);
+		usleep_range(10000, 12000);
 	}
 
 	return 0;
-- 
2.49.0


