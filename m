Return-Path: <linux-media+bounces-33105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E18EAC0AB2
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 238C84A4FF5
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 11:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698C028A1F9;
	Thu, 22 May 2025 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAgWslIJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C171C32;
	Thu, 22 May 2025 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747913729; cv=none; b=rcqpOXj04Gue9OXwNnmwMyDPpvHPPGAaQMoCCG5V9B0NbcmYEHYphQ7f4Hjt5s1IvfP1EUgnKLB800AHnAjGRCgjb4KuBKSmptw+oTvW6GfgmDzzqB5IKlr/dsuCK9r6sntRI50+cbKrA5X5+X8rDdFTJpKDNxwirVjuWFsKHqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747913729; c=relaxed/simple;
	bh=1mi/NDU0aKbsozc3jYCQAHLcdyjrMvttxybx/KU1JuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Aai0jTozsaPTyfmjeeUmeUc82Yi1M5F33OIztjSB40luvJ6Wc8digiWn0h5G6nl6VkI+SEyVgX+n9Gqz6PbkRNqUtNCMOI8fl3g4r9DalS5aYI6JFKglb6LO4eQwoX+uCCOTvr2tj0ERB7+vxarwUUz6D+oVr4mOw2Q46Dqh8Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAgWslIJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so48539275e9.2;
        Thu, 22 May 2025 04:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747913726; x=1748518526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLr3eAhXdgkzpChTY6FdqlkPivT9WEeZ1GLLVzMKFQs=;
        b=CAgWslIJvm38lfrRFtN2RleYHaixCdf4HXDUlHILzes4k/+qlOpmDGgPx3WWKr/JpE
         ERCX998o6jUHMdqLymy6MimY5Bo/geyzpPU7dBAtP3VNCXw98HdyQPt895QtuW2DnFtz
         +YobyOqmtGOmONpDXSimnp96w3zh6EUl11fAdkywNj5MEVMfz5MS88Znhpy9QGoxc6zY
         mvd3Ku/zSMpLJhaTO69iF6etQNAsmXWaJDJIsUpOKu0zL2HHR5ovhYCH7sFKVolqNbc5
         O6y8AGVvQBOLsPWr7zPArFfB46V4Q5JbFj2VXGrTWZvroWX/v1cLlgEhkrZcl3kcftjU
         Z/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747913726; x=1748518526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLr3eAhXdgkzpChTY6FdqlkPivT9WEeZ1GLLVzMKFQs=;
        b=fEdnB7RNkAKmegIW+l/Wv06Mpf4NnskN76PYErLBu4/5ASyxhfo4+r2cn7+9qdllr5
         hROTTV5w7aYmjWs3Arwj1hvYil+z7u2JWGoT4mVYprqekRuBwi3vo1fyZgM58eC9jE6T
         FOfOWdVangFYozKDTkRz1EGhav1s/enCwfkA88j2AAr23ZRoUoKWmBVJNoaZq+VBmqYw
         LeEiRhijYKitj4Pk1fKv5Rv+vtBikNW5hHQQ+Y0v5qKtSvE05mgfYtjhmersqjHAtjKE
         FWclMei2YiUhEe96PUrrHoTt0koKzBsjx4JR+d8lSkHHsx+1IN6MQ3o2L+MdQtpQJAEt
         dYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC4OlRmKle5ZknDPZ0qM8B06RQatPtuSJ+y9e9QavT4igCbQ0cvHEYdJQBDvpm8Y9v3lipvHG24ETyrVY=@vger.kernel.org, AJvYcCW53/hX2AKdqmE1dcb/ep9ldsfSgaahcTYuIjDcQOakzEcc/xkQ3JJENDrxExKP6e6C3qj4yoGEUfV17P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhrF071p0yco9CzKEXOBA1waOM0sSAWis6SUaQ6z8bi97ovi0F
	PKMwcUB/N3N5N2gIzVrHp+o4WvOrJZHbGq+fJXsBB77FhBD/WMM5gZII
X-Gm-Gg: ASbGncsoewMxPMeYcV1V/CnjFPszAeGZmF5JjaOZI1UQoWnGgqP10fXJYqbxv+muRbD
	c/+qk1cMnRjQkFQu5+jlaOAgwwHS3+PNz61b+m+B9c53LOQjViWAHsfuyaZxCQomY26t1rR9iy1
	KJss630lXroZLxKvhxgnIycrgQtE0hA1c8DZfm9/lIiugtxMQevYLUZ3zL33AvcIxAptTPzAH3a
	gSJElTCNpu/easedgjI00NucIWXJDFqt4BPMNQtpTuw0lSwi6NQlGxHduQdj9rJ3i/d6qKYcdlU
	/kmN4svp/MrUCA2CU4vq0mXuiuZSoVf3BXCNnq0QsW6xT+TUhO4VxIRcVPq9
X-Google-Smtp-Source: AGHT+IG35j29cID0hRVTZF2DdCxFefjSKCTDWxo9pbHWIK560K/Y/owNj1t5S4/NC4Dnby5ITiXM7A==
X-Received: by 2002:a05:600c:37c5:b0:442:e9eb:cb9e with SMTP id 5b1f17b1804b1-442fd66f0cfmr223193225e9.26.1747913726173;
        Thu, 22 May 2025 04:35:26 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f38142aasm99630045e9.27.2025.05.22.04.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:35:25 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: dvb-frontends: cxd2880: Fix spelling mistake "ts_clk_manaul_on" -> "ts_clk_manual_on"
Date: Thu, 22 May 2025 12:35:15 +0100
Message-ID: <20250522113515.2764759-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in variable ts_clk_manaul_on. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c
index 0a1f3899d72c..9506d55eb83b 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c
@@ -1709,7 +1709,7 @@ static int set_ts_clk_mode_and_freq(struct cxd2880_tnrdmd *tnr_dmd,
 	struct cxd2880_tnrdmd_ts_clk_cfg ts_clk_cfg;
 	u8 ts_rate_ctrl_off = 0;
 	u8 ts_in_off = 0;
-	u8 ts_clk_manaul_on = 0;
+	u8 ts_clk_manual_on = 0;
 	u8 data = 0;
 
 	static const struct cxd2880_tnrdmd_ts_clk_cfg srl_ts_clk_stgs[2][2] = {
@@ -1742,7 +1742,7 @@ static int set_ts_clk_mode_and_freq(struct cxd2880_tnrdmd *tnr_dmd,
 	}
 
 	if (tnr_dmd->ts_byte_clk_manual_setting) {
-		ts_clk_manaul_on = 1;
+		ts_clk_manual_on = 1;
 		ts_rate_ctrl_off = 0;
 	}
 
@@ -1760,7 +1760,7 @@ static int set_ts_clk_mode_and_freq(struct cxd2880_tnrdmd *tnr_dmd,
 
 	ret = cxd2880_io_set_reg_bits(tnr_dmd->io,
 				      CXD2880_IO_TGT_DMD,
-				      0xda, ts_clk_manaul_on, 0x01);
+				      0xda, ts_clk_manual_on, 0x01);
 	if (ret)
 		return ret;
 
-- 
2.49.0


