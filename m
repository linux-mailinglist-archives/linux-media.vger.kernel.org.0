Return-Path: <linux-media+bounces-1379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516F7FDC25
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 17:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7F8028292A
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 16:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02513987B;
	Wed, 29 Nov 2023 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2xIBMS5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEF4BF;
	Wed, 29 Nov 2023 08:03:18 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a013d22effcso935082166b.2;
        Wed, 29 Nov 2023 08:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701273797; x=1701878597; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0ai8ILE74HcwdOUqvcTpl9qjFRf+Vf4A3Z9OcifiLY=;
        b=d2xIBMS50Dd47pj3uwPWU91qG6MkJQgowYrsyTgYmhTWzpZgQCBgvz85++iaDiR1/Q
         RDf534I25mMPqyrzUUyl0yd5SORtKnNPk7nrvOWU/aUvtmERIKmoM902sTuvaZKfdfP2
         0WOdxiVZ7BrQ0HliVNInZ6e1qr5bBxaM0/nNlGVa92mzq1srmoKMsqW1UNwLyBLVesw3
         E3YWgvI6uL9woY9DtfBLo8ypfHzQWs4F4QClLRhTUlpJvRQxxQPd5TBzxXcAcXv/RqD1
         iKnLdo6MEREN0eTCi6y0SOEn2tHHlwjzlHkTsRjMcT8l7zZFRxKLbsMZJbY22Yz3yMZG
         UUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701273797; x=1701878597;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0ai8ILE74HcwdOUqvcTpl9qjFRf+Vf4A3Z9OcifiLY=;
        b=sVeiOFA5V4VKw9wjAwM/MTJ/9C0geSltvZ6hd9wu56WtMFhvn3wZrX+Jxw73YK5RzR
         DnpbkHHbnJ4mLROmCs6Pg6FO08Uc98R970ycyeXDHIbzirJWFwIr8CmzJvtRFL81nMUf
         9lh2IqHPyV6NRrUaR+0YuwUWs4tvVIz3BFY4gxF811gwbaXAEULdfy6BcMAmphHh7QEY
         toofiJjftJ8BjDB/bMMZ+foKVLov/5vxJzVBn9bu2AJL2nWYZ3BDkqwxafGVsmK2Kos/
         dY55CMRbFcigAbRk3GWwdxp9+UjttLJ+WJMTGR+n3Jj6PqSIU3e2WyuXYYX1MIxmJLXA
         NQyQ==
X-Gm-Message-State: AOJu0YxRdvY3MbVY8SBLrJk6whHA+tEhSyUOQt9mapCkv7Ga6EmvqG09
	IcIhRTx572BZck4pR2Z7KRC8y0HuvxI=
X-Google-Smtp-Source: AGHT+IFZVdYm5uGTUWgukbhvvqVrPFRUit9xzFKUvmv5eU26LhTvANp9htEXiGH1vrlI6oIoceMNRA==
X-Received: by 2002:a17:906:5302:b0:a0c:5bf7:c675 with SMTP id h2-20020a170906530200b00a0c5bf7c675mr8264434ejo.40.1701273796612;
        Wed, 29 Nov 2023 08:03:16 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:2564:b975:71ee:2d88])
        by smtp.gmail.com with ESMTPSA id oq14-20020a170906cc8e00b009fdcc65d720sm8023872ejb.72.2023.11.29.08.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:03:15 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] media: MAINTAINERS: correct file entry in WAVE5 VPU CODEC DRIVER
Date: Wed, 29 Nov 2023 17:03:13 +0100
Message-Id: <20231129160313.12093-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Commit 26dde1beb359 ("media: chips-media: wave5: Add wave5 driver to
maintainers file") adds the MAINTAINERS section WAVE5 VPU CODEC DRIVER
referring to the 'cnm,wave5.yaml' media devicetree binding, but the file
actually added in the commit de4b9f7e371a ("dt-bindings: media: wave5: add
yaml devicetree bindings") is named 'cnm,wave521c.yaml'.

Correct the file entry in WAVE5 VPU CODEC DRIVER.

Fixes: 26dde1beb359 ("media: chips-media: wave5: Add wave5 driver to maintainers file")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b108946b00d..31baa4bf525b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23485,7 +23485,7 @@ M:	Nas Chung <nas.chung@chipsnmedia.com>
 M:	Jackson Lee <jackson.lee@chipsnmedia.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/cnm,wave5.yaml
+F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 F:	drivers/media/platform/chips-media/wave5/
 
 WHISKEYCOVE PMIC GPIO DRIVER
-- 
2.17.1


