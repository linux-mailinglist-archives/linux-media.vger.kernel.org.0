Return-Path: <linux-media+bounces-31689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F5AA8E80
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 10:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66AE93A4F3D
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 08:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817981F3FC3;
	Mon,  5 May 2025 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="v8bqE/jo"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341D1B0F0A
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746434876; cv=pass; b=bjcfKsL7BUSFkAZd8/LzLZohYa+sGbptSA5a+POun1iz2HGJynuz3trLfsfk8YOcIeWEnHNC/S0asFaqhI8rMu6xUF8g5FhHOb68gYT5Js91wvzHoAp2dpN8AXY3MSZFEW7HzBfLBsIUa29sRn5I2QJE+toiP/7F6BxwF33WXvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746434876; c=relaxed/simple;
	bh=DzBfhdOufowdOKDJUcPSoTLI7BkVlhofGQ61NRQE3YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tkKB7DP8oaZxf+iSW7AxTCV2aQGydF511rZi6I6mgVAfhKy6U1KNR6vEgI18zEQQqzSYhgfQeBnahHNTflgjk8VTgYXtDUp0x18j7zrPqGxK7EaFju3XefqQHZmARJiAD43gkBhMhqLCPvqm9KE9P8jyYXE2JOZwnx1nNGLd+j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=v8bqE/jo; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ZrZt00jGTzyTQ;
	Mon,  5 May 2025 11:47:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1746434872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=RgR3DrN0hQXJMSA5Wd0nWtzlQb53hKxzB3VcIhSTmZw=;
	b=v8bqE/joXCbebKKypFsNmVTeR5qGUk4m7OdcfRA18DrknaoBG5rlDennipMZRSPAwKDDKi
	BnXtKrIHO6UnT1/YrKRSUEDUrfkChNJT8uZx23eMH+yW0VlxEMXbznkTQbAz+nWGLX0I+P
	+zmlkt92tUU+FXZPaZVOjW4uN+Wowjg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1746434872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=RgR3DrN0hQXJMSA5Wd0nWtzlQb53hKxzB3VcIhSTmZw=;
	b=L/bBZrlI9kU52Q8WMCHqDaJhBNcPZkvvbwhTT6e+mQa4rAg87Vst2Qan2oSktDb5njnPPo
	H6IsL1sb4ksafumlnAUB6vS5caXA45LgWzxPTxlZshRSEB4DCdBeR4117rYv+Efy0acv+5
	VlDyOcjmeRYi+gOY9NrjV/h83D2zx+k=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1746434872; a=rsa-sha256; cv=none;
	b=LcPeCgKWV7NnPNKg+kNK6pUO3I/c8DSLEZPU854Ra/GZRvYvSWlqaW/SyzCuenKMV8t/Be
	hLpUA5UXhzh4BjnjGlSBEBa2Gj1XuHd2nr90lD3R2JbAyx8VVmM/iFjcnO9lKqTXYOOPZT
	EoKcVBgzcPx+hsSrrsXrhIjTCYuiOd8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6CD46634C93;
	Mon,  5 May 2025 11:47:51 +0300 (EEST)
Date: Mon, 5 May 2025 08:47:51 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.16] New camera sensor drivers
Message-ID: <aBh7NzWRlLmqOIsa@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are new drivers for SD VD55G1, ST VD56G3 and Omnivision OV02C10 camera
sensors.


The following changes since commit b64b134942c8cf4801ea288b3fd38b509aedec21:

  media: renesas: vsp1: Expose color space through the DRM API (2025-05-02 10:16:44 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.16-3.1-signed

for you to fetch changes up to 545fbfc6a30f41eba9881b3e8c127301b3ebf684:

  media: i2c: Add driver for ST VD55G1 camera sensor (2025-05-05 11:41:22 +0300)

----------------------------------------------------------------
V4L2 patches for 6.16

----------------------------------------------------------------
Benjamin Mugnier (2):
      media: dt-bindings: Add ST VD55G1 camera sensor
      media: i2c: Add driver for ST VD55G1 camera sensor

Bryan O'Donoghue (1):
      media: dt-bindings: Add OminiVision 0V02C10

Heimir Thor Sverrisson (1):
      media: i2c: Add Omnivision OV02C10 sensor driver

Sylvain Petinot (2):
      media: dt-bindings: Add ST VD56G3 camera sensor
      media: i2c: Add driver for ST VD56G3 camera sensor

 .../bindings/media/i2c/ovti,ov02e10.yaml           |   47 +-
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |  133 ++
 .../devicetree/bindings/media/i2c/st,vd56g3.yaml   |  139 ++
 MAINTAINERS                                        |   26 +
 drivers/media/i2c/Kconfig                          |   32 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/ov02c10.c                        | 1013 ++++++++++
 drivers/media/i2c/vd55g1.c                         | 1965 ++++++++++++++++++++
 drivers/media/i2c/vd56g3.c                         | 1586 ++++++++++++++++
 9 files changed, 4940 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
 create mode 100644 drivers/media/i2c/ov02c10.c
 create mode 100644 drivers/media/i2c/vd55g1.c
 create mode 100644 drivers/media/i2c/vd56g3.c

Please pull.

-- 
Kind regards,

Sakari Ailus

