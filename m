Return-Path: <linux-media+bounces-14340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1A91BF85
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D7251C20B5C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7D11DFDE;
	Fri, 28 Jun 2024 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UToNEzUb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA545567F
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581412; cv=none; b=T482HOykso3uJ+AgVkpF6e6oCpQFA3ECDmy9AYxigA27nZhL+D7zereS0GXk8d8BRgenXR6IefKAiCN57AMXI8f9EsZeCoh2jSf0SQwlq5foQtyYsu3v1t8yrXsVnk2fqMJPG6Rg1wrd4Xhu0lGilot0nM5kcQf2YV5Y/z1SI/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581412; c=relaxed/simple;
	bh=aiUwwwXQGsuxgPHwPy7yUAg14Z46gzqLXMQoDV38ZLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBdMhTNGIIqMC2oFahhSxzX8ZcPK8jI1YgsrtSCQsh0Q4Iv35aayYo4pJlGfA+T7MdTXOcCg99GGYZi4+Ht7n9gxzeGacLhTx2AdJg7zWmjWke4vN1GCnjVLXVMmES8x+2oqT6cmvbflzooKsCHdzerHirJ+TkBwKV/mqoJZWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UToNEzUb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B1E72C5;
	Fri, 28 Jun 2024 15:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719581378;
	bh=aiUwwwXQGsuxgPHwPy7yUAg14Z46gzqLXMQoDV38ZLc=;
	h=From:To:Cc:Subject:Date:From;
	b=UToNEzUbROScB6CvfJ5D6NIx+3Ci6qqpn4N98SQ4UfA6IfYfCOmeb65xepLvg2LPq
	 G+JNkmI5mjV887bf1AFspSDpeSZ5N58XAn82wsUS5J3xjkwE8CVD55HTshZOuD7ENw
	 v1i4DM2kBx9FUTseet8PFwXOtQXDl/BiLCxjBNgw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 0/5] media: uapi: pisp_be: More late fixes
Date: Fri, 28 Jun 2024 15:29:41 +0200
Message-ID: <20240628132948.871568-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few more late fixes for the PiSP BE driver, just merged in media stage.

I kindly ask to prioritize these ones to make sure they get in at the same time
as the PiSP BE driver.

The first shouldn't be controversial: BIT() should not be in uAPI.

The second patch has been blessed by RPi and the third one is a request
from Sakari to rename format identifier macros to use capital letters.

The fourth and the fifth fixes are new and steam from having tested the
following software stack:

	RaspberryPi v6.6 BSP kernel with the PiSP BE driver backported +
	libpisp ported to use the header from this series +
	libcamera ported to use the header from this series

The last two patches complete the header to the latest version of the uAPI
from the BSP driver and are actual fixes as the driver logic expects a certain
size and ordering of fields in the config structure.

I have now compared with pahole the size of the pisp_be_config structures
between mainline and the BSP and they match, so the uAPI is actually now
inter-changable.

All the components are available at:
https://github.com/jmondi/libpisp/tree/pispbe/port-to-v11-header
https://github.com/jmondi/libcamera/tree/pispbe/rpi-main/port-to-mainline
https://github.com/jmondi/raspberrypi-linux/tree/pispbe/rpi-6.6.y/backport-mainline-pispbe

(I used github just to be ready to send pull requests to the RPi repositories)

CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1212611

Jacopo Mondi (5):
  media: uapi: pisp_be_config: Drop BIT() from uAPI
  media: uapi: pisp_common: Add 32 bpp format test
  media: uapi: pisp_common: Capitalize all macros
  media: uapi: pisp_be_config: Re-sort pisp_be_tiles_config
  media: uapi: pisp_be_config: Add extra config fields

 .../linux/media/raspberrypi/pisp_be_config.h  | 45 ++++++++++++++++++-
 .../linux/media/raspberrypi/pisp_common.h     | 39 ++++++++--------
 2 files changed, 64 insertions(+), 20 deletions(-)

--
2.45.2


