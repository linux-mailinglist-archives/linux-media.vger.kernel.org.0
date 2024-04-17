Return-Path: <linux-media+bounces-9651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B28A7BA4
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 07:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EBB61C21147
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 05:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB58951C3E;
	Wed, 17 Apr 2024 05:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="a9/H7p0K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D5BE4E
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 05:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713330012; cv=none; b=kXTC7YOGszcrlwjiW2gEHndD+SJ91Z0BLrBwTm9NLJOy7oJH2OFEcBl2IkMff7AS5eddL5HQ/9ycABj/+pQJ39m2uFPmPxDjTPMZcK3pN3tZTc6uBgfmkE9NujmY72jrPrOsFKXVH2RfoH+z+uNEWENpxp/KXBU4Mr9/5s4TiSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713330012; c=relaxed/simple;
	bh=V3uBqnpiuAyNWbyyl71QaVAWqL4UlFAM0kLtZbvd3Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CblupeWLj9UrZvhRs8QMb2sIqUblLn4l7K0VjiXRrgRFESEScIVaVRJFnEdPO9DwIzgShq3P1l2TIXYI4vpLGD5OGxInUFgeGeKaD45yZ5XRcwn8CGL9JHdtgPIEr9fG8mO9pUDkkY3ez0E+3opXdxn5NSw8q/avejrFiw+I5RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=a9/H7p0K; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 71829440049;
	Wed, 17 Apr 2024 07:59:56 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1713329996;
	bh=V3uBqnpiuAyNWbyyl71QaVAWqL4UlFAM0kLtZbvd3Uk=;
	h=From:To:Cc:Subject:Date:From;
	b=a9/H7p0K38YWhG4aHWddOMROachow4Mi5H9zvnA+GmCdX+vs2pUP9aGG+z/R48fpU
	 9vG5MKLTm+WDZlVYFXv2t7Hr1FcZ7jLoOWBNXDUX3carYwHewRFFuPddld/NC/BQgY
	 WN9jQYjb2QIlynranpX4A8Hs/s2bKJTO23waCB9mQqQR59zVKfuVHakuT5jvVsj4lU
	 J3+6pQXsot6ZReRGKqTYYDgahJoXsy+fq1idEw5ebqqq2sZdGQzcPLYLyOZJ37n+r9
	 al5cSE40d+sR4fos90Y2DyjqzKQ6bwPNHtZKKvLff4IYjTI6kuMIQ+VHtqeJ4c3gQN
	 MfLjcAVtj6Dhg==
From: Baruch Siach <baruch@tkos.co.il>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2] doc: dma-buf: fix grammar typo
Date: Wed, 17 Apr 2024 07:59:48 +0300
Message-ID: <505484b83fedebce3c65b10b076b34df075074b6.1713329988.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use 'supported' instead of 'support'. 'support' makes no sense in this
context.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Add commit log message (Christian König)
---
 Documentation/driver-api/dma-buf.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 0c153d79ccc4..29abf1eebf9f 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -77,7 +77,7 @@ consider though:
   the usual size discover pattern size = SEEK_END(0); SEEK_SET(0). Every other
   llseek operation will report -EINVAL.
 
-  If llseek on dma-buf FDs isn't support the kernel will report -ESPIPE for all
+  If llseek on dma-buf FDs isn't supported the kernel will report -ESPIPE for all
   cases. Userspace can use this to detect support for discovering the dma-buf
   size using llseek.
 
-- 
2.43.0


