Return-Path: <linux-media+bounces-28288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 396AFA62D9E
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 14:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47327189D929
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 13:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFED1FCCFD;
	Sat, 15 Mar 2025 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BO/qv1CH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418981FCCF9
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742046042; cv=none; b=fXttMUsVK9ktTuzv2Pv211uHfOVZ+TARo59asUtUgEc4EhtaGXuPA0vDQXV+7axCDqVtpvP6i88EyCs+c13YpmqZ8Ebd6o+vlhTkL/CJcAtWGNtR7arqYqeST1XsxbURH6HVsPzfMdk/D+YsYtbiBQJ1RXHQGNB+G2rnslifNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742046042; c=relaxed/simple;
	bh=E8jocHu5wWsMxvcoCmPKc+TA3pYPbkfWJvR/i7m4LdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHtpLGX9OI4/ID84pIEy7OcHlR0SGuzh4yATLCrzM9vphsc3CPS7i6MgAHzEitfLOQyuhlwPzenRFf789IFMy1eTcHPX3vIrEmnazKTJK2ANqymZCt1xlKI3U/5SuyXRLNdkqAjyRnsSK8cWSVkpyG3twKsMXfGuIZ5t8xT7UyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BO/qv1CH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so5232526a12.1
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 06:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742046038; x=1742650838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD11mzJFRq6d0T7pDKGqoqCjyj5QqJtchVCr8n4C52w=;
        b=BO/qv1CHEC/eE/AHEEbZSxgFTuUL2vufOZJ0SEjYaqp4pKN90u9NAD/K33Xe6WBn0c
         S93C1zNuhM24bDxgud8C3EpMMNKVsJu3LAJXcJ0iwnSrw05fTn3004e+STblm/qM5tBp
         3SF+pmeImwwvWDj7SzHdmytIDVAcBJsHkH0MHnMckUfUTtrj9Unpc9AtlR5tCucRWdEq
         PAwAkxqDfIcxsKq8WRlKDO+tl1GrBMgxtCveO9Xkm1MpqiD8xdoWbay2G3AyYw8E+cf2
         Et1o0XBRYVGEZ113iZoAaY8MG3/Nk2gA9Vv4TTDOrdL946GyZJz40tCZv2PRYGYr3CX/
         +tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742046038; x=1742650838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RD11mzJFRq6d0T7pDKGqoqCjyj5QqJtchVCr8n4C52w=;
        b=sUJGWwaIq4tdZeHTrtyVv0PqyKAkkTqr85iXbm49rwiCN+RldiOEvbk44F0Ap9kfGw
         +Xr4h2NHd2msREET+isrfU8nQjtyxzujlfwYeFOrrJ2y2Rv3/DepBJxcxBZG/ZBiv6gJ
         ItZIavmGWD+D/1FsrgUIoQOYAj4mUytsa6zo56sXNYKkWX9xaWPObAbTShvz0Mq/Uf5Z
         /hJkc6a6CjPUge5LYKasWJFFP4iETs+1Nrpst+kyFLIw9EJJRtfdbZpgFmSSeiSn6Z2W
         Ic7p9OQBZ9HNltRd/7KmHMdD/r2mP+8UUUvkk/DI/Gj0lz+/GutJ/sj39pKB2+G3l+DC
         GiFw==
X-Forwarded-Encrypted: i=1; AJvYcCUjD5eOU8/GuR69wisAdUsPqmos36TrXvg5NVq3QazRReRUxQlcMIW0UK3AMwp+cec7O3+dmySgcS0wEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPmOFno9qNonN3SFlSdid2y5u9Je7p3oW1/5gUOI2xhDE5NMvx
	/kauoN/fexKbnCu9NsEv2/RuG0xG2AjaX2U7sX4RczyBDiCv0hdUViYlwdXHa7updR6yxT4KPFU
	ra3Nw/g==
X-Gm-Gg: ASbGnct0EPMYvTGgtWB8093EZnRlXDUsrusfPjRw+BBJkLrApaL8xdNEMYI4GzlhhJG
	4krh1NCjVT8UF2K/9W5OucD4w6YyykmjUZP4GUrskjDCpgivdiHey1RIM0GNjbb8c4L3wwXUKWm
	snzNm92TSBdTNLBh366BvNg5DkfOvzM7QUVu2eFxNjWsnhPAnHSBlfYbydskkg6C15JA03/SZWr
	8RY1A4Wc0mctT3UftXmHlDyEfq1Y4gu7u5qUxpCEZE4LpoFeII0xppuot3vk7nqEtA56sTkvU9o
	vRYdgn4Dr8rCeUqNGlRPaDpcpaRY0YAUDSgjJ9MuYKUTExK9j+tSUWxiZkwZ+/b9jdq+HhRij4c
	FYXssWKIz0KRFYkDMokoFOy4PMK+SgOAfYcJqTo/gdppBYq5IS92IJh1ZMkbAGT9jQpIMQoxKpA
	==
X-Google-Smtp-Source: AGHT+IF94uOzzvBdoGEe8hOCEMQD4gwFpdgpulBXsezhA1kwIkTQSRXsrr++z9Inem7QZTmL2Bzr1w==
X-Received: by 2002:a05:6402:50d0:b0:5e4:b66f:880e with SMTP id 4fb4d7f45d1cf-5e89f24f5e8mr4840870a12.7.1742046038528;
        Sat, 15 Mar 2025 06:40:38 -0700 (PDT)
Received: from localhost.localdomain (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b009fsm3378824a12.34.2025.03.15.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 06:40:37 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com,
	heimir.sverrisson@gmail.com,
	linux-media@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com,
	ingvar@redpill-linpro.com,
	hao.yao@intel.com,
	mchehab@kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 4/4] media: i2c: ov02c10: Add OF probe support
Date: Sat, 15 Mar 2025 13:40:09 +0000
Message-ID: <20250315134009.157132-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315134009.157132-1-bryan.odonoghue@linaro.org>
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Supply OF probe matching table and enumeration structure hook.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02c10.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index d3dc614a3c01..094651228763 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -1004,11 +1004,18 @@ static const struct acpi_device_id ov02c10_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
 #endif
 
+static const struct of_device_id ov02c10_of_match[] = {
+	{ .compatible = "ovti,ov02c10" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov02c10_of_match);
+
 static struct i2c_driver ov02c10_i2c_driver = {
 	.driver = {
 		.name = "ov02c10",
 		.pm = pm_sleep_ptr(&ov02c10_pm_ops),
 		.acpi_match_table = ACPI_PTR(ov02c10_acpi_ids),
+		.of_match_table = ov02c10_of_match,
 	},
 	.probe = ov02c10_probe,
 	.remove = ov02c10_remove,
-- 
2.48.1


