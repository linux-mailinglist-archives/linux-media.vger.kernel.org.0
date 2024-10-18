Return-Path: <linux-media+bounces-19880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484EF9A4007
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7748E1C2359A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB5F205137;
	Fri, 18 Oct 2024 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8XrAQWg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA02D204953;
	Fri, 18 Oct 2024 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258522; cv=none; b=tEDzcGHhTv6bVAKunodw8OuTISjdSLoHSIGSCjNiDBljp4ZQhO4gMTEnTUN4GRVwzJ8mV6k2EReqjQh0Aa0TlIe3+b7Rc9pYTrIW5ydcar6lWBioi+atYIArrr+9C+SFWWR2Jmt6Q7MMLTJdisN5pXmLbE7ZK02YgSXcoIUzjW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258522; c=relaxed/simple;
	bh=hNCd9uNtCRM2hwA8k/edRSCd9T31zSFg9BqyFyDvYD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Icu5farPTbosf0a8lvg256aNQ2/gkYZSgYbHtZ2z7r3dPzlUK9awR8VMU7JgOdLlRT2/ev/Sjo8mCHhn1dhJkOVEKNFFSkOqyFgeqCQHBAGgrzk8O18+JEyOTE3kKnu6/A21iU+3wcV7x1tL3ZNkRnwhUK8ZuppWnL0qPf4ZREg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8XrAQWg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d461162b8so1427275f8f.1;
        Fri, 18 Oct 2024 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258519; x=1729863319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo7pmWVX1OVaFTdkkZPlKolKf8bJGft6RtN49GD8+ys=;
        b=g8XrAQWgeapABLZ2J0I+77Ya8a6Ac5y9YAlvnT99bBCVcNW7nIwCg5Bl1bxwH5wh/I
         mA4xRaucmxzL15jT5D2vN1UV0ssf+uMLsQ/niqkkmLLcgErlfO4L+ezkTel5Dq9Jw7Ff
         tzoch/8saEotYCQDXjVguV4Gd2K0hfTAUYZm/2JgsmovP645BF26dNqDISRmCXSQZwUA
         i/Q614Gmxg9xJNG4XMBxDYfUgFSHJGqR0lfgaXJrXTYpQC5/qBfvouF4op0WdX23ynCt
         aY3ynIZ1AS7sCAcehtk4vCC/MxVslaPf2wFHVmy7EH2+5rlvhD94qsr5RXBsRhnLzmSl
         zLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258519; x=1729863319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zo7pmWVX1OVaFTdkkZPlKolKf8bJGft6RtN49GD8+ys=;
        b=I/EBtB16fdyFm25Lq/wQFS/yMxRSsrRQfFS0ba4sgqrrG8zF+WT91yh8k2K27RWe3j
         PkOD3H9Yhg3GyAh8u8ku1JXgDo4kqKrGk6/V8UwtVRD4O9IVmEpn7fUhhbM32Ad6PWNU
         +/+ySmgq2HZ2eaZoLQEytqY25f1xn4gOKl//UbMz04DATrLORh3qrK6jPZHjZMIKzp+o
         tI7wrsLu040O4ZuUXy8F3ubEkNNDtVbKFZbt6JCvxLCnIYuYI1kWF4Hb2zYGLphzqySg
         AJFGGch/yr06n9KpWoT0FCd4dkkf+yWRe0q6PEokxoLlVPqcVLMaeM2NRJz3A3UdI3tJ
         ecug==
X-Forwarded-Encrypted: i=1; AJvYcCUa3Yz5aZ4do40S4YkEY/VptNzvykGiStm9tRgHWwAjWBQdgWXxZgfLsJJvv3InQ+f5hkm+8P9yuKI3250=@vger.kernel.org, AJvYcCUguO/L4slD4/r6sbiYv9yQUxJHySSMJgtb66Fog0Rhdjtc3Dmx84Up3ug6CdL45qo24/qFcWajWqfkz3Gn6d5k9Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytr2SP/9A7hGWaSNdNJiHalKmaVPZU/HRWlXZh13pVgR3fSZ4p
	Pj1vIpFFBThq+yx/HlPt2BKRYVbbYB+e05habTE+g5Vj3BWwbySW
X-Google-Smtp-Source: AGHT+IHsA660u5v21wJKhR99XiJHegM0AcG5/YRHw4S2pFNWY98a3Du0snvHav+L1CWNCp/S2DlihQ==
X-Received: by 2002:a5d:44c8:0:b0:37d:501f:483f with SMTP id ffacd0b85a97d-37eab6ee112mr1632466f8f.44.1729258519021;
        Fri, 18 Oct 2024 06:35:19 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 19/23] media: rzg2l-cru: csi2: Use rzg2l_csi2_formats array in enum_frame_size
Date: Fri, 18 Oct 2024 14:34:42 +0100
Message-ID: <20241018133446.223516-20-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of `rzg2l_csi2_formats` array in rzg2l_csi2_enum_frame_size() to
validate if the `fse->code` is supported.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 7a658518b4d6..4073452f3a66 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -573,6 +573,9 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index != 0)
 		return -EINVAL;
 
+	if (!rzg2l_csi2_code_to_fmt(fse->code))
+		return -EINVAL;
+
 	fse->min_width = RZG2L_CSI2_MIN_WIDTH;
 	fse->min_height = RZG2L_CSI2_MIN_HEIGHT;
 	fse->max_width = RZG2L_CSI2_MAX_WIDTH;
-- 
2.43.0


