Return-Path: <linux-media+bounces-29840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E56A83811
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 07:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC2E443466
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F991F1515;
	Thu, 10 Apr 2025 05:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmhJZVPx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688CF1A3150;
	Thu, 10 Apr 2025 05:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744261611; cv=none; b=oUG0BR0B5jd9akCz2ukXeK4/x3zkGGneL9THSCK5CtgTHbZe3oPFsPzEMpCc6/rluz0wufeLRp+t2Re6/IBlvdPrAS17lcKn+mlmzStgCYUdnfgNFXtUGKE/9Tntia77hn2uTgYoHbh7HclMG0wme4ID5h9nW8rd+/H1iiGnTJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744261611; c=relaxed/simple;
	bh=8rCqixOvDHQ5m3uWKiliryBjCwbDUjuhy/lmzWlucQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EW0Z4TOgyQ8sUDRv+p3Q4QGVmlwUs88ZJQnHIxW/Sthp5M8q52vpYFlYZqWM5UjPQhB1+5/8lnnwL6Vtb5//IofvdW6Wln5gQtNwBP408bZYv6CTKWqmE9nHhVjoPiZEYX1pkH1xObU4jWrVs9gfxvSe/gZhnneadO1+yVHD7Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmhJZVPx; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-736c3e7b390so302468b3a.2;
        Wed, 09 Apr 2025 22:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744261609; x=1744866409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d46airT75vHv8EXQAD6iB9DXsZw0o96cfAedDj25Jsg=;
        b=JmhJZVPxnoTEZWD3g0E8kv+IdVPl6Z7qly8k+c8p8FUHWfpcJOY/ROl6eT9YYC5AWj
         xpZz/ZXL+PWE6Wwd78sLsFIDd2JspPlWxPWahVUOwvnu/Nw6In5FbrzGUNVdfLdfHBea
         hambp4sIk6AgvHP1byttMdeMEvb//yKWigAu2TjtyrkfwcTRsgh+GWsXO84Q83bJhlU/
         xbw1cf1HEbdthA+1wI0RCQJZVAcQNMrnyPwNUeBAkTmMTskDPq2nrMWProsXRkMCzZPT
         UaFkCAuNdihoyX1EIYai6WF23csnweUdpc99guEOYCwOfOqTe/An11CoZ2MebiwVeh+x
         +stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744261609; x=1744866409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d46airT75vHv8EXQAD6iB9DXsZw0o96cfAedDj25Jsg=;
        b=EYWuW34fvZW2jQtV4vjvokUbrGROUTBaLHT1ETy5FjUudb8FPNz8sOMA7olxjqJQJt
         g6QBkErLiY0dg/4xoK3fnpQEHP06rH3pYrhcsatMDuHVMIdFvmf2MGwg741BDSViF7vF
         YO0BiqkQCKDSaIsTrhKM3kTLdT92fpFmkJqs/M4CtcLoZNRh6zi8pdrqjvuRyFCcuOD2
         KhRF1Vp/yWc2TMLyurYE9kM2sXT0TfagZUMhDNo/H/nZewjOXJrOsvKWpgc8jjbcPpIE
         Mx06CQLCOxdzb67ebh1ASfrOOKCyoGjYq2w2G4cMk31Z75488QICb6QL7GXySHvfPZzL
         sYHg==
X-Forwarded-Encrypted: i=1; AJvYcCVvCSD1CbJC5nNvG3XAJaIWzTLo/QBwuYTU8IoX2JeV+Z4edG66erNKzufzvQcPvZs5M3mPhHr+XAg5EiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzKqZeOow8OJPH6TD7IxYkzlWL8q8Xs0XHB1cEFP0Q8DCvAvQ
	nlY461iP0/UpngKPqJGw+jtkokhVLdIUev1QV1ELNPkZTXP1Nn57
X-Gm-Gg: ASbGncuVGQy7ga5HIMr1zJtV/7rJ6hf+rTRKaUpeGrJgH6GhqLzko8aWP/57HyxCX5g
	HNYxiztewJ7qdZ7V8C5HlFfmgsbCIB09Hw0V6DiJUCl1wOPmOhIw2tGNBbJX6E5vtbdCCcvJSyh
	uOT4gzEGyUfcIXmmaaCjFOuwa7s/GXV5f760m4tCDyV+T2ziKaiD3rWOCPC7wyol6xOCiu8SBNj
	qvnQ6Z/RQvvKVsrq0L5+jpAKbKU+bc2aScvOQ0gbJsjbum8rjzVFQL2GT8NV5t3Lyxdk5EdmBZV
	DXw61Tb5++ulVqNNRJJmP7v84JSL7hJauzApr3aCMUYpDxFEGpMLZpSwDmM6
X-Google-Smtp-Source: AGHT+IEyf/jfRZocce8XbsHKUc43T+JyTF/Sk4rwsW7yZtcHMwpngitvkGrHYV2zaS4TA5tWyxiyjA==
X-Received: by 2002:a05:6a00:1310:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-73bc08129b6mr1309744b3a.0.1744261608589;
        Wed, 09 Apr 2025 22:06:48 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.231.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d6af12sm2320503b3a.80.2025.04.09.22.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:06:48 -0700 (PDT)
From: Siddarth G <siddarthsgml@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Siddarth G <siddarthsgml@gmail.com>
Subject: [PATCH v2] media: imx: Fix NULL pointer dereference
Date: Thu, 10 Apr 2025 10:35:43 +0530
Message-ID: <20250410050543.6963-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cppcheck warnings:

drivers/staging/media/imx/imx-media-fim.c:79:6:
error: Null pointer dereference: fi [ctunullpointer]
  if (fi->denominator == 0) {

drivers/staging/media/imx/imx-media-csi.c:795:27:
note: Calling function imx_media_fim_set_stream, 2nd argument is null
  imx_media_fim_set_stream(priv->fim, NULL, false);

drivers/staging/media/imx/imx-media-fim.c:388:3:
note: Calling function update_fim_nominal, 2nd argument is null
  update_fim_nominal(fim, fi);

drivers/staging/media/imx/imx-media-fim.c:79:6:
note: Dereferencing argument fi that is null
  if (fi->denominator == 0) {

To fix the issue, add a check to validate that the 'fi' is not
null before accessing its members.

Signed-off-by: Siddarth G <siddarthsgml@gmail.com>
---
Changes since v1:
- added "media:" prefix in subject

 drivers/staging/media/imx/imx-media-fim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..25f79d0f87b9 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
 static void update_fim_nominal(struct imx_media_fim *fim,
 			       const struct v4l2_fract *fi)
 {
+	if (!fi)
+		return;
+
 	if (fi->denominator == 0) {
 		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
 		fim->enabled = false;
-- 
2.43.0


