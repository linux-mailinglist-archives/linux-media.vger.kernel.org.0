Return-Path: <linux-media+bounces-35610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A6AE3D90
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4105D3A38C6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2229C23BF80;
	Mon, 23 Jun 2025 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6IDILtF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811191AA1DA
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676439; cv=none; b=rbIb/qGmwzBFz2OqQyyXVlOcCrR5pEtMxeDLT/DvaBh9qlfChtv8x31Mewn5oOM6xloMG5bjtcMjpFCfKOWhZKptEyDlrHmZ/2vCl1O9cjxZAnz+6qrApSh0vVgwPGLEsv8oxsqBzJMcTxmuaYGxIw5IkIkJfyIPN6O+dFCwvR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676439; c=relaxed/simple;
	bh=KEZGEEqKSpovkohWWEATluwdswuR7DsRfJlcb7r5UrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EH6YoD/WVxoE/QzxQLikWvwWnuYWvClMq8lKe6eq91qXrf/95zqQNyNyG5XWKQtIy9TqSyY5lyKoKZVRZ3hF6FAwnbfiWqbKd0tpg6uviRwUS1zll/Z3YNCftnYbnuNYlRxSWb8lIOYTc9iVY3qYjhoI9e7Wm1vJKXYpIsgx0aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6IDILtF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009CDC4CEF2;
	Mon, 23 Jun 2025 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676439;
	bh=KEZGEEqKSpovkohWWEATluwdswuR7DsRfJlcb7r5UrM=;
	h=From:To:Cc:Subject:Date:From;
	b=X6IDILtFzuBfnvQn+qRI3VQRq0UCbvtSaP2wxIk+nNXx4BsGpJDEqehB0DplJqbvr
	 Z1f/YZz22YQBHNf93VgBsu1zU5vhK8oCnzCIpi2aYLY3SAWjCbTir8i5nKDnd8wdQQ
	 vE0Iefg/sj5G2+lCJI2hekS+2jsYOksMNZFgUbp9qyW8ueRs+2Ja6PeZ/3EGD96VNq
	 FXlDVLakUX8ts2ZWsJPIzWwfKd6MeN5lPEzbCLL4ZlL/L2vnjDoZD/z1Pzd3BbTk3Z
	 iidQOTOJhougmeSlZrv8M4ghY4vJRzCTpp/Kik/ECW0Bxy7xkKvGGHa5Z8BZEn7tAH
	 9lMTafFuEiXaA==
From: Hans de Goede <hansg@kernel.org>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/4] media: i2c/pci: Various error logging improvements
Date: Mon, 23 Jun 2025 13:00:31 +0200
Message-ID: <20250623110035.18340-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Here is a resend of a bunch or error logging improvements which I send
out last year, but which seem to have fallen through the cracks.

Regards,

Hans


Hans de Goede (4):
  media: ov5693: Improve error logging when fwnode is not found
  media: ov7251: Improve error logging when fwnode is not found
  media: ov8865: Improve error logging when fwnode is not found
  media: ipu-bridge: Improve error logging when waiting for IVSC to
    become ready

 drivers/media/i2c/ov5693.c           | 7 ++++++-
 drivers/media/i2c/ov7251.c           | 7 ++++++-
 drivers/media/i2c/ov8865.c           | 3 ++-
 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 4 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.49.0


