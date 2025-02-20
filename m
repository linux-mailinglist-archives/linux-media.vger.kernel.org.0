Return-Path: <linux-media+bounces-26473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9EDA3DC81
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85FE6421B48
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50BF1FBC89;
	Thu, 20 Feb 2025 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvbvGD/H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7937120487E;
	Thu, 20 Feb 2025 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061076; cv=none; b=A5e9bjv7PpxJmi1qxNPL3HM7FfnmQo/wPKpnsYfhoVv+lQ+qwxVBn+zAWPwjFWkhRCmEafYuMH8wqVzdqDKCpS3o6KY2z+N1DDBQIqFinFDrAujkAAD5cakdALMZvB19s4pBDKjvSR81cK8DczH6VdZCqWYZehc/HJrCB0+2WzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061076; c=relaxed/simple;
	bh=lg2S49Y/PXrPABJ4Pn2C18lsbCiXukENnnTBnuXF1lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rl1p2WxP6NC4UNNBIz+/fwJyDRn0kIustLmQnPgEo440ZkJHOEoV+N/5kthuPjJiTbZ9o/Qubxochv4N9BW225QLx9X1GP5nU3XXTYA9utUSll7UJSe+GkPHC+lvepFbDh3wpHOQk2F5pvWUDwLH4IvMafl/iiFZGBO237gNbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvbvGD/H; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so1861655a12.0;
        Thu, 20 Feb 2025 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061073; x=1740665873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=fvbvGD/Hr9MZbrNRcyFGwOLFy4SifL8xMpfV5o9SLD090ZVxZ7Nj9skZQhKl1X3xK5
         T95YmEAG41ftEPeCqlmEVA4xgs8e6HkOmYmomaQyrcV0imBeCd84rfUSuoB0Upzto50Q
         LUhHyJQ1hP/EKyV59s77Bc3fCBiFy2BB/a6Zx2Vd5T7R/Zq7I7yB6+ufKzVx2I5m5gMO
         vYO7YwiqEoiRgwlIkMXhi5rBwbVRFhzydetRPHrAMQX4yuuyuF3jFYIaaRrFY07yimW2
         9+OR1vV5Rp0QvxvJI+XRoNJH68xMEv2HFfaOUCLOwl6lvVY1dz77wQxTjAkBSzNHzatK
         z17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061073; x=1740665873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=haMmZbFEqgxKXEE3RDLbAHssaL+MMgjC0jGeENmrljD1u6tU6q339L3RdA3SDi3qV1
         TTcn/g8RNxVj+025/smrzKHzdKVwrtdy3bj6EElpYOxhwiiTRbkl1mX0Pasa4w0EiA9S
         inFOkPe7kc02xhlhe1ujZWCKSSNLC/nlGe82Y262tnOoeMeNLboayY5G5cyxl8xFiPMU
         P14Si8hyMr2eaWcv3bqeIR87bebvNs6Ml6xk6vadUx58lvv29GEuaUnmf/ysjorLluvg
         GSDZaxE8M2nLzzWSMwQ/jd2kIt3dW1jtuNGzkCp/xXa56piZagKT9nVQAI62IMIdxQFM
         2ODQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDaf7OV+zJiOFl6+kUnmZt6oxIq7jRllUsauJk6+Lazr6M0JlfkwDg4BABZkmS6+dqH91nTHW9Tk7y@vger.kernel.org, AJvYcCUqff76biJ3XTD6yBf5OAExeVaMdNtbdetAb07wxa//o/Re/MRaFoVmsFUvDmj6mu8XQog6teOSQl9QUqqG@vger.kernel.org, AJvYcCVCuHOgjFMV1yf0VfZyzcUEjR5K9o5NmpXtMUy/EW53+VibhcZI2HQe78Eu531U1yuz96SyDGM3qpMFb1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr1UKOeMeMysYGnkIOEBEPjfNJO7FBJ50RBSlFzVYede0RWs80
	9SvzQ5d5ph0/XU0kEOw78H2ZesmErQD5Sb9iHG0Smqk3BkMciISZ
X-Gm-Gg: ASbGncuOPLazNBTwk3FYnjNeQf8omWYpNKcJQq6uEkkI9bq/iQnm6j6AtUabxnfrkOx
	wXWWFNbwv/GbLnZzU/XrWW/jIL2RW1kRp1V0GL9L070d/vs7W1wCRD5/4yG+uvPopYRSzzS9Qpl
	bsAIDb6eqO/vwlvjl0/chKO5xGoiJijMwj9h4DLsS5OtFS0d1wpYZlJjkxCcYUCYGK79Pj+OlfQ
	AKYm2wdZJhPUpnpv40M/WUk9VTLyfIsT4gW0H2Mlc9t5lo4VfmYlaSJHD9mRDkJ1DOqrhHum95s
	+VnnBt/C9WSX98jSGF8wbzsknKn4
X-Google-Smtp-Source: AGHT+IFJTXX+DBbct/Jp9j7V17SgXIyxDY15+dtpRb6rLc//WW+3bSD4xvTcn19KGL1thCMxcgoDSw==
X-Received: by 2002:a05:6402:268a:b0:5dc:7823:e7e4 with SMTP id 4fb4d7f45d1cf-5e0360b4cdcmr24048577a12.12.1740061072625;
        Thu, 20 Feb 2025 06:17:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:52 -0800 (PST)
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
Subject: [PATCH 3/6] dt-bindings: media: imx219: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:25 +0200
Message-ID: <20250220141739.228714-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
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


