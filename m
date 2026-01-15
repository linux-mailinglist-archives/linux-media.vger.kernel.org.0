Return-Path: <linux-media+bounces-50749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F618D22BD5
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 08:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23F7D3023B6E
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 07:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0B332694E;
	Thu, 15 Jan 2026 07:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m8k+eiRy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BA222157E;
	Thu, 15 Jan 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461149; cv=none; b=M52/GCvfNcHr7f/FWeJn7UQmwKjjApear5LuLfFfflVyYXrC+nK3XZC+LWF8f3ShNq8VHXaIJ1gyeLu8WgLIdL7Ny5Wy+1JKkkAZoz+fkq/ZOtCYxOR36VnrzGqxCWZBTaX7OSI/sS6w+Xo7OS8+Az9VTsmwKqoNGoVMJd2rkPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461149; c=relaxed/simple;
	bh=/IwC/lglEhqHfVAMEtgYM0z88MPFPR9t19SDrLzDlTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V+9Vy5OvUm5EJFwmrR2E3CLWjaNs4rTSgfG7Iiv/j58lrIBlHHijPGbqGSf+mihE2511ZmpOxku1YoOiEr09LOSVckRF2YiQ7yq2/IB6IF8UkfHF/8UEY5XXVmcMMoUQpaKDUtxL6/hzbA+MPulEBxW0WxBMa0eCR7Qsmuz6WUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m8k+eiRy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:76ee:df3c:dc54:9316:8c06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 471544D3;
	Thu, 15 Jan 2026 08:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768461118;
	bh=/IwC/lglEhqHfVAMEtgYM0z88MPFPR9t19SDrLzDlTw=;
	h=From:Subject:Date:To:Cc:From;
	b=m8k+eiRyxzVYyWMhFCBkCRDCm10wCAkEY197z9WWsFXYlWlCAAEI7jwtkMYYtHX2C
	 l+Kgb6GxYq7mnjYGzgg2BRNTBMYcdqYsXsbr/fVC82jOkY1FxpFBflY3KfuUalKf7/
	 L2hEDdjIswGmaZml4AsixnnpeB0oazHiKUsP9Q4s=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/2] media: staging: Drop StarFive JH7110 Camera Subsystem
Date: Thu, 15 Jan 2026 12:41:47 +0530
Message-Id: <20260115-drop-starfive-camss-v1-0-27550e7a9815@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOTaGkC/x3MPQqAMAxA4atIZgO2oqJXEYdaE83gD4mIIN7d4
 vgN7z1gpEIGXfaA0iUm+5bg8gziEraZUKZk8IWvC+cqnHQ/0M6gLBdhDKsZ+rFlbiKXpXeQykO
 J5f6v/fC+H/RKLOtlAAAA
X-Change-ID: 20260115-drop-starfive-camss-2b9ff7cf3321
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=/IwC/lglEhqHfVAMEtgYM0z88MPFPR9t19SDrLzDlTw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpaJNB/VeliDGGT01+T6LRd9Ll7aPDtK4rxT0k6
 xFIdHMlwIGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWiTQQAKCRBD3pH5JJpx
 RXGLD/98xb/QtoW9XY+NqYwP0VKVdqruVtK3ypVluw+h0rMCpAZCjMJn01WXYjy0YlsecTzNgmE
 ogFUiwLqgBwPaMTCcnQsLOWH+iB2T1GMUp9QldUgmgzc9nxRhLmVmmuhRfYBuMphadkCXZ+UaVI
 qFCtqUv05mCt6LOTANXSQaBLaFGO8ww4JMKrm4J6WT4IAIXq5jpwHDTTyNlDkzNDDu0526+S/Cn
 hAd3ciKygeHt69u3YSBW7PhkPXULziukonZTYVTnmBYB5nQaWxgQcbj8Sb6vSjNRBx+QZ2m//pp
 1u18YrDFMx4jdep4LKVqx3fRIrzUu2KHbHTBKqt1jOvMIla5xyebxrT/I1bv5gw3A91E/S7konI
 PKHMvab8jmbBeSZyC3DwOLY76VcS+22NJxkixer5tZZ/N9FvBAzXZPu+jO4x0EfDVjkldLb8HB8
 nJ9gaJhAjcON0F6BKZIG3TpDKXmIvVgE7wSmSCDfWv0IRJbiFk+3AOHf4b8+ODgqqDnj1PnmGgY
 t+FmCEGF5o2Bq5O9vQrTbx0QFkfGLLLRq+umHp00db0P7fBP6NXXgXQxgJAdCzQ45Bb1kR376q/
 nHb5NONMO+e+kJajgtPAOzUjlEYVZ1t1wncztEYMD2FTHxDZ6AmTUCXfP+MFTLy6kKgTNtgj5Wd
 XrfdBfG86Gat24Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

StarFive no longer plans to maintain or develop the JH7110 camera
subsystem for destaging, as discussed in below thread:

https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/

So drop the driver and bindings from staging. This came up while adding
support for streams APIs in Cadence CSI2RX driver, which is used both by
StarFive and TI in their capture pipelines:

https://lore.kernel.org/all/20260114130522.GE25101@pendragon.ideasonboard.com/

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (2):
      media: dt-bindings: Drop starfive,jh7110-camss from staging
      media: staging: Drop starfive-camss from staging

 Documentation/admin-guide/media/starfive_camss.rst |  72 ---
 .../admin-guide/media/starfive_camss_graph.dot     |  12 -
 .../bindings/media/starfive,jh7110-camss.yaml      | 180 ------
 MAINTAINERS                                        |   9 -
 drivers/staging/media/Kconfig                      |   2 -
 drivers/staging/media/Makefile                     |   1 -
 drivers/staging/media/starfive/Kconfig             |   5 -
 drivers/staging/media/starfive/Makefile            |   2 -
 drivers/staging/media/starfive/camss/Kconfig       |  18 -
 drivers/staging/media/starfive/camss/Makefile      |  13 -
 drivers/staging/media/starfive/camss/TODO.txt      |   4 -
 drivers/staging/media/starfive/camss/stf-camss.c   | 438 ---------------
 drivers/staging/media/starfive/camss/stf-camss.h   | 134 -----
 drivers/staging/media/starfive/camss/stf-capture.c | 605 ---------------------
 drivers/staging/media/starfive/camss/stf-capture.h |  86 ---
 .../staging/media/starfive/camss/stf-isp-hw-ops.c  | 445 ---------------
 drivers/staging/media/starfive/camss/stf-isp.c     | 379 -------------
 drivers/staging/media/starfive/camss/stf-isp.h     | 428 ---------------
 drivers/staging/media/starfive/camss/stf-video.c   | 570 -------------------
 drivers/staging/media/starfive/camss/stf-video.h   | 100 ----
 20 files changed, 3503 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260115-drop-starfive-camss-2b9ff7cf3321

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


