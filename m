Return-Path: <linux-media+bounces-29149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA238A77C1D
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C85F188F735
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 13:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEE920126C;
	Tue,  1 Apr 2025 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="kCbrsWPE"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801AF1F930
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514275; cv=pass; b=pM7T3jzJYbw4/8Q3bCG9++M/47vYziy9xM1GgY+K25WY/g6wfcr8leGtqjbzD1saq3VQBuBWi1OditqFoicz/3UnyvZqo+EZuaNEmHcX5FGDKjBiNDG6ah5fVepRzmxBwkOLLLOufvY2+ruwdji42drnNodHkauZySt9EXkyRGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514275; c=relaxed/simple;
	bh=V/DGKa8KBsOnlSLL+wJXPRUIsxlP96eXqO0jalfeWO0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8jJa6FcvNxa1Ft1UbfHmlEyjGq+UUH21BvO+b7meEFknQjYOcEOwhXEM+aXIYKUYKfY/G5wLFRcP1Kxn32Ijl/R4/1rdix3zlWCMavdRZW4/ZNIofA0yy4ludpkne+AOchfNEhDTuqpeIpM/Mq5wEx/aJiKlH+EjraxCi5MaCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=kCbrsWPE; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743514271; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NBN00Ed9tR1n96gGRe+y7kGa1NAZetwJ2k/Klh/PQ+exfkW045n519bsM3xEEAcQrzKE+48KZ51qEYa/oV4I+7YXZilTCT7opOyeZmt/fT6A0M3ixc/K19ehPE5R01tnmIqUqrVx1LGQ94x6FTXn2C2L+zuXQHeU6AX1/aovI14=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743514271; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=RnZco34rPDBCZ61NHJ4vPju1FWKMCsMCQSbK5hbzv0A=; 
	b=k3+Eojy50CPzCJ9yPy9YALxnlsFa/kKTVmF0hTK+Rk3G93ytSAR3VvmjH4Kt0u+CUs88DE3PurjZKDxAAXehmVeOFrvru3UI4i/gC4uali45CEx66mrDCYSLTCFEG6GLEokjvvFV7zYLmmD3B7/Phh434XMEz+svvh2wQ+AZ7Vg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743514271;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=RnZco34rPDBCZ61NHJ4vPju1FWKMCsMCQSbK5hbzv0A=;
	b=kCbrsWPE75pcNCvPu56oooQACVX1i4ZPgW6WR0rM7tKUEiUBA7LI7LgprlYZlqSS
	tWmQphpoDj6ZUJ3o3tYjpUTaJWGEXo88/X2vjY47ueWywC0ffMBEP2bnU1msy0DqqRC
	Sr6M5hu1wEFTR4uAMB8zOfcvIad9EvSaZ50SeK1M=
Received: by mx.zohomail.com with SMTPS id 1743514269611736.105602455207;
	Tue, 1 Apr 2025 06:31:09 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:31:05 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.16] Amphion reduce decoding latency
Message-ID: <20250401133105.ckyvtug4tn4wex2j@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
X-ZohoMailClient: External

Hey Hans & Mauro,

The following changes since commit f2151613e040973c868d28c8b00885dfab69eb75:

   media: pci: mgb4: include linux/errno.h (2025-03-07 12:05:42 +0100)

are available in the Git repository at:

   https://gitlab.freedesktop.org/linux-media/users/sebastianfricke.git tags/for-6.16-amphion-reduce-decoding-latency

for you to fetch changes up to fe951c1956dab9050c3e1187a5034db4f820689d:

   media: amphion: Add a frame flush mode for decoder (2025-04-01 13:53:00 +0200)

----------------------------------------------------------------
Reduce the decoding latency for the Amphion decoder

----------------------------------------------------------------
Ming Qian (2):
       media: amphion: Reduce decoding latency for HEVC decoder
       media: amphion: Add a frame flush mode for decoder

  drivers/media/platform/amphion/vpu_malone.c | 39 ++++++++++++++++++++++++++---
  1 file changed, 35 insertions(+), 4 deletions(-)

Regards,
Sebastian Fricke

