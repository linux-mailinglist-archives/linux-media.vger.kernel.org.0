Return-Path: <linux-media+bounces-26527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70850A3E80D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 00:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2184619C1E2E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 23:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2089C267717;
	Thu, 20 Feb 2025 23:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4zg26CP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7E62673B9;
	Thu, 20 Feb 2025 23:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092930; cv=none; b=qO02is+QNYf+aqiTydLS4ZJ3SOxUEpRDMfknghQK2bLcrtIx/8u+Mh1MyfZuccRUl2gLJieOaVCfOcpWTDHWk2izAAQYfNYUMkxUyeu9hzB/hEPavLwkCL7DI3cOu0/vYFGJqh/7q/Em0eACnO933ZmhKOajKB/6jMGkKY/wyUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092930; c=relaxed/simple;
	bh=lg2S49Y/PXrPABJ4Pn2C18lsbCiXukENnnTBnuXF1lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUyLPrubfv0dZnNdmKuAx2sAIYmYV7tiGae+5R8+JoFaV6VUwzk3Z53QHKzkM1aVJbaHB2O6uVdYgvscUGUvaIKlxPL1W1mzR1rmY6ILMhrl6TVUUm9IN401enLvlquhEfJJdGpHYPgzpG2d96iO52lFjSc7U/Pa3ynyqqbw83w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4zg26CP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso289324066b.0;
        Thu, 20 Feb 2025 15:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092927; x=1740697727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=Y4zg26CPh3tC35wfGqQ0NqWxdHK0qQJTg5NfK82aDuKVluu0jV1dOUF5evr9E+N+EM
         znQx9WrVJLq2YG9adh7RAYu/3EuF/oAZDVa/KmXQC321LRiyRSI2Wwa1Vbl0fCvfX4Xm
         JjPk7YZk9x3afXWKlKSmf7mcjQ80SNJiFgcaXLmHGDONWzEylD233zTyVPZvgB5HCE52
         Ijt70f66OBn2DWc1NnZrqZyympy25Cztf2ly1RsHrvofYlT+zr5SELjIUgEQs4Z8by1N
         hMzf8FOHjp4DM/yxd2/folBFwmqWyTMXLpzh/pwwhf2LZwMVm2PhDtB8xqwsXjYm+3fA
         jESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092927; x=1740697727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=SFj0V7mPM6tvVew6010YkDU0sIaq0HVFZf1IV6LtI6kR3O470YtWRTL18GMBEacQEO
         vSSxOPyX6WlW7ZgHQdMLQg4IK+t+n9Ek3h0ccY3X4MPHmoUdnM9Ei7ocjFAjtDgVePQo
         qWtYDw6krBhOOquckYbygmDZTYqTAdWR8IEIG20I4VFjuLD6UNbj6gOn8E8jgppdxToS
         nx5RaZN2UC4eTGw9oqstZ3HpJxf8Q9xBN09LxDEe/x5LfT5Gz/TosxEAOC9KLnGgM3JY
         3rJuaNjrXdMfooYOhNZvsxZSvAHbYQeNewkfDU3a0fP9b1gHO/IHQCMNK2zrRsbHXMGO
         1ahg==
X-Forwarded-Encrypted: i=1; AJvYcCUdmva7heBLtE0EdJwY0ctQ/80D5Gc5pdbnfYAzTSWKWPQhw2KxCd5mE2yPw6JX7dsaxstAxxRtQJOciH0=@vger.kernel.org, AJvYcCVL2uEOKhVHxnz+qB/nygdeGlPLrg29mZTKuSdHofcF6RZdX98FQWSWEtpJw+f6w9aqemgVG2u20YgOYKi/@vger.kernel.org, AJvYcCWgd9Kgllk447f47+858lvqrSRPnAE2FdL5pXVVer7JYwsS1C51rJgQZpA5ANbSRqmHHzeXc+5tSaCh@vger.kernel.org
X-Gm-Message-State: AOJu0YwQD6xEaU6+kKu0qDA59ysOlmP3yy3ixB4DESnacMSRYTmAj2aM
	MepLf8DngDI00RmvN3A6NB0gMM/hASxDYMp5KIlFwfyN4PoBXBiJ
X-Gm-Gg: ASbGnct+y3WCavN2s3IcCTVrnqBjwfnScWsUO+RWmr3DeYIcucBMKCU/06LUcysoLh2
	vlpZ9L+asZ8m7DwlVamlD8fAmxnbd9oAWpKAIWoqrManrLe32yxUFwPkQudufMYBdOM7mgYbTf/
	LVWZvbRzNUnvpBR7APW0PDjymnFfFwNilTjK4m2DDuE4+19T2PP5vWM3QTpVNL9PLyDhjBv/EoV
	j06GVtn7al/T7JAWezGYDIkZgCjHl1K+Ym3zcTbnAZBnH48FQrCA+EIu+Lff9lK3TfZtfUzN8bG
	xGXE4pswN1yo/9DhWPVSpcCExWVQ
X-Google-Smtp-Source: AGHT+IHxCyp3AmxX9+y1FumuMZ2w71DFr0p5Hi7cNfrmyJDTIG49fuCS7zq2b1FXlJ53fyeJ7aqZdg==
X-Received: by 2002:a17:906:3151:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-abc0b037859mr72192566b.24.1740092926822;
        Thu, 20 Feb 2025 15:08:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:45 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 3/6] dt-bindings: media: imx219: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:11 +0200
Message-ID: <20250220230818.275262-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IMX219 supports configuring the Virtual Channel ID used for image and
embedded data streams.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index 07d088cf66e0b..766b0e5fedb05 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -66,6 +66,8 @@ properties:
 
           clock-noncontinuous: true
           link-frequencies: true
+          vc-ids:
+            maxItems: 1
 
         required:
           - link-frequencies
-- 
2.48.1


