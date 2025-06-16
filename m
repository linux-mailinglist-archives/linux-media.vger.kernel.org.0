Return-Path: <linux-media+bounces-34900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD4ADAFF8
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1CD27A63E3
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 12:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3217D1E832E;
	Mon, 16 Jun 2025 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MWYdBw2z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44CC2E4264;
	Mon, 16 Jun 2025 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076087; cv=none; b=Vctl0UWiNrvCUQqbpUO5+aubsYSOjegeLG1dEi4MERlsLcPAXTDdQoI6fJ51gK8x9RA97JfK8UvvifMgd9n/TFP/fhqH1u2zFV6SYfMCyhD+L4qZmZXCIarTRCl/F1f7C59HC97ZyMKbInxd6r/x+OSXoQ00XFcta73G/SfApyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076087; c=relaxed/simple;
	bh=jx9LsrnqqvfZJjAXS2T4pIFNkI+/mxQjwBC79Za+/bM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mBCPppMR4REsLmVmPQaE2ouA3+fLnnYEmEKBt/pBYooQLhJ7VxjECHz0nABCRrk9ot43KlEqagZrk18JNVZrkoFHKCLmKzcYdWDPAzvEwgFvGxt/AO6JulMDSQf9cvxRR6hbPydMAhC0e7/7d/1GI0vC0DeI+mMdOzq8Op3So/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MWYdBw2z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A881D22A;
	Mon, 16 Jun 2025 14:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750076071;
	bh=jx9LsrnqqvfZJjAXS2T4pIFNkI+/mxQjwBC79Za+/bM=;
	h=From:Subject:Date:To:Cc:From;
	b=MWYdBw2zHaZk1+bjy3Y8U+xS9f2b0reAcgjaTNz9pEs1ncZETw2nFtBOXxf2502A+
	 YxTuf4gzE5v55JDzOZ1bCWM7JVUixKgZ/5YeZRmFeYIDHz98WOh3OIs6RKouAiltEY
	 hdBLgkLXfCEdAfH8IKPHcLs+sy8IsemNNKZkioyU=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v2 0/2] media: vsp1: Add FCP soft reset procedure
Date: Mon, 16 Jun 2025 14:14:23 +0200
Message-Id: <20250616-vspx-reset-v2-0-6cc12ed7e9bb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAKUGgC/22OQQ6DIBBFr2JmXRrAWoqr3qNxgTBUFooFSmyMd
 y/VbZfvZ/6bv0LE4DBCW60QMLvo/FSAnyrQg5qeSJwpDJzyhl6pJDnOCwkYMRFlLWPNTdSSaii
 FOaB1yy57dAcHfL2LMx0h9Coi0X4cXWqri+G6NoIKKS387gcXkw+ffUtme+Hf28wIJdIywYUoC
 5DfnUEV/dR7Fcy56KHbtu0L70GL+NsAAAA=
X-Change-ID: 20250609-vspx-reset-aff11587390c
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
 LUU HOAI <hoai.luu.ub@renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=jx9LsrnqqvfZJjAXS2T4pIFNkI+/mxQjwBC79Za+/bM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUAqr7TWZDtdbyV1Xa6UryYIEK9IMrZG9YR84D
 tFE2j3QS1eJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFAKqwAKCRByNAaPFqFW
 PGguD/9t866PZU4M48mikMXcg+BIvFEdwKQq23PQNA2iVmYni3J1tKbTqhQLylIea8zu4Wy6H9e
 WiysSp0jRPLqFnRejtyyAHXQqEGi4MrHUlIWUeIMBPJ8q7tU86OIZh6fKsSbq1sR4mwIXBJI8/U
 YeOuENJy3djNrWunUle4iI3LAr6NnRduWTJKLA6dhHBATsIdb8bLMpVxkQ1NClpk+OC9Mi9eG3S
 /nV8V935YK92XNZSNi+siosQhaRF7WDd/Y6nfqHG8AgfGrb0IaY5+OE+pNG4ysLlq1I0In4eTEi
 2OS1Lp9D58x87oWTNTiW3FVCjWP0Nq6PUUasN1NW8N4eARFtys6S+fzJ0KJHvJ4PjnWNr2CTv9Z
 bBSqjY9wYNdJKd3tm1IDB3pyQVUBNp8ieXWRUQ298nAZ5V3rlIyp4FDAQiXcp22jqrl2B53Ev1o
 xUbMhdsYP11dshCOKwuoHIE+SVoyUi6nc7YVcJolWQg1pk0kQIchrvjR9VY2ACNDpLv0FlPJAQp
 6SCkQySdX50J2uJKs9syR8akBRJ/s06pUpv2cL6fwOAq4H1TciFxeUyvdembK4M1BYUE69DqMef
 iwf4kgGuvrpn3HIHVw1/o7rVpD4n3fbBxKSjfe4L4cCeTTVvG2KIYQNehec5QRrhaeLwpIVHZvl
 99pcfVGcfK9/kRg==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce the FCP soft reset procedure as documented in section 62.3.7.3
Reset Operation" of R-Car Gen4 Hardware Manual rev 1.21, and use it to
reset FCPD by upporting patch b4bc2410cd81 ("rcar-fcp: Add FCPVD reset
sequence for VSPD") from Renesas R-Car BSP 3.5.3.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v2:
- Drop VSPX reset
- Reset FCP in vsp1_reset_wpf()
- Apply reset for Gen4 as well
- Link to v1: https://lore.kernel.org/r/20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com

---
Jacopo Mondi (1):
      media: rcar-fcp: Add rcar_fcp_soft_reset()

Koji Matsuoka (1):
      media: vsp1: Reset FCP after VSPD

 drivers/media/platform/renesas/rcar-fcp.c      | 41 ++++++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_drv.c |  9 +++++-
 include/media/rcar-fcp.h                       |  5 ++++
 3 files changed, 54 insertions(+), 1 deletion(-)
---
base-commit: 4d2c3d70799f5eb210003613766bbd113bbebc1a
change-id: 20250609-vspx-reset-aff11587390c

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


