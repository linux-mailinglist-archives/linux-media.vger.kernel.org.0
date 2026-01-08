Return-Path: <linux-media+bounces-50193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 365BDD019BD
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F178733F3612
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB2C37E315;
	Thu,  8 Jan 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Xsx0m1fu"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B0D399A5F
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859592; cv=pass; b=mooNJYcj1YhvoC5bb4Cd0F9xYUdKa75TG7/L+VTDFh+I7d6Bx0xob9naHRVdkqRQ20C4ianBn2N3/fIkVZK5sSQaxzBcm4orl8eScYFnJjHRXKsoOZhyzS9LwDD5ztkEeGhEO6GG7gw9HukZTmIvMr4AIG7XSuRMtIoQHzgCmw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859592; c=relaxed/simple;
	bh=kxXg5deiCWXSJ/6TimrsjyJ4k02jEztLz05506rNVUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tOuy7YysrrNNVElIKRrZQf1gLqTKwqCqLQQIjHqh4mwUsuDcvZ3sY+47SYxPCn6OUCKXotZDBNG3h+t85meXGEj/9LpSzckZK+Jk1ffaYf5BNfEWXM1p0DiCLlvtUXOZ0HGTxqrdCj85SmwdTDWxsBH6DvXTzq1iefMiD88Eaxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Xsx0m1fu; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4dmyCK3Y9VzyQm;
	Thu, 08 Jan 2026 10:06:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1767859565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LmOZ1cVXTlZIgEmEoSlnlG3A2Yyrjo+NLTIMKJyqx+Q=;
	b=Xsx0m1fuUl03fONy7L7Kbc6TdHFElmGR9csg4PGJt+z2S5BVcKtGxg802uPJ27lbYicImT
	fv+MoAlHo+8C5oUyRURm5mxYb8xzc0wm507ujw6G7HHwK6diKUUG+5BisTLUxNngEvdbkK
	TN6UOzjdNbE4js5xCE9D+Wquu1+CkiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1767859565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LmOZ1cVXTlZIgEmEoSlnlG3A2Yyrjo+NLTIMKJyqx+Q=;
	b=PGCjGMYiza+TQNfHy1hWIkWdu7N5LSaAE0ZaIiR1V1FFtnESOe5i28BirCHO9J0ARpIFzG
	757cw4baOi70pRtLJg/vZ+2qUVmd9JjTbsjgMQlkNGOMjctUn/VwXXavD4OSZndx8apDPj
	xE9SzJU54aw3EY4TyX4Vct2g+2HgmX4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1767859565;
	b=vredC49c5ZxTJ4ezCC/eLwHyJN8A8t1+S6of+f+bFZ1BhUl3Mo00lWaHl07m+RCctKeheD
	/Wxji1ipagYCj3DgGnREYg1iCODnfDXashNLD2ZWG3fYaO3vwRImoaj32d8a3seUVMneB/
	GsqSGSYnF8KWspbAk+UjQdp6eTCx2Ys=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 103F9634C50;
	Thu, 08 Jan 2026 10:06:05 +0200 (EET)
Date: Thu, 8 Jan 2026 10:06:04 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.20] New camera sensor drivers
Message-ID: <aV9lbNqXNLJmW30B@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Please pull.

The following changes since commit 336367fab9b96db7b0ee174443c426fc6c53b912:

  media: chips-media: wave5: Fix Potential Probe Resource Leak (2026-01-05 15:56:32 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.20-2-signed

for you to fetch changes up to d2432f513e7655050d03fd609a715ea833f5f598:

  media: i2c: add os05b10 image sensor driver (2026-01-08 00:43:39 +0200)

----------------------------------------------------------------
New V4L2 camera sensor drivers for 6.20:
- os05b10
- s5k3m5
- s5kjn1

----------------------------------------------------------------
Elgin Perumbilly (1):
      dt-bindings: media: i2c: Add os05b10 sensor

Himanshu Bhavani (1):
      media: i2c: add os05b10 image sensor driver

Vladimir Zapolskiy (4):
      dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
      media: i2c: add Samsung S5KJN1 image sensor device driver
      dt-bindings: media: i2c: Add Samsung S5K3M5 image sensor
      media: i2c: Add Samsung S5K3M5 13MP camera sensor driver

 .../bindings/media/i2c/ovti,os05b10.yaml           |  103 ++
 .../bindings/media/i2c/samsung,s5k3m5.yaml         |  103 ++
 .../bindings/media/i2c/samsung,s5kjn1.yaml         |  103 ++
 MAINTAINERS                                        |   24 +
 drivers/media/i2c/Kconfig                          |   30 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/os05b10.c                        | 1135 +++++++++++++++
 drivers/media/i2c/s5k3m5.c                         | 1377 ++++++++++++++++++
 drivers/media/i2c/s5kjn1.c                         | 1487 ++++++++++++++++++++
 9 files changed, 4365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 create mode 100644 drivers/media/i2c/os05b10.c
 create mode 100644 drivers/media/i2c/s5k3m5.c
 create mode 100644 drivers/media/i2c/s5kjn1.c

-- 
Sakari Ailus

