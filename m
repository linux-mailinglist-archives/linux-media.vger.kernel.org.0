Return-Path: <linux-media+bounces-19159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CAC992EDA
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 16:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5475D1C21CC0
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 14:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7AE1D8A1C;
	Mon,  7 Oct 2024 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="BtQfY2m0"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830641D54D4
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728310772; cv=pass; b=VtiPdF7nfTZTg6c1Wa43bVSZ7PSzW1i7BQRKDYpG0uvQeP24wEkJLKl5CVxqj87IWY3GT4pwoEp5XauSfuSpWhbnsV0D4swfCepd5oqgJNf9MZMrIO8BQPkhtxCF4uABFvUp3viC5m6LFFLOWW3ZUwCEDkZJjIDgRkRhehz04Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728310772; c=relaxed/simple;
	bh=56scXZhUCXdxmvb9GWJYRxFM5h0Y+XNpuEhbEpZELB0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tHYDdirrC91wg35NbYtFSTwNxQdupKgvcvuFEqGvE/ait47SI1nVwqOvBrroO8mrlhSKCETs3y3Gpbx3guAZ6t5swvPNruDd2dUBHxSQZ0d0LciSbsZLtTJQU+WAoanT6mMcJasa16HIsvXFPP2kbnvlmJ8rej4ATjz8BO+jeV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=BtQfY2m0; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728310768; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F2r8DWkXcrHDUenuMuPi7VHibniX0QBhSkdtN00bV3cVWRxQoxARDxTqU+oBWVsobnM498t44q604YXyF8IdVXWhMoia4chVhzSCk0lRgJxQekf3H8BejEOB1taG2Ou6anI8+zfULKRzuwt7Gi2KNX8oyf6wyg6veytIgmd6/gg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728310768; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=8fTluUSKBR++8j2mAAvXXvyOSj7qs9Ns8UP+ilIGs70=; 
	b=btUoN9IQi8T0wRzNgFOR9ig9mHJJuusEHSt8chkvcATkCvICN78xsG4gubRSdm25Czlo8+IhcBnZLTF5Mel/4fexfrRp6KOnxF4f9YcnxYU7gytyse1ji9A472k+TUSmol86JXEOevAni0Qne/Sp1887qj/i+wAhOiPc0Y1SkNU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728310768;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=8fTluUSKBR++8j2mAAvXXvyOSj7qs9Ns8UP+ilIGs70=;
	b=BtQfY2m03F3xo/GnbRGyi3lhVHysYyb7BMlC6cgfVcUSJX/FrT8VDtuXNPN6vovg
	CVSwsG6V4H89NWoRTMWsDGbm0L4A5S4YmaDSuUMAPYUambHAv0j9FsN/hTR/couFm8X
	LKGKwSgHL9ZSoyK0kBvpSM14XTZrmuVgLhuw1bUM=
Received: by mx.zohomail.com with SMTPS id 172831076708837.16483881473721;
	Mon, 7 Oct 2024 07:19:27 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:19:24 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.13] Wave5 features
Message-ID: <20241007141924.dmw5xhdpnhpzgs74@basti-XPS-13-9310>
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

please pull the following changes.

The following changes since commit 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad:

   media: atomisp: Use clamp() in ia_css_eed1_8_vmem_encode() (2024-09-10 07:30:36 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.13-wave5-features

for you to fetch changes up to ff47f042e9931e7b638bd05b7bc4863fc22142d5:

   media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder. (2024-10-01 01:34:03 +0200)

----------------------------------------------------------------
Various features for the Wave5 driver

----------------------------------------------------------------
Jackson.lee (4):
       media: chips-media: wave5: Support SPS/PPS generation for each IDR
       media: chips-media: wave5: Support runtime suspend/resume
       media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
       media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.

  .../platform/chips-media/wave5/wave5-helper.c      |  37 ++-
  .../platform/chips-media/wave5/wave5-helper.h      |   5 +
  .../media/platform/chips-media/wave5/wave5-hw.c    |  30 +-
  .../platform/chips-media/wave5/wave5-vpu-dec.c     | 321 ++++++++-------------
  .../platform/chips-media/wave5/wave5-vpu-enc.c     | 313 +++++++++++---------
  .../media/platform/chips-media/wave5/wave5-vpu.c   |  50 ++++
  .../media/platform/chips-media/wave5/wave5-vpu.h   |   5 +-
  .../platform/chips-media/wave5/wave5-vpuapi.c      |  33 ++-
  .../platform/chips-media/wave5/wave5-vpuapi.h      |   1 +
  .../platform/chips-media/wave5/wave5-vpuconfig.h   |  27 +-
  drivers/media/platform/chips-media/wave5/wave5.h   |   3 +
  11 files changed, 460 insertions(+), 365 deletions(-)

Regards,
Sebastian Fricke

