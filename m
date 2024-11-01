Return-Path: <linux-media+bounces-20697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B79B9259
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 14:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B8812829EF
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 13:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9AF1A0B13;
	Fri,  1 Nov 2024 13:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="G/N6ZvaB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB411A0AFE;
	Fri,  1 Nov 2024 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468853; cv=none; b=TDQTBCaWnhNpvYCWiCV6qOA7SY6/bCkl3+UuMD2AckrBHZ+EPj+BiOQhJlFoX6Aa9PgCBtnEHyGNYxEAmJz6PtRh0kEU0isGoeAN2U323YrJX6s3yyG2/WNk1vDXunzTotQDxb9b2aGssGJN8fYTjBBw8QFbl6URYXD7bLn7kXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468853; c=relaxed/simple;
	bh=T/1vMKtCA38mIrGWbm6fWsJ30Yo5hwizSzXQ1B/dd5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vBVQURBvkNH5w7xIYhDwFDxre/atIxsqO6UWnCJ6yTyIrL3Z0UqOW1QXJbl5DHD9seAzvqRSvvq55t6Ff+dI2hIiXmtRSM4OmrDw8Vx/9y7K2EVOus+sIWuYZP/Dl1zC6IbYIwPohr4M2YFXf2piBNPH5/tEwKtaCg+GzstN5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=G/N6ZvaB; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.130] (BC24930C.dsl.pool.telekom.hu [188.36.147.12])
	by mail.mainlining.org (Postfix) with ESMTPSA id 06E23E45AB;
	Fri,  1 Nov 2024 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730468844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KlGN7rLdrvw9HV0QDCJ28arpK5PO8WrojsH8+qLI3Jg=;
	b=G/N6ZvaBzzfg169im1cDBPAkEbL2bpXcM4HPxNk40ut6egIwCsqiD4unU7dEAr3JrvwE9b
	S3Y3+AjvKnyX157dLK1dexMjm2AbFLThxC1kRU889l6qO0cwuNJMoUxKpyZe7GJLax+8tb
	OOytS6lyDq/E7FoW2TEIpCKLxjp/5YsktZF6aVzXHpNPLEvT2NyPi7aaxWqlZ9GI8Y3FD1
	zNyTbfqVuIQPLT9f8tXz4xGzFtQwnsrpQHPXi0cpY8GwjNSadSd21stll8A0GJoLHfVnll
	65WTzA87OvL40rnCqZUzRNrfn769NZ1ULzsub3Ts8QeoenPQFjiEb1zZyElWTg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/3] Add MSM8953/SDM450/SDM632 camss support
Date: Fri, 01 Nov 2024 14:47:21 +0100
Message-Id: <20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOrbJGcC/x3MQQqAIBBA0avIrBM0rayrRAvRqWZhhQMRhHdPW
 r7F/y8wZkKGSbyQ8Sam86jQjYCw+2NDSbEaWtVarZWWwSdmmTi5sTPSoPPKDhb7EKE2V8aVnv8
 3L6V8TvbuZV8AAAA=
X-Change-ID: 20241101-camss-msm8953-3e8a0474e6cd
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730468843; l=1102;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=T/1vMKtCA38mIrGWbm6fWsJ30Yo5hwizSzXQ1B/dd5o=;
 b=hW8p/3bdqosl7Tu6D5+Pcc1ZfX5PcTw1DXzn+gixF312cO5ntyzGDMyd1CVb97IG6zTYzdwT6
 aiuFQlFey6wDgnFd7LYm5zyQwMZnnzHjlbg2tLJuMBaTXGhKB3CyP6N
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add camss support for MSM8953 based  devices.

This patch series was tested on Redmi Note 4 (mido).

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (2):
      media: camss: vfe: implement pm domain ops for v4.1
      media: dt-bindings: media: camss: Add qcom,msm8953-camss binding

Vladimir Lypak (1):
      media: qcom: camss: Add MSM8953 resources

 .../bindings/media/qcom,msm8953-camss.yaml         | 320 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |   5 +
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 168 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 7 files changed, 504 insertions(+), 2 deletions(-)
---
base-commit: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
change-id: 20241101-camss-msm8953-3e8a0474e6cd

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


