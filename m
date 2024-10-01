Return-Path: <linux-media+bounces-18938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9498BF3C
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13088B25343
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDB21C9DFD;
	Tue,  1 Oct 2024 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4ubNpUk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A6F1C9B92;
	Tue,  1 Oct 2024 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791791; cv=none; b=Y2GSvuPMnqZvY6GcGFi+QLhYBM8ykVSf6ViBBpLorOq9zuNofdJyFpL/B+3PE3/YImCvbv6WCN9qvzbJ9APwQrvfG7kFi+IHLp0Uf34YjzfCJDYbswsFUCloiFCFZ/Vvrpa0AIxuaSWYRQN7C7EqWJD+qHZnK7EP1TIj7uHpeS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791791; c=relaxed/simple;
	bh=PPbqMcSNUPuSBOLc6T+pUKnDNoIUABoAuYPB4BZEcIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1x5SJ/drCk9xWkGMUKKBDy8eboBogq62Re520DJUr81GGKJwcptJ7V6QsP0iDWg+4HowQtkmIYT50JdJv3GDeJFlTQwws/uvN58gZvS69908PTS/Bc+MxRmINImCU2nwpWc9yMguf8itbTJb/aczqoux5MGTKJ4PFBgo1fzodU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4ubNpUk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso1038338666b.1;
        Tue, 01 Oct 2024 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791788; x=1728396588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY0ON9RWZF20+0WmEC/baBuWRUFD1qrfNbARxLa3h4M=;
        b=Q4ubNpUkNm4SQsrtWpmnEzg5MKRwpmtMtmjYnlCTaNzbKQM9cwYDzm6fAbSoMZa9nU
         xrElQJ1JdPvv50PN8ebcsfIyG3jsXnLga/wL0nc4iXm2feyRsy9kdjh/1+jGYxhaJvqL
         R6NO3XsQMR2fWo+pz+mogLghjKrMeZaJSXE7/bBdLk48tFW4PoysFNbL4wt/O+s6Pzq7
         AQxmQ+XbqcDBbDw17eC9yDniYVMEpgl2KSqx+q3bdfzM0s8FNrR36kyVZEVVO5BP2KmH
         a/us2Aurnwtivuy8AHnXpAu2hqIDXP6UmVQ7i4/Fo+VPB2lUeEFVAqGykNtnBgB5XCdd
         ghPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791788; x=1728396588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KY0ON9RWZF20+0WmEC/baBuWRUFD1qrfNbARxLa3h4M=;
        b=p4qbtvzX+/Fg/1fpFE2jj0V07QnWw7XFNTIcCzhreRlkFZ/Ggekue07uym8DwLa7+8
         9LbLcPX5bMXUuv4GFRv6VPbKT6Dqp3U/n9O2J3JxcfUXM6Gid33gGnQGuMaluQ1WUr+m
         JYNnh7eXEAVvx7p4VbXEK9u6UDxcDe9fZLfdNfMkpLrKSStyPni6naDhYyY/qcWYhGGA
         xxL1LPnz0RAsj3GFDeGjfoqZ3VlDBbE452EBV1wu5fBulxuA3SZ6xoMlTrp5uVKCcYjy
         4Pl9p5s5ETUET9k/9PMl7Hz84EST08JaUALbE7hIc/eI7af7e/kfpxhCGI3hMMSpK6wb
         3WiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDie25lSzIYCRieE/CjQ1D9JVfJMKijDjbOm2oY5RbRgxV74L1Qf3ZICwzC23+v9VjRwPU9pEzjWm0YgQ=@vger.kernel.org, AJvYcCWHxWDdjjlwBQ//b9K6CFXMeAsAKoHyD9Jisxyk68T6KzZKtMFpZJJfjbPuAoFlg73UVncrr3zbZb/BOlWVg+jEBKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAesj+xUyaFoIej/7OK0odQ4Xr08Z3Q7cS9bxNIJpjpyg/VwlF
	ajNis6ja+qnreVwVSPShPEacPwETts2bIKaKHph+YcMTSUOoB8oQ
X-Google-Smtp-Source: AGHT+IG4E5/3Xdvm2ASE6P6UBPVu+jPpWZNAjOa3Ww0oECZU721QCIiSxTvJzpIMIGDLniD3loN5fA==
X-Received: by 2002:a17:907:7216:b0:a8d:3fb6:33df with SMTP id a640c23a62f3a-a967bf0855cmr356347366b.8.1727791787709;
        Tue, 01 Oct 2024 07:09:47 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 09/17] media: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
Date: Tue,  1 Oct 2024 15:09:11 +0100
Message-ID: <20241001140919.206139-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplified the `rzg2l_cru_ip_format` struct by removing the unused
`datatype` and `bpp` fields from the structure in `rzg2l-ip.c`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index aee7d4ba70b0..7b006a0bfaae 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -10,12 +10,10 @@
 
 struct rzg2l_cru_ip_format {
 	u32 code;
-	unsigned int datatype;
-	unsigned int bpp;
 };
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
 };
 
 static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.43.0


