Return-Path: <linux-media+bounces-28269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D7A621DA
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 00:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B25319C613A
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 23:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B481F5428;
	Fri, 14 Mar 2025 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0HHRgFp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691819B5A7
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 23:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995362; cv=none; b=V+EMHuher2w49voX76qxLip8pDfcCGNswQ2VZ8kmgAdk2dbD6cvd2ui/jARnoBtcLFD7TzteKjWwxDirBSbKIv810j3122GSWr6et0Ve9sDDtvQtR0R0k+B8ZX5pMahp79wd4V6Tf/3lo78B3m3+sjnFNmB1r2flSsFsJ6gOHqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995362; c=relaxed/simple;
	bh=ukK58TSZD1mgx2a2RMEtx4bXeUeR9Zv1iJTR2sL5N+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4xZd/toDJ+eEiSY9EEZGngpgZAEddMyKwkCRfApzhoJnGE6Nlj9ndmh1EihRzZga1ItaVUbMFc3FZslTsV2afmfAtp+nSNfMpJ58NB9C6kcrpsb4KJHuMBv82KZVHcfrW5fqJtt6+gO3Q1YuiHTVrwp7Z9IYUpnKaIl6kq/goI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0HHRgFp; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2aeada833so504548066b.0
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 16:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995359; x=1742600159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgtbrNjg3RxK7lHji+uLlEjbRwxwoaENC7vutfrY5Ak=;
        b=y0HHRgFp9ITHESaB4ouBNW8Xfi/ZIiKkYQdNHFArfAXZzr6wL/vt5XlaE5U7Fwgrfu
         OajSvnTwrqfwDM1hraI4xpRhCW2VR2S6/pmSn8jxIqTSLfN/i3QoASB49Trz+oMlqJLi
         nftnRdzWrrYnOHYXhSAz4vzrRiKcsZEisPyGTyRT5ExLssmjvAGopMp2FMH+kcwTn+rf
         tlHvqxUgrPW9Z09JCtbubsqEDE3NUehuJnn5fKs0pnna+4cl+1F+81oT7oNwHpOOX+To
         VnBOzYmNIT4IEDp1i4CBiGOjUDAJ+6iifmqGGSHHvtmiL6lmXPfRMl+DPjT5+Fc7hACT
         Ftrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995359; x=1742600159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgtbrNjg3RxK7lHji+uLlEjbRwxwoaENC7vutfrY5Ak=;
        b=fKoWajqEWF27BewBo83vWu6O1KpWOxvFa2x++05AUFsCh5aPaJf8PwVGf4oS+pQoDz
         Hp8v2/40eE8zqrKPBkcyR9KIabVQDxOxtLsFTm8sJIaT/g5RLJiguXuqhX5noX0aRtix
         6QKJyp99eqeKRLhDAPU54tC2pUlKZtLiXo6P5sttg9VMppQD4Qu2cTd6dKFxhE7jiCu4
         zwLtIDjcT+WmtdJHHIFvdnwrW2yi81P1My+drYP0rI4rFd7oImBcoQNII8wxPbXvCO0N
         UrpgTQBm8qrD9y6zdToSaG75Pc/5FHY2QE3jtHhizDpQHCQGGhk5tb0nrfXiFSP+zeps
         UpTg==
X-Gm-Message-State: AOJu0YwhZ/Pypxt+S79McGQLUPShYzCG17Z4YmEi+TOqpEFjbSDdDw62
	ByPU+wjbC6bGObUmTGm00RtN4sxBIMbaSsXp24Sf8/D+GP6UPMoc94UrgGCHUJ4=
X-Gm-Gg: ASbGncs+/9oUf+sZkdoarJU6WXTdZNeWlJKET6bR8CoAi6iK2yL8SGa+Jgij3dF8e3z
	dU8Bq1bta8oneZ96lQaR4n/nZeCMMP85e7SOWis0sHIwxYOTNqkwbPB121FghPgX1Fe6sdCJn5Q
	MbTHRSWDzS48vz0Jv65i3fCQIGBE29Bafbo8qe9FsfIsHqfD/JYWv5783qc4CSLHL0FbLpcYsHJ
	Axy0H9FQ2gl0js1pBHi9QP3cCIkbsJ/guMxNdETd+R+9s1xpaYFAAyrxTz3uTE0UF719LU5QSik
	xFtke2HU3Ei20v6rmHmgFhVjY/eAvZ9EjtmiFbydLW5hnWoXoyVD0TiC7BQMsYnIKJeiQc+amw/
	zoiot6SW+S1xfrSEDwo6xbkuPYJrYMo+TYYd0PedN6nLuJC/44uKquALFjKE+b+9BKY6u
X-Google-Smtp-Source: AGHT+IFioEfRk4etvKLgUi95Is5Nk227xfOzVnVRdw09cGLrCdUKOtOpJZvahOiRQ8jdUpxMj7pcgw==
X-Received: by 2002:a17:907:2ce2:b0:ac2:d5d3:2b77 with SMTP id a640c23a62f3a-ac331304749mr433254266b.8.1741995358560;
        Fri, 14 Mar 2025 16:35:58 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm284246966b.29.2025.03.14.16.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:35:57 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 23:35:54 +0000
Subject: [PATCH v2 1/7] media: qcom: camss: Add an id property to struct
 resources
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-1-d163d66fcc0d@linaro.org>
References: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
In-Reply-To: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

In various places in CAMSS we assume a linear set of declared devices
{csiphy0, csiphy1, csiphy2} which currently works for upstream SoCs but for
upcoming SoCs some of the SoC resources will result in a set such as
{csiphy0, csiphy2} which will break the naive for() loops we have.

Introduce an identity property which resource declarations can populate
hence facilitating non-linear resource naming.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 drivers/media/platform/qcom/camss/camss.c        | 41 +++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 86b98b37838e11d43d642c3f24e9a66acddabd03..ab91273303b9e3c67c4bcefe1e3a67e1a47bf14f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -81,6 +81,7 @@ struct csiphy_hw_ops {
 };
 
 struct csiphy_subdev_resources {
+	u8 id;
 	const struct csiphy_hw_ops *hw_ops;
 	const struct csiphy_formats *formats;
 };
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6791dfea91b13d584694a26599e24ca088dfc1ab..9da74da679a28070b101df06a8412e85efdcffcc 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -46,6 +46,7 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_2ph_1_0,
 			.formats = &csiphy_formats_8x16
 		}
@@ -62,6 +63,7 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_2ph_1_0,
 			.formats = &csiphy_formats_8x16
 		}
@@ -318,6 +320,7 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -334,6 +337,7 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -350,6 +354,7 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy2", "csiphy2_clk_mux" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -524,6 +529,7 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -542,6 +548,7 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -560,6 +567,7 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy2", "csiphy2_clk_mux" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -751,6 +759,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -768,6 +777,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -785,6 +795,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -935,6 +946,7 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -957,6 +969,7 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -979,6 +992,7 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1001,6 +1015,7 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1179,6 +1194,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1192,6 +1208,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1205,6 +1222,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1218,6 +1236,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1231,6 +1250,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy4" },
 		.interrupt = { "csiphy4" },
 		.csiphy = {
+			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1244,6 +1264,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy5" },
 		.interrupt = { "csiphy5" },
 		.csiphy = {
+			.id = 5,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1458,6 +1479,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1472,6 +1494,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1486,6 +1509,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1500,6 +1524,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1514,6 +1539,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy4" },
 		.interrupt = { "csiphy4" },
 		.csiphy = {
+			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1766,6 +1792,7 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1779,6 +1806,7 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1792,6 +1820,7 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1805,6 +1834,7 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2134,6 +2164,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2147,6 +2178,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2160,6 +2192,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2173,6 +2206,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2186,6 +2220,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy4" },
 		.interrupt = { "csiphy4" },
 		.csiphy = {
+			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2199,6 +2234,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy5" },
 		.interrupt = { "csiphy5" },
 		.csiphy = {
+			.id = 5,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2212,6 +2248,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy6" },
 		.interrupt = { "csiphy6" },
 		.csiphy = {
+			.id = 6,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2225,6 +2262,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy7" },
 		.interrupt = { "csiphy7" },
 		.csiphy = {
+			.id = 7,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2749,7 +2787,8 @@ static int camss_init_subdevices(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &res->csiphy_res[i], i);
+					     &res->csiphy_res[i],
+					     res->csiphy_res[i].csiphy.id);
 		if (ret < 0) {
 			dev_err(camss->dev,
 				"Failed to init csiphy%d sub-device: %d\n",

-- 
2.48.1


