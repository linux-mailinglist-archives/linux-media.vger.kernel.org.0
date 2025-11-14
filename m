Return-Path: <linux-media+bounces-47157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 57406C5F82E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 23:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE4F335B81E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 22:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8E030F923;
	Fri, 14 Nov 2025 22:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Gbpjl+aX"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9793090DC
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763159054; cv=pass; b=QwF/ek9BaOcf0CND0+SauCX6NS8iHgn2RgNP7qDP2o+OQKOECFUbujhlNDgJq2jl5Q3NlIZBu9q1+KoeFXiDX2zttrhrqZb8mMhuK/vWU1LWACW7eG/XcNVfyrUQd9Tk8z/yUuHkJZHhTTaqiN14XBsRstHAejchM+BB0r7Cvhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763159054; c=relaxed/simple;
	bh=kfgYaquE/SepubHb9mH9FZ93nnFbLc/LF/+eqg0mAUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOTGmk+4TqGBu7lnibUcWToqqJ0mE/hP7S1RACHGfPQhiWSnwfvckIpLWIdkMrpcOXoIXyQu50v56uEGbv3X6ikd6mOtj7jvVDQmMliacG0eGbOCo2eKrTWJs+qnApf0X6DoXWZHuIyskgKHtx7VW/qFSVvcjQuNS6RuBz2kVrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Gbpjl+aX; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4d7Wrd43GHz49Pxf;
	Sat, 15 Nov 2025 00:24:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1763159041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3FwQ91ObArIhY2DRwPCaN/Y3+Ix0fei6I+rVq1fc9C8=;
	b=Gbpjl+aXHX5paqJdI/BUHmhyBBJ+Bbp2b8N7curYPMNj5+ktz3SMLHvK5DR81r6kRSpp6o
	NYACwWTv/3WG1j/UrHHU7X3nrYiGwiyOe0mQ4peV1rre2hd+8hK9hPEDUZgH+rC4fDlqIw
	oPHbAzkic8Sop480LtNMXkJ2MVuNxmQORDc0nDB9QRvf/dubjJCxswciX5OYSB0UNFwjJ1
	GruRwy7UaFaw9qISBJgsRGpn1rCAGuVuQdkXehYMEOfR9lw6wNmcLfpT9UDbKEdz9cartJ
	QpXs44X91gHuBTHZCdVdqPOeFtZ8kxDP5x98ibjf634oa6YXWXQmPPsSqng2hA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1763159041;
	b=dLGHK+XL6iiSd+N7qvFlt2gak98kZD6416y940VdZ2eJ5u0HnkaDRMWua+gF8l1lCdrQUE
	eWxKtyYBNSj06tTZ3ziuab8BuDmF1s7CuaSDxnCxOW7vtNdk4nhYZfCngbXEtxSElRmHRL
	R/U1EzuuARv3OwjVHK2FDRqc23e0PJ16jMYbsUrNtYSASj5uOBxCzB/b7DukfwheH3M7z5
	xCciwHaB+VRhBRwDJ808KdviG+s0ushWipUL9soScDyAQVqa4EH8N/tmMX11f2kdg3XoeZ
	puP7k5qIEu7SHJPn1XaDJfGsmirpURFKZ4emXPLx3+zxFhvN7WdpfMMq8O1qkA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1763159041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3FwQ91ObArIhY2DRwPCaN/Y3+Ix0fei6I+rVq1fc9C8=;
	b=fD7CSDTeu/86zgtx4QqbGdlem/Z588Ivg8lECemD0RODDeNwuwdjtlGrgDjP4EqJBVSrgT
	B/7NSRLcqBca14/Gb2CtWZebOCZsz8VkjXJhWwqT2CW7+Drny90lyd3Hgom8vRnu2RAeNL
	18wBsQtZIh3fnulw+it8oBOx9Iry1e/rEiZaEcW4avJpn/wgeztZIEwPrHZ4Tfn2pGKPDp
	zvZd7eOT8cObekoNROfjwHhEpOjKMnYBsI2rkA+4yVuDDVYS8bcgvF3s9Mgrxz1kOtMKFY
	ZWEBAaSlslKfkn9RsGvnwxuwZUDV9q2lqM1hr3+j9uPrzaz1RJOsUwLUIzAV/A==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D69E6634C50;
	Sat, 15 Nov 2025 00:24:00 +0200 (EET)
Date: Sat, 15 Nov 2025 00:24:00 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.19] New V4L2 drivers (rkcif)
Message-ID: <aResANF6CFNo9C4w@valkosipuli.retiisi.eu>
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


The following changes since commit d363bdfa0ec6b19a4f40b572cec70430d5b13ad6:

  media: i2c: add Sony IMX111 CMOS camera sensor driver (2025-11-13 11:33:39 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.19-4-signed

for you to fetch changes up to a2e51f925d009d835a81138a9ed1b4a144ebb254:

  media: rockchip: rkcif: add support for rk3568 vicap mipi capture (2025-11-14 17:30:25 +0200)

----------------------------------------------------------------
New V4L2 drivers for v6.19
- RK3568 VICAP
- RK PX30 VIP

----------------------------------------------------------------
Mehdi Djait (1):
      media: dt-bindings: add rockchip px30 vip

Michael Riesch (9):
      Documentation: admin-guide: media: add rockchip camera interface
      media: dt-bindings: video-interfaces: add defines for sampling modes
      media: dt-bindings: add rockchip rk3568 vicap
      media: rockchip: add driver for the rockchip camera interface
      media: rockchip: rkcif: add abstraction for interface and crop blocks
      media: rockchip: rkcif: add abstraction for dma blocks
      media: rockchip: rkcif: add support for px30 vip dvp capture
      media: rockchip: rkcif: add support for rk3568 vicap dvp capture
      media: rockchip: rkcif: add support for rk3568 vicap mipi capture

 .../admin-guide/media/rkcif-rk3568-vicap.dot       |   8 +
 Documentation/admin-guide/media/rkcif.rst          |  79 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 .../bindings/media/rockchip,px30-vip.yaml          | 124 +++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 172 ++++
 MAINTAINERS                                        |  10 +
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
 drivers/media/platform/rockchip/rkcif/Makefile     |   8 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 865 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  25 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 777 ++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  23 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 250 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 303 ++++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 442 +++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  31 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 153 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 638 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  32 +
 include/dt-bindings/media/video-interfaces.h       |   4 +
 22 files changed, 3965 insertions(+)
 create mode 100644 Documentation/admin-guide/media/rkcif-rk3568-vicap.dot
 create mode 100644 Documentation/admin-guide/media/rkcif.rst
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 create mode 100644 drivers/media/platform/rockchip/rkcif/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkcif/Makefile
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-common.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-dev.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-interface.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-interface.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-stream.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-stream.h

-- 
Kind regards,

Sakari Ailus

