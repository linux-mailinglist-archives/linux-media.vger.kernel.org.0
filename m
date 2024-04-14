Return-Path: <linux-media+bounces-9247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34618A4275
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 15:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83A1428188B
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 13:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8358F3E476;
	Sun, 14 Apr 2024 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="M5GA7CYO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57E1CD06
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713100084; cv=none; b=TULoHGQBh0pK44CTQqST532ZvaURgP8vwugcNjTl7HPZfcgVfnVNq0KTdbQKBFlGS8x8sYsEmna8EWdiUXDc7epQuu7z7cLjiWps5VUF6wQUuvVdwcTQoQI7vxC935d5c5tmpAmW2TFiYwASWjbFYQGEMaRP2/e6G6Tgs3uVFHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713100084; c=relaxed/simple;
	bh=d26hMS4a3xKS20b554++VWyk9qEnuKrkwdbfnGK6NR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsvvJp5dOAYzwCHH3lUeTOw3VbRBJcWjI5L5w4KWewx6XkY2+MbKoNJEG0CbaFMbYQgwMYXIknoXHvOA/+7e57DmjtShctwOXy8tcD6hlxm2yCYhdbbl4IMVO9sMZNzoXw7MyUQjGFQOErlDQ86v3ZMM5al5h885WXiQrmr1L0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=M5GA7CYO; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 3955C440317;
	Sun, 14 Apr 2024 16:07:20 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1713100040;
	bh=d26hMS4a3xKS20b554++VWyk9qEnuKrkwdbfnGK6NR0=;
	h=From:To:Cc:Subject:Date:From;
	b=M5GA7CYOdJApD4QhgCa2iQESZj6RwJsqMyECTHf/XA2MQk6tkWvhjPFDnNMfds5DY
	 meeL2iSExiblN6wX/3hGgwktF0MTsZV41NrKean0t4QbIJghD1KkGWqE+5ttoow9HR
	 s9C0v8YfRsaiFE7lIPRvEG5FMEoDMtwXXwg0nDv8UYQomjsN/5+umQD7lLGHosEz7I
	 8c+1PCWWmZvWj8YBA2ijyKH+0gGkySy+IgQmWYA5gYaR7aVUSKXhFyUSRSZeqlNxwZ
	 0S39ecO5TNnXYABzTXd1IWNjhfnELHNGLZ8kiVFGjd2t0Tt3A2gkSE7SfMn18swjAQ
	 54Pu0e9oZ9mrw==
From: Baruch Siach <baruch@tkos.co.il>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] doc: dma-buf: fix grammar typo
Date: Sun, 14 Apr 2024 16:07:37 +0300
Message-ID: <d242a446258e34b2db8990561e51f145df748f83.1713100057.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
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


