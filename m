Return-Path: <linux-media+bounces-23395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77C9F109E
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 16:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D489E1883C70
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 15:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1661E2009;
	Fri, 13 Dec 2024 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Y1UgMspa"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA51E102E
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734102863; cv=pass; b=EIGd1YbExxJyiQA6d0P4tbB9x5QCs9JTPu7uRCS2zX7/AZqL7ZQkyA3xlww32CHLq8WMiWqvyg5azDJeSowcWK3NLtJWq//2BX6qy+CJ+qR1Z1bk+0qW6EDQ2cIPDz0s1nUfLdKER0W54ZmXaF4rBxihPkSn84MTSKx74Qc1I0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734102863; c=relaxed/simple;
	bh=VU3ecQ2d/AAPT+41mtd+nL9tDIY9BWAktVTbFz+h1KU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ouC3T0d3wGX8zc4DR8824dNljfziOTdhyQY9wvRh0NiXWpNq+1yDU00Flb0kMX7U58i17hAKRrxN5PMnWThS6E0XlhtGGp1+qe2cMsllgeopkrYxF9xhaUGh26gSgWuVQC/gcEwIOgnVPN4YHhRkSExANSeNLCcCU88VCt1sFdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Y1UgMspa; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1734102860; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TA3wD4sOKsDle57uTuzr4Ej3Xc3fq/P6Kqc9wmbHyuIfCrxdrocozN1PHbs4l3ZewGdFzVUwAqJTLKiiTSHqA0M0ASW34kMh3JHyFACB6dVqnKJISWeRaFj1NUjr+fK45uxauDQzMM72hnQYg9irDFvgpxz7OyuwqQ4HHBqYMLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734102860; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=KoQUBJAQPtiSw8SVhSQBVYRgnqAFyl5lPGskZ9U+XwE=; 
	b=kat7STf3IOPbMkuzb4OcHIK8PDo8rDrfmUQ1/DmNp5vqoUGJ+PwsPehHM/X8SA5dTgXEfT2v8bO6ewNgWWvQf7eQGYCyZRUn7wkyVaZJ0LWjepZ7kQKvBDXbP7TfNoB1N7pGIvAjQ7PF50qDghFkA7G3m5mIrBavDWWylrPlV80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734102860;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=KoQUBJAQPtiSw8SVhSQBVYRgnqAFyl5lPGskZ9U+XwE=;
	b=Y1UgMspaEZwAzEAbYd0HL6hcP+7V00Pbq0mu0/GjSmpt8Cm7yhz7kVFR5Tkyc99S
	YlWvEB/riXmkaSfG5oKTb6w8/Es7bdTdDiNoH79oaQNtN3g4wPjtEZlInt6xn/XhLvw
	RKe/wn0OAblXpsfiFjOB1DCiVMR90TgJzsirvLGQ=
Received: by mx.zohomail.com with SMTPS id 1734102859192655.3860008038012;
	Fri, 13 Dec 2024 07:14:19 -0800 (PST)
Date: Fri, 13 Dec 2024 16:14:15 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.13] FIXES: Vcodec fixes
Message-ID: <20241213151415.7opofgiz25lpmn5m@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
X-ZohoMailClient: External

Hey Mauro & Hans,

this is my first time doing a pull request for the fixes branch, so
sorry in advance if I did something incorrectly. These are two small
fixes, which I would like to see landing in 6.13 if that is still
possible.

---

The following changes since commit 2dd59fe0e19e1ab955259978082b62e5751924c7:

   media: dvb-frontends: dib3000mb: fix uninit-value in dib3000_write_reg (2024-12-11 17:54:19 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.13-vcodec-fixes

for you to fetch changes up to 531a8089b1f45cccd6e9a959bfbd20ecccdb56d4:

   media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline (2024-12-13 16:10:18 +0100)

----------------------------------------------------------------
Two small fixes for VCodec

----------------------------------------------------------------
Arnd Bergmann (2):
       media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
       media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline

  .../platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c     | 3 ++-
  drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c  | 6 +++++-
  2 files changed, 7 insertions(+), 2 deletions(-)

Regards,
Sebastian

