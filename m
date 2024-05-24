Return-Path: <linux-media+bounces-11857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876A8CE8E3
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 18:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D5D2812E4
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 16:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B47512EBEF;
	Fri, 24 May 2024 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="PQeq57PW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20AA3D76;
	Fri, 24 May 2024 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716569356; cv=none; b=VvRK2GP1QKmcy8fL4x+T7J9mSmSgW73iqWrufJ8Joxt7WiUoZdNnBchCtL60uyj2likCzxc74XgNY10PoTpRW+mNyb3nl0csQnmDwUwIIoMTOz8O1lWPj8RDtRaS1xW42HEdwLdY2uHNknggce7hdyh7VE1iL2pavdXhm0dxSxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716569356; c=relaxed/simple;
	bh=0kJ9o3GYTsgGNmQOf+dwA3oXvQWpdUpUuMMJxMFquRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UgIJ7V4DS61qxrZqpPHUR3ZQDIVytO/ZkhocWuIGQD5NkYf5WLPRxdPJLh9LXXAasRgZSjTsHChu7oH39FhgG/qsdQtwG9rPOnAnI2tEw9CKYa23cMHzYIWve7q/yUg94/cyTe/sUg87q5hAXasj+2hYCAlK9+WfXQq0tILl5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=PQeq57PW; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=4d8AHI3phquKVZyKLt/M7qw5W/5gTcn/DbYfr1WAF/Y=; b=PQeq57PW7KYtTlAi
	EvhAkkTbOn/cF1tVrYANTCSd69HP4y3xn3Rb0HqTWP9YjwaeLFRpxClWDfol+NtkGAqfGGeYu1P4N
	QR+Xry448qE8tsVc2mV7l1bgnukvt8pGIBvSfrvJUjBnWnW91ZVTR3cAgbCnb24DeYRzTowGxYP++
	pSYegYaQHcb8asaosnC4RFrzkrd5g9WUyYyKbeWodwmwyQXJaYdWeqM5okpU3N4XvCGdqJNbk5PR9
	3hTx+xm+ySckvkMK1TsuTUqCOH1a60EFWyNdR5HO7lJuvGy0yPpKLhr2KWXx59GNVYIaExvxQFGPw
	tidvZDJmmXz/u/jPOA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAY6K-002Qpy-29;
	Fri, 24 May 2024 16:49:05 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/4] Dead structs in media/i2c
Date: Fri, 24 May 2024 17:48:47 +0100
Message-ID: <20240524164851.184467-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Clean out a bunch of dead structs in media/i2c.
Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Dr. David Alan Gilbert (4):
  media: i2c: dw9768: remove unused struct 'regval_list'
  media: i2c: ks0127: remove unused struct 'adjust'
  media: i2c: tw9910: remove unused strust 'regval_list'
  media: i2c: adv7511: remove unused struct 'i2c_reg_value'

 drivers/media/i2c/adv7511-v4l2.c | 5 -----
 drivers/media/i2c/dw9768.c       | 5 -----
 drivers/media/i2c/ks0127.c       | 8 --------
 drivers/media/i2c/tw9910.c       | 5 -----
 4 files changed, 23 deletions(-)

-- 
2.45.1


