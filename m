Return-Path: <linux-media+bounces-26313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A517A3A69A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 20:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0DE165906
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 18:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5E71E520A;
	Tue, 18 Feb 2025 18:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ/yIepp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A21E51EA;
	Tue, 18 Feb 2025 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905094; cv=none; b=go7ECjetQHUfIc1Bwn/tMTAEEJ0iL3W/uguOl+RbtxAIg8VDIupzPWFbqXkfpF9VffLzfkI6Z74BXYSykdr7W19CBaR6tktr7xDsnvVuAwS+KgYoR+nTbm9kAvZ83DKOXv+h85Q2iPI0UYo0QBFCOA/lPyCrHFr42hO7U+YhKCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905094; c=relaxed/simple;
	bh=53njmH+c2yf4GLXICveIAjXd49TtISyQqP0xl16YiDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EKbOJd7UhRpVPgL5IYB67lsNhFbGZKULDQG0wlvI1dA6+oFxHzAAoXZP0eOeJSJCNcqYy980FRjJUBmaUBK6kfzoX0LOKhBdaXdIpaCLjmzpOHXOjGTyWDnBHogBWLVArYixz7ZpjvZSgfRpyZ0JjWolWpKTSfqbYz/E4LmT4ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ/yIepp; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd420f82e2so81248796d6.1;
        Tue, 18 Feb 2025 10:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739905092; x=1740509892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ae5CUAqvFWLqCxBuF5XhzMM5neQb6Ke5yTuZdxcdHBI=;
        b=LJ/yIeppW9hkcgL/kAQwAFKKd3TT8aNyEdS3XMFjHKnZRM8VJGXlruUH4xsHtKn44r
         zqWpw2Ehk+jtKTn2JFukl/VrgE7uBnl6VRWDFr8cmd3ibHcZ+gfrvzlJGwmebhfWxPqk
         OSAclwduFyDs30XG5VxmTr6Brd+0ShmufBhmgq1tOGlXV8KuwG+qaBUqj/4PaeBCiOCn
         4hHOtpUXkc4yFkvmV8O5sM4fPLb+sbuzNc5iHko5bd3gtEURsDRf1i7tXeLW6aByrldD
         MxdzBuiI4l2/hX/bOwjt08sO5KGbjy/6YNnTM3G3hU7vPN7xHhhHGjZlzRmoihw061wy
         v+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905092; x=1740509892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae5CUAqvFWLqCxBuF5XhzMM5neQb6Ke5yTuZdxcdHBI=;
        b=rIQ2pPZsqhQD0vPAIvsTH2tobuy2hm3YgFnZ0RQ/bwuZQMcuZrDlObz0WJ8VNWGTe3
         kDgEW0Rk0BA2Km95tGLry7LcBmQZivs8mslbEBrodLeD72i5XiBigGsM5tDDf+M8WKAd
         0tVY0H2ZEuSesCkFaWK4Cjz4ahOosN3kcIrwOnOAwI4dSns3ZnlBQIfQkMll5Fi5ERJI
         DfGqAeQLpzUehFdekJasyBpbMrKDjNXUOrEB1iKESZcpAoPgaAVSPxcyEVXakrU6UQCB
         LolB+tFffZme9DvLqo3LwzhhXLplKzSlssqS8OIV/IxDEPAskpvUFgat7NvBHv+AIJxp
         ASjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJrTJJmjfii+IBTWVoTP2urDIMPWewlqwmdEcLrIDP5DvxB94yae7kFEZ1g1yoagmo6k0zNrRc16axpXA=@vger.kernel.org, AJvYcCVhDjPi/rU0urw4yEr/vCoUqmGuQr7lX9XKU/C/k3B5s8czRiFnwVFmJonxppgmS72CXq9wgk2qYyeaqSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqEuYbfbklq3WUGYH99usSxCj0ecvnxWDeYLmi4fcSRH5Gyb0o
	dmQAXokRH0XJ9k2d9dbGBX4vFzwfRFwYR75ZpURWUwtOzoDdBHg8
X-Gm-Gg: ASbGncuQrBFie47NYarudVboCXDMnlf3aJLIVY0rOmRCp3UdRAgPiRfqQK6OrcCKv4l
	lgAhM8vZUHXNsYLbRwiVKj9UgF9Chr3jX9UXBJHxdFMnG8FbjftE6HOpHXqnfwZlsggNkOWv0k1
	xzpUwc1lW2m9qDcq9R5nB6580T2j6DqQAxGfLpZAKUQWUUVG6+gaWrQ7bO6iy4Bj+w83Y6HwfTs
	p8+LMMkUHhpTs05G2ZRaX40ufCSjoUS5ELAHUonW/rOuHxq8s+OkmdB+LflVDkGbqKIzdjryuyT
	BHwljjAtouLlvgm993GVDvJk8EOVuY8Z7oiZuA==
X-Google-Smtp-Source: AGHT+IEBUpcPJIeS91rT5iM8/z85eHzjoA42gXRp32LDonh/AwlEudjIz2MzjR25aealFM9CLGUITw==
X-Received: by 2002:ad4:4eed:0:b0:6d4:e0a:230e with SMTP id 6a1803df08f44-6e66ccc114cmr224422306d6.16.1739905092130;
        Tue, 18 Feb 2025 10:58:12 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a40bdsm66803016d6.59.2025.02.18.10.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 10:58:11 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: sebastian.fricke@collabora.com
Cc: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	fullwaywang@outlook.com,
	jiashengjiangcool@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	tiffany.lin@mediatek.com,
	yunfei.dong@mediatek.com
Subject: [PATCH v2] media: mediatek: vcodec: Fix a resource leak related to the scp device in FW initialization
Date: Tue, 18 Feb 2025 18:58:09 +0000
Message-Id: <20250218185809.37130-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
References: <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mediatek devices with a system companion processor (SCP) the mtk_scp
structure has to be removed explicitly to avoid a resource leak.
Free the structure in case the allocation of the firmware structure fails
during the firmware initialization.

Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference in SCP")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Reword the commit message to give more context.
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


