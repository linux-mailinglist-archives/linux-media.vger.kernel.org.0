Return-Path: <linux-media+bounces-37086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5E8AFC8A6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F288F480AD8
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D952DA77C;
	Tue,  8 Jul 2025 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Iaqshucv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43AD2D9ED9;
	Tue,  8 Jul 2025 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971275; cv=none; b=Obalx+ui+RfqlyANXaAamRLUdiBOerUROJZXonF9aIeEbJsq+PN09p/l0/mPHiulM1j3aQX43Xh9u769lnFQP4to4B5Ybbtp0WTUoQU6Q7gaSo28KT8RPUatyDmZDD0DnDOamZtpczm2aay3k6WAlZgCDwKOJdpJRhkkIpfrUrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971275; c=relaxed/simple;
	bh=M/R7QNtY3WWeSOL+meIUvajO8tLpcXYlab4cNCnyGoM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dc90XY7QD1Imywkj/u+CBuaMREmaDw/BNpTKhJhGum10Pll/WED2U6tfpygpQLWHDc5Yv+FBfDYtA2aWW7XpRbULymFi1xLU3vcFuWsZM6XoayH0hklr7xVAuhVuN3L2R3TGtVK1utbmCFQP//FbV8qhPa6zdVQtAQD73SCCFb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Iaqshucv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09D3350A;
	Tue,  8 Jul 2025 12:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971238;
	bh=M/R7QNtY3WWeSOL+meIUvajO8tLpcXYlab4cNCnyGoM=;
	h=From:Subject:Date:To:Cc:From;
	b=IaqshucviT44STswB18ARkA4uVKslXHErGBrdTHWP31XFRilPI6iv0fRo66W8IRHq
	 QxqRHMJZi49FS8IMeWeKc29kZC/DEWjRlBlx0O2IsYBTOijudh/jlBByYaTdrni7oG
	 UOj0dnJ4+9oZZrfCVrwVttlPzKjOMvhppO40p4JY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/8] media: Introduce V4L2 extensible parameters
Date: Tue, 08 Jul 2025 12:40:47 +0200
Message-Id: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/1bGgC/x2NwQqDMBAFf0X23IXEIpb+SulhjS/tgk1lN4gg/
 ntDj3OYmYMcpnC6dwcZNnX9lgbx0lF6S3mBdW5MfeiHMIbI2CuK67SAVzH5oMKcN1l0ltpkTrd
 rzGMeUgoTtcxqyLr/F4/nef4A/D07FnIAAAA=
X-Change-ID: 20250701-extensible-parameters-validation-c831f7f5cc0b
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3686;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=M/R7QNtY3WWeSOL+meIUvajO8tLpcXYlab4cNCnyGoM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPW/xcSH01XHbjzoLEDUF3UwH7xfSWv4wBikg
 ilaU3lDKZKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1vwAKCRByNAaPFqFW
 PHv/EACnTT5Kx+do5148Oe5MQo4vnrINzTcR/3VRciCYZTnkpWGV4i483Aphv+Kdg7E8VOVxpS0
 c8KvfVsnG7hN54xdkTAvP7ruWXYMNPh4Mv6fUlaVQRfC5aJZIHtlu1Fku72i5Mlo1c9g0PwvAsb
 tIWswq4JZe5idmb3M6fRKYxzYQ69CPAGkugPTH76QKi6FO0tGYQu9t1askHeoxwz+nMNnGOn/7F
 5t2z8sDOB9YMkMZtRxHu/QCkC+JO1hD3G9qEsXZFjy2i6wqdq8gGwe9yvI1n4LdDzXhyls446nu
 lFz4eTQe0tvZxzPCmpFT+vK7rOI5U+DFJug4mU6y+ddjUwf3tcQfCkdx3IzcXedQpLRdgJ6W/eT
 uphHlYimadaEbNexprf9Y671xatpQzSsLrM67gP7SP9TybJgm2prpkYbVk2uwjpYSIpulwn6j8a
 WWkQdm9a8Dyqh4KO5B+2Iw5aDLS2TVtG5j2m0T/Er32o7VIJtQR5EQKBVoFd/R4XVzXQ8X4IE2i
 nJrX6ixGSDNcRo7il5eKuK7KmPqrrSeilog040Nhe4OIzms6ZMlhaeioXkKX6ONpKAMzjUTaVT7
 CSheJI9Cp72swqX5GO9+lU8JJYpRSKaRUSJbCyDdNYm9ZZ5QZx5OgOPqALLOYR3+SRSjxoNr+iB
 uCEmsWq75n93tHA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Extensible parameters meta formats have been introduced in the Linux
kernel v6.12 initially to support different revision of the RkISP1 ISP
implemented in different SoC. In order to avoid breaking userspace
everytime an ISP configuration block is added or modified in the uAPI
these new formats, which are versionated and extensible by their
definition have been introduced.

See for reference:
e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
6c53a7b68c5d ("media: rkisp1: Implement extensible params support")

The Amlogic C3 ISP driver followed shortly, introducing an extensible
format for the ISP configuration:

6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")

with a very similar, if not identical, implementation of the routines to
validate and handle the ISP configuration in the ISP driver in the
c3-isp-params.c file.

fb2e135208f3 ("media: platform: Add C3 ISP driver")

With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
a third user of extensible parameters is going to be itroduced in the
kernel, duplicating again in the driver the procedure for validating and
handling the ISP configuration blocks

https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/

To avoid duplicating again the validation routines and common types
definition, this series introduces v4l2-params.c/.h for the kAPI
and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
and Amlogic C3 drivers to use the common types and the helper validation
routines.

If the here proposed approach is accepted, I propose to rebase the Mali
C55 driver on top of this series, to use the new common types and
helpers.

I have been able to test this on RkISP1 but not on C3.
Keke: would you be able to give this series a try and see what happens ?

Media CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1465950

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Jacopo Mondi (8):
      media: uapi: Introduce V4L2 extensible params
      media: uapi: Convert RkISP1 to V4L2 extensible params
      media: uapi: Convert Amlogic C3 to V4L2 extensible params
      media: Documentation: uapi: Add V4L2 extensible parameters
      media: v4l2-common: Introduce v4l2-params.c
      media: rkisp1: Use v4l2-params for validation
      media: amlogic-c3: Use v4l2-params for validation
      media: Documentation: kapi: Add v4l2 extensible parameters

 Documentation/driver-api/media/v4l2-core.rst       |   1 +
 Documentation/driver-api/media/v4l2-params.rst     |   5 +
 .../media/v4l/extensible-parameters.rst            |  89 +++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 MAINTAINERS                                        |  10 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 272 ++++++---------
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 364 +++++++++------------
 drivers/media/v4l2-core/Makefile                   |   3 +-
 drivers/media/v4l2-core/v4l2-params.c              | 106 ++++++
 include/media/v4l2-params.h                        | 166 ++++++++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  45 +--
 include/uapi/linux/media/v4l2-extensible-params.h  | 106 ++++++
 include/uapi/linux/rkisp1-config.h                 |  60 +---
 13 files changed, 775 insertions(+), 453 deletions(-)
---
base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


