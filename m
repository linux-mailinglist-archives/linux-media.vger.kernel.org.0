Return-Path: <linux-media+bounces-62439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKlPMCnUDmo9CgYAu9opvQ
	(envelope-from <linux-media+bounces-62439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:45:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C87185A2939
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2477307EC11
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DE3379ED8;
	Thu, 21 May 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7Ysfwt9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AC377547
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355509; cv=none; b=LX6FcGN6pfcjqsx3YPY5FnhAhTbqrj2o0pp6vmV+CGOmCyFQgnHLaEjCeg+XphmMt0mAf0R6lOLdbBhIKH0HbYEEKlSashY6pWOuxo7bLBYVK1LxgmTa0mHkmaCa6xmSbnDwpUJCrxNcFbw0sbjwPsWKUlvA2sOSMLSQD/18z2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355509; c=relaxed/simple;
	bh=5/9C7suvplgEsPbQlJQ82cUD+wRYnGK2N6Wv+CSFAPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S63pHbuJaa5yeKlKB0r7niOuBvDLKaPnPZT9KlkBTpl4aa2VXcMWLHNML2I9AlBkd5Xfk3WXRpud+UjH4FjQj/6dk/LCRtBi2AWqFYjbYXBdKWYm7I1ZJytjWfnHw1pY+Vm4pLGHM/j4nFPQwwXUkYJfGGodvq3FFm0geVOw++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7Ysfwt9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e82c23840so47471555e9.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779355504; x=1779960304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaQcfmkaubMR1gaBpk2C5uvdfgB4RMMo7pbgwOu7Sk4=;
        b=T7Ysfwt9H6uwkJuCsOuBJavkOb27YP3ed4nRF3FbVZ7aTz10jTfZ0qe0X/3Hp5pAzU
         iWx+bGhr9L+6wPLpT1cDntXGv2lDpjVtnrpeOfgKodbqQShFbY7F8Z7EBIdFSzGImpvG
         YgJOywre7b8Ovp5HKhU0maw6WNO+dSc8RjCVZcnNhWdcXg6XMZdquUKPBIJ25iMTiiix
         x27OjHzG2dZOSZCaOcxeFqZ4ro9C7/GrY9JqbWEOv/l0AeaoMUW6CgyMFQ10brHjk8gS
         TL0YdXyzFyw+IBtlkDbEc0qsJxkYRL71VGPT+mozKZPU6krrXYPxbLzTIJ5ZBH7EsiIL
         WjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355504; x=1779960304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xaQcfmkaubMR1gaBpk2C5uvdfgB4RMMo7pbgwOu7Sk4=;
        b=X01g3uQ2lG7jBiobdPSflU4oxsz3CFEGYSMd+xdKJI52Mm2BHmhA3k0AJnfVT+/YWo
         ddNcAx9TClrbY0ECTc8EJvipnZASFg8I7rEwg45BvVqQickFXxtN0w4NQV9AMqDHnaAC
         fwnkO5c5IBIaZxpQHwwzHXTh3wyWT7VphQ96rNKHTIYU9FVaXanEjgjQaH1kHjld6nYC
         NMswb1aCQR2EApP/Nhxoe4kIZRV9JxjAxHNuNWz0kQwf4kajSmH61BE8RiN6/+2wCzsz
         xKK+aLEn8oFgDgPZPkFzqA0tDKQSw6lMhyBg47B7E3Z7dyVTIxy+BguygTvKzQyhoQ92
         RD8Q==
X-Gm-Message-State: AOJu0Yy4Y3O+bgeOTiy8L62hc5UmWmAA9A2Iu5i5L5rVmVPc0j9F/9JW
	pXdIOr1gAqBz5fy/pS6a1aKOPI3GmFdnTPCd7sGVoid8/aLnMzBktIjJ9DQR9Anwvjw=
X-Gm-Gg: Acq92OEpvZmumSYhON5hcQtukwahjf0wYiU1GJID2+jFEbplgdu3VPU5an91ugbI17/
	PPbye5C50rmJEaPJkhIOeYYHdyAGJZ1jpLZY1X+OYo6RuDfbzcDNKFK/9/1A+jKZIt9D5hl3qNp
	CYQpskOlNTP0kISTN7Zic1Iu5T+wXjYc1bwhs7OFE+9oILOfkMXY4soViCVPotUcdahi8c3coaG
	OXl6AQckUYFPk8XF2qrmuSqiPK2h3Q7oYKrALrD3ZDmUcC5LYUcd/uWGA1G8lfr1QTxllSy46kf
	7rDZqeb9z3RuZ5AzLsbQ5XwR4Swpm68UDuWrO5Z3gTR9h2F8myHhsfh+lZ2m9+AwFi17efBLI6s
	Wea28CSl/dacq4KSBP7lgDnBB1UP4AO6p1JlGPwRK4Kx0WlttYUXpKuiA/Of+gM/TSNg7DOV5ca
	PyygS5W9XoWy19cuRFkNWWrmRLeWCKsLS2HdOZa2UhE9HtdP80cBNInDs=
X-Received: by 2002:a05:600c:a383:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-490360bd3c6mr16091865e9.23.1779355504435;
        Thu, 21 May 2026 02:25:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm54945595e9.11.2026.05.21.02.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:25:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 11:24:58 +0200
Subject: [PATCH v4 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8x50-iris-10bit-decoding-v4-5-8ff8fce3f904@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5/9C7suvplgEsPbQlJQ82cUD+wRYnGK2N6Wv+CSFAPA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDs9q3hdbuw3CBEvtKL90P/F8+C2RLBsvIdzeaTzg
 PHFm/jKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag7PagAKCRB33NvayMhJ0VJ0D/
 9fo0MHvElrb3vnYjZeRGK6sOJ4wFkoN06Ld+CUJM9vi9v7Ky8DynnMIE7DXObGVS1OavtFgQDbiUgr
 057KhcWcwjeZWFGYCHFsnbQ4C8FZm+c7l6/oGB/BIB4fERlSipON7gMAEb1lbRV9wBTq2LD+M5wPiD
 txgC3swcgifhBP2vjH8gf/d6NSvDXLE5jm/Il9+5rfoMyHmVo8aUJqf8yEq8OCqe3gaI1RCKkSMdNe
 LRaQyvKB75OgA2VJ0x4tb1h2GZfuSmr9QcLDJLXf4xMABWfA7m9cp0ERj2xK/U8GeCAeslopY1isly
 b/nvc7Ui9wPtB9Wa1N5cca180VsgAiUtm1InA8q4v7/l1H32XER00YcswLMpn94D8wVFinaZvFbViG
 owZcGGJ40I/JrdYcW88bM1A1qFYF1wmO2P7y0FGHXgojQyaALlgh1wtJYYQZG0L095GopMfqpntvRs
 jFNejHp9qJZIYur9QG40v12Jr8noEFhwOudIAndkFOaSazzk7mn70TikJM7dZrN0G2kV8qwGgwt/HQ
 bVFS/pW82biZY3Wqoxr/x3M2nNyy0gFTtv1JM769a8z/rMubDS5DA/H6mUgDDOsouQO3O+im+7qL4x
 LflgMWojqfh2nTIEdy4WM9Yg+Zd4qi+TG3tYbmPjLkPBmro6wlik5vcAbgTg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62439-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C87185A2939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 10bit pixel format can be only used when the decoder identifies the
stream as decoding into 10bit pixel format buffers, so update the
find_format helper to filter the formats and only allow the proper
formats when setting or trying a capture format.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a108173be35..7595e21277b0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -17,6 +17,7 @@ struct iris_inst;
 
 #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
 #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
+#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
 #define CODED_FRAMES_PROGRESSIVE		0x0
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 3846d73b4d23..f1366a1865c1 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -105,6 +105,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	if (i == size || fmt[i].type != type)
 		return NULL;
 
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
+			return NULL;
+
+		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
+			return NULL;
+	}
+
 	return &fmt[i];
 }
 

-- 
2.34.1


