Return-Path: <linux-media+bounces-36027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00408AEA46B
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 19:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FF8A56405C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 17:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FBD2EB5D4;
	Thu, 26 Jun 2025 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sqsa1O00"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19478F2F;
	Thu, 26 Jun 2025 17:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958931; cv=none; b=grafj7guQnOoVZfGqq3vQrZY8XmAqTBIvcZZeGMmaMYmwTfUZ8c3tgpl0X/ZFdCF861oCl00K6AHJGAYNY1VFEqgbMlnOZ6zkayYuwOB99Yg72pT7Uod8DKn2ErnK+chU+PbbVL094iI3SssknGYYZ/dmev03sHrc0ZA2g9j3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958931; c=relaxed/simple;
	bh=AQiq4z0xA88o3HSFvbhcfQRTGqMXtRqE6hPl7TrS0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQs2yHjD2KAt95LxUXzrOuHF3hITifa0cEUhpuHJ4SzhtwZgIJuadNV3aRHZrKRgKhq9bpT4ISjYr0AGcJVcizPwOgfwBVOGZzutj43SzGd989Y30Y6NE0+jlzczIwBeGEW5ofHjUym1wKnBqdxYmVdnaAeN4zJ6fImOm9wd0Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sqsa1O00; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747c2cc3419so1215379b3a.2;
        Thu, 26 Jun 2025 10:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750958929; x=1751563729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=Sqsa1O00Fc3wDyUSrpz14qw/4GaAnrgBeQJxTJZqEIbgbXD6lTCEn3EM5dJnG0aUG2
         OeFTnXxkg4VZO9ed61OOeHCwTj7MWRxAzwJTbVDlUdWOE6AhEg026rlh0AZQff1K1ZfO
         9Mm/ZTAch9qL6Yh3PaZUu6hI3/LkedUkRfPG3WMkOahESBEBOQCLej1a3iukNg89y2SS
         rf8UbQKDiP1+4AplaWRwj3flJYo3+URWIhREZT9UoKpBLsSP6jDaKcUqlKIE0Uet0Yka
         R/Vs90EPMoc5njQhqm04zZPSx/drAMd1iQq5dVK/rxQkl21WuBO0DDDWA5t0Gj7RSLxI
         XKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750958929; x=1751563729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RO2tN+aSoxvaSEMRq7XEvMbHrJsjG9xLguEP52powFc=;
        b=AoDrM4wmWh6II7y8BbiwoXQraAjWPGjOZTgE6vCuTNLoOu8u143TAjg+aMmBeLooco
         tSN5d3yhyxuiNtkd32btwXKUUbTMEUb8mn3uiFnj1W34HmSyVwLeZnEPVfjsXGh7xkC/
         zz8vUBLve/nOM9IE7u+Pn2xl5gkIEvSXpXunEER4AO7LUu5bhiZFXey1ui7rBBWaoaRm
         54kJ4KQuMWgP8E0inrefadOjOTbax09jo2r4huwKvKiGSwiAaJT0sBwL+d47kwhcXioP
         XUu2dguAUuoN/c/Seg4oMOy9mlC1BrcZ6LC7bZhBnrxM/0GJEwSDIim+IL7TY2p50RJe
         wfCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRB7vnQzlhSTell+lMGs9WzgsQmbTsr+UJNx4KqNfiN0J0zyg/sfSTYXLtLh26o4WcksOHbzLRrnLv5S8=@vger.kernel.org, AJvYcCXdUosK0od5G8RhFvgExnY8EydcklZZ9iof+lzifDFtzI6EMzF6crG/NyCvPyjYZzm/dGvRg9nb+coZFeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS1OQ47uhp3tymDZbmLzgi1I1s3ibKzRDMFRdkMxkKOdZ//UiY
	ZMqeVL85U/xalIAIlGrN1skX6Cc+xMVROfJVpnaffcSoYh6WcCUhT+uF
X-Gm-Gg: ASbGncs1TP0QoCz8J4BKyD81A/PeV5Ez4SBpdGLbjzjw7verlf2BHX3syNUWeSfZf/c
	niJonuF2ZUZRL0Lzy+FRqu6APpbq4WPn4sXjsKMRHxBFa0DGq2GkDAL1lQyMNsaT2vAfXGzYSj9
	w718c+VMIvabuGki3cCkkDFqR/BmKBrHkJzTAsWleurqcYQ1WIRwip2b03vfiOAp8OmOK6BG8Qg
	fBE6zbM3UOVvTqRKolJoWQdem2O5TGw7isALWz7qywoLmF1GKtwvBSwstOBzdBOcvHtcVx1V+Vd
	JH2XQcHiP2S930EhDuER4aGt+II/xKXD9kgdIilOOrATU7aOFZ/NWWmt51l2972PZQ==
X-Google-Smtp-Source: AGHT+IFlz1ISeSqJdOROistKjbH54/ytAzE+OyIesUVOCzXGCvK+a1JEVnGW+DkFHANXqkfgFdM6oQ==
X-Received: by 2002:a05:6a00:3e17:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-74af6f2f9d7mr50135b3a.19.1750958928731;
        Thu, 26 Jun 2025 10:28:48 -0700 (PDT)
Received: from icarus.. ([45.64.160.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bec8sm226888b3a.39.2025.06.26.10.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:28:48 -0700 (PDT)
From: Pratibimba Khadka <pratibimbakhadka@gmail.com>
To: mchehab@kernel.org
Cc: Pratibimba Khadka <pratibimbakhadka@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: av7110: Replace msleep() with usleep_range() in tuner function
Date: Thu, 26 Jun 2025 23:12:03 +0545
Message-ID: <20250626172707.10115-1-pratibimbakhadka@gmail.com>
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


