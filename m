Return-Path: <linux-media+bounces-14004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3964A913F33
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9982281951
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6865718A955;
	Sun, 23 Jun 2024 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUe8V2b3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B22186296;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184976; cv=none; b=MT/5TWdFJdJf5mHXKIwTqVTFECp9IMx7rul+VtqHbvvt9eU4/VY2FS5Cgdv3DfRj9/yBjKCdKOwDk1MqtNWufjoEg12QaFI2otbgm26vb79vxDbZ1y6bUT0O1tEzm5STGf4Q2P+WSr1jwAear6uT7uh1P0/d5wuopUfNvy7VFso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184976; c=relaxed/simple;
	bh=rOgR1WW/xbL4EEwa12yEe1zcnoAEtvtUA085CcCmHOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2UqXTziI2HTLPYTw2zDWAeTAZQaVnoDRRjeXtYZc9GtTAv0/5yIEzvfULkqsIlAj4fCX/Ubc736UY/qn28L8odHDgrwDF8EQWGD/AIp73faNYIIIpYqK76eiJzMD56Bbtwer8CnCk7kDQQ5Q/iVrQ9S3nRy/cSZbUqe8TL0FUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUe8V2b3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67B3EC4AF48;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=rOgR1WW/xbL4EEwa12yEe1zcnoAEtvtUA085CcCmHOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rUe8V2b3Gqo+eOQyt0maQvzm9SZBdKbLBlcYn/1UsVf7VYIASIRjqz8MAKO/wNP6C
	 x2lHGxm3ObhKiD92F+j19HZ5q1FD7LeBux7JVzWyJozL1PLkYlcZJi09zMP037rFih
	 DpLGPz3wnGa7N5RFsmlEyCxvgOpuOsC2QNCPiAfgy7ZxiUlmo7FUxWw0PZ93kWwcFF
	 rMmztbqS4ks5HCwJaQGphRGUUQewPtT5HwHPbPubsKQXB1FdFINxvpS9+kLRNS6hTf
	 hNP6GOhdJcMTt2q6AMRQb+qlr42pU1TSQSUyAyyf3ofwP4yNNcEAvDx7T4RN5/K5vl
	 3dpDwTyaEpnkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAE7C30659;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 07:22:45 +0800
Subject: [PATCH v2 6/8] Add debug log info to msm_csid_subdev_init function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v2-6-0dfecdc50073@gmail.com>
References: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
In-Reply-To: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184974; l=892;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=xalkNP77MBkGfMNCvE+EDKlSV1hYrIaNytEu+tgrW+s=;
 b=DhNwZ3i0n2A6g2xn04mAHFVW0aP5PSgdJNKSdD6r8n7PdY51bQlsdfAHt0/VTvjyyOGrFvgk5
 uUUNtXfX8LJDriZKfAHFJuTMZBWqB+oFnKpt1uCkzKvd9nzn0D+PPp+
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Print out missing clock's name when doing msm_csid_subdev_init().

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index eb27d69e89a1..02162bf9dbc0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -628,8 +628,10 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		struct camss_clock *clock = &csid->clock[i];
 
 		clock->clk = devm_clk_get(dev, res->clock[i]);
-		if (IS_ERR(clock->clk))
+		if (IS_ERR(clock->clk)) {
+			dev_err(dev, "missing clk %s", res->clock[i]);
 			return PTR_ERR(clock->clk);
+		}
 
 		clock->name = res->clock[i];
 

-- 
2.34.1



