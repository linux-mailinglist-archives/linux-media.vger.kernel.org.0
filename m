Return-Path: <linux-media+bounces-16814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3695F2E3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31BC81F24FA3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3180185E7B;
	Mon, 26 Aug 2024 13:26:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE0818454D;
	Mon, 26 Aug 2024 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678784; cv=none; b=X5Yudi9ssmWfPX8fg2e0AwqKHFs3fNhx0y2+FbW+U6hDoZe2KEyCQlfhigozrLTjxC2eTLo8bQfbyE7DPoAgtKdv259nGayBqg4L6KL2r/CdReHFHMvErsuBSXLWHLaXsPrg0a00l+7jHQ/Be1SC15WJHWOIOAnHolIOLT0SfQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678784; c=relaxed/simple;
	bh=nHDRK+VjH0qEIIYJx4D/jZm2tnVHKK1joHijjtltUPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TftWVMVrn5zI/RLPv4dx0I05P7w+M4UbuA2upK2uEM6MJlUl+5kkkBt5DdTwYksrLLS2G8NWKgOX6gSDHH0XlS33BpumOWcUWtLcDwusqOZN7KpUKhAMJFtOQ5blYjGd1lcGh5BobNAc6Wt/29dh1YHfCpjg2foNSBc4avE8ie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id D2F6B2B0C2;
	Mon, 26 Aug 2024 15:26:13 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	11162571@vivo.com,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 0/1] media: mgb4: Fix debugfs error handling
Date: Mon, 26 Aug 2024 15:26:03 +0200
Message-ID: <20240826132604.3240-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

This patch handles multiple mgb4 debugfs error handling bugs including the issues
from the two patches from Yang Ruibin:
https://patchwork.linuxtv.org/project/linux-media/patch/20240821071100.7839-1-11162571@vivo.com/
https://patchwork.linuxtv.org/project/linux-media/patch/20240821072944.9275-1-11162571@vivo.com/

Additionally it removes the #ifdef CONFIG_DEBUG_FS lines where possible as
requested by Hans Verkuil.

Martin Tůma (1):
  media: mgb4: Fix debugfs error handling

 drivers/media/pci/mgb4/mgb4_core.c |  8 ++------
 drivers/media/pci/mgb4/mgb4_core.h |  2 --
 drivers/media/pci/mgb4/mgb4_vin.c  | 25 ++++++++++---------------
 drivers/media/pci/mgb4/mgb4_vin.h  |  1 -
 drivers/media/pci/mgb4/mgb4_vout.c | 25 ++++++++++---------------
 drivers/media/pci/mgb4/mgb4_vout.h |  1 -
 6 files changed, 22 insertions(+), 40 deletions(-)


base-commit: ea2e2ea551abf0ce8350f82e8cd431b7f8a1e5e9
-- 
2.46.0


