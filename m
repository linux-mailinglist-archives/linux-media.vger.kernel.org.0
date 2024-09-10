Return-Path: <linux-media+bounces-18079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB697396E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 16:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C77A41C2131C
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 14:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A50A194132;
	Tue, 10 Sep 2024 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fVlZggUz";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="OsvjldKn"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-42.smtp-out.eu-west-1.amazonses.com (a7-42.smtp-out.eu-west-1.amazonses.com [54.240.7.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB2818C34B;
	Tue, 10 Sep 2024 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725977412; cv=none; b=MR3c7z1XbG+LthZCKjKcwGrekkbSAx1bBWPlTP39OwhTtU+Exo/5avQygz6w75x73qJ/gDZZGvxGmwfRpzvA5KCoVIO1A4098FqiUvsjZwEOHv3IBevhYiOp9TTfwlaCgPNg1raPr4CmvoibHaMDB1or8ViYnCMF4Gr8/WSlOYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725977412; c=relaxed/simple;
	bh=Z6iH79IgsccM8IOZRV23HWvG93x+QmrBBT16l/5gsWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUFahNWaOG5uuHwb70ptuVusuuvj98WGul+9foxBvwPRGpsddq34lecIe/FXleLa4mTzRAztpYsDHSL40v8oQaoQufsgnnC6ABuH121cM29rUdMO7mLpr6XOkMD8bKcms/6Kuju48cLnrrE46OL8gOWKw/EukYUmof94ysuYMvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fVlZggUz; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=OsvjldKn; arc=none smtp.client-ip=54.240.7.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725977409;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=Z6iH79IgsccM8IOZRV23HWvG93x+QmrBBT16l/5gsWA=;
	b=fVlZggUzw2ijGcBqwn6vADrylP0/eRVI76LUhJW/JpZvEvUwVKJCzO+dcZz25UtL
	ieeJX+WF9PNxe88iatPPi+18t3DqPExQaY84Z//2wEklFMCPn4JSIbMWjRgJU5BGTj4
	lYUm/yQ+4PaPnN3YAJm1lgBPUSGpWdEUrA5i7Zzrgltq9p3Hz9a8g6LwGQQGeQx4VV8
	SLpxvhNv8d9sdqOMzcascdfIZzEH1nzaKtWvqG7WnOWx9N5wMgKs1FnnhQuZ69UwMmm
	lceS9iAJWlir1Now9ivEOEiS1CJfYVjrl8UrYjVupO9YDm26Iid27iqiyoqwNTFvzLP
	PqZJKE1QoA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725977409;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=Z6iH79IgsccM8IOZRV23HWvG93x+QmrBBT16l/5gsWA=;
	b=OsvjldKn2qGKdbq8pISK3lGIR9WQ/JA6gBFgH/pVjR3hUquoUzzqGW6uDo9Fa8VQ
	cVA/AUqKJT6R5H2Hty7gHc+v7mb8SASg/hqHmgeAWGhxADq7QxcwzpFniC1C2jkr3Bb
	lY8XDb753k5TTiA1Yn6N5z9CzmUSIL3lONv77dnM=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: av1: Fix reference video buffer pointer assignment
Date: Tue, 10 Sep 2024 14:10:09 +0000
Message-ID: <01020191dc45365b-26b103cd-153a-4b74-a663-ed7beecc1713-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.42

Always get new destination buffer for reference frame because nothing
garanty the one set previously is still valid or unused.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 372dfcd0fcd9..2b9a1047479c 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -161,8 +161,7 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
 		av1_dec->frame_refs[i].timestamp = timestamp;
 		av1_dec->frame_refs[i].frame_type = frame->frame_type;
 		av1_dec->frame_refs[i].order_hint = frame->order_hint;
-		if (!av1_dec->frame_refs[i].vb2_ref)
-			av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
+		av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
 
 		for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
 			av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
-- 
2.43.0


