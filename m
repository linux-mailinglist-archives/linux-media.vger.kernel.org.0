Return-Path: <linux-media+bounces-10218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 573C78B3612
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 12:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9AF1F21CEF
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A574144D0F;
	Fri, 26 Apr 2024 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EKAFRU/Q"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63388144D16
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714128697; cv=none; b=nw+MxTEYDkNuKqcPo+rZw2wjIXEiUHvj+8Tl6rVmfX60m5QSlSkEQynx1zHO+qDJ9mKmKE+2O8Ji8t9XtolfgIZ8tp1lzEZI6O/n5EYbQv/FTSGXYheXnaip7P+fkL8IGu9fxsoLle7BUJVDGs0BY7l6cHptt+61Z/p/lj0SaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714128697; c=relaxed/simple;
	bh=Rf3GXKEnT8GjnjL5bpnzCzjCnAiiS8Z3H/yrVM/vwZU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HzbXeDbAlzBJMqh/R+i8X8M1Kl5IkMAXyP+k4pSYODYDRuDbkTz19nat5a6Tjbt8L3eAXnDo41GLU20uKASeghCF7dESM2aC6LzkU8kFw9PtqPt7/0CK9itBBFaogoz4rLeS93MjszVCva8RwKs7EKeKaKY7I27p0qB+XtK3c6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EKAFRU/Q; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714128694;
	bh=Rf3GXKEnT8GjnjL5bpnzCzjCnAiiS8Z3H/yrVM/vwZU=;
	h=Date:From:To:Subject:From;
	b=EKAFRU/QAuqoag/j3gL0uWKhCsg+wloplQcnRWEmSHrmyGNXK5twzfXH6qNPUoPJ5
	 Cio9m0kE+4qXVG2Qb0sLMGOwRe1/6yrbu1HeN4aOPh/BF3FFT8H9laLLOhhabsxAhs
	 fziVCannGng1+RYbSe5yLkgY2rH2KiTimGr8ETGhsv+GgiplxlvtjOwas1BYsq6jaP
	 7vpJM9va73ohBlNw1HZk7Rw+AUBkBcNUxEDbjmIf0+6bcRJbrq/W1R3cs+DL5bIJyV
	 F5PyjiwfqfKAlj6YFR6Z2SM2Xv+t9RCYLrJmtOpUx1CqP06/gvPCRVVljKWFlqYFZq
	 r51TGm8jaUtng==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89C0B3782156
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 10:51:34 +0000 (UTC)
Date: Fri, 26 Apr 2024 12:51:33 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.10] MediaTek MT8186 encoder fix
Message-ID: <20240426105133.3fxsdm4ayosoed2r@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

here is a small fix for the MT8186 VCodec encoder.

Please pull.

The following changes since commit faa4364bef2ec0060de381ff028d1d836600a381:

   media: stk1160: fix bounds checking in stk1160_copy_video() (2024-04-24 13:49:56 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.10-mt8186-encoder

for you to fetch changes up to 1f2a604758ead45b07f514fcdf8efbbf5c438217:

   media: mediatek: vcodec: fix possible unbalanced PM counter (2024-04-26 09:54:57 +0200)

----------------------------------------------------------------
Small fix for the video encoder of MT8186

----------------------------------------------------------------
Eugen Hristev (1):
       media: mediatek: vcodec: fix possible unbalanced PM counter

  drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c | 4 +++-
  drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h | 2 +-
  drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c       | 5 ++++-
  3 files changed, 8 insertions(+), 3 deletions(-)

