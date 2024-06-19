Return-Path: <linux-media+bounces-13760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EAD90F9A0
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 01:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45B2A282635
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 23:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456DF15B142;
	Wed, 19 Jun 2024 23:07:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E6A768EC;
	Wed, 19 Jun 2024 23:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718838440; cv=none; b=kHNObyZTxWuBM/mEG9/XnY7FdoKz6y38vLsB65sAFP/zbMlHbWIEcxjIKAu/+uf8nRKLmhThHYbaJkkFswJObUVjgYxz8olvr+PvRWbAjwcquLR/8ydkdXqkYD8KNDrR/nuQbNhgmkEWMm66SBbwunAhLol8TXHcsNwKhjOZga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718838440; c=relaxed/simple;
	bh=9HsR6ljcoMUVKNNH+pR4AbSIfJq+cfzP3SRKSNQEtfE=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version:Content-Type; b=UtSySJGLdzbTmge+hzcAB3Lo0LOXk5XTVO9hVZAv/RMe0u6OCEbE2HuxffDIVSJ0WOzrjuxcX60MltfFVG3h8uEmL3F8cyNmLiUvXX/G6yxDzl/psQwLconTGB8r4kueBbPDjKjDX74VvQXaiYXUXCSODO78Cv50eMEdDXfCcZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b69c7d.dsl.pool.telekom.hu [::ffff:81.182.156.125])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FE9C.00000000667364A5.002E43E5; Thu, 20 Jun 2024 01:07:17 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  John Bauer <johnebgood@securitylive.com>, ribalda@chromium.org,
  linh.tp.vu@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v4 0/1] media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix
Date: Thu, 20 Jun 2024 01:05:12 +0200
Message-ID: <cover.1718835633.git.soyer@irl.hu>
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

I applied Ricardo's suggestion.
And I found a few ways to improve the style.

I've also added Ricardo's reviewed-by tag as these are just style changes.

---
Changes in v4:
- Based on Ricardo's suggestion, only query the min value in uvc_ctrl_set
  if necessary
- Rename is_relative_ptz_ctrl function to uvc_ctrl_is_relative_ptz for
  consistency
- Rename 'relative speed implementation' to 'relative PTZ controls' in
  comments
- Fix indentation of comments
- Reduce the length of the new lines to 80
- Link to v3: https://lore.kernel.org/all/cover.1718726777.git.soyer@irl.hu/

Changes in v3:
- Based on Ricardo's suggestion, I squashed the two patches.
- Link to v2: https://lore.kernel.org/all/20240405-uvc-fix-relative-ptz-speed-v1-0-c32cdb2a899d@securitylive.com/

Changes in v2:
- Made recommended changes, moved control check to helper function and removed dead code.
- Link to v1: https://lore.kernel.org/all/20240326-uvc-relative-ptz-speed-fix-v1-1-453fd5ccfd37@securitylive.com/
---
John Bauer (1):
  media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.

 drivers/media/usb/uvc/uvc_ctrl.c | 42 ++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 7 deletions(-)

-- 
2.45.2

Best regards,
Gergo Koteles

