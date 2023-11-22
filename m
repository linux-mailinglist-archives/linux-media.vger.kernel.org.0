Return-Path: <linux-media+bounces-855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0D7F4C0F
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 17:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A73D1C209F0
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E7D4E62A;
	Wed, 22 Nov 2023 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3guqg/0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12983BC;
	Wed, 22 Nov 2023 08:13:17 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ce5e65ba37so7874745ad.1;
        Wed, 22 Nov 2023 08:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700669596; x=1701274396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IoVmD+VTOG0LFwMmHOyCBmPi9IZVbmlhZU/3heFnccs=;
        b=E3guqg/0SKWh/jx/NOQrZgjXrpT+l55oKAy9RXcBhk3bSEmFBkBkyRTqYTsiVwGy7p
         Vf7KhUfbr+uYCp1Avfx/pUgr4FCh0xkhEg1kx39/tUdCHqnSgJXLxomjyrYHTw4VPFPm
         mdIQPC2xKUrzzSxThLxTilteiRYY4CendxUjUkqXpG2YvwHZLqNIlh/AOw1U8oNvLNeV
         PhdadhqDjPQW7OO1Is5KL72RZglKjl3bzxtm/HsYbHdhXgnLvD3qCXtzXD4PX/eCT0Ty
         tXybwiuD4sqchkJ4TQWQbrAXomZ3z5NZfBaP6/4QnN0pj+VBOikic3lGEpvVR1gme0iV
         2iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700669596; x=1701274396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoVmD+VTOG0LFwMmHOyCBmPi9IZVbmlhZU/3heFnccs=;
        b=gS9yYPpxS4FXnIjnNv0R4k+dtf1IADN/TPUTQs4rN9ongILo2nFfTr7g0ULlLzSrtM
         LUOuaUcyipNXC2d0410go1dC+iyMpXDW1jtwMTDW+mwnRmVmcKZTPO1D20u31K19hoMv
         S1U2ADKSsLsT8ptohZIEubXAdwjeIMx/gw8qdMZu00yD9pKd6owRMAccZhPFyDjNZpGg
         AuX6LtgybFe362j+GFgdGynakntLG77Z6GncmZa479gBzxuziOBYBRmqDJijbFolo49E
         lWFqOnLFUe+Y72Or4zf8HQ55Gx6tf5BCHVw6WIvFE/CIizuheADtH2TOzwkYjAGyuFZH
         9l9w==
X-Gm-Message-State: AOJu0YyvTbjHpbF5la4NyYlJNsQEQcV55bgtOL3wEn8mob1vQdu/wNi0
	SOqiCFkVOoiImbR9BqAw9IAU1YgWFOmSahv6
X-Google-Smtp-Source: AGHT+IFsgXMoN1R9EYrpdelZJS8IU3T+gk7YiDhb8jEIJjGE8qV1tfyECMvAlXEdvK/FIqGa+Vqugw==
X-Received: by 2002:a17:902:c40f:b0:1cf:792d:93d3 with SMTP id k15-20020a170902c40f00b001cf792d93d3mr3120269plk.4.1700669596158;
        Wed, 22 Nov 2023 08:13:16 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:313d:d4a3:2c73:a19b:b896:ebbe])
        by smtp.gmail.com with ESMTPSA id jk21-20020a170903331500b001cc311ef152sm9875626plb.286.2023.11.22.08.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:13:15 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Phillip Potter <phil@philpotter.co.uk>
Subject: [PATCH V2] media: stk1160: Fixed high volume of stk1160_dbg messages
Date: Wed, 22 Nov 2023 21:43:04 +0530
Message-Id: <20231122161304.12434-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with dev_warn_ratelimited.

Suggested-by: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
v2:
Thanks for your suggestions Phillip. I have updated the TODO comment and 
used dev_warn_ratelimited for inclusion of kernel warning.

 drivers/media/usb/stk1160/stk1160-video.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index f5b75f380c19..a8e0d352a68c 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -105,6 +105,16 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	u8 *dst = buf->mem;
 	int remain;
 
+	/*
+	 * TODO: These stk1160_dbg are very spammy!
+	 * We should check why we are getting them.
+	 *
+	 * UPDATE: One of the reasons (the only one?) for getting these
+	 * is incorrect standard (mismatch between expected and configured).
+	 * So perhaps, we could add a counter for errors. When the counter
+	 * reaches some value, we simply stop streaming.
+	 */
+
 	len -= 4;
 	src += 4;
 
@@ -140,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/* Let the bug hunt begin! sanity checks! */
 	if (lencopy < 0) {
-		printk_ratelimited("copy skipped: negative lencopy\n");
+		dev_warn_ratelimited(dev, "copy skipped: negative lencopy\n");
 		return;
 	}
 
-- 
2.25.1


