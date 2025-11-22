Return-Path: <linux-media+bounces-47605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57891C7C87C
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 07:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9688D35B1FD
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 06:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE712F25E2;
	Sat, 22 Nov 2025 06:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL69vdCb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AF1191F98
	for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 06:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763791956; cv=none; b=jIc2/dy3AwSr48csAH4qPcz/INBlc/50Qiu7nEfqIJ0/QE1OND5hQnHjHRjxH228SrZ+QIBR0yq2yHAwzSDBmsksBquFz9jhkt7p1NEvW4lUt7QfqY/K3/qAkQsZCRr0sslIRj8dbNL7oClv3v6Eyf0vZFyUVgwva0TFqz05PfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763791956; c=relaxed/simple;
	bh=X2b/MKU+rsahySYjtm7A+lzzR/q0LqJmysjHzsfXj7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UQtYMJxMnQNNfjvadPNBqEMxyBBK4yo9t8OI4e+W9IMAvwy/ZAqg4tygBGbjOLcb+2rVUll+uMgFSbizu8sGIxVsLd7eZ7yTB3StnpQDRIobJqoIHQeQ17pKK1Mkk0cJsvVg/jchUIr+5xaDU/t5HwVAo+HRCNkRBKFYoqZ4O7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iL69vdCb; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3437af8444cso2890593a91.2
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 22:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763791954; x=1764396754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFsL45n41/Hy6LgeWFBOzqkc8C7/mLyLVAt81mYg+MU=;
        b=iL69vdCbvA85jhDN+0131Kebx6movWmQS/XaCsHzZv0dR6jEsCEHf/ohY2a87zWnd7
         LKtVoykd12FIJZwD6mAlumIW4ZKYv/Ur1grCBAiZmXGIh3le5WBgrQpfb+zUPCewE8l+
         qjkfA+4INVzFYFHTEv8LrbXLwQCDAmBGfXFZEVw02IqpjXTSPlBnY18DUPItN1S8gFxv
         5g71gHz7HEiBh3cH/JXm0mhUuVq5g4okJr9JCijPsbaVmUcjcKSFV/2sOvucfRC9uLI6
         bZ/yIsS00Y/NvTTb3r3nfzJPeYFmJrxVjzNaSeUpZIMo+Z/Dj340mRFSP1UckANcqJtr
         wGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763791954; x=1764396754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFsL45n41/Hy6LgeWFBOzqkc8C7/mLyLVAt81mYg+MU=;
        b=HPiftot7pkmQpCMWu2WfP/AvWVK2NwUqV57EGKy5NnrDkphiJZR6oUYkVmPMWipWxH
         RmZb4DB9Ktgn16GJHs9l1OPEp7crRPf7soQTXNRtgg4RxZ9zOCYLUEVieZst7V/3Vlbd
         TSxk8Rrbo2eYMd0720GF/Kyx9x37fJQ5oZ5Juna1syBwHYogLUHONEn1DApI6tOGC6ac
         6mpOvrcOjeiy8ec85UDlbaGJHU/9ElqNA8G+v3AnI01j8LLkiqZViX85PxOABAUVrG1v
         wyhgwDB6ryxiEd6GL0Mee+N99dTiTcVT2nMrqh45Q/LKVjtQP0jWygbFliH4XjHhm7Jw
         zo/A==
X-Gm-Message-State: AOJu0YwsCgq4taKsZyduzmox+1FuNPKNNGF4JBtyBzlPpGli4BTYzErJ
	WjHueBXIh9l4HX/gW9uFCjPl+3483hSRC60gYtel2UM4IeLXag9FXxo=
X-Gm-Gg: ASbGncug6Gad9FqPPqq0sVCI8R9E5s3YNxUHFQOb0wBzK4JjkGjYrVVRVej35ojIMf6
	YleT7WCNATQ9JiEeTfh1yNY4yfdE0Gm8FyFUw4jf6GWLxFH2cZDYXIzeJlWdBpWXLZltM/omYYw
	odRuT8nbxxrOLzKodUmJ3FjIgkhhALROuPL/9f/wXRsChcapoTbs9TULCruqyEGJrh+4UpKkO5Q
	fI/oY3W/MvHK82B6kQ1g4xWgrBMaOKj7t8LuLafGyVjT68l1WWEEve+EVcRJkBT06uD/3Jy5da9
	H9/0/vmmcWZ1vTvkoI3bq5DpC4lf2WvcZppLXNSoEYnEdFYiRKzZhTyKqCuSR4AInnyidm+SauN
	KOo0aTjNo5QyT0ZaefknikdQBTnFwHSatF7AjQP7TeClzt3soCY3cVmBEf0Gb/XOHY32JxsgSWv
	pQzKvsH8UwGxfm1w5pdcjOq09ZhZF9EefMwek8SmO7mP99Dv4=
X-Google-Smtp-Source: AGHT+IEELFfYPSuLnTswRTEk4MYgnZbFR5Ptbci+yj7Ijvh3VOfQijP8rAUNywzLB/VWxLh3vTqjGw==
X-Received: by 2002:a17:90b:180e:b0:340:bfcd:6af3 with SMTP id 98e67ed59e1d1-34733f546aamr5285531a91.33.1763791953971;
        Fri, 21 Nov 2025 22:12:33 -0800 (PST)
Received: from samee-VMware-Virtual-Platform.. ([2402:e280:3d9e:537:8ccb:550c:e84d:a5b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34726696ba5sm7287600a91.2.2025.11.21.22.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 22:12:33 -0800 (PST)
From: Sameeksha Sankpal <sameekshasankpal@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>,
	syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-core: fix use-after-free in dvb_device_open() error path
Date: Sat, 22 Nov 2025 11:42:25 +0530
Message-ID: <20251122061225.47432-1-sameekshasankpal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a slab-use-after-free in dvb_device_put() triggered when
opening a DVB device fails during the device-specific ->open() callback.

The root cause is a reference counting imbalance in dvb_device_open().
The code assigns a dvb_device pointer to file->private_data after calling
dvb_device_get(), but if the subsequent ->open() call fails, the error path
drops the reference with dvb_device_put() and returns an error.

However, the VFS layer will still call ->release() on the file, and
dvb_device_release() will call dvb_device_put() again on
file->private_data. Since the earlier put() already freed the device,
the release() path ends up operating on freed memory, leading to a
use-after-free.

Fix this by explicitly taking a reference for the file descriptor and
letting the ->release() method drop it, while the error path only drops
the reference acquired for the open logic. This ensures that the device
remains alive until VFS calls ->release(), regardless of ->open() failure.

Reported-by: syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d445a71e1c011b592c16
Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
---
 drivers/media/dvb-core/dvbdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716a..7fdc21a770a3 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -103,7 +103,8 @@ static int dvb_device_open(struct inode *inode, struct file *file)
 		new_fops = fops_get(dvbdev->fops);
 		if (!new_fops)
 			goto fail;
-		file->private_data = dvb_device_get(dvbdev);
+		dvb_device_get(dvbdev);
+		file->private_data = dvbdev;
 		replace_fops(file, new_fops);
 		if (file->f_op->open)
 			err = file->f_op->open(inode, file);
-- 
2.43.0


