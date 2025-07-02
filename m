Return-Path: <linux-media+bounces-36592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252EAF59F0
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BABBF3A6EE8
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EF1281355;
	Wed,  2 Jul 2025 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejB0/v7S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C338E281370
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463729; cv=none; b=aVSns9tb1BGW99ZQCbXYKlt0NH5FxcIECwthi2kRcueugjLQ9e9TjhcnBxlmMUSHeKpWV0ZA8bAAb8HVcJLrqeYldCS2uIqzJBkyK2WjKZwXEyatbHy4fqcj0d4QGxBf2NmGlt2qj51OK6FF69VEzHzvbFNc17lHCsQ+n0vfzu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463729; c=relaxed/simple;
	bh=8jJX77fMwFm/xUmCW0r+3HoujzaMaMtZTgzsXj/A7Do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ouce1wKRygJwE4np5lwjkmSxhXF6ypn7TcjCdNxlfyO7+lbKXfic26PojUxUMYXfV1synijr+BKDaxuG+kNVHUnPewlhk6LlVqy4QOzr0YXpjUsjJXxBQIiqq1Lq+d8fN/jlURcLzGkXAh01ER7Dlcql2ZBcUZRh/mBhzyMcQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ejB0/v7S; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453486940fdso2839775e9.1
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751463726; x=1752068526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxbw21eCjvigwTkxmQkjUBGSZ6O2pE8KYrbWd2bLkaM=;
        b=ejB0/v7S+X6O9bvUs71USS3sU9mcRalgBkEDUcePST1JR5JhhuuIJOP96QILKmL3QK
         LqnIuXwNuvfVzmrehO/JuhRvOprouBgKcj7wIXLweTITmcRJqJLaLMSCErC42Tev1U4R
         9+AE3oVhLek2YzREQPfH65NLyZz3hGjDQdbxNRCsGvexRQg/CWvyYdMFHAIUCX5ZGWXL
         kYFtvx6Wel1Mc2ReoR8eRHVMOnfh4iabJ/m62CruHUhynVfgVXQ/GqR3rCjuXvxzx06y
         H9CjumJIaho6yDUflLazJFD8FO0I5MaX9e/64XnTJpHAvGkB7iy15WGx7Kbgf+dLpuu8
         8u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463726; x=1752068526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxbw21eCjvigwTkxmQkjUBGSZ6O2pE8KYrbWd2bLkaM=;
        b=u5FrPxhNC9WBT0mNJstkW7Z/Yw4wZbc5sdbOVAmTWfnoaywovAvNbDluMif+KZa6wQ
         XTosH0v7cwuxW6y4f8vQsiDb6MuAQWfop3E56bH4tRaNRueabShKfHkR2y6MeyKavsoy
         /EtTBNEP8JUktwdFkH8RJPROLGV9scK6V8gE3Ev+ClUN50F6MAjhfq1UnI8CfwvQal/E
         7HQuJJGGZpujaTd1aNK1OTZyN/JSZtveQXKkL+jczKYJ1rSM5MT9+sQRCURdbOGfdACo
         VL7hq3yPCLZIqbrKdLcHHUW2lP2pzdcbWoJ5/vYdc9xdmKHvDkxyaB9+znzp2XEHOo9t
         XY4w==
X-Forwarded-Encrypted: i=1; AJvYcCUNEzDEnJk4W4TcXWKHokFYhKrP1zcHB7oRM/jw7YFJtpCKK6zHcVZeZfv/sdAGIBb49i8hRFrgggNS4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJiU3QDovdWqLQvaAcDTNeB7cTucZLwcDz3gHj5ZFVwCVMsK1Y
	cEmps9cX95hgxWqjceppHNxe4QnNRYCkQhigs1RLfP4F5kBT9yQtX7PDNbFqzuXC4SM=
X-Gm-Gg: ASbGnctOlmL9AjF6zrW/SpAqTyqxO+zsk1FVFkVTGSmYcWoCApqssGx8ar1CdCXKfGV
	fXNonfSoevfwEje9C0RSGF73QqxdLqd8ztqmRWAr5XvCUxLpJgfvPRWT8h/RrGlHx467PconWJO
	lSYmpjZGlV3NO87viEWu+g9rFOoFNF+U29prTRUUqmOXWV8Fxzat0H0+mWeFozAbRRANq9WLsip
	XqE2empsT/qj2Z10BF5Pw5P+2w2YafWiww+8YqJrIeB/QAwuzKVmO1+JqPDatrqPpVHvlB5mzsS
	1TozSKnOKZSrZnj/0gzZOHYKRsz1RFAvPlqB/lH9nd8MwmmQI6/zYwvpdxwpNBfwY712Q7FcRX8
	=
X-Google-Smtp-Source: AGHT+IGv3cNHYzlxR8z+2wi0VwPFwKxWuKoNTeM+XJGhBONAP5AO5viuU1uDZTJIBZ8gfcjyNdNDvQ==
X-Received: by 2002:a05:600c:c11a:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-454a37325b6mr9016165e9.9.1751463725959;
        Wed, 02 Jul 2025 06:42:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a85ab932sm34501915e9.0.2025.07.02.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:42:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] media: iris: Call correct power off callback in cleanup path
Date: Wed,  2 Jul 2025 15:41:58 +0200
Message-ID: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=8jJX77fMwFm/xUmCW0r+3HoujzaMaMtZTgzsXj/A7Do=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoZTcmIxPfZouqTdHL40xqaJC9jb8l0tBbdCO9d
 MDDmwLZIWmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGU3JgAKCRDBN2bmhouD
 1380EACX+G21CH2i8gcOLwT48jxrhqbSIa1xmnGJTgN9en0VFj2iquKAvw8Mi14okHzwJ6tbnjS
 xGE/38rchqAyjmN8PApxTcPwOD4hvDBqoQlpou2p4JhygUmN7HINLO7yfaUfd8IQ8V+xe7474zS
 ZbRMvfWtMPkpqqwYLPNeLrYjvmpsDcy7KjhRAsTROAHjK5DQwvuiiKMX8UzhdoHwcGYoXuoryWo
 A5X3/IrQKcHuUljUqOxZZ5utjjY3F9ZAxPvMm/yD0yP1fiTMEgCVt/mvAK1b8g4zIVw0mHmifJ8
 2ciQWA7TJw0F6uG+8q1MX2WvM3sQYm3PMF1z4DnksU4OaL+9lTDk1BBnTvVCglP+Ksl6oAJs3JY
 CEHseCXtyMmvA4aUrw21u8ycY3wMpsdti/F5KXk16lGwAPRAWKUH9SwNdYlPJNSy1Zt0+/2SpHF
 fL97svpN7IWk4jTL79jbGr10ZDVv5fPDQSmSxpGsSW7C37+CE6DAuTPIC0ipvsqwIhz+zc/dWu7
 nIX12Xu9xsID33ZgylyrRKkREbmn2m+IAcubA1TjhV7rcxmE+2uriwI0kThNik+oGYO/LwikPHm
 z3F8KcwvqBKSrrmJlpv8cv2zM3DnbEQGWw574YNFZX+AGgqh4+Mg+JtoZ1bFbbMTPk/B1pSQCSY ELndQ2z1yTLoYyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver implements different callbacks for the power off controller
(.power_off_controller):

 - iris_vpu_power_off_controller,
 - iris_vpu33_power_off_controller,

The generic wrapper for handling power off - iris_vpu_power_off() -
calls them via 'iris_platform_data->vpu_ops', so shall the cleanup code
in iris_vpu_power_on().

This makes also sense if looking at caller of iris_vpu_power_on(), which
unwinds also with the wrapper calling respective platfortm code (unwinds
with iris_vpu_power_off()).

Otherwise power off sequence on the newer VPU3.3 in error path is not
complete.

Fixes: c69df5de4ac3 ("media: platform: qcom/iris: add power_off_controller to vpu_ops")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 268e45acaa7c..42a7c53ce48e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -359,7 +359,7 @@ int iris_vpu_power_on(struct iris_core *core)
 	return 0;
 
 err_power_off_ctrl:
-	iris_vpu_power_off_controller(core);
+	core->iris_platform_data->vpu_ops->power_off_controller(core);
 err_unvote_icc:
 	iris_unset_icc_bw(core);
 err:
-- 
2.43.0


