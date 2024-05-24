Return-Path: <linux-media+bounces-11860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B68CE8EA
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 18:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 646CAB20EA6
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 16:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FD712F387;
	Fri, 24 May 2024 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Z6nOaKRO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD812CD81;
	Fri, 24 May 2024 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716569371; cv=none; b=uiXR8wnGl0NE4UrNxxHurjXyUk+BnCUP4TIT4+Uqg3AwolJPqMEG7vPQ9xrzaQCiwCOXq7NpjlULWB1z/4v8a5dyu6M8jKlySCxubNS6pZKZbqeCGrG5EFvyosN3dxE71g/4ArzRi254Rh+LkW9Nmizc5GBEZZMp7VetYz1/xm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716569371; c=relaxed/simple;
	bh=ABQqYyyFJchDJa5XOJECzeEmy43x6Wrq5iLGE+SuCxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6b4B+h+Kr7417Mc4i2Y8hbFm/700CvAR7hO1/22tvvE3L3f7ZtEHY/mox395cM9YM/fcgaR5vYf0elbN+Rsks1Sa5GVJjjU0rLM6Z/2n+pS8kzSZnDzZYWMRLo9kmH+pHBwKfYIPDolQm4WKdxl/V5DDpEo5iK4Fvar10OokwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Z6nOaKRO; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=23mA7e45gOTCFr4oRNrq25h0iVpj26coA+zC1OVoi0U=; b=Z6nOaKROnlzQfoVY
	Z46TGR9Kli2R+5e666Akhe6mwu90eueBCAsUVGgxQaGvUBR570wcSkO/ICLsmdS0LGWzj2e9CSSbJ
	1V6dwdKR7yhBVA+IATdFiIzh65XjOp8b2jmV5Py11i2A9N1DJiGQu6zr9+Ixc0AdrmdpFwXqwqqFf
	cPV0NmV+Hl6URht9PsqPfvf4F5ZwVlk3gSi+Im/SctqfVefK5oY15NIsgFk9ihW2Ap3Ub5MH8N6+y
	mzOBtoub2lp06shQEuGd8iTFb2vtdmvk8DbHDtE6fLH+3pYUBnSfPngL7YLLqt4bcPD63tfG0ySMm
	XHgf37BiBETU0MheqQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAY6e-002Qpy-2Y;
	Fri, 24 May 2024 16:49:25 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/4] media: i2c: tw9910: remove unused strust 'regval_list'
Date: Fri, 24 May 2024 17:48:50 +0100
Message-ID: <20240524164851.184467-4-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524164851.184467-1-linux@treblig.org>
References: <20240524164851.184467-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'regval_list' has been unused since
commit 398994c1e104 ("V4L/DVB (13666): tw9910: modify V/H outpit pin
setting to use VALID").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/i2c/tw9910.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 905af98c7d53..6dffaaa9ed56 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -212,11 +212,6 @@
  * structure
  */
 
-struct regval_list {
-	unsigned char reg_num;
-	unsigned char value;
-};
-
 struct tw9910_scale_ctrl {
 	char           *name;
 	unsigned short  width;
-- 
2.45.1


