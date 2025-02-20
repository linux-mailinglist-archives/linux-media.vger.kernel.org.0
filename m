Return-Path: <linux-media+bounces-26470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7283A3DC76
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0738A17D79F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE77A1FE46D;
	Thu, 20 Feb 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJzdN4qF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3AC1FBEB4;
	Thu, 20 Feb 2025 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061069; cv=none; b=m6Q/u9ZelJDBTr6Mw1hQhX5pDhvXdvNyHToE7DeYF0xTiQbEP4D39cCbjbNN3okWBMYTdk4eIU3BnR7oYmbeCBrYH5rCug7iLFNBhY9W9YJY7UmkG0/YFbMDPU9uS391G4ZgwLR4Z/UZhGh0DCtHOPWLfkIrERoOQAvoFCU7JwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061069; c=relaxed/simple;
	bh=LUMgRUpWvuZjoguWpdCmke5vgOR7WB4z9bLKqjwwGy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5+6i5BEWkV1vCMPeL2WeM1R10+Q9MLBg+SJFt8/I0ZMFRoI20+G6mpOWk3ErYvRtVMEa6zk+vckUpu217sSyIasEzaWq6l75DGfTYe2niRPOrqQzIR033Cbg/tRfnsTrQIa4OVjzgIOMO90LGkpJDO+PrhfXz64IxgxE8HGs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJzdN4qF; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so1649079a12.3;
        Thu, 20 Feb 2025 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061065; x=1740665865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5NAA4XF+E1i12VZp9/nJoaJNV9QI4nVe2Rlxr+bSvU=;
        b=hJzdN4qFf+Cy1k27abaa4bUNZAAiXpvLC/1b5TL8dIm7IpzhUmP4pp83R/+X3vhUD4
         HJWfyQFHuVnErhy0G8q++Hc9zitIuxT2XF7u1UFiUwfi7z5jnBxlHPzoqgv348rCl+Nh
         avfHI4shiu+Xo7744j8u5Vmarc4vSEWSX52ioiwexu6QFK/qD0oF113s2UlE0fs0jVrb
         xVqexBe1XaIhpX1t62u2g2AANpTMiKi3fVVLNRVEFWgGKfJR+tyANr00dCREJtWZeHef
         r0LGVDN53RDxZcyaLrb8lVV6FyMyJHeB6VGQTKqDWjnJsPZINJhnPVnG5+iSV08+78FZ
         4NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061065; x=1740665865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5NAA4XF+E1i12VZp9/nJoaJNV9QI4nVe2Rlxr+bSvU=;
        b=SPqkHFVT6ggpM/GrwNoyeobjGxcfKojDd6ZDUVCfanv/eV16rUQ+bThQV6YE+qow22
         gXogFyN9UU16lRmhHlqR80JB0r5FDLVVKUVqdm2wpyTRmqOX3EX4uzcQpus3H/Owlg7f
         GUkQ0Np94OdcsuiizWEIdeUaiRUbGCAdHFlfI1+rqXvQ9+qKM/3AxRGn84buIN2/1EBC
         LKn7jFQHlUHL7SOBAiQpInWgEI5LnFpzMlQhu/zBffFr0YirkEDDi3/48G/tw05XffHd
         dZANd6QWeHhrbT6LOzPfalU1n7mU5MGHFCToRR3DQXay4W4snlCgkPHmHUiXijzwmu+g
         brXg==
X-Forwarded-Encrypted: i=1; AJvYcCUQTIU9/8dIDk94ADrP5BW1Cnv9Ipv3OIwN9w2ugI1AJaiOXgq8T8vPfV/fKBmzswX+d6Io8ZWc2/eJjPE=@vger.kernel.org, AJvYcCUhEcM8HWhCTJNGQlbmmB5Ts5bpXq07JDwz+LFfPL5xTyqAGxfJxvIyydNdOQ6fX11+syTzmZUZ0z/e@vger.kernel.org, AJvYcCWiS5KVvtqh5HrsWcpIo1LcuGb5pprqEHJAgZq+/TZ3xUmIu7Nvr+uJ5l+w99Vwl/SNFgr+6rHW3jounyiY@vger.kernel.org
X-Gm-Message-State: AOJu0YyHUQnDxJaowvoY7xQ7neBALR/a/WQDYDJ6IYwMolUj7U0hQjV+
	TmLHzeZViB+LGFVZxUK0E4uE/vGWd7HyjeLXLOjL0CIebrpZMIky
X-Gm-Gg: ASbGncu49AYtM//XAHmQw5hAjlckditQhtfVH6r/5/98ly9+zTYCM5f67RKmPiZ1AKL
	OgmzRqd/JERsT4IXj9fECh5HP4mD2eNW19yAhbHcvGmlg/yrWaYFMA8rFqwJ+h+zqVSC5FtgJZp
	kCjwivBQc5lP/oDxRYSwuZjpszqcK/wK29kSUWMbf8nonLBzXLh1JApkNJL/Ii/+KHzSI4ZIwmY
	ISyKZXRNrch/4xI6FgCOrbNaLHG49qTvuybaGzGe4qAahsPuRMu3aB/P+pRz5qlgnXC/6P/Ksld
	O1m1JTUxlxzP7BNzjsq3v6isUxvS
X-Google-Smtp-Source: AGHT+IHwF/iEm5a3EKb+wf6y31mYTImtmkfKgViMWXtti2k6qyught+ricxhgsnrzaDiZKQpJ1Np8w==
X-Received: by 2002:a05:6402:348b:b0:5e0:8064:b42e with SMTP id 4fb4d7f45d1cf-5e08064b595mr8838593a12.25.1740061065289;
        Thu, 20 Feb 2025 06:17:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:44 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 0/6] media: v4l: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:22 +0200
Message-ID: <20250220141739.228714-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for specifying these Virtual Channel IDs in Video Interface
Endpoints.

Add support for parsing VC IDs in v4l2_fwnode_endpoint_parse().
This allows us to retrieve the specified VC IDs in camera drivers and
configure the hardware to use them.

The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

The driver must validate the number of VC IDs and the VC IDs
themselves.

Add an example implementation for IMX219.

Cosmin Tanislav (5):
  dt-bindings: media: video-interfaces: add support for Virtual Channel
    IDs
  media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
  dt-bindings: media: imx219: add support for Virtual Channel IDs
  media: i2c: imx219: pass format's code to imx219_get_format_bpp()
  media: i2c: imx219: implement configurable VC ID

Laurent Pinchart (1):
  media: i2c: imx219: Report streams using frame descriptors

 .../devicetree/bindings/media/i2c/imx219.yaml |  2 +
 .../bindings/media/video-interfaces.yaml      | 11 ++++
 drivers/media/i2c/imx219.c                    | 54 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c         | 15 ++++++
 include/media/v4l2-mediabus.h                 |  5 ++
 5 files changed, 84 insertions(+), 3 deletions(-)

-- 
2.48.1


