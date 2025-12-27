Return-Path: <linux-media+bounces-49596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08272CDFCFA
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 14:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0372B303D9FA
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 13:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AFE32B99B;
	Sat, 27 Dec 2025 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sh09vUZJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB532B99A
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838033; cv=none; b=P7UH9EWeMo5tpbZJ9YQqSvjfHGY9uR56ImA3jeN9ZBFSv/v0rTqJXhyxsym/WNiQ2ceotOQAaI8n73Jv64hU7Xswbgm9D4dy4c+XuOfgJDHX/f/TbYhaEZo/npgIxQIeQgXs13y0V0orzKlX1vVy8HRs23jh++vzPzlPAbr5Z8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838033; c=relaxed/simple;
	bh=ViShpRpNoxGO8Zvlyak7SFSG0dz1mWoEy2EgxRhIuYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2F8KpVZ8xlHkt2RcNgIGn4bOtqcPdrNnm7MXCRyGPKN7k+08GlUmr1q56zeQyAWA8Je8Ukg1ZsdYo6GruQ0UwEyfMaLvppdxPBq5GkXzii0kn0q5sJMwn5IG5dh4TGASXXkzz2CWqYXrfKctj2A67udWXWkZjJNaaU3Z8vXIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sh09vUZJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5942b58ac81so6572396e87.2
        for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 04:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766838030; x=1767442830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gu0hdt3x2HR6dSPqUKV/8Rrx3e+fQI4f8ZaVCl3DxKI=;
        b=Sh09vUZJwVNKvMAwpJxAg6T9ayf8h2AOJam8lGLGvxW4RE00rheTp6Pv3AhFNH62ll
         mnX0nlTdpJodnontvJ1JkVxKrgyHdcZbUiCcH/brbFUfmo1k6yCPhsSWzCMBQt/wZidi
         sb1DiUiQa1P4nxWkAPh5RxoQHf/+EwdM0tjpilP1iGOnJ5WqSdClAwl98UScEerWxIN9
         3J5s79WGp+yeHRohmySNF2lCqF5lNJrICxRADRG92KVppqsovczb8twsTPTAeloQF+W7
         D4IsCNkxkGmPTlrF6WPbyIbfy0qFkTMd+9ojmhXZXGCiwjWrPlopeBjJrujjOtMdY15k
         Hmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838030; x=1767442830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu0hdt3x2HR6dSPqUKV/8Rrx3e+fQI4f8ZaVCl3DxKI=;
        b=Br1UyCJVUk7/6EbPRIEdbs9itpk8DaOiK4nnaOiuMa4bdvnzFvbbw1q47rmUIaAnWk
         YxvYaml+qbWjc5VHw0FL2LZbvKL/BDUbOpJYy3vKMJcjMzHgjiS1WabF5afdNcyeWibr
         VL56HfFTq6fCV+PrNosLy3OcAezMEcNI0W3fSuGvk4jSRlc6pwM8frhKDsqjy5RG2GA6
         oFa1GzMizTQh6Ff1mMvPLB3oGZgrbkXuhQ8NDOHQL5PB6S1heXxPq9waGNn/anFwEuRh
         W3e25IBdvOWI7L7g9pQfKWK8Jh5k6SYgULjq7ocghBEnOTrUvfv7ARg2jOX0qG5rSgLA
         6faw==
X-Forwarded-Encrypted: i=1; AJvYcCXZo67OB7qmKjYvMRdgbOn7zZIiEz5R04dOK8uqX8DfGM5IJCeRg37YcZ+2C6Cor24xp1lvZx2O/A/yeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPsybmdC96PcuhIwGFgi/Sy8NJehqRAgn265M2xEErHeD5UQGR
	Fj5+qKuKzJ0c/OpP7URUmp9x/6qi0oMrkSHX+n0a/DBw+P0dKDQpBu1H
X-Gm-Gg: AY/fxX7+2sFCGFWjRAg+Dd8q9B2PNr6Z8YNTdni+KnWHXHiqAHU+M5IcyI0VIJioY10
	h1sA48+i06OY6HiCsFOIK3vj8otRIvBNI6PqD2AY6vQ8sFz6OuSxp78vF7qTqT1eaJL6WtUdSLw
	B/+iSEvcp3b9R3o2GUuf21FFwYlaZpM7jrFHFfxx3solhd1/275V9/Hv9dp+cXhAcZIHp0FQM/I
	Sxbd6yCQH5lx7FjcmlymoWQntMtA+8aYGAXMYBogMW8RLzJPizgWvpHczcYb9VcbBKYLVXV23u5
	vwytvVcgVxBZBeNCdMys/Ph2y41/gVoUtkdQoPZ2A4YvYdqJhZEQBLhUj1TBdEmf1+pb3ttDdSm
	xO/OVU4t3RMl3iVvdfsschd7qphSX0k8JijqR1O8aw2FhB/x5m7y/g4j0szxLDM2VzX8jCyYZY7
	9+zChTY2IfXCDlZ6Z7iREe7AYBzrU=
X-Google-Smtp-Source: AGHT+IE3nq/gbPSFuEDdA5YBhzgkzKmx4GdK6dsDzMoBwJOj7JjaPLrx1nwV7C8th3UvQh4+NFI6qg==
X-Received: by 2002:a05:6512:131c:b0:59a:1152:57d9 with SMTP id 2adb3069b0e04-59a17d722bdmr7507324e87.6.1766838029960;
        Sat, 27 Dec 2025 04:20:29 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.121])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5f07sm7356479e87.12.2025.12.27.04.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:20:28 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: renesas: rzg2l-cru: Fix possible ERR_PTR dereference in rzg2l_cru_get_virtual_channel()
Date: Sat, 27 Dec 2025 15:19:44 +0300
Message-ID: <20251227121946.67935-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media_pad_remote_pad_unique() can return ERR_PTR(-ENOTUNIQ) or
ERR_PTR(-ENOLINK) on error situation.

The current code dereferences remote_pad without checking for
these error cases, which could lead to invalid memory access.

Add IS_ERR() check before dereferencing the pointer.

Fixes: d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel information")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..bf7d96841c78 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -411,6 +411,9 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	int ret;
 
 	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
+	if (IS_ERR(remote_pad))
+		return PTR_ERR(remote_pad);
+
 	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
 		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
-- 
2.43.0


