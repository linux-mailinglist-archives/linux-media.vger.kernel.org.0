Return-Path: <linux-media+bounces-47610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B96C7CB8B
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 10:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 102CD3564EA
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 09:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7082F5A2E;
	Sat, 22 Nov 2025 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lm7vkIeH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B3F286422
	for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763803865; cv=none; b=QwQwBEJOmXz5KMeGf26ymw11W51dAhvYRs+FQAqGTETJM0Lf7+5rO1wWtDlBBW+L5NsQoUbXM8fab2hrrALlg6roPglahC/CXbalqS29FoA8hFEWDYIak6QvAqRgGZLxHzKIYav2Jy9O3TQvPas78jqmYdtKTRkEbbyvn9NowH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763803865; c=relaxed/simple;
	bh=Xjc/kJc3ZI0aZz6CtydBYDtDImK0fjANYmP+AbW/p3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDNLr1WXVGWtu8wc7fFhx8aiBgrgT4bXlHuARotBM0JRmMGMB6/01iC0TU9OeQsX/lPLraj4NakDrnh0oVrJPmu9PvDrhBeWLCy2fqkwAOPtV93DIfDvb1hRF1J9yIp6J4w/Wbniay0mWJitZdyV2VMGTsZUm3qUJ5IaVqEucUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lm7vkIeH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29812589890so33701875ad.3
        for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 01:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763803863; x=1764408663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC8ej5LFpEPbTrMIbcFonnVKGl+b1S9qqadw1svoUOA=;
        b=lm7vkIeH6rHBTNOYgzsPOXSfuKEtVTSD/GY2pixAMaimUt8XlsUC3EFr8oNKJuBTk+
         oMgw3zC6Gj+75MMrVId+MVbiE1B0dEAAtFuiJFHl2VUN1VBf2+xpMmGsMWflYiSU3Qsm
         /k6AWBD7os8+HfuyjKOvLZJbeDDy4HQmt/59Pv5Se6ZcjgO6YoAqp3nc1g53oq8lW4U9
         tAeop64CH5Mnek0Q0eLc16LZOVvqzd/AbaL7kG5S6ataB+/Rsv5IMves1FBdWDCWnO9x
         tc91l30qyjegcDkp/ugerjHj2Vkh9PGdF+hMYHFj0oRh9mSILJvtX2sjNxItqdvpyMzc
         txbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763803863; x=1764408663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC8ej5LFpEPbTrMIbcFonnVKGl+b1S9qqadw1svoUOA=;
        b=VT1nCBhad0raRnUC9to+S+miyuRdFvrzpyxNiJJg98pn4fswrQi/PTKdZKBbtAV8AL
         O6IzP4KmaTw6NfdjYQfXOy9/Aa7Y7G6cFTCM/Ss22+27P13//DHbXEaw3QWF3jO7bLj7
         Ud+NvN216NZatsxIs9YaJVjw8IVSR/YO4vVV3Sf3jLWr8BchGVGIbish9aLNwHLKnlpG
         /vj8QG8vp4CaNb8MC5q7UAhq7wt9QoOHNuSKVAhUKz0ffIlmtvb144HsO8i15hpyfHDp
         jfjZr8XxYF2IDzFWHOQG7MtrSUydZfn7nNWGNxOiZm6k7sz7N+XwoMX13BFKUvAC/CdV
         k41Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkmR+eCTgAr29olvbj1giSvBnnesUEo9o6RacZHHIQGwtJZRtznXUmggBGbTeiuQkg4wdl3ypztcI5Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3urHbuDg/mQxNTs0zrA2lYYLQYAp5QoMd2KI9KhzkkD+zsJyZ
	2xOmcm2hTIsGdiqjCMgjjoXtg2F4blxKo5QxTouzoZmBl7w0GVg1fd4=
X-Gm-Gg: ASbGnctjA+tDb8YGEuEbu2+BsKfZk2AoG3zOXxc84+1OvgXJ1QeKyVHiRL2/C0wyJVI
	hnSiFGWjYWF7Wisd8gh5bAJOY66WIBsYt++Z+KQYopu64LP+nm5+d9YuepskJ/UhPQV7x2HRUj/
	AHqyzDYOvFiJDIs/h+Y0CJc7RptxS52H0s9rQyddoSef+MFTyevbt5S1+TuR5nx5266SOdwdohd
	bddf3zX8fVd1lLyj1xU38caGx3r44B2/fPe+oHXHxgeZ4T0YQKnFsuLJNomBjoCZVGbOghKJoYV
	QGh0gr9FqzomYRKuaAcSMUzqVdtw8pQjW09N+rPWNfntxFP+pj/lkASJAglF+qlFyWTQZyU7HMJ
	Q8ewKoUejxD8F0ns8lxQDqLjOSHVfmzSL76ktzPWKdfJl6hBzrdsGBStIkdZck4pcX35GpYRDXO
	mokJ4Rbc1hEY2hN8CcTNgjYpeixP+Fu+d1yiRSMPT5C4c45Uk=
X-Google-Smtp-Source: AGHT+IEN4gNjFWI0PYTj4cSkNZRt6rJsykEMr5l2VBPcsyZCzjYQiDqT0h1Q7Noi20RHDR1SGaCQ0Q==
X-Received: by 2002:a17:903:290:b0:29a:5ce:b485 with SMTP id d9443c01a7336-29b6bf91339mr58226315ad.52.1763803862734;
        Sat, 22 Nov 2025 01:31:02 -0800 (PST)
Received: from samee-VMware-Virtual-Platform.. ([2402:e280:3d9e:537:8ccb:550c:e84d:a5b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111adasm80657165ad.18.2025.11.22.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 01:31:02 -0800 (PST)
From: Sameeksha Sankpal <sameekshasankpal@gmail.com>
To: mchehab@kernel.org
Cc: christophe.jaillet@wanadoo.fr,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>,
	syzbot+a83ee2dae0e6cc6cd3aa@syzkaller.appspotmail.com
Subject: [PATCH] media: dtv5100: fix buffer overflow in dtv5100_i2c_msg()
Date: Sat, 22 Nov 2025 15:00:56 +0530
Message-ID: <20251122093056.50774-1-sameekshasankpal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a field-spanning write where rlen (4096 bytes) is
copied into st->data, which is only 80 bytes in size. This causes a
buffer overflow and triggers KASAN warnings.

Clamp the copy size using min_t() to ensure we never write beyond the
bounds of st->data, and pass the clamped size to usb_control_msg().

This fixes the following syzbot report:
Reported-by: syzbot+a83ee2dae0e6cc6cd3aa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a83ee2dae0e6cc6cd3aa
Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
---
 drivers/media/usb/dvb-usb/dtv5100.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dtv5100.c b/drivers/media/usb/dvb-usb/dtv5100.c
index 3d85c6f7f6ec..df1ce9b49ecf 100644
--- a/drivers/media/usb/dvb-usb/dtv5100.c
+++ b/drivers/media/usb/dvb-usb/dtv5100.c
@@ -55,10 +55,13 @@ static int dtv5100_i2c_msg(struct dvb_usb_device *d, u8 addr,
 	}
 	index = (addr << 8) + wbuf[0];
 
-	memcpy(st->data, rbuf, rlen);
+	/* Prevent buffer overflow: st->data is 80 bytes */
+	size_t copy_len = min_t(size_t, rlen, sizeof(st->data));
+
+	memcpy(st->data, rbuf, copy_len);
 	msleep(1); /* avoid I2C errors */
 	return usb_control_msg(d->udev, pipe, request,
-			       type, value, index, st->data, rlen,
+			       type, value, index, st->data, copy_len,
 			       DTV5100_USB_TIMEOUT);
 }
 
-- 
2.43.0


