Return-Path: <linux-media+bounces-2981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA6581DB2A
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 16:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBAB31C214C7
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 15:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB09FC14;
	Sun, 24 Dec 2023 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H8tRSTo1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE83DDDD
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5534dcfdd61so5706755a12.0
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 07:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432675; x=1704037475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/bJ3x7ddMTFAEm0aZqxS1jFQ1MSMuIev3UEL4KwkkM=;
        b=H8tRSTo1IHSxPKRu2n7clvIT9XNCZvWnBrfdjRyk9MV6lDYlpJjvxoPCOT1DQfVI5D
         7ut33XCZ6ZJoFAnadfy+Tav2R6scOGsRQ2KT2MP9fS15PTDHpiFdmukII4UPNj9GJTlI
         bQKjAtxIpuLOA1decMKYKdGoIVAuwBMDeTFVIAquutquRYwh8bn5KPUKR/qBNzPlxWc2
         uxpO1FB8zc6G9QNWyiS276AnlbX92+d9RYnois/sWQz5hFRf9VI0ui9tivqcpd20M18m
         QxxyRtqwtAw6HBcwl4oAcZpce8wTbm4i3BNcIP996JuJJxd/fYEpZjwxpcO/wS0+Kth6
         UFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432675; x=1704037475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/bJ3x7ddMTFAEm0aZqxS1jFQ1MSMuIev3UEL4KwkkM=;
        b=sgSjRWmlN49PdJpUGmbQMqzwmcb1IG7Aoz3PKaEleeFu5+BbqNZ7izFxhGanFm6Xa0
         +PO4k6NR3xSO+OB/3/ZqTMkJnsNogHMDSVR/Mz31jNCO951ZwZ5nq/FSh4sF5+OIqYL5
         +GlnB4gFimO7+DQ7mqVR67q5VwTqxhneHsU4liINgqc/5ES/I4s+nWO4son8VezuCtTp
         VpNiBlq8cAyDGEhTotXMblVchPiQPvRjZpHCNPc4P+8tMYEI6jJT6gC/Gt5iCKi/dWOv
         CDU8TZ32ggEg7W/4zJqor/9UrT2Hw/ly597E1qSyed0g/cuYEbMZTVN+UbaBx5+1Ug8Z
         SprA==
X-Gm-Message-State: AOJu0Yz58bcfUvMbazY731U7r9pliXzjtZQfpPYdC8uaDKglJmRlKm6l
	fQfigIbJhr2p/xKsQh+RPNxG1NyeVXjCHQ==
X-Google-Smtp-Source: AGHT+IFMytQlUGsUHr2lW0AyF5yYtyjd47XaMcqL33aA0ICawVecLpDO9lpGweLKnEUzEiLSvrTzLw==
X-Received: by 2002:a17:906:947:b0:a23:5939:759e with SMTP id j7-20020a170906094700b00a235939759emr4476446ejd.26.1703432674625;
        Sun, 24 Dec 2023 07:44:34 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:03 +0100
Subject: [PATCH 04/15] media: s5p-mfc: constify fw_name strings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-4-a3b246470fe4@linaro.org>
References: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
In-Reply-To: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tO3hUFAQxvu9Nowg3KG0FpRXiKXEajVYfAhfC6NTrBs=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHR3/m9xlHNEWUuIN7445o6ljNQikRjBXqCP
 jBYeuSSJCaJAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhR0RAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PXs34P/1LyaSaTZfYQ+m9JIOPVFI7kTxlPEOsIc6leETIFxYTpnj8
 bdblNXLebn//vRhCMsFHxb6igV3W0i9r0i+eQr1w6NyW5U0oQzJkCxaVqJAGpn2UBV/P6Ic7XSG
 Hb/7lfUUw6eRPAjN9UHkY2rGdXgFZzo6Ukj6wabijN3QWo4csDd67xE7QSAThvdem24/ZidjeGG
 90uYwu6UEwOYPPsFCh0U/rQ2NG8zg3FTPQbxjmXeV5JfKx+jzR+rMOeNW/4aKx4C2PXZmukEagZ
 KJIoPweguMie3wjaGdpaWJOvgqALLdQq8dT3kdVgYKWyboU5x0a6hblhwjtXpok187ccrU5HBMU
 4Zcy6tywsnQwOQU50/DpnxrTsm7kQQTZRqDx14rMu+x+WfV6lqxwE8J10Qp5S2LJK2+8z47wEgh
 gtNqz3G5Dp8OgGpX0zLjGZlFR4jfAbWPxTpCeVcxMWGLnwqrwCOOHKQxennJMwPk1hqpeffvZLk
 M1Sis/KKadAPfRLSsXzmu0Grp6liuxgTtYzWgbtQlpz7VUU6z0ETCxrkKcXBfTbonbmJlsBY8Y4
 EPb8K7TqBZ3V1bzzIABU12x9+MAP7ocqhC37C7Asu9NGKS4k5LnqKmr2qnS1HGocehDjWUy97or
 RSNfsWkUqYy8aH2yK6s4msFT7OdTvE5F/jt4b
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Constify stored pointers to firmware names for code safety.  These are
not modified by the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index 5304f42c8c72..f33a755327ef 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -227,7 +227,7 @@ struct s5p_mfc_variant {
 	unsigned int port_num;
 	u32 version_bit;
 	struct s5p_mfc_buf_size *buf_size;
-	char	*fw_name[MFC_FW_MAX_VERSIONS];
+	const char	*fw_name[MFC_FW_MAX_VERSIONS];
 	const char	*clk_names[MFC_MAX_CLOCKS];
 	int		num_clocks;
 	bool		use_clock_gating;

-- 
2.34.1


