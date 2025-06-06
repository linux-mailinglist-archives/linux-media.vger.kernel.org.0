Return-Path: <linux-media+bounces-34236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B26AD020B
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E85B01885712
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2809E288521;
	Fri,  6 Jun 2025 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZDQjazCJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71784283FDE;
	Fri,  6 Jun 2025 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212055; cv=none; b=HbSbFfzQqQk7KAS2GMC41ueguQpj0SR6SC1xYWFCDBfcsRpSJzZTxt6/4AaHnHSBkivx5Tk2rDI3Nj/JIfP+1hSZ9P6hzeqpOAm1bfgMZVsN8R/ELOZKIBRkHTwmEzBwsr9PF/0n4eznN+80SleuxEvkp32Xq++YXGEzx67UGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212055; c=relaxed/simple;
	bh=1WJsWhTzFsCD3REzePOpGgsNVGMiEg6va/vljjL/0II=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mrGf1halFHgBhlPpM+5NCzcivOySPTlneCdpFzdPvw8si7nR0GHIioxkDXPcZlwiSf4B3n6774jH0fnlpC74vYhMk7z4sQN3XOF9b3K3qgkW9joIzn1KlfbCGmz9eveHlPmToZvcoWsIXL8UgaeOHhPsx3L1WlUCfO8uSnWhxsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZDQjazCJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 250D211DD;
	Fri,  6 Jun 2025 14:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749212046;
	bh=1WJsWhTzFsCD3REzePOpGgsNVGMiEg6va/vljjL/0II=;
	h=From:To:Cc:Subject:Date:From;
	b=ZDQjazCJTHMo4obbI5CXD2mDzuNpEWRIbUIi9XKVgSj9VTzvWrRKtrMAdBDUCNrvO
	 3qCVZtM8hD3f9KVRo49qQAldwRaGLmF3+ni2QtA+NY+zA7qgEviGals6xso/VawfLS
	 PJbEuuUsaiHTZ9A1u1VOyhAFKJdKfIMkSM1IJIG4=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com,
	rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 0/2] media: Add line end IRQ to imx-mipi-csis driver 
Date: Fri,  6 Jun 2025 13:14:01 +0100
Message-ID: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many boards, such as the NXP i.MX 8M Plus, feature multiple interrupt
registers. This series refactors interrupt status register debug handling to make
it more intuitive to add other registers such as LINE_END, which has an
entire register containing only one interrupt. Previously, the
mipi_csi_events[] list contained a debug enable field, and this replaces
that with a status_index, which indicates which status register contains
the mask for the interrupt.

The second patch adds the user line interrupt, which is useful for
debugging, as it allows a user to trigger an interrupt after the MIPI
CSI receiver has counted a configurable number of lines. This can make
it possible to discern the true resolution of the image stream reaching
the CSI receiver. It adds an entry to debugfs which lets users choose
how many lines are needed to trigger the interrupt, and can be disabled
both within and outside streaming by setting the value to 0.

Isaac Scott (2):
  media: platform: Refactor interrupt status registers
  media: platform: Add user line interrupt to imx-mipi-csis driver

 drivers/media/platform/nxp/imx-mipi-csis.c | 107 ++++++++++++++-------
 1 file changed, 74 insertions(+), 33 deletions(-)

-- 
2.43.0


