Return-Path: <linux-media+bounces-49559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50148CDE1C8
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 22:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22416300F581
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 21:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F7129D281;
	Thu, 25 Dec 2025 21:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njxZDsl9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D027EFE3
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766696607; cv=none; b=XOTfTafJtXcvbgH/mRa3d6IffHEzx0JRe5VSQ5eyD1TW5kW3N4+msCRIPf4xJwPw1DC7g5D0jfoFMxavPW5YsvxmYXQhT1DIowxASsDUKlt3Em596SHR7O5bRBa6CYH+jAnRI6m7+/ZCx75p1ZoXkX7oNAAVxULmVpRec/ZBfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766696607; c=relaxed/simple;
	bh=LzzAK71oKGH+Ne4tLqGKZkmM3WqgvcA70QIroDmAP90=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dUEY1E+65NEcjYSrKF5ARkd1doSU4GWorQLwHDazWsKB00IG2eXcM2HZnv3Rawi61qUiVfGeuWsy3KcYb3iVOwiF1Mj9jVaCt30xtbfDeLrlZo0RO5DF/IdB3CTJgw9LXUJpwAwSlrM11Ax+FwSHbh7imc7u8xzq7G2ajtgIAi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njxZDsl9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f1bc40b35so113964485ad.2
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 13:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766696604; x=1767301404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsApT5yj8V9Zkp6Dt/ZSOD4MHvJezpImeyU98q7SWgM=;
        b=njxZDsl9VfDcqyDOVIgrmqSBps5JV5pxwnYtJHlV1Ty4TTCtd3nUDokNU956HDIZx1
         fpEWRL59eD2TdmkPhsO5bv6lv65C3IsyPDgEbHDk4MjUkUgUxcVnSGywdr/0AIyeFcwU
         b/9XCeHf9FpDW//+AfnUZ/uREw+aqCN2leaJxpMRBLvwwLBpQvEhXCr/5dFoNArAwkq+
         /1V97Xob0l0sQPkLCztRTPPc6aZywbR96kfEfe2YokMbhenvN3oxgp+aGWvao+sGEzHQ
         YnZBB4QQMUpJ40Qm0MFBOuhWiYgiKx5dUEOOQJMzNysv/QUtYpRAc3dxH/ca6/kV5Hbm
         uJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766696604; x=1767301404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsApT5yj8V9Zkp6Dt/ZSOD4MHvJezpImeyU98q7SWgM=;
        b=JD27o/+R4Cqm+LSWj+g005QZk027II2K6rN/ZWO9J/h8EcDK/ygDyQxuJ461JXYT3/
         ZpRF5cyjOWTyeyOYP0N2/XjW5xsVphHIwGIyrldcNvcgrbEdwjPJbS3O8a+LVxuVLeUl
         OS0d1let8xUUFiMn2oufl8ANNAfrTj7MBErWUGgRflbcpEBGzHGlTgGcBQ1E4liN4ybz
         Ny/1ayikt/KF/a+erusyJRwuSny5vJ6Mbp6n7OJPhEBmIsvn2zhwU46/VTaj5czXwBKv
         g2IWjZVDfrWuAiOYpYAOjg9LG3BBzhhFLeanNbfGsQek7i528967rRoQe3wMwKjnHbvL
         2AFg==
X-Forwarded-Encrypted: i=1; AJvYcCWE7a3yYphbYMbS6em7zPsJpFGC415riJvd2RUfrs56TRh50DElr6k0Sphga38LQILMPjHYA2VZSQjNPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypYqfrDTU8LoQpLW92YGgYerJr0XpSeDc7MhsoWRt6qltG6TD3
	cE9RkekJC+kMUeBGsxm0Fp90Yp7pEbon/UgW5+vjZpXyZLPLEWXusrq+
X-Gm-Gg: AY/fxX5pcGsuYEbD3fEoma3lXHWCdv5Uc0C1sP18DRzyHDdtqgV9O2fgpeEj1LWBCnc
	ItQTFfbVqUZ+PCdnFTtgSX4iuw6DUt8pCnVz+/cZs3CEUIkkPyZMsS0X9Qw2l/ByqGukehyCm0+
	05D+GjkXPXIRf0rDm1+zkyq4TTp8UE85PID4ogW9tghoG4tySskjaMcOJxJ2Vuu/1hFdvXMyrT4
	P/Yj3gFIyXH51T3dyOifZmuBqgiXzU8m1Jgwe0NSA0ZjRFthV10wD6ecQqVyKTOdGLULliLAmSm
	g4PXTP9EqGtVtDOBgJYGIfvk56x1cULjwDEsTuyMkrz/E0NuVTsJIQfMYOUhmmQLyfCraGjAHwx
	mFYitUi4WMe5VKrjWrX43/BlEHUkpW7w6O5p9y+pBRHwS58BWXXcttyuFPuQyq77Z5ba5aD63KT
	J4uT2YI/5xL2a7nGE8AiFI5w==
X-Google-Smtp-Source: AGHT+IG8uOUoCLF6dXHoObLIhEI9juc7H5pEmK2gEYctvjy2IRVa51GRjA0KTofcYITFdsdGnpZcwA==
X-Received: by 2002:a05:7022:208:b0:119:e56b:c74d with SMTP id a92af1059eb24-121722b2bc9mr23486496c88.18.1766696603699;
        Thu, 25 Dec 2025 13:03:23 -0800 (PST)
Received: from [192.168.5.77] ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm83006203c88.13.2025.12.25.13.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 13:03:23 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v3 0/2] Convert et8ek8 and omap3isp bindings to DT schema
Date: Thu, 25 Dec 2025 13:03:06 -0800
Message-Id: <20251225-dt-bindings-et8ek8-omap3isp-v3-0-b027e0db69a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIqmTWkC/33NQQ6CMBCF4auQrh1DB7DElfcwLEo7wERpm5YQD
 eHuVhK3Lv+3+N4mEkWmJK7FJiKtnNi7HNWpEGbSbiRgm1tgiY1ElGAX6NlZdmMCWlp6tOBnHSp
 OAVA39kK1VLJXIgsh0sCvQ793uSdOi4/v42zF7/pz67/uilBCqbA1Rg5EqG7jrPl5Nn4W3b7vH
 4NU37HGAAAA
X-Change-ID: 20251221-dt-bindings-et8ek8-omap3isp-2a5d6e4171b7
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alex Tran <alex.t.tran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=alex.t.tran@gmail.com;
 h=from:subject:message-id; bh=LzzAK71oKGH+Ne4tLqGKZkmM3WqgvcA70QIroDmAP90=;
 b=owEBbQKS/ZANAwAKAXT5fTREJs3IAcsmYgBpTaaZ1dDjv81hfWjK59HtOWHCTBBQTuwkAWTe4
 OORVFOtBEqJAjMEAAEKAB0WIQQAohViG04SVxUVrcd0+X00RCbNyAUCaU2mmQAKCRB0+X00RCbN
 yLXpD/98f18rgxynhH2q9/bk+SuR5JmBSMXaz26Kc3Du6G7IaBN35hT2kEWt4Cd3+J/m7UqE257
 NZ3DMbBkLzWVSs6o9Y9gyRiDbEC2qoloO9Fw5RBVpw6VDGxzYBFZu7VMs7QyqFBtLQSBL/+QH1w
 RLxXYwVTC9Nwbk79m1uFCxr7/tUGGv9J6kFyxSSFzVNisWIiSa3MUgvhnORzVXQF06V5914DAwd
 rmmOUuoYOGagxch7g/Wz9Xax/iYm3nAABZhNKqTty/+dlgeNVasGrAUIwlnU+puN8FfQ9VuXtDY
 m4onrDB2zE+e7kipNQhsXB28jH8Wa86Iy0yPQrdBVzYK4OBjHGO76u57C0ZrBDFgTSvDclGMiGD
 SgfSt4XvzL5doxs/zsUIJWRCffnxrkZUYV2f4Q/Th3QhTh9oRDjIalzZUR9B5hk4RDn2oh6uCJz
 Aiq7iuwpyErVgQ/FiC/yC9iT2P5+0AdIU7BCYkQorz6tiQo9jGMYHCSs3ol2FNXgsHc0PIEmKnP
 oS8r3WgOQAKgbpOuXX8fqsQ/slROQaSgDIb73vReFLqmSaoe4DDfDdvi8/S5hKTmOBsj0B8O8mb
 ZX9OebKcQodkBKvtstCAu/PedUTWHKv/ADmCc9Ou7yX+75Tt10Fd0f7/c0AE/QBSZ+CaKY1Ubml
 mhquiFFJ+vIczuA==
X-Developer-Key: i=alex.t.tran@gmail.com; a=openpgp;
 fpr=00A215621B4E12571515ADC774F97D344426CDC8

This patch series converts the dt-bindings for media components
toshiba,et8ek8 and ti,omap3isp from the TXT to YAML schema.

The series is composed of:
Patch 1: Converts the Toshiba ET8EK8 sensor binding and updates
the MAINTAINERS file under the NOKIA N900 CAMERA SUPPORT accordingly.
Patch 2: Converts the TI OMAP 3 ISP binding.

Changes in v2:
- Dropped obvious et8ek8 clocks description.
- lens-focus and flash-leds: fixed schema reference to
  video-interface-devices.yaml using allOf.
- Dropped pointless et8ek8 remote-endpoint property.
- Dropped obvious omap3isp interrupts/iommus description.
- Removed standard property omap3isp descriptions.
- Completed examples for et8ek8 and omap3isp.

Changes in v3:
- Fixed indentation on omap3isp example.
- Use unevaluatedProperties false in et8ek8.
- Remove lens-focus properpty in et8ek8.
- Add maxItems constraint for flash-leds in et8ek8.
- Link to v2: https://lore.kernel.org/r/20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
Alex Tran (2):
      media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
      media: dt-bindings: ti,omap3isp: Convert to DT schema

 .../bindings/media/i2c/toshiba,et8ek8.txt          |  55 ------
 .../bindings/media/i2c/toshiba,et8ek8.yaml         |  87 ++++++++++
 .../devicetree/bindings/media/ti,omap3isp.txt      |  71 --------
 .../devicetree/bindings/media/ti,omap3isp.yaml     | 189 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 5 files changed, 277 insertions(+), 126 deletions(-)
---
base-commit: fa084c35afa13ab07a860ef0936cd987f9aa0460
change-id: 20251221-dt-bindings-et8ek8-omap3isp-2a5d6e4171b7

Best regards,
-- 
Alex Tran <alex.t.tran@gmail.com>


