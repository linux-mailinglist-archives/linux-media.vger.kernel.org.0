Return-Path: <linux-media+bounces-26434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78554A3D47A
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 10:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D18017A7D3E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 09:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95491EC01B;
	Thu, 20 Feb 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr3iWc/q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31FD1BC09A;
	Thu, 20 Feb 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043245; cv=none; b=g1hGQzHX13pE4t21REtnknwmTdwDvr47STQDGZ4OwwC5eze/sJszsZ5Ws4gmuCZ4sQ1NVcQBO6QbVWKQJWW5sk5xDP0/EVWQLeFwV8Y3v87RwOKmyvfmaciEJLh4ioKMcFafA3NZlPfirpwmet6/4xWWhrllXRkjhrtmb0SLb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043245; c=relaxed/simple;
	bh=KwTxzj8EU6mJ8ad9IUkHxV6TfA/e+UVoHR9+ftJvD74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2tI/fS1RDUo2svUY+DSdF2MN9YOkxvsuB3kv9M5v+yqOEQ4WGWXg3rvgGi5VBNPG8QplT/PavJPgdzy7JlCRKpyar+KX4qg3zvkkmat0ab9Kn0hczrtCo98YYjTcDYXO/9OyZknmJnTM8rPVyEIMJgXTo1RbcTTBl8xz0LtEbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cr3iWc/q; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaeec07b705so113254466b.2;
        Thu, 20 Feb 2025 01:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043242; x=1740648042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJFLBjsE/w48uQWEE/sJf25WWFt47cr8Ziom4yxnO9I=;
        b=Cr3iWc/qq1aXx6rZ+I55++uHNAOr1yxNuHMTSH/GWJA/lJbFw0Ll2MLvzk6Gki/Sff
         Ynj6Sn8AsIGIdZdAh6zMgz8AP8Lua38BHqgQopzrMM4jGi/GLEskkeAnhd0psUjNEGOY
         U5OABA0rNzNzTKwWK+Fznc6a+6J6gBwmRW88ZsKqdiv/IimJlvjyTT0J5bZ5m5P5KCb4
         X2Fq+2rgO3rCQIAvu03XMaicT/G7h4nCT6h3rOBEfFln0Aq8QaENhAyvbUFhqjrOFKY5
         LtO8eBQ7vZuVYnqyDF/nLu0X0QesgQ2HX3vSc5qx62EiC4X8aEgGUp03sWUTE6kHXgod
         UYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043242; x=1740648042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJFLBjsE/w48uQWEE/sJf25WWFt47cr8Ziom4yxnO9I=;
        b=LNWUs0IZKf2qlwbq+eLJJdeanNV3QaSxj27TsFlcoNenty9GAmCkGSXA+5rI5hSpbO
         EEQDhdDYwG2q2qBcSNWmUhX9zi5WXCyQ66JU+cQqqJJK8c5Uqjs5BSGE2ygpgKtjZ03z
         zDNF/Mm1p97A3DbUW9Dzbxgl6LZGmcpAi0kWcs44TOzSpkBxUca3LX6JN8r7U/qEgUiX
         6Dw0Qu7pt55l6AE6vlKUrKvfSy06CVq4zitKpJXTMzobrQav00GfDsB38MoxWCfmE77V
         dKWK/AIWY5A8SlUCN9di0mwsGR9Tceay1IrUwHxQaGoLz/erhTvy8hhxgLsuPGgz+bW5
         w73g==
X-Forwarded-Encrypted: i=1; AJvYcCUJVstJZK2V2fGl4dfEQdPi1ikLk+2gyX5TQkXB33PhN6y0pw1YWl0SUBnCkK36D2yu7X2Ms1LS6fB3F4k=@vger.kernel.org, AJvYcCX66dGIBwT4rlE08Q4NyIu6SDYxc1OVPlIBJ2Hw21pdlm5LGBfWkPvjtJZH9S26ED8Oapp7aODqh/kjqBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgxBUepBn4uJksj9l7DOXVoMSp+uYYucMuzwwWqfT3Q44AMSnG
	rNthyfxQkHQt20Z+7Eym0F5z25MwacftZuXgRLpJ83i9rTzkDCMD
X-Gm-Gg: ASbGncsZVvlvFDhV4tRkuha8LDlBunCr+3dIXtDZyG2SQxZLP5Z7hy61H4dZ4H78N2A
	9WKlR6ClFOWvPLIhuMluFCTbzes9dR+w3qf1ZlcjIJFzxED6W3OrQ1eolzNExh/xJtLIyKqKYZz
	a5JBLirJhHx2FZ3HiRfcICXhPgJ378MTs36I5D04tMqniqIF/hzWIGWxKL0pnqwcAjpEv+2Tidu
	a9Z2mTcognFtyvl7t7zYnJ+IYsc/HsxQKK6cMRdVI1ZikmymvaObWg7qcr6w1aTZEubBmAtx3cz
	uM2FmjAJAUuDtkGy/MVcqqa/8tjy
X-Google-Smtp-Source: AGHT+IFH77Toh5BLoa/DoGQILLeWN9qsNu4stk384IN/rlsikDaMIRUYzdJmJUURfmK0ptNDuRXjEA==
X-Received: by 2002:a17:907:930a:b0:ab7:e7c5:b373 with SMTP id a640c23a62f3a-abb70e3b378mr2010338266b.55.1740043241671;
        Thu, 20 Feb 2025 01:20:41 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:41 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:32 +0200
Message-ID: <20250220092036.6757-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the v4l2_subdev_state_xlate_streams() function is used
to translate streams from one pad to another.
This function takes the entire subdev state as argument, but only makes
use of the routing.

Introduce a v4l2_subdev_routing_xlate_streams() function which can be
used without the entire subdev state, to avoid passing the entire state
around when not needed.

Convert all usages of v4l2_subdev_state_xlate_streams() to
v4l2_subdev_routing_xlate_streams().

Remove v4l2_subdev_state_xlate_streams().

V2:
  * Fix description of parameters

Cosmin Tanislav (3):
  media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
  media: use v4l2_subdev_routing_xlate_streams()
  media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()

 drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
 drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
 drivers/media/i2c/max96714.c                  | 16 ++++++-------
 drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
 include/media/v4l2-subdev.h                   | 10 ++++----
 8 files changed, 53 insertions(+), 47 deletions(-)

-- 
2.48.1


