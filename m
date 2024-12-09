Return-Path: <linux-media+bounces-22885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7319E9326
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6D691886641
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ACC2248AA;
	Mon,  9 Dec 2024 12:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kR1gr7EF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0595221D9C
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 12:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745673; cv=none; b=DqS+yJuitGT39VrAomjOI9sQM7/cobMO2+sslFDznuB5rNgnWc9XC5h6oy46I0BXSOtmxnhxO4kg2WqbwZM3k7hNRVjtXBj0bc9tmmD0vrF/J9NFQ3NRAQ+il2XNVEIR7JkPK89mW1o4ATCN14OAaKWwitduYdpCH9rxPTfYzbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745673; c=relaxed/simple;
	bh=U6FIxo9NOFz5aJHwz/CGu0rXqmTcBFULicoq/xd9RaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XtmK7+zREnVWhG02Sc8heiiSNEVFfQ9TaC8hckOxkXPQFhQuiOWT15t8tz7jQ4lzcMT4spUH97EoKy/2Mg94nfWEokGaY4HPiz+YVxOqaEzfRrLZaaofDxwxuP/yvS9dSML7Iaq0pKb9uqk1AIXDssOnQ/DQeyXxgPH+s8Oy7DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kR1gr7EF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa543c4db92so4052666b.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 04:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733745668; x=1734350468; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIbPh213uMn4RKe5AQAX5FOeJn89qdDTeC1KU8kliyE=;
        b=kR1gr7EFLhCP2DJof4vpZ5Rgy/H5KHnEe7uuce65uxmg4RJeI2WAE+C0HOB5XWn/gP
         7EHQe8nq50AP4yJXGnSmZSGZWifePJdjrzxN4Ky/KGo8jLN7fmMJeWuWRHKkZsRWaORx
         clq/QtxBnAGnaLYO4Jj8FRO1Ovwbjzc9UDhSeiE4c1+8sUhQZKTczksh2/qCxtly+NSp
         8+6UqbRu31wDh+FBbmanO0g05i38ZCFPSSyQUjlZyd/0r7gvnErHfg5o5TQsXLyloXIh
         lMEQYfneEUp6FsGS8px4Y34KVs222KxFaXgnaAvwI2XgitguK3SrP6xobvxnFl7zCd4m
         YexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745668; x=1734350468;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIbPh213uMn4RKe5AQAX5FOeJn89qdDTeC1KU8kliyE=;
        b=A7ElSN1fgVNeiDBbbytQ7ljqYFF6i89SyRlqzxpWkIQid1bmsXm/40CBBTggjDkRsx
         880xuUcI9iMCM2+naFkgasFPEYYRorhmEjf1nVcUG087p7o9LPCkWAhLxbvlrs6CmKF9
         geu4JPyP+9VOK2ogAXyu0zBgXzD1uwhdWhGxFh3oPXZ1UYd4NhML9fuIGwaxwUyqPh/w
         SBSIUfA3pkQMXlMMrKeGP17vr4BL1aakA6m0HYvqkJktOpiRhslUVFCKeJDcoksx+Xff
         KxJ7VaeHt4tLz19QARWTWTx4DfPRsUsu0oBzdWQZ1C5/MbaZifWonYuPZFwEWSLkYTmM
         ialA==
X-Forwarded-Encrypted: i=1; AJvYcCVkWNFDs8ap9UXvniyCmMalwL6r1mF84g+rxDqag7+Qx62m3Gbjt25ybCbmx55EzcODcK27+S+OMhl3mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ7R4wPg/Ak8RXhhSX7ACPp0xcWGYirybfEW2pwRlpRPFLa19j
	gP/0n3CPdbRidFrCCn+spltTGqRfGjPNccaMSqb2wv5k2duvZ33HsfU2v0MIFLs=
X-Gm-Gg: ASbGnctNHBkBRUolyiGAKLkYIaXTxw56+4AqxTO3xr3KH4uPsw+Jx9+VcfHeZf7jUSn
	8LfHjp2RkXt70gPNVemdkS4e49xItOeDO9kuzsjtAKkgjIQCFiDQEf9s5xKDpbAM6FPFOgqmK3T
	eOduT7mbVBvmWkRK8C3VzJFNBGZD3vfRODdqUeh/JcRpD/UzYl405EsNKsYoKDuikR2hKNFjRpe
	mwCtfT3En6Z9Ki7s+t8iRj+p8B4ahWJll9IZK3yhUp5vLzoxXfmMvbecAaXJxDhz1M58eVr1KOx
	dkl1eP2enYEhEl4Eha9TlCILT04cWGF3gTEPHzWBkZPY/ltk36QOBdEM2f9QI98SDQ==
X-Google-Smtp-Source: AGHT+IHIzUpxWEtu6qwCt8niQVJmNjY0QttQwYVmWWK8DQ6e2I9mse4mlgRgChp2cySuPRm+pt0vIQ==
X-Received: by 2002:a17:906:3087:b0:aa6:9198:75ab with SMTP id a640c23a62f3a-aa69cd5193cmr7199166b.26.1733745668002;
        Mon, 09 Dec 2024 04:01:08 -0800 (PST)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69afa395csm22555066b.71.2024.12.09.04.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:01:07 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Some small preparations around CAMSS D-PHY / C-PHY
 support
Date: Mon, 09 Dec 2024 13:01:04 +0100
Message-Id: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADcVmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwNL3eTE3OJi3ZSCjEpdi6Q0E7NUI1NDI0tDJaCGgqLUtMwKsGHRsbW
 1AK9/BBVcAAAA
X-Change-ID: 20241209-camss-dphy-8bf46e251291
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Since the hardware blocks on the SoCs generally support both D-PHY and
C-PHY standards for camera, but the camss driver currently is only
supporting D-PHY, do some preparations in order to add C-PHY support at
some point.

Make the dt bindings explicit that the hardware supports both (except
for MSM8916) but also add a check to the driver that errors out in case
a dt tries to use C-PHY since that's not supported yet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      media: dt-bindings: media: camss: Restrict bus-type property
      media: qcom: camss: Restrict endpoint bus-type to D-PHY

 .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
 .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
 .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
 .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
 .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
 .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
 .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          |  9 +++++++
 8 files changed, 142 insertions(+)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241209-camss-dphy-8bf46e251291

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


