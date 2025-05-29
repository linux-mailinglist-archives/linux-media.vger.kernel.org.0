Return-Path: <linux-media+bounces-33611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1672FAC80FF
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 18:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 582EB9E1746
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 16:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F6622DA03;
	Thu, 29 May 2025 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Aw7h5ZFV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C961362;
	Thu, 29 May 2025 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536655; cv=none; b=AcgWjHmUcKGwnz1tcUtktNH2af2/erT28T6r1I2Z35UxEHITA4xovQ6oRzJiDuUw4Xae6l7/UG3BTvHzgs1Jud+sp6gEkraT5+84ne1Z4nQxq9HzS8768MV8fE3WGfaFTsZSCJCZFBJGp2KVAOFiVC9yeDOjkqYADzIofabH/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536655; c=relaxed/simple;
	bh=BvOVZq2AHLJJJYptHSBqkzbep1xS/oogtJo1WIvUUGk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P/pUvQnerdJ0WHJJAxqEBXLn1F4laahngjAeb+A1xGOsiXTvCoiKULfXPEdjv+bxNFXQll1xVzIJ/y+RaphZQOMsKfp24H2aW012KVP7yu6Xbx1+AXDPjTSC/Od/PhugjzrxTzUtmKJ36cFM+lJp6J/v/URuCxb7fU1M4AXc5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Aw7h5ZFV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54D257E1;
	Thu, 29 May 2025 18:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748536618;
	bh=BvOVZq2AHLJJJYptHSBqkzbep1xS/oogtJo1WIvUUGk=;
	h=From:Subject:Date:To:Cc:From;
	b=Aw7h5ZFVP/UzUkRh4uj4s1Z4rgHoQ6FG7NzyEiildgq2ZCoW7PptTncMipe5F+YgM
	 0dL+ORHJFvCYRqy03MIytMD7RJX25JvpH18CyOo5naLFitfYrOTPuJbWxnr0SVrgK9
	 6qWCKf3vQ6vXvYpLrGP2MyqsEacGcFWSdfABF5rA=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH 0/2] media: vsp1: Detect display list wrong usage patterns
Date: Thu, 29 May 2025 18:36:29 +0200
Message-Id: <20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2NOGgC/x3MQQqAIBBA0avErBN0wKKuEiGVUw2EhVMRhHdPW
 r7F/y8IRSaBtngh0s3Ce8gwZQHTOoSFFPtsQI1WW2zULYdxfnMby+mm/QqnMrbyWA/o7Wggh0e
 kmZ9/2vUpfZUveB5kAAAA
X-Change-ID: 20250529-vsp1_dl_list_count-156d27a2d5b1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=BvOVZq2AHLJJJYptHSBqkzbep1xS/oogtJo1WIvUUGk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoOI1EKmgeToUg5hW8B7Zn13WmVGZVEMED7xHp2
 T7XRqWrcpKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaDiNRAAKCRByNAaPFqFW
 PHflD/oCg7yTtoelmnCUSQibXqBgfdEhF02csJoCsrJjI87mbAhdAZgGQbb7dla13+TstKK8l8c
 mip08rBI5VqT5wnxXg1R2lBxzq0D1RSQsLmppSz8PKUPHQz0vVf9s5isLy6tE4QZrD8K/xrXAAK
 zG30Hih79fzFtYpnlLIswafpG/M8HTyDfSWwKWd7Ptgss5RJ6/9G/vkp64udPXxFcCmBPUl0Yfx
 BDmc1A9dCv9694EuWRl3kIwDa8WILS+fMn4qeuf612a4nJAcIDY1MmNbTKx3WEYry5R3qCKIC65
 64eH6nrOEOQQRax9lMX3fXQcoIlcKZFsX7ClyBY4De8Hi/iYYwjP+SPhNK5DDUvXPrFPkJ50Pvi
 nV65rXrg6pLUDCyOqvH0mkGjm7FdqHlaQxEn9pv0+92/KNNJ3Z4IerD32Yrarz9CVDK10C+Tvzq
 piqVIElrh4x3dzeYF5sKZbcTw90G561nI4gCDjWM4qTb9Bqq3QNLUXyzqFwu7rswNwzZfYu3Gwy
 FYZW2shN3d848U2DDhwEp2Hiagb+y5K8DN8/NbWMkdSHYANYnbXJxdrcuqhNxBIe/8B0Q+7OaRz
 dQbqaTMWY5Ov/XImfl4rhTvEBjDMuf+17SsVO8NhLt8N1JxnxEZFmoXnYkoS2SW+0HPJAzQFZSF
 8J+ONvxWDEg0oXw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The VSP1 library driver offers support for programming the VSP
using display lists.

Display lists are created in a pool and users can get them and use them
to program the VSP. Once done the display list shall be returned to
the display list pool.

The correct management of the display list pool is left to the user
of the helpers, and it's helpful to add a few checks to detect invalid
usage patterns, such as a double release or a non-returned display list.

Add two counters to detect double releases of a display list, and a
counter to the display list to make sure that once it is reset all the
display lists have been returned.

Tested with vsp-tests
170 tests: 165 passed, 0 failed, 5 skipped

However I got a (hopefully unrelated) warning:

[  795.547528] [<000000007d841fd6>] vsp1_irq_handler
[  795.552448] Disabling IRQ #43
[  795.653324] vsp1 fea20000.vsp: Underrun occurred at WPF1 (total underruns 1)

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Jacopo Mondi (2):
      media: vsp1: vsp1_dl: Add usage counter
      media: vsp1: vsp1_dl: Count display lists

 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250529-vsp1_dl_list_count-156d27a2d5b1

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


