Return-Path: <linux-media+bounces-19178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 843AF9936B1
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BBD51F22E17
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1EF1DF246;
	Mon,  7 Oct 2024 18:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipl1k9Pv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730961DEFE1;
	Mon,  7 Oct 2024 18:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326944; cv=none; b=JaBssKPhSOti6reggCwNegGCJrOabdaMTtKtojmLtmw98Gp+E2tL3P575xZoqZ/N0mXr3zuRcKxFKzC5KKErkadw7gSVQ9yXXLkI8yuPQON6WtkPNqH0wuf1XHIGXVApAB6+vkBMwKERmGaz3z8zlcUTAnlib+us1QH3t61GZn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326944; c=relaxed/simple;
	bh=jjKhdL2ZlFvCxK6TQCDrMqBP3ZWyNv7UnbEcwC/zyfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6PVu8jmxjOgu7RoQ5SLnLNQ0sibCW+LaQ8P/TTZKMr/1riRVmPhWsSSv5Mjmm+v/aNslOsx8fyt3KmG1FIrmm1piRbRRgxjnfmYJTp/RF2piK6IzKeWTehAr1nxq/BFnxTXBCeKdM2Ld2Y3sUckffJRsCRvQ/sIMyZLN7kS4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipl1k9Pv; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a993302fa02so296676866b.0;
        Mon, 07 Oct 2024 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326941; x=1728931741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOA5rh/i3sB2aiZsIVyQZqxDqnBUHZOsMDWgLcJkZqo=;
        b=ipl1k9PvR2s7MMuX5ihqN348R0R4lhAk8au07+EZ6Cc2rrjcMzWMx5zJK4+HQ5TkkT
         ZC7XCqywe47WMtkV6VlMEDsWCLd/lQl95jan+XYLF1WlfIqxXcTdsCzG/vynSG1KSTqE
         ZRr8uUz9g1Hsv9Hnng0Lc6orTYtNNYy80+dQO6AxIeQQyRQ4ihCz57pYyplduo+JChuW
         25bj0wLs1YOsiRsUtPZJ9EoYecNs182H6kQhYzVxMdAzrPTn55vulR2gCd403tjM8q9K
         qUhJdZi0dnuICsxIQUvPNsAWapDw8lxJFdBrd+7+JznCj9Xb1ieS9ll/cFUo+O+hUwOh
         j2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326941; x=1728931741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOA5rh/i3sB2aiZsIVyQZqxDqnBUHZOsMDWgLcJkZqo=;
        b=vXcN7s3YiBO5BHxdOz/fNL5W849cdnVbie21dttkj+X/tO9/+V0n7IGoCjduiEJIBU
         gSqeKwavICCjfjmVn+ZXCiH8fgsgAm+OwpRLKV1dbC8iOZLkAqfEU8r1y7mcBM30NINd
         TfaTBahrUIG3WrylWkVM1Y8vUBPbJrhZ2hpbJrw85Q2atAf81FbaR2+LCwTysPwkPWri
         Dkmy0HqzUuGywvX/ndWeP7nTOd6PZBvofslO0H2cOicVmGkbYRcZCydPn2rWG6FpjBWj
         7KI/PEVf6+nR8jaGDeu4IAJtY3n/+PXD/fd9wVj68eeyL4S/cGZ0TPcH2tEn/OaHyqY3
         s0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHdEXubCOBwuMHFgBPi7SkL+fvNAPWdSd8Uo9pS5EuMfQWiq7W5MbRoeziwj9llG2ovfzFNeV5Hhe6DhU=@vger.kernel.org, AJvYcCWOpPR0D79DpTDIEhvzakdHKS3TXswETpTVSv7beqCAhNO7ZDybbHXgiRAbYbcr/yHArainrNUF9un8Ro+ilN2Q15k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/K6TIayLkwz5Qiwdj3o1VQjuw7ThpezdaUeviGx1CeGZCSiAS
	eZbdQcflxcvIKWiXTMLZuZ8zq/qjCeW7btlEh3LX0eA7pEhW7lYM
X-Google-Smtp-Source: AGHT+IHxUiFI/rbjgKUNcq/HDSA08DHTDAUnvMS06sqo5ZNDKF9M6dhIda0R2GYpQkYr8kgARXL/Vw==
X-Received: by 2002:a17:907:e9f:b0:a99:501c:b841 with SMTP id a640c23a62f3a-a99501cb8f4mr501119866b.28.1728326940612;
        Mon, 07 Oct 2024 11:49:00 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:59 -0700 (PDT)
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
Subject: [PATCH v4 09/17] media: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
Date: Mon,  7 Oct 2024 19:48:31 +0100
Message-ID: <20241007184839.190519-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


