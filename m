Return-Path: <linux-media+bounces-26612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7395BA3FB47
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE16E1891109
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCE6204F8E;
	Fri, 21 Feb 2025 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6xdUxjF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D88E286298
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155049; cv=none; b=i0vIyD0KDnlNX3LNci5bE2lfmEjIXICQ852FBfdanDTCZ9YkW5rHMLbFKsra21/Oc9+goy5pav0r5zxWCkU4HutKpfxBWuxwlsDZ23G+odgc8vxb0zXZ4ClUilTgzb0G5THztRb8v25014iJ/WCksyYrL8ha2QOtwhveKZFNXJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155049; c=relaxed/simple;
	bh=S42VEDXVz9SDKKgFcIHAWaqDHqsQdQy6R4zhiBxiNiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1SdVm2OY7/hizpiaHiPqA86kfyxu6/YbQnylRmcUJ4nPAQywbRX6xBElw/xysLeiJ3c1pkq+ywuPevj+pXky14KgdYmZYnGGoqR5+ek1jTGmB6Z+QPV53dMBM6CSagQCy8KySUCQhcDtYizn7M4XREMcs6n+peehHNXELHaQ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6xdUxjF; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-220ecbdb4c2so63156195ad.3
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 08:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740155047; x=1740759847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7niOwmDgSgvTHiVMtFqKUeR7FmrJKPDgfZyIEaZPhU=;
        b=F6xdUxjFJA03mShENspNfpb1k7NdlAK/u5IdqPoOC/Otqe2BXp8aS6Vvy0+UPI+q3p
         UwqbRcsQnwj0+V9zfjd2cn6BShZCifzPsLNDtEBSreSzFYL7OEfA9105gGuKqKMLENCV
         EEbl+QWdkgiZjM0vbBHrqjPEPSgh3L0xOXYSe/5vWIB07Q6sl2kjnMeeRNXOdsymERHU
         SyO5jsMgZyXdeAxYBDdDeVq18PJcn8oJmjSj9g+7LM6XGlRwXSTrrPZ6571/HzEKDAoy
         O5WZt/8tYUsgQV/dMFnfXtuoPsgsC0MNeqhCbEPphWXEYGo+Q8Y5Vs9rV+15qvtrlK9e
         TTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155047; x=1740759847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7niOwmDgSgvTHiVMtFqKUeR7FmrJKPDgfZyIEaZPhU=;
        b=r+gJ7mCl7CmNrD6W4c1cTeih0Beahyg/jRxLho/QnNK0qzonmTfNCLY+OBOEWgXc1Y
         061S4oN5SkEjif8hHEnAHQJ64cR4cUAf4cjNeO8HJAv/rcqyTXkmjhp1QkHkWcB7iLg8
         aEIWIskgAiN47mS6eb2sganXH2vDh2Tmy350jHYNr3NtJSsPzYQlK0m2mDwqHezfpu1l
         M6uhjo6L2y1sxijDINUNfCvBOQmDk71BXI2n2V4RkIypytzL6aNLspPP+V7ltLpOcCNh
         MAjLLzYlFZCZanixusuugchC2c5gat36LKb4vwMgH88sOU9n04wtMubzhK7pH45cZUke
         Z1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV3pQ7ws14wC+m/3xRZfQ9GMMrzJqxHBnzXseQ6Io3kBbTdfgFvznC8fdDIr7UeKm26EH1+M80wUa0ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIlzkb8AL4vWZYJg9jwiO4T3vRu3C11rpo4YpSRbjianqZD0kc
	B1TM4pMYvhVTRy+lOU+8+hmmsdsf3+wvWkCvKZPXX55cqvAio8/q
X-Gm-Gg: ASbGnctGc1cSC2R54OaGaeQgttSqL1emF1FFpyudML6HId1mBUKfCBhPe9KMhecUvgg
	kINmXdv4sKw2j9zij/o2rg7PpFpSKYb7EKvzt0jxoNUeatebd5KYQJDiSY7OG32nV43u9NwVNh1
	a+DBKWihbzLyhNnXBatbU1HM9nSHVMcBp+Imfdncl6F6YV+i27hVjOiRktlgRC5EBC7Em+Cpe9M
	t5z64BlfbjoOTMZkiRWYAVo5AOPAR1x+bU6sWIudcWmXpA8+QoqV5hme6QZZnmWqTgXbiIJsdD8
	6MgqPQu0WF02Dx/udy1UHZHaEYw8LnlIv5xH
X-Google-Smtp-Source: AGHT+IFa6u35srflL9gb016qqxixWBZsztkue+dJYqy8+vJfV5rQKbhF2ojkYXB6/MN4EMaGHC1lvQ==
X-Received: by 2002:a05:6a00:1813:b0:732:6221:7180 with SMTP id d2e1a72fcca58-73426c943c4mr6434262b3a.5.1740155047355;
        Fri, 21 Feb 2025 08:24:07 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7324254618dsm15948797b3a.26.2025.02.21.08.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:24:06 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH] staging: vc04_services: Fix function call formatting
Date: Fri, 21 Feb 2025 21:53:47 +0530
Message-ID: <20250221162358.53913-1-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

Adjust function calls to avoid placing an opening parenthesis at
the end of a line, improving readability and maintaining proper
kernel coding style.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 .../vc04_services/bcm2835-camera/controls.c        | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 6bce45925b..d00d910989 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -533,17 +533,15 @@ static int ctrl_set_image_effect(struct bcm2835_mmal_dev *dev,
 
 		control = &dev->component[COMP_CAMERA]->control;
 
-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
-				&imagefx, sizeof(imagefx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance,
+						    control, MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
+						    &imagefx, sizeof(imagefx));
 		if (ret)
 			goto exit;
 
-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_COLOUR_EFFECT,
-				&dev->colourfx, sizeof(dev->colourfx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance,
+						    control, MMAL_PARAMETER_COLOUR_EFFECT,
+						    &dev->colourfx, sizeof(dev->colourfx));
 	}
 
 exit:
-- 
2.48.1


