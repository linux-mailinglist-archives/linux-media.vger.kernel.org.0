Return-Path: <linux-media+bounces-19808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D68B19A2E4E
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 22:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73D1C1F23145
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 20:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849D51D130F;
	Thu, 17 Oct 2024 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoZl81wB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98798144D21;
	Thu, 17 Oct 2024 20:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729196349; cv=none; b=jD0CYX1cFmu0pTzQZSqmWjkVA60XR9vYiR7IQGsN+m4Ry/rar4P47FVm2ySbyPL1jUamZN7jwX0mIFZmZ0hBFJQHFCLOeFvA/FkAGv9SmCDFNbKSfzrP2c6zZYYhANha/3ieG/NaiQq6UFCJBS6yIg9p+B5siTa6o4s/A9m74WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729196349; c=relaxed/simple;
	bh=s4LtUi5qDb8ZUZ23MjLKciF1AK1q2vZlh9Dvnsh8y7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIOQPDLgM95Tov9tSXqflIq++8cWUP8v+2fmo89RVaHGGSFxVroKPBEOB6hm8KjPte/OQ4Ek4FuBhAIQezjDnvv8oaMRaBh1fk9LyADxDdwkE2N3hPYGCzHr3n1Tw3E0Qal0f43masRGcGmqzxjvegR1/s+EXjwJV8b0emIoa00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoZl81wB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so1202299a91.3;
        Thu, 17 Oct 2024 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729196346; x=1729801146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLuLB8ZqbIpBpx1ND1vbb+62qdXEaSB4nVeZdMJrGZc=;
        b=XoZl81wBV5dk2pU37hsB6qrKQWMC8ba8I+BRcxq5UsiJt4rEVnk1MLF9rb/9qFmbKg
         OaREMbit76kOg1bfQbO88Kf9p3b1HYORjqnypF8Puesw8YBFhWJpsIj5g+WKG8vs2qji
         /8vKC9vqwGci1aj+U88lDaKe5Mz/obVj5OfWnXpMJ3o3A634AksiElQ0nKghev8k529S
         vCN+i+Q8zrgM38uSeilbXVLumBrwdRfyvTr6sfzoDwst4m8tJs1Q8JavqcBTZJUhx7w9
         QNlu1AF/pr7tQEkp8Optp4OYiyBVZveAjAulSrmyUpYGzUU/3wDS6G052iQCy/ZQbQPE
         8BBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729196346; x=1729801146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLuLB8ZqbIpBpx1ND1vbb+62qdXEaSB4nVeZdMJrGZc=;
        b=SdR6/TlOXed3Ye2pM7jtL4vHaPMUH4uBNN8AcVgnQ7j420pve9nAD5n6IlnBPjwojv
         jPLu2j1mRAz1sng4SVk2bCIHugc/gkI0a5uETrW7IZBj90OBzZcfLSZtmuYZRLiJPddo
         GGoJ58kXZwVfYbF5VYe1AfbunFRaLnaLH/abehg2JOS8Z7qg9UE2/bG1XTGxqtR+c2z7
         e7SY0xFl/mALW3XKQaG85IDCgJzVz3GG7XGePO2CCX3+UplScH94BZcOeDeruWcuY043
         dpTX/zA9ww5Jqzvl2JyeQYFozfDyPEuoHJX6orhsTr6mUzVxOJ2Ni8SCplGTvk7VKsVY
         1KQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9JAeONcUvhSLLjIZo8c8HLSt6p482RmO2iDTe5LMpcYfeUKnGEmy+qJ7EDg9QgjY24AEITirdBPC/JNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKss0pzhjTX0sF3doyQgzgZUqZc6dbovCgzpm07lE17SMUjjuh
	pnblAa+1C5dVtHnq9cnTpMs+N3WWlydj/0bFOgLQx8uW5DD/Pn4lz6vZ0O9B
X-Google-Smtp-Source: AGHT+IHAshLs1c4PMHir3QhIZHAZUUg/NgBSZeGahxS7a6BaavGEOXnUpiPvqGX4ruCodcMKaJ/XpA==
X-Received: by 2002:a17:90a:dd93:b0:2e2:bb32:73eb with SMTP id 98e67ed59e1d1-2e561a012camr226188a91.31.1729196346330;
        Thu, 17 Oct 2024 13:19:06 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e5610b59b0sm133201a91.7.2024.10.17.13.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:19:05 -0700 (PDT)
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
Subject: [PATCH] media: platform: mtk-mdp3: cmdq: Remove duplicated platforms checks
Date: Fri, 18 Oct 2024 01:46:12 +0530
Message-ID: <20241017201612.2607-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform compatibility checks for MT8183 and
MT8195 in mdp_cmdq_prepare() are redundant as they are
done in __get_config_offset() itself. Furthermore
there are two if-else branch in __get_config_offset()
which have similar conditions and are redundant.
To address this, remove the check in mdp_cmdq_prepare()
and combine the two if-else branch into one in
__get_config_offset().

Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 24 ++++++-------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..6eb5affb0366 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -114,19 +114,15 @@ static struct img_config *__get_config_offset(struct mdp_dev *mdp,
 	if (pp_idx >= mdp->mdp_data->pp_used)
 		goto err_param;
 
-	if (CFG_CHECK(MT8183, p_id))
+	if (CFG_CHECK(MT8183, p_id)) {
 		cfg_c = CFG_OFST(MT8183, param->config, pp_idx);
-	else if (CFG_CHECK(MT8195, p_id))
-		cfg_c = CFG_OFST(MT8195, param->config, pp_idx);
-	else
-		goto err_param;
-
-	if (CFG_CHECK(MT8183, p_id))
 		cfg_n = CFG_OFST(MT8183, param->config, pp_idx + 1);
-	else if (CFG_CHECK(MT8195, p_id))
+	} else if (CFG_CHECK(MT8195, p_id)) {
+		cfg_c = CFG_OFST(MT8195, param->config, pp_idx);
 		cfg_n = CFG_OFST(MT8195, param->config, pp_idx + 1);
-	else
+	} else {
 		goto err_param;
+	}
 
 	if ((long)cfg_n - (long)mdp->vpu.config > bound) {
 		dev_err(dev, "config offset %ld OOB %ld\n", (long)cfg_n, bound);
@@ -607,13 +603,6 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 		goto err_uninit;
 	}
 
-	if (CFG_CHECK(MT8183, p_id))
-		num_comp = CFG_GET(MT8183, config, num_components);
-	else if (CFG_CHECK(MT8195, p_id))
-		num_comp = CFG_GET(MT8195, config, num_components);
-	else
-		goto err_uninit;
-
 	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
 	if (!cmd) {
 		ret = -ENOMEM;
@@ -631,7 +620,8 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 	} else {
 		ret = -EINVAL;
 		goto err_destroy_pkt;
-	}
+	}
+
 	comps = kcalloc(num_comp, sizeof(*comps), GFP_KERNEL);
 	if (!comps) {
 		ret = -ENOMEM;
-- 
2.47.0


