Return-Path: <linux-media+bounces-29698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF9A8196F
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 01:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D00814447C3
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43B32566FC;
	Tue,  8 Apr 2025 23:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XdMGQ9R1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535D23FC4B;
	Tue,  8 Apr 2025 23:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744155232; cv=none; b=fLfS6TvnnesqtbhVaRF83XRxT4E+5ogWfe466wUb134mOoTL4kMlIKb7R3o83Yxzlpdd4oKqEKmXiLXjE0f5kUQGPErZgP2g0cLqcZWkvRvsqaESLQbF4wIM1wH2cH9V0QXpmV3LhuSBOXBOPPlI198XrQByX+5ujPu37GePdF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744155232; c=relaxed/simple;
	bh=TfqR7GvLXcSIsEA252LK5Z2N9lDyHgDy+nX4Bz9uYmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtWLxjY88YetnqjqKf7OkzHgSgNM5aJLngrYXU0ztyaMc8gjGmVqjMELmKzTq/2K3LEeWA2jkHooC3vdMZq5s0y1+q64k/zplnh7yAqqGrxbLgKTUAR62Oq5VZY98dtLhLDUvCWNovw3HezrlRf2w81CA6sQqnIu36XNZGf5Ato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XdMGQ9R1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D95A7352;
	Wed,  9 Apr 2025 01:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744155111;
	bh=TfqR7GvLXcSIsEA252LK5Z2N9lDyHgDy+nX4Bz9uYmw=;
	h=From:To:Cc:Subject:Date:From;
	b=XdMGQ9R1jLA5GP6Q1Wk0kj4GoBCfbHTmwRddM57I15vJXH4O8CMgDFtXXkntuFqG8
	 P1KEQyLzYq2CUEh3Of/a0n1QNJEaUsq+0YnPhVEOtlRhgM/a0Cp+gpIYimNOlI+AQa
	 aEcdqLY9WEm6z1h1F/eswrhqx2xp2talKzzu0KmQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [yavta] [PATCH 0/3] Add colorspace support
Date: Wed,  9 Apr 2025 02:33:20 +0300
Message-ID: <20250408233323.7650-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series add colorspace support to the yavta tool. The
first two patches are drive-by improvements, and the last one addresses
colorspace support.

Laurent Pinchart (3):
  Use SPDX license tag and update copyright
  Constify various global variables
  Add colorspace support

 yavta.c | 233 +++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 212 insertions(+), 21 deletions(-)


base-commit: 547e4995ac18091913e0500d09374a241bcae59d
-- 
Regards,

Laurent Pinchart


