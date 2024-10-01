Return-Path: <linux-media+bounces-18920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8053898BD32
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 15:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC756B23BA4
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7182319B586;
	Tue,  1 Oct 2024 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzZJuVWq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D872919AD94
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788558; cv=none; b=fREdoPTQ6SwwSxNR9NVvU27k/jFg5AKu5gVAyyDil2MhYBcjIA2RNNWEyVGphTh65NiG4ePKX9Uuju+/mMI4tgyEhgYBYjznxfZjm0l22DFKH57XGBGfVZGYBIBq14ISHprR1/OHQ4WH1cm6d1zeG3O+3p+v/kKcSPadvBLk2Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788558; c=relaxed/simple;
	bh=vTwVvG8iZlHzHza+YS67mEwp2zyunt+kNzBDYWtFYWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8Xcnk/oJoMRD0iw3cmb/5H9VvZKvxe2Iz6WZiOhFCo3j4I/3uF8Lkd8DL1Bw2YAJznctmqfK2GmniTwsinyGwgi236fUbe6ARCzm7t3SKYzBVXJn30Pu7CJZ8QzanBwCTxCnhriLRQ9tZ7t1Xz9eYhxyDAEbpW+GM31HEnvdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzZJuVWq; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso27887781fa.3
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 06:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727788555; x=1728393355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7nKjwcfTxwC0PwN6GrPgJAgBaaTNk6QSx4URpDS/gc=;
        b=EzZJuVWqe4dq4DSLEYafF1RDbQ37B8sYfE6VIFtY0ohWA2rjHysQraV9dT6lhN8s2n
         /VnDr/bpZ1KrsfO3+zNTQ3c25wGgnoCLlOgMlzPEcIzz8SYZ16b9OPl8HZKghlq50opV
         rUezgJdvDF7rAlC1+qY4sIh9EuC7BW/OgM/jCasHcSbjQCvaD9OyOkZWPyoP9fIfIqxI
         y+s3pBOryA9Hqunvh5wt+8VuNVtPix+A5CMWCMSQrnuvKd8docvJIdJBR7x2SXH+FHWY
         PXruVoTERxOIINowsrmctxlMbHnxA3+nh/wCEdqyvdXu9sxgh2Biop1AnGJk4oi2+CAd
         k1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788555; x=1728393355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7nKjwcfTxwC0PwN6GrPgJAgBaaTNk6QSx4URpDS/gc=;
        b=m0Qyk9N2kMBE6NCJchs2NxYW9Nc0rvwYd35/9X8E2nHqQhDKdj8v7CxzNGOo+4W17d
         bq99nWRGLGtQwSwrmlGCvtqFIf4NqjDpoS+DlTF5527v/lrOCAbPqwcx59cZxTYszzjM
         /iiPHkkT1maBUoY4QKDHDWVkdYfbcsFbKU1UqJFDnULf1+RFlXAA06TpC41Z5RmzdgqV
         7feK9E1iUnVJk71OXTfttwRBlWMpftWkV18MUrZPSFbNEG293++OrCSEvfbamjuGzv8k
         mlv0IMk42CcJGm8Xdi6FxsYsiga57Kt5BEu56Iymuwd78IkVZTlXDKF6klqZTm3VZnwL
         0YfQ==
X-Gm-Message-State: AOJu0YyRQhXm0WRxuNq3cjaQrJ+arvqxQ0Vr6qqGE2Wca/QV21V3kNWF
	MlQbO1ZmtNZs5nqS3zOls8YCZGzH9lje6F7+HMAp3Ixe8Sd9ZqelNDOcUKh1TNw=
X-Google-Smtp-Source: AGHT+IGnYlidwKx74FpXp9lnAfLCOvamYKKTjUzv/lAopPuJt0yTpxQDXRhkk1HEkGvbsHnREX5bKg==
X-Received: by 2002:a05:651c:54d:b0:2ef:2905:f36d with SMTP id 38308e7fff4ca-2f9d3e4966dmr118969421fa.16.1727788554878;
        Tue, 01 Oct 2024 06:15:54 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88248abf5sm6170875a12.77.2024.10.01.06.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:15:54 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 01 Oct 2024 14:15:49 +0100
Subject: [PATCH v2 1/4] media: ov08x40: Fix burst write sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-b4-master-24-11-25-ov08x40-v2-1-e478976b20c1@linaro.org>
References: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
In-Reply-To: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vTwVvG8iZlHzHza+YS67mEwp2zyunt+kNzBDYWtFYWc=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBm+/YH9ifjoLl/q8cwHxx2jKcu3VxWfPPCtvJZo
 /m1Al51PXiJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZvv2BwAKCRAicTuzoY3I
 OgtSD/9f5tponllpWndL3ew/MCurWWz4cP041CVQGSjiHOQLs4LBamTk9/p9sKU4bS/o4gjHUHg
 agBB5f9rog4wQrb6BFR167obvnUf4XWKFTuRBVxpvi+oIBqDITmlhL0BciQPDFGH5Gy/o93WiWO
 hV4kdU7APdnnB1xyYwPgZWdMfUOHBcw3P3MzGzpfyck6qn0cMg8GTDTbCfBot5vuQVW80vBgtU4
 FUWE5Y48bxjGayg9r8UDprRN3byOoZfT3JfCfXcv7ONWqwxJfh7dlXS9OQ2/lRBPMulFifZAU+t
 lzU1pBGeGFTfh6G4oN9LkI95RyvIv5Yq+uIYwKR6IzIoYJsmU0S1kDUQxf5hm4k1Tk91P4Us4f2
 SbO43XBmBJm1Jq7PySQES2XrXUaokra+Y7z5X1NAzhdqpzDOCm49V8blv1s85WoOc4moMuvFJ8c
 x+m3JlIPyByA1RXvVKwETAlyZxqrD1Ive4nbO9EJytCFY1Onq1bfOxFcO+rLZwADw3en4SHphAO
 f0a5rQVhjPAN4/0Bj4cR8g+qthITvOQSmL/eySByJfbUapjMNv16pylo44ttjKndKV3Q6+7m02z
 5B/cc+hfV/0kJglbUK55B5fy4e/biOlSWjfPlbHG4uyL4LtvX+FRZCIF0gnd0V5qadSIje0YsJX
 v8tM3xQHeUNLcXg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

It is necessary to account for I2C quirks in the burst mode path of this
driver. Not all I2C controllers can accept arbitrarily long writes and this
is represented in the quirks field of the adapter structure.

Prior to this patch the following error message is seen on a Qualcomm
X1E80100 CRD.

[   38.773524] i2c i2c-2: adapter quirk: msg too long (addr 0x0036, size 290, write)
[   38.781454] ov08x40 2-0036: Failed regs transferred: -95
[   38.787076] ov08x40 2-0036: ov08x40_start_streaming failed to set regs

Fix the error by breaking up the write sequence into the advertised maximum
write size of the quirks field if the quirks field is populated.

Fixes: 8f667d202384 ("media: ov08x40: Reduce start streaming time")
Cc: stable@vger.kernel.org # v6.9+
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e80100-crd
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov08x40.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 48df077522ad0bb2b5f64a6def8844c02af6a193..be25e45175b1322145dca428e845242d8fea2698 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1339,15 +1339,13 @@ static int ov08x40_read_reg(struct ov08x40 *ov08x,
 	return 0;
 }
 
-static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
-				   u16 last_reg,  u8 val)
+static int __ov08x40_burst_fill_regs(struct i2c_client *client, u16 first_reg,
+				     u16 last_reg, size_t num_regs, u8 val)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	struct i2c_msg msgs;
-	size_t i, num_regs;
+	size_t i;
 	int ret;
 
-	num_regs = last_reg - first_reg + 1;
 	msgs.addr = client->addr;
 	msgs.flags = 0;
 	msgs.len = 2 + num_regs;
@@ -1373,6 +1371,31 @@ static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
 	return 0;
 }
 
+static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
+				   u16 last_reg,  u8 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
+	size_t num_regs, num_write_regs;
+	int ret;
+
+	num_regs = last_reg - first_reg + 1;
+	num_write_regs = num_regs;
+
+	if (client->adapter->quirks && client->adapter->quirks->max_write_len)
+		num_write_regs = client->adapter->quirks->max_write_len - 2;
+
+	while (first_reg < last_reg) {
+		ret = __ov08x40_burst_fill_regs(client, first_reg, last_reg,
+						num_write_regs, val);
+		if (ret)
+			return ret;
+
+		first_reg += num_write_regs;
+	}
+
+	return 0;
+}
+
 /* Write registers up to 4 at a time */
 static int ov08x40_write_reg(struct ov08x40 *ov08x,
 			     u16 reg, u32 len, u32 __val)

-- 
2.46.2


