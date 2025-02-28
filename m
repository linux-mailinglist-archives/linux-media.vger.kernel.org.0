Return-Path: <linux-media+bounces-27199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D387A49374
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65DEB3A32A1
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B58124A04F;
	Fri, 28 Feb 2025 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmuoFAVW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB9242907;
	Fri, 28 Feb 2025 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731229; cv=none; b=pXqW6tKfelfn3ACXapuWiGZ0NB6eHtw4dTHPeuAPCuwdFGdD63ltZwoPRnfK8fMbtWc2oihQ1I5YhB93W/TdivKOgr2QPvaiwZACFbad/PGcb3SepTeQiexuSqn49dybkz8ptQhyaU9ygyodT49A4B66fPbWWl7MuwyYJMAeFwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731229; c=relaxed/simple;
	bh=ThjXtx5E3z8htq57zBY1ROtC5gC7/VgBF7BRXCSMHX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cuMyx6ZOAwEseAMVXkUD2R3l3gYcCfnVYXznDJMPlxFnl4BKj6N4Rvy3Fmk8+52Fd+wtNtuzFeqmkQ9ySytonqpuv+kOwx4JnTeeHGpSOlVHZUvOnH3IKlPvK+Iwdxd5wreut9jpyt0uCUBnrzR5tGc8LSbKSBWejBrOtu91rmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmuoFAVW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a39e659cso12615095e9.2;
        Fri, 28 Feb 2025 00:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740731225; x=1741336025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hL3+FT4jgWy7HTiAlfNxhK1vujiRovaeIT7kM4/gew=;
        b=AmuoFAVWYFtNJST4vZDLPhhC42juM5QbIZCdM4BECc2R+4QXTnZo8RyGbE8TXdvq5k
         aRxulUfb8gXpXl47g1Iyb3f5Wc5bs4ufWHgtLht+xvTCch1ags85pWI7acNVhU29IBxE
         +v3ZW2VpyE6Qc3aUDMnHC3e44D+f8rTsPG9z52XP36It4MCb3/5zKLGAhtz/rN4SJtgp
         5YBW5fmomvyTNJgnXQ6TsX0AvodH75FyNcpifYhXHljqMZ18M7fG+L1oeEDNFtL3oYi3
         1tpJTwSHSK99UN4CG7wWg4fqc5vQVteQQO1C4KbQPKn9UC4Ruc2S/CZYktKGidPJvQAG
         PzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731225; x=1741336025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hL3+FT4jgWy7HTiAlfNxhK1vujiRovaeIT7kM4/gew=;
        b=KJrgRWXUlRm5/G1jG7Bob94VYJfi8Wfl0WPUqNIe0Khz5MomBTYUrWzYHT44xlI2Xd
         y0bOi0oEN0HDXXeoqSp3vfQ+cmJux7SksJ92OeBySqp6SJUYQABRdjeD0mRxdQu2VI19
         Wdv3h6meJjkvWil72aKzurWXp9UEXc2srk/mjD7z3rC7KEah26vh2HAjrYsJQKd8hz3i
         XyYGmAfaZKttEuCx68ao0DXi2JOP4ZtyoLZr8j29JIozOIGMUm08oipq9R1Xe/QXsuoI
         ZfOEIxpBOCFANvMwYkrvz/X9ICfkILqD7lk0K0gXhLTmjxSGkZjoi+tKnhScyvMLImCs
         s0UA==
X-Forwarded-Encrypted: i=1; AJvYcCU14rtWbr4lM7Zv2bjLENxN9xw9ezWKorbQObUwFgeghEzFqQwexXmCqBOSWp68EZGHZa35rRB61UyQcMI=@vger.kernel.org, AJvYcCUYIkqRZasQFLTotLsEvWkv/LppWrFPTGxm2civAnJIoXHshq2GiMXg1Folf4i6Kf7BCMrQ5iScxbpp6JI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhgawRNtMMKVxWuWc3uzbQ36RuFp3vnJeCAkfP4lelSKefyI0
	pIurY2kAUqGhkwKbcPU5Q4ZY8HZthCDeFLwDaryyiiXEjZ3ti8fGU/aSTEKrB+Y=
X-Gm-Gg: ASbGncvGwgA4IYPh8kfXPapZdfHJFgPwgigFrQKYNJr0Zsc4znkBcHVF4Dvfo9UT4q4
	XIgUKjd6va0VgeF7LhoxdGRbIeaMm8xbOMeMpB7K7Szyu+CPs57WPttAH5t91ZoXJYmXVxr6pna
	VjJCEwESw+g4yhUs0/FTFnHSVsm8z+eLQJMO9VrLv29HWH+JHsatU4EPY14de36caEpfYIfpo/J
	/8FKlfEM6wRegHwEkcXZoN6QWYR1tLSaVsj+Xw96CfKCfTUuJaXabOVGXxk5ng9vh/7BYjYsI37
	aDKiqvIHeppqMZYNgkKgeZQGRVk=
X-Google-Smtp-Source: AGHT+IGS5XKZknp6OS/KozqNJ8LNcqswD6SqP4S7mevnsEOs2WH2PwRJLz62ZsYNAOG/lfKVd6b8zA==
X-Received: by 2002:a05:600c:5106:b0:439:9496:181c with SMTP id 5b1f17b1804b1-43ba67745d4mr17834485e9.29.1740731225247;
        Fri, 28 Feb 2025 00:27:05 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43b7371b004sm47094275e9.24.2025.02.28.00.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:27:04 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: amphion: Fix spelling mistake "dismatch" -> "mismatch"
Date: Fri, 28 Feb 2025 08:26:29 +0000
Message-ID: <20250228082629.676037-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/platform/amphion/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 6a38a0fa0e2d..85d518823159 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -805,7 +805,7 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 	cur_fmt = vpu_get_format(inst, inst->cap_format.type);
 	vbuf = &vpu_buf->m2m_buf.vb;
 	if (vbuf->vb2_buf.index != frame->id)
-		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
+		dev_err(inst->dev, "[%d] buffer id(%d, %d) mismatch\n",
 			inst->id, vbuf->vb2_buf.index, frame->id);
 
 	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_READY && vdec->params.display_delay_enable)
-- 
2.47.2


