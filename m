Return-Path: <linux-media+bounces-19701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9551799F8F7
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 23:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 599672838C2
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 21:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99621FBF4E;
	Tue, 15 Oct 2024 21:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m6LgCaAX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72EA176228;
	Tue, 15 Oct 2024 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027221; cv=none; b=U27yVj4W9S4J3AMWf2Nwe92ytsqvpJf+sB6Zzx5BDWj7dLqlpOTLI8zjyDnxxmFJF/rZbEnn638AYlOnuczB2DBOCZFBV2UFQIMNYW9yZCAWmH7Ub/C1gr7X75Jzn7VOXjzhQ17H/8/PqQ5w4uua2e1gEQt5iNvWklfz6fPyffE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027221; c=relaxed/simple;
	bh=u9am+UCGnQilJbWAqiDmkykAchS51xzLBic38sT9mOY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FN64SK9s5zD1DQqI5uQ/qx7kGh6jLr38EZXU0S0zYp+mP6HmLG+cHxV2ZyFshYeIhrDj2XAUkrGy5ogFAdQNa49XAZfFftuIEe8dQJTtGaPXn0EI9JVuVmuo/cohIhD9Yhrb0an1FMCwRD6AfwsIVqiJLvug0RBMdCXc6vG6hTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m6LgCaAX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC3909CE;
	Tue, 15 Oct 2024 23:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729027113;
	bh=u9am+UCGnQilJbWAqiDmkykAchS51xzLBic38sT9mOY=;
	h=From:To:Cc:Subject:Date:From;
	b=m6LgCaAXx7HsiVedgIgTe3VhjIUkFnv7TGRV+QdwE4WdMagzuLTWN/t2JrabeVUUo
	 zksG74IPbCBMWkuT5aUmS8SSYvT1pQ8ffPh+LcZeetOQ70E94A5YD7UzZIbdDWHl2F
	 VkQuUTJEsp/qRhJZj6Vbp37imhv5fl07FxHJpUco=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: anders.ruke@gmail.com,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/3] Support OV5670 on IPU3 devices
Date: Tue, 15 Oct 2024 22:19:55 +0100
Message-Id: <20241015211958.1465909-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all

The OV5670 is found in the Dell 7212 tablet, along with an IPU3 ISP. This small
series adds support for the sensor by connecting it through the ipu-bridge and
adding board data for the PMIC so that it can be powered.

Regards
Dan

Daniel Scally (3):
  media: i2c: Defer ov5670_probe() if endpoint not found
  platform/x86: int3472: Add board data for Dell 7212
  media: ipu-bridge: Add _HID for OV5670

 drivers/media/i2c/ov5670.c                    |   9 +-
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 .../x86/intel/int3472/tps68470_board_data.c   | 128 ++++++++++++++++++
 3 files changed, 137 insertions(+), 2 deletions(-)

-- 
2.34.1


