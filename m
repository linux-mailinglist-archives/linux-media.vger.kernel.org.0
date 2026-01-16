Return-Path: <linux-media+bounces-50825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308AD2CE7C
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4498D3042FD3
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7220C34F24E;
	Fri, 16 Jan 2026 07:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oz3jT53u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6702DEA86;
	Fri, 16 Jan 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547247; cv=none; b=gpFqDRnr3JYjsFMkLzvrnQudpjnU7l+dLf8MKOUwBLpL3di6/qD841gmCFrMfo/moSndfPar1b/o0+xVLVZ2eQf/xITvsvkglC5KH3Y/Bug4Wbuj75tz6Zde9YijSZVdIZal09d197yKtoq10zO+RYKHX0Gt8UjdsgxnYWHbzrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547247; c=relaxed/simple;
	bh=c99MDF9q1u7+i6n3zOJX6X91LyEGUnH55p+NHf1eRAQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uCwZd6bn8ePRcOrzfG9tpSRxVCOHvE04bEvO2gidei2Seh/+2AP50bKpMM5XoE0fTQsUz1pbYy6VTm6Qph6fzmSF2cy9BFz8+6pSnWNjxBS84riebwiqiKg6epwjpmso0lrH4vP3fsRw+t1iadTCGmF1Wk/kaLeBHV0AIM5Z+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oz3jT53u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:76ee:df3c:dc54:9316:8c06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA2984B3;
	Fri, 16 Jan 2026 08:06:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768547210;
	bh=c99MDF9q1u7+i6n3zOJX6X91LyEGUnH55p+NHf1eRAQ=;
	h=From:Subject:Date:To:Cc:From;
	b=oz3jT53uLeBLhUeIRAQ7XjL55/0OWrCrPBuEGMfa/rGf6N7qrUg4JZv1Lle0NzYay
	 YEBfquMZDBJfBcYFCnvB5+WWqK4pE00yp9+J74rrRjbC4PeG9LZ8NpupwMP1oPT+wO
	 cmz936/dEKxOxz2yLkbapBuQLbIWcmzv44ok3nuE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/2] media: staging: Drop StarFive JH7110 Camera
 Subsystem
Date: Fri, 16 Jan 2026 12:36:57 +0530
Message-Id: <20260116-drop-starfive-camss-v2-0-34df57025921@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHjaWkC/32NQQ6CMBBFr2K6dkxbUhFX3sOwKO1UZgElM6TRE
 O5u5QAu30v++5sSZEJR99OmGAsJ5bmCPZ9UGP38QqBYWVltr9oYB5HzArJ6TlQQgp9EwA5dSm1
 ITWONqsuFMdH7qD77yiPJmvlznBTzs/97xYAG2zqnsfXdzbgHRfSS5yF7jpeQJ9Xv+/4FdAmly
 r0AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2586;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=c99MDF9q1u7+i6n3zOJX6X91LyEGUnH55p+NHf1eRAQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpaeOdaFIshWbaCs13lSsXrXGeWAHB+7/g0YAEn
 rADFpOCvH+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWnjnQAKCRBD3pH5JJpx
 Ra8sEACInfFOzocJusNdQM+6vf7g5ktmoVIkqAyRdcEJsPo2IEXpkmw6/bHo6jkcPXBxmpZPWUY
 X7HfKRb4wLXeBgcXGb+zHhrc6DT/tixIh10k57Qtzbu2ENGvgVk+3P6GYoWqKCKVGiVLpS1Xuxr
 D+YMbmS+40ycwsiMyzamKF0ULXcfk6eig7HIsCvs4RiVo/u+tjwrcUW6ht5KMeaNES5AEXbETA9
 PsaZovLKZl3G2RjhtklFdpHCo0tYchKmVo4T1nvPYVPWVjZ/oyPO0XSpNeXia3+8wg9bA8ZheWr
 cMkp7MyYnzsj90dY6QixkiJSXrVNGe6beEn5VKobfu6Lo6NYMvOVsb2dmbvGRJwqVihrcv13QDA
 WA89h2X0PovTvlQD5NSczRdqPTP7K1I14pPfKVz7zNmWG2Ac9knjmjtU9fiNgCotiVKBCsa7U+t
 3ArWRX3uQjz8fSI8iwbaS6JwtB4a4aiXIGgwm5/eTAFgxOlFeWlHgeh/ISAyZ7MBtIWUaGsn/fK
 L83Tsqrud2SvRVGGNCyTOCcDn8Apk6q2WEseWUn6INLdTeljdT41nJgWiz/Foy9+akw/R2aCcEF
 OXTKxNsZRHaw191m4pareuuUISXg2TuffAyfIUplgA8lA/xkrlpYt1cSbJoSUlyX1ckikF5+w5F
 7CrxZkAk7MEJJ9w==
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
Changes in v2:
- Add Changhuang's Ack on PATCH 1
- Fix PATCH 2 to also drop reference to the starfive camss documentation
  in v4l-drivers.rst
- Link to v1: https://lore.kernel.org/r/20260115-drop-starfive-camss-v1-0-27550e7a9815@ideasonboard.com

---
Jai Luthra (2):
      media: dt-bindings: Drop starfive,jh7110-camss from staging
      media: staging: Drop starfive-camss from staging

 Documentation/admin-guide/media/starfive_camss.rst |  72 ---
 .../admin-guide/media/starfive_camss_graph.dot     |  12 -
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 -
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
 21 files changed, 3504 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260115-drop-starfive-camss-2b9ff7cf3321

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


