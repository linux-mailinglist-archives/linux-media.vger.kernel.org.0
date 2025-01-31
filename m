Return-Path: <linux-media+bounces-25444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AFAA2389A
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 02:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57F061889B0D
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 01:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E083522615;
	Fri, 31 Jan 2025 01:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8UqbdI1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6354C9F;
	Fri, 31 Jan 2025 01:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738286916; cv=none; b=pEeWFqZAKUC9dEGy1R4fL1aRjrzt0b1U0q3s6IhDXbC9EWXnfsLSQTMsOoa2IGvQHRBt1G3DpjWOvnCwn5yXHe44XvQTu3IHrKjZPFjjeRPN/r5MjI3iL2xE8U1YKG5/A2Y0cNryHCSfrjOIC8JFSpVjMy0/CmqKlw6K60dXw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738286916; c=relaxed/simple;
	bh=Nz7VVWUaoEwlZrcDHuPzxHbFjFZlpUJ4kGW1Cx8wNrM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lz/+gINfZOlFO/HwE+b+iAJmqbtOZ/xhPlz5Q9EuBsZVL5q1S8hPIPvXpjQL2cSlEAAlVa5jI3Gxi3Ho/KCA9df8/Pz9ZRoMKxv5pCuU2uAyIXwJbIuvR1AYXUvW4FSyEMs07EIn+RHmtBE8h5kjFCywEX3FhWWiEtio78y5mAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8UqbdI1; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so13238516d6.2;
        Thu, 30 Jan 2025 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738286914; x=1738891714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nsBQ15KPAbNgDIj2dwTdXPvw6ebbg9GOZ64wqvoRjZM=;
        b=H8UqbdI1U67SoxsvMKIjuZQKOJ0E5cKCzjw+ao1em46IvMLz12U/DFOGBU/srImy4h
         8q5u3BBQRy8STpu1n62yTiGq2c44rsRuscTsgNxSFVWfTeiX1bcs1TJvyHRa9BJJSyDn
         EMKr6oGIqzh3JAovvOmqNCPXJ7jKwLcVN1f842YIkqHln0uvpcO1L9qWailKeKaK5ZrP
         ipX8zt5hhdiB1ZzmhBYnAFLPkL10Gv0M8eUBaBXn8QWpVGyO4glrDeob+4u1nnmtefQz
         G1vHwEYCgh2pSMf75bcux35sVyvsL1HRDOhQQhF1RVt6JUa+4l+V5hu2DS8hJzpDnouF
         X8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738286914; x=1738891714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsBQ15KPAbNgDIj2dwTdXPvw6ebbg9GOZ64wqvoRjZM=;
        b=pfz0rnoHy22zqlBMLoGljlRcu6FGAoQjGIqVapEvt+SeC4hiA1UreZOXLZktcnBW0K
         AuOeFrXlHMpUZrAsL5ljNeBU00AByAfM/HoxnrTFTLeTgUCOVIIbZCzcudteGcVOqj5Q
         0LpXPI4aCWkDUdOhtN01i1fGLLiWaGIDhvWFCwY0tCbSw35l0Oc6eB+lhV4vCLkLTI2X
         FZpnaG0yfe/wQzbh6Gjiujwa3azp+Fbisrh050R5ecMmNhiM4CKPMO1tkccwDMnEBger
         8Q3yN3sYlNmsa2/ODIbjA5dLboSdDt8HBKiIT/D4HiuVgKuU1rNxXyMeJh2HuLq7mH6y
         dBJw==
X-Forwarded-Encrypted: i=1; AJvYcCXjzG5fiaZ5gqxab6WmmYG71Rml8zmQE7vskh6xzIy+psPHQKsbeBWpdqbTviNZ8STmVrdbrjlHIO69Ld8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0SPRyOivhxUOcYGgWk1yvef/AxdPlyyf1osO8GeswO2UH9yZF
	WRU/v6PvIG6iQqE80ppE8fqEVdCUcTTyZfJfuVGeWxrIog4zag0B
X-Gm-Gg: ASbGncv770K6KrBr+1y2thyfuOwhkA9xSH6B7yamOS2cFAeKIyODn0o6GZbwdPLRf99
	NxzdUI0ix9FbSOeE2XsZeCSno7+okYyBPxsM7YLI30bj77+aG8hmINOCQozPaf7HgbcW2j5UzSj
	jiw06+8T7gbR+aSxOpcSADCstTXAUlEpN6RKyDNPnKJ8KxyFudblGpMkMyNxTXhm7Sib4IZaTDJ
	QoESUI7EX2CHdLhaQB7owiFBMe9MJNWUWGypaPhrD8SosYn+HSboHs+PCd2R31p8/NEzTRwdkLY
	JHmGPuT9/Znp/bwsFlKc+cP+N3UrX+r9wrgWTw==
X-Google-Smtp-Source: AGHT+IEDTGGykK3VT3IFwkV7jiAPCUT4mQR5DWO7oY08yzO1EcFsGxxZjoFcYEQky+5HouyGEl7YYQ==
X-Received: by 2002:a05:6214:430a:b0:6d8:aeda:dd93 with SMTP id 6a1803df08f44-6e243c8fe49mr147890246d6.39.1738286913646;
        Thu, 30 Jan 2025 17:28:33 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254818bb7sm12366476d6.47.2025.01.30.17.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:28:33 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fullwaywang@outlook.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] media: mediatek: vcodec: Add scp_put() to free the scp
Date: Fri, 31 Jan 2025 01:28:30 +0000
Message-Id: <20250131012830.22394-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add scp_put() to free the scp if devm_kzalloc() fails to avoid memory
leak.

Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference in SCP")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index ff23b225db70..1b0bc47355c0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -79,8 +79,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 	}
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
+	if (!fw) {
+		scp_put(scp);
 		return ERR_PTR(-ENOMEM);
+	}
+
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.25.1


