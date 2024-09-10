Return-Path: <linux-media+bounces-18131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2042D974172
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A379B2850E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A771AC45D;
	Tue, 10 Sep 2024 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8lDFRoN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794EC1ABED3;
	Tue, 10 Sep 2024 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990877; cv=none; b=tkqbYBCeDoI0wrC0Hbs9YXdKjedV0y4vAflCJapxzDbM+RIzCksBeWTU8uj4RSbwPNIufZHpOdLqTKlSZ+WVFJEkfV0ej4k5ZlntCA4w70HzWIBfzuqXVweS7CgD0pMCyvkl1jTlkqZFPjXnoxmkPLv8bdCg+PFzxx31ciVAnSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990877; c=relaxed/simple;
	bh=LHbIuamZvJ39m6siSO+//JcL3iKfPuz4w6P3j65aeGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mqA4eBs/yU1YwvSFTsh64vIfUvr998gNUxhUY8DZmsu0dsVCl4fCDFTxGgAHn3mJnSe7dyHFFHKOsWRst2PsdpcWk8uD4Blyi5Y2UUoZ9Fhj9QNYbhLUM7PEC7prlgRuDqlG8t/85DWyWnzunOCLQV0OVyHjxcMYyGPfMA3MU/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8lDFRoN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso10201525e9.1;
        Tue, 10 Sep 2024 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990874; x=1726595674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2XXdUMfe/h0/nnAIkOlqEyRspBx9XBGOkc9nucMT4E=;
        b=d8lDFRoNtFCihRdAHk6gBeJN/g/+3CA6YfrOCjic8nauu5OAhe4xJnLXbE614Mj2KQ
         xEUFgYi4yJsDB2XjOx23dk4i5KcE18Kc4zUM1kp/mSjpX8o0xHua63Q/jRrS/l1AzCjX
         BWjuAzeea7Jmed6PCMjVEna6EY7F9Pg47twIW3fVrDcaa0vzXXdpTOzjGg9idf3iem6/
         SXg0e00+GNsC55YXzaIWKr1FpURdUusc91z9najCPkYxwDFiv4FYI9UJtyUZosjZrW3U
         WyXe3qd1VzQGPgcszbfVqXaqvYwdJYDKtV1hqsKXj3dVgPGXSDYqpSBeNIwAmGErDFoA
         owOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990874; x=1726595674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2XXdUMfe/h0/nnAIkOlqEyRspBx9XBGOkc9nucMT4E=;
        b=JNroDvxEIEErNLNbXf5YggmAgS7mAh1wV97H1e5PEQhsvaTX5KnuGmSvye9rRSy06y
         ZEw3GGUAIwV64UBHvJ+f9N1P+Zn5WQ9jXyvqcrditukR1N+AukdcVgWP7sXmO0+enphP
         Lw6hnqNZbqhvilh4/GpWCWALkDapqKb8jhyG8F31BTE7Kvkt/gcSSYgIQk2aenCvgpBi
         ed2dfW4izr4/Dssin2gUKpzfClGztp60eLh5MGnkdoB9hzZPyoR0d/bEYwuo5gFvDSgi
         L7IMG0GE35bB7p3Yewuww9qS5/KzgMBwiPTlnLC86A1uZoNEP6rUsN/blf52JQZqjHsX
         foNg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Em17wrBFVthepDNRtmTGKMk8/X8j8LO4Nez5WHgcyXN7d1NUGgByeUqN23kHW6rC9wG9JPDcImVsljqqwaS7gt8=@vger.kernel.org, AJvYcCXNbU1uZS9KFhYaNw3VxZQ9/SQ0qpqnXITQLRgNf5KoCIr/lpphutksNVmKGRSesF5yFL/6FP/0fXhpOr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7BZMtOjXmJIjDYcqBTaf+wovwBLiFTrJdPJZHi3XOfX9pDjUD
	547+02Jf2XGnCy8eFcSLb+Rr3j2um/zzlTV1itUtIkVJ0UP07OZr
X-Google-Smtp-Source: AGHT+IG3z1pvsNeSpTUBH5v8tKZXIgo0lCINi5UgVfXyzcAlHyLulNl9We4vCKTqqLIwzmyb/h3tzw==
X-Received: by 2002:a05:600c:3109:b0:42c:b9dd:93ee with SMTP id 5b1f17b1804b1-42ccd35fcbemr3554795e9.34.1725990873795;
        Tue, 10 Sep 2024 10:54:33 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 13/16] media: platform: rzg2l-cru: rzg2l-video: Use rzg2l_cru_ip_code_to_fmt() to validate format
Date: Tue, 10 Sep 2024 18:53:54 +0100
Message-Id: <20240910175357.229075-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Utilize `rzg2l_cru_ip_code_to_fmt()` in `rzg2l_cru_mc_validate_format()`
to validate whether the format is supported. This change removes the need
to manually add new entries when a new format is added to the CRU driver,
simplifying the validation process.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 014c0ff2721b..c32608c557a3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -201,12 +201,8 @@ static int rzg2l_cru_mc_validate_format(struct rzg2l_cru_dev *cru,
 	if (v4l2_subdev_call_state_active(sd, pad, get_fmt, &fmt))
 		return -EPIPE;
 
-	switch (fmt.format.code) {
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-		break;
-	default:
+	if (!rzg2l_cru_ip_code_to_fmt(fmt.format.code))
 		return -EPIPE;
-	}
 
 	switch (fmt.format.field) {
 	case V4L2_FIELD_TOP:
-- 
2.34.1


