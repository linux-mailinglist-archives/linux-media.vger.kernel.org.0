Return-Path: <linux-media+bounces-29980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB56A84D8E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 21:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CB824C45CA
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 19:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B4A290BB8;
	Thu, 10 Apr 2025 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgiWjwxK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9CE1F09BF;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314798; cv=none; b=NmSvffQ80UPgVA+YNiyAm2GzRQp+Y0rqNzx/S/0WdpPldyOYSGjeCuuZTjJxgvT2sTrBpBAJI2cS7LjDoFZa49yEtAGOWwDwhdHzrKIGW2wiB09FCvpjTVUnUw8NDxai9Qda4cqMHXjc6AkJ3nlzdE4X+SkcM219BhUt+9b2F8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314798; c=relaxed/simple;
	bh=SabI+vQohgwZoGDBdV/O1b0jCw1dwkyTziMkwNMVoak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kp0/wDRKXqmsXXWO2pstothtMXeBjewru7bRzy+5oxA+ko0U5LYxmslzVvrDNlVA95wmW9OXqzcSVYVNsTqEiWIC0ovLKo3ujUPyplqbPHPTsPG3A9vd7Klrea+jFdutKTr2aGi5pIebHm9jRBNruFL1NVdmsnA4NjRBUNJm6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgiWjwxK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49344C4CEDD;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744314797;
	bh=SabI+vQohgwZoGDBdV/O1b0jCw1dwkyTziMkwNMVoak=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MgiWjwxKrjSiKCQ/hEBawyOjZ+luZ3Unss1ZioKO9vBxc8KkZbP/2vO+20my9+58Z
	 Y/pi8gc8ZPg2l69sTTFONmTYi6VxHLC9j3Bo/AdSsDoYLWZmhyswGUBAD+YJbeIKFl
	 Rgqu0L2YlWscNrHhNMpegdtqw6rPenyGw/SVUCtw+50NFZA2XRyLgpgrT4WOI2IMi+
	 lOCPNOoIzXTgTib+CYrt56aV+CwZZR7pwy3GS+74Ch5QaUsvoqIHtOriaouXb5yyF3
	 /LvH+FO/GoV5pIy1g7iFSJ8e8vleNMi/ABHnzc5NzjCgXpahogq49rD/kyUbygCWf3
	 lSlr+cVGkcpZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36501C3601E;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH 0/3] update e-mail address for Michael Riesch
Date: Thu, 10 Apr 2025 21:41:29 +0200
Message-Id: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoe+GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0MD3dzEzLwSIE4t0s0F6UzO0DVOMbQwNTFIMkpLMlcCaiwoSk3LrAA
 bGh1bWwsAMGSZLGQAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744314121; l=1300;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=SabI+vQohgwZoGDBdV/O1b0jCw1dwkyTziMkwNMVoak=;
 b=EeQE2RZ6/nv/2KYm3bdfAzi43a+GNtVc0yCaKN/zDsu0Ale+mzT2Xw5s+1uuu3I76u4imTJqv
 Xz5rGoJNIjaCcWoVMUQQ7LSUJr7Q/qR3XFewc1GOmyqWbAMIBMokQho
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,
    
"All things must pass..." After five interesting years I recently left
WolfVision and joined Collabora.
    
These patches add a corresponding entry to the mailmap and update my
e-mail address in the Sony IMX415 image sensor driver, which I would like
to continue maintaining using the new Collabora e-mail address.
    
When I prepared the series, I noticed that the i.MX maintainers are most
likely informed about every device tree bindings change for Sony IMX
image sensors. The first patch adds an exclude to fix this.
    
Best regards,
Michael
    

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Michael Riesch (3):
      MAINTAINERS: add exclude for dt-bindings to imx entry
      mailmap: add entry for Michael Riesch
      media: dt-bindings: sony,imx415: update maintainer e-mail address

 .mailmap                                                     | 1 +
 Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml | 2 +-
 MAINTAINERS                                                  | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250410-maintainer-mriesch-3d18540b2fb7

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



