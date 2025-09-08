Return-Path: <linux-media+bounces-41956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A83AAB484CA
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527DA177A5C
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5508C2E3360;
	Mon,  8 Sep 2025 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="IFIRY1Pd"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EADC3B7A8
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757315239; cv=pass; b=UvDgQPMcGAyTklBjGJpqllCzcmswGxRgKoe/hEx4pKlsl1IS5BGRIf+aFGx4z+IoER5WyT1PY0gPKbwRFGJUd6ofryRcLW2zwFCfmSxKobDyQDq7TUf3gnJCufbwHvu8CK1NoCfF4NMR2ZSjjMwJIzFpCBFej5MRDmccZRj+fJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757315239; c=relaxed/simple;
	bh=Kf3REiCZgiKe10HiO3sMPMOQzDnoJT1ouq/bfYuAZ54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UkNIJufYEJ622FwQ9yjxJd+j1DszVan3vhmrLXFjF8BRfLkZCwXe2Tipg6MMZ7S+YoyuwIA4ZjEKjQhyWquhIyJz1k+SqP5k0GtVCQL2iJ28BlJmK96/lYg043C52jHSJdIV3MDOOIgIoDnfpRapwN47TwsOyDhy7knIuYbRcbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=IFIRY1Pd; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cKygb14SdzyRw;
	Mon,  8 Sep 2025 10:07:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1757315227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fMcT4yvXvIhSqQJ/JARQzzTVnM1x3Ju4Lvt7tXX68I0=;
	b=IFIRY1PdLhy3fYXU8Oz+2mMEmzRfpbjqGbggPmC8obOoxJK7piA3sdHUYD4kvAv+HkRGCB
	KshltkxUV5WN4dDroFsvcSBnfnQQvYkzcgC3yF3qFnPDOFQkLqv0HcIUUqkGRllNgSSnWb
	0O4NAeKiBKTQf/nkYxzZ1nI1To91/fE=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1757315227; a=rsa-sha256; cv=none;
	b=PJ66IPw9ZNAvIENWBk/1//5z2z4uhb62x5h7XS0OeomF3172IQdN1lcb9mDw9InizTrybN
	W9Y/Vsk9/WE1CdB+d+YzhoWSU/EOpT37Jk02YVvE/vZwyXbtZZPbAm6JYl343Lk1iTYCvo
	LxBaz2QQklJjnfOJvwKutj4mz83jLRg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1757315227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fMcT4yvXvIhSqQJ/JARQzzTVnM1x3Ju4Lvt7tXX68I0=;
	b=iM0Ty9EVk+I/jjrGq8ItIRiHViTTNCLLqQGtZ95OUq0H7Ue/a2KXnwdM81miG33+WNq65r
	2yJEN76vKQE/MFJTB/xSZLUrQlcd1/GmvFXlpbAcN10ufvDiT5zM1TPMLhDT83tie2BG6K
	VijN7cRW/pO8koTtuzlLMqd5uuaIE5g=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35B07634C93;
	Mon,  8 Sep 2025 10:07:06 +0300 (EEST)
Date: Mon, 8 Sep 2025 10:07:05 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.18] New camera sensor drivers
Message-ID: <aL6AmZnwBtUp0kL5@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 04f08db52b3f892c85bd92ebbc3a7ca32e4f60f3:

  media: i2c: tc358743: add support for more infoframe types (2025-09-07 10:29:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.18-4.1-signed

for you to fetch changes up to 17de12296f2640f4e8d1a04aacb4b51f570692ed:

  media: i2c: add ov2735 image sensor driver (2025-09-08 10:02:08 +0300)

----------------------------------------------------------------
New drivers for 6.18
- New drivers for ov6211, og0be1b and ov2735 camera sensors

----------------------------------------------------------------
Hardevsinh Palaniya (1):
      media: i2c: add ov2735 image sensor driver

Himanshu Bhavani (1):
      dt-bindings: media: i2c: Add ov2735 sensor

Vladimir Zapolskiy (4):
      dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
      media: i2c: Add OmniVision OV6211 image sensor driver
      dt-bindings: media: i2c: Add OmniVision OG0VE1B camera sensor
      media: i2c: Add OmniVision OG0VE1B camera sensor

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |   97 ++
 .../devicetree/bindings/media/i2c/ovti,ov2735.yaml |  108 ++
 .../devicetree/bindings/media/i2c/ovti,ov6211.yaml |   96 ++
 MAINTAINERS                                        |   24 +
 drivers/media/i2c/Kconfig                          |   30 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/og0ve1b.c                        |  816 ++++++++++++++
 drivers/media/i2c/ov2735.c                         | 1109 ++++++++++++++++++++
 drivers/media/i2c/ov6211.c                         |  793 ++++++++++++++
 9 files changed, 3076 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
 create mode 100644 drivers/media/i2c/og0ve1b.c
 create mode 100644 drivers/media/i2c/ov2735.c
 create mode 100644 drivers/media/i2c/ov6211.c

Please pull.

-- 
Kind regards,

Sakari Ailus

