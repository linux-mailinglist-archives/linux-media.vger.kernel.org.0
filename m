Return-Path: <linux-media+bounces-13584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5AB90D94D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B84C285DFB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4449768E1;
	Tue, 18 Jun 2024 16:33:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1F117547;
	Tue, 18 Jun 2024 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728392; cv=none; b=UEJTI6YqfuatMd4Nz7KHajXa5DEdmnGs37kNwUN0gC+twZ/vp3F1Wg1gmn46VqUmkMizeK4eCxvz86dU0+oed0TPZ6DOoPA3SD3ulnKtQ7r05H6fcZRdxRQq19d4eomhRPJinJotQh6450LuSfrXjzTsipZxocJePW6XiJn27+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728392; c=relaxed/simple;
	bh=2+lwRs78cxru6m7ugKHW4XeV4c6ueUaRvfWt7+pQLiM=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version:Content-Type; b=L+3k51mer74BxyXBBocw+KrkEOh2xD9jnuhNnc6vYWdHqR1n3B3rxbscS72QSqZDz4bFy7E+Xj1aTdx2mssl/XlIxgtOwnGYlFO/ZdgErdx1JNQMU+qo7tLpDe7ux8WLcmQnvesndfPgUvxQ6GS4rCaimuz4mY42O+tSTAtCHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b69c7d.dsl.pool.telekom.hu [::ffff:81.182.156.125])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007165C.000000006671B6BD.002A21A4; Tue, 18 Jun 2024 18:33:01 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  John Bauer <johnebgood@securitylive.com>, ribalda@chromium.org,
  linh.tp.vu@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v3 0/1] media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix
Date: Tue, 18 Jun 2024 18:32:39 +0200
Message-ID: <cover.1718726777.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Hello,

I am picking up John's series.

---
Changes in v3:
- Based on Ricardo's suggestion, I squashed the two patches.
- Link to v2: https://lore.kernel.org/all/20240405-uvc-fix-relative-ptz-speed-v1-0-c32cdb2a899d@securitylive.com/

Changes in v2:
- Made recommended changes, moved control check to helper function and removed dead code.
- Link to v1: https://lore.kernel.org/all/20240326-uvc-relative-ptz-speed-fix-v1-1-453fd5ccfd37@securitylive.com/

---
John Bauer (1):
  media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.

 drivers/media/usb/uvc/uvc_ctrl.c | 38 +++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

-- 
2.45.2

Best regards,
Gergo Koteles

