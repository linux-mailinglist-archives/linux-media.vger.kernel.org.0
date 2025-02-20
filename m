Return-Path: <linux-media+bounces-26524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F7EA3E802
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 00:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F20F3BE21D
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 23:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506BC264FBD;
	Thu, 20 Feb 2025 23:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsR+P/R4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5E91F1307;
	Thu, 20 Feb 2025 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092907; cv=none; b=qGHbvrkRJXxd4RMcHTSe6Xf77X/ks3Rde4e5UpuNadSr/9XkfX7SeCPCMZFOgwETvMcRxjCpk1WU0yHillO0W9KOZX9XCmKF5/81Zu8XjTU2/tpqiFIl0O1/KtfLNK6Sn3TJnZrKVfwUk3yCjb4vEGCkbszOiypWLi5zGQAs1Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092907; c=relaxed/simple;
	bh=pl+/7EWG3hPE+Epp1RScVgVLKto/qJ+PZdiT/igveD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JE9nSvhCpKkluUeuVxHvd0NsCiDN22/II2gGIqwV2dAV0lQdIN279btj4OxNXDsKnHEpMROjkhq5xeedY0+IYkodAJY6LLSua+f/OHEGVWJM+q2XFDYFnCLfHujqrThaip24/8wBOPuneNPYNv2ZCIRCraf1Ovj3UFUkViTNqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsR+P/R4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so2340123a12.3;
        Thu, 20 Feb 2025 15:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092904; x=1740697704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgLCVi2eqi2umimuqd7r8m9jVOLKYJ0bYbbWZhjQWDg=;
        b=NsR+P/R42SxlMwxW7+ucLIwM+8rfLW598PFbrCw1yQMqXd0Cnn1TlcsGkN9rCusXU/
         fq1725ED7rrRm9TX0vEiJXhkHc2KclJhaJCDv5fs57QA1pkNtpQOI2HB5dj0QfMUDMqp
         TfVGo1BoMe4azBdy2ix3yAv/g5z/yvrHbgzx1/jb9BIlEtsvsr2zFws0wNV8gk/EHAiv
         vTA+UpN9ttSmiKLa49evJFUv2/Mp8mYCo/RJeu3vdsM4UPX77kyWdIlD8mtAU4wTiE96
         AdZAJTZaJSd/ow2IdrSnBJK3I0wofjWcCpyuitsVxHpLYNufTblBRUUlW4w2ZbaaFcRD
         Ovbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092904; x=1740697704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgLCVi2eqi2umimuqd7r8m9jVOLKYJ0bYbbWZhjQWDg=;
        b=ByrgraTy/qgzwNHfqbsu9YfFJZ+YNfaenPSX7el+9Rw7CNG//QMTkE3SFS+q+Zu+iO
         D+3AFbUNZhHlnqmMfUyOHj5RZc4HUmeLah9aLZk6g64+6RBUA2ylNWQLKtbYd/VcfzKe
         EFDpV/AZu0WX+xD56c/Y813YXjIvGPBEf747lnbp7eJGsdjIbw3S/jVOIR8L8ucNS6fH
         NXaTkPjtu54wVz0M/g98VXfFe1gM0ralkPjGHOWNvQ+rskXcn06bSGe8XjqfypxLG0Ru
         7Cv5WDdUycAuJG3Yg7jG/JxQ6nqZHfGt/w/GrxPvY5QX+FkWdXl6NP4SEt0fFPx8RHAp
         F/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCURxd76F3DaauCPmg7XfiOxj0wgwVe/zPockvUrot+BTZ3F0fpvvT4e4d7fKx7o8a7JdNjb272RhfXs3BrJ@vger.kernel.org, AJvYcCVXwrGBOp+EhvMPqnt0Uh8FjJ0xFC8x5GawIF194VL0069oEcx5b9t86V/X+opDbdXfqEFYnuURdvyzibY=@vger.kernel.org, AJvYcCXL1WNMonsbRPY6YJ7qsayMWqjkYpe9jJ0SqQ3XQxQUkLxTIMgP18M1F+Hzsoemq6v3CYp2WyKb+xeD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6shKqK6QCVnN+b6bhoW2+zRlg3x9xghnQIkPy/mRJ8RQmb3RZ
	k9w+/kMGnKIGtzEjSXCwwABHCj9tOnmR6v60ZTGVT4gPdTEoxKjG
X-Gm-Gg: ASbGncvhP91P0Gqvf45ZqAEZVVHXxt0HhEwko+6aVRRwUHRMymu3s3X9lGslFxD1Skv
	HqB3VqfieGfeWywyTM0sNQUqUEh0bAvJvcnef/wfAs/XxAGxpOqCk37xMlBQbIOGBdvW07cBusT
	Ca27vXyVsUQ/hVYmrrIlKELrW2efUuen9MU9GcYCzreCpdrPo7uhfO3n7YVoFJ/DzXaiJa5pr1r
	k53tYlJZsOFbEiyYqrSrCE4uvLEQS1KmXWfA2YTTaxO5e7UHYwtdQS0op2bKLFdeTBYv3OOmg1N
	rFyftU60hkJPBX3ksXmBXoAzgX0x
X-Google-Smtp-Source: AGHT+IEDvxSma402XTJDmRJ/JuNvt76UQM64+7z10txDsXDLl3qf7Mk9kk+qny/wDvwm+o3bDkamYw==
X-Received: by 2002:a17:906:3293:b0:abb:cdca:1c08 with SMTP id a640c23a62f3a-abc09a0bfcfmr94355266b.16.1740092904163;
        Thu, 20 Feb 2025 15:08:24 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:23 -0800 (PST)
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
Subject: [PATCH v2 0/6] media: v4l: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:08 +0200
Message-ID: <20250220230818.275262-1-demonsingur@gmail.com>
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

V2:
 * goto err_rpm_put on failure to configure VC ID in imx219, and print
   error

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
 drivers/media/i2c/imx219.c                    | 56 ++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-fwnode.c         | 15 +++++
 include/media/v4l2-mediabus.h                 |  5 ++
 5 files changed, 86 insertions(+), 3 deletions(-)

-- 
2.48.1


