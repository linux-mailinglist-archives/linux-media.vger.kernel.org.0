Return-Path: <linux-media+bounces-19755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A519A0895
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 13:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8EF328AD92
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 11:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D264207A09;
	Wed, 16 Oct 2024 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIR5Tbfv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2FA1DAC9C;
	Wed, 16 Oct 2024 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729078718; cv=none; b=MhJjsruDxldldujd63FB6iAc7QanVdahzxJivNxAuJ0+6PGUG5kkqmMtL0MwvyU2c5FpJmLCeLRw6VSy0OQmpMlOLe8MCq04l6jr8aotnmQ1ykQ3gqEQK1bNc/UJHOYH2jlEOdlL8yW5PCvmG2PZHyUMEhCa6bjXkpgPdgDlex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729078718; c=relaxed/simple;
	bh=gV17pod08Wg5drrD6kGvzxvg7qLdWPcvL82rFOe5sRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnvqCc7agk3Bnyttw7AYg8zGRcZoK48ri8oAMhtqbBEs01i9aE36dG4zPN0wbZTflVuwnKWDLPBgh46VBPNSiwsTvfnTJVOLcJrSunlLKYwWyZKT9OaRJswDmrKi8ce/0SDC7jI1ZpMPFDHhZteruBGP7oeQRmp9Cj17dOKfUmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIR5Tbfv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7e9fd82f1a5so4282787a12.1;
        Wed, 16 Oct 2024 04:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729078716; x=1729683516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=leMIz+S2hdMoCIQxXqMQsph8MlFS4sT6v52ga1WkYdE=;
        b=VIR5TbfvkDKcqr12/OvQaLlAYK1cZCfJPQvkujujyCvVvhcG8X6kBD6rrgoQRJ/DJv
         xE7cnYDtC0AS5bSZSzU7krHaPVC/SxpHoLQCK2p+Dm//9q6tHYlNkDyWqNyZsTcMGwx7
         j6KJH6ceSXgaxvKNkENK7iqLErJ8YHlUtS9weWrji687dUvTBMPMnXZMrJBhnWV92Ndf
         GnLnKjhoMSLQQacWN14Izj24AO1rM2HUcOqZyw6fUlJKCn6UYLk/AULJ/IYcxA9F7M7Z
         NTctKQDAS9bIidod8hEO3Vfwfku+afO5rRCegcnDmOX4Hg5v10+eLl7bBP+6NQnlsb12
         rIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729078716; x=1729683516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leMIz+S2hdMoCIQxXqMQsph8MlFS4sT6v52ga1WkYdE=;
        b=o4qOkRUo9NhAqYUJCSh1OdFir6Wz5/oxdBIFTj6RWm4/SdyMUzMM4TfTJqfHrzNgQO
         k1gfuoUL+1u6PpDuhrkLVVW0TPFa7dOHjPCckdL64CRkwcwfPS7Vy96YDTN4lk84ZEMm
         ek3mQcWInj8VSMJvnr27/9+A9a0TgCX0kHDLJBdp2ELsDggsZJhnyKuSbNSdX2hw4yuh
         EHvO05x/A4UcTYzmnaJWWiqJnLqo4uAu00zNb/9egUEXFk+ai7ccFncDoHdJkx1l2XO9
         FBgpui/pcap3nWpXyWCstLxy4WSPmlghUKfcvZ5ALB1OvGbsToovrNtnr8OcKNvXVYYK
         kkNw==
X-Forwarded-Encrypted: i=1; AJvYcCVEgdwsBDtvGUhlEEekCZUkmdq9gx2pimy03sAOsIuUdqNxh4oKWC/V4O1tyw0lJTHuxfbrKz2jc6Z+cPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeedKOo+MUdVB6CUikEYPX63ELkSw+SzM2i6xSF4drA89wbC/v
	nGeIWSXs/D1DJcaSVUH+5gYnatM5vFAMgD+7J5zcgtvg5lSHwo/5IhGDFxYz
X-Google-Smtp-Source: AGHT+IFlTJEDuRawJmNHK9InnAgh+iHuDxeBCY8ZpQR+u0AgCari149kEVX4ecjZSxAciJY7lw309Q==
X-Received: by 2002:a05:6a20:e94:b0:1d9:ee1:3bfe with SMTP id adf61e73a8af0-1d90ee13cecmr2012870637.13.1729078715892;
        Wed, 16 Oct 2024 04:38:35 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71e77518a76sm2883040b3a.220.2024.10.16.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 04:38:35 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mohammed Anees <pvmohammedanees2003@gmail.com>
Subject: [PATCH] media: platform: mtk-mdp3: Remove unwanted else in mdp-cmdp-prepare()
Date: Wed, 16 Oct 2024 17:08:08 +0530
Message-ID: <20241016113808.4311-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since platform compatibility is already verified, the
additional else branch is unnecessary and will never
be executed. To fix, remove this else condition.

Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..168beed4155a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -624,14 +624,11 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 	if (ret)
 		goto err_free_cmd;
 
-	if (CFG_CHECK(MT8183, p_id)) {
+	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, param->config, num_components);
-	} else if (CFG_CHECK(MT8195, p_id)) {
+	else if (CFG_CHECK(MT8195, p_id))
 		num_comp = CFG_GET(MT8195, param->config, num_components);
-	} else {
-		ret = -EINVAL;
-		goto err_destroy_pkt;
-	}
+
 	comps = kcalloc(num_comp, sizeof(*comps), GFP_KERNEL);
 	if (!comps) {
 		ret = -ENOMEM;
-- 
2.47.0


