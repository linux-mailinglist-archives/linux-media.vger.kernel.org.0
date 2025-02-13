Return-Path: <linux-media+bounces-26118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDFDA33C35
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 11:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8889B1882E42
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 10:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABA4212B32;
	Thu, 13 Feb 2025 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="gfRepGri"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0432066D3
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441533; cv=pass; b=mraedX/GCSzHm4BeIsZm+s6GKXR45WAH2ls/nzXvZ4jR2VPNrOmBbVMcGlWvTw/pmjXOeFBJN2jQMKJbNy43a/AaziXpxvEwsqAf6m2Q58YE0B1Ul1rdH3tzyhUn5/63Z+a2TF+fM88AmMIxofcgkOKeF2HMvX9eJz/oN53OHRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441533; c=relaxed/simple;
	bh=01JzCdd4nhVjEDeV+7d27DPf+lkOhca7meZoWvE7s5s=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=GOaXG6jUwJqVuBoNkYqBlBW7zMM+o7d65heS819+I67PCIAN+SSLnCojHYL/y/bj4C6SnlBBBG1avhIDV1m/tp7b9pOBCBEcY7ufM/0w7IpWgRjrj0fHDxdDFh24GdVDhCNfwoRgNQXUahqeHJ5YD7wJE7k57gSNxya2OInWcos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=gfRepGri; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739441530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ETfoeDI33tiHnvzMw92GGgvLSXfdU4YXkrUGI/cEFYLueGqwuPjAqEHdVunWGLqtyJA7ApLIGFDWphJQPt4KSw8kKSI79BAUOa2HRiGoE8iQvaapGwEw8qd2C42V8yy+bALv08SKXSFPCUgCdUQQNtdOvXlkMai+yqNWLBgDtdg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739441530; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=yC/H0iGIFaIW0xV+3bCb0j4N7W372zupjhh2nKTNzG8=; 
	b=oDi0GiK3D5MKSIK/TOWltmh6OtN+MK0rlX0sNr1C5myz2Wp8dcuj22cJRMs0jl6ByNm/DF2vVYtg5uGE6ICc5/oGhEi86BJUUvEwNRNj7npU35J+XRS2dyyWRi9EIvJT3zi4MFKg/bnzNydbK0VaO9mlCbvE9JDLkUrH6p2u2zg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739441530;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=yC/H0iGIFaIW0xV+3bCb0j4N7W372zupjhh2nKTNzG8=;
	b=gfRepGrim3fJTjYF09dgEkb1Jg/n6CgpazrCTV9KE15/lxwc1/rBjeRsIp/mc21Z
	pUvotr6h9XyT38vfUwtA2gWEih3WQI4eUn3UFX/0Dg686hdSWm9WvFOGm1S/13cYvYF
	+z/RW3CuQ3PVLAYP/sQjSzk6O8EEv2BHfiVvltv4=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1739441528906627.5461185450031; Thu, 13 Feb 2025 02:12:08 -0800 (PST)
Date: Thu, 13 Feb 2025 11:12:08 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "linux-media" <linux-media@vger.kernel.org>
Message-ID: <194fecb5ffb.102a3cee5964478.1717519691223129395@collabora.com>
In-Reply-To: 
Subject: [GIT PULL FOR 6.15] Wave5 fixes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello Hans & Mauro,

here is a small set of fixes for the Wave5 driver.

Please pull.

---

The following changes since commit c52643b241525c0f4bf8902eeaba0d74bc5af278:

  media: qcom: camss: add support for SDM670 camss (2025-02-12 09:01:34 +0100)

are available in the Git repository at:

  https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.15-wave5-critical-fixes

for you to fetch changes up to 74bc5089759dee749c48b317ad1362703568f111:

  media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster (2025-02-13 11:03:29 +0100)

----------------------------------------------------------------
A set of different fixes to errors encountered with the Wave5 driver

----------------------------------------------------------------
Jackson.lee (4):
      media: chips-media: wave5: Fix gray color on screen
      media: chips-media: wave5: Avoid race condition in the interrupt handler
      media: chips-media: wave5: Fix a hang after seeking
      media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster

 .../media/platform/chips-media/wave5/wave5-hw.c    |  2 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     | 31 +++++++++++++++++++++-
 .../media/platform/chips-media/wave5/wave5-vpu.c   |  4 +--
 .../platform/chips-media/wave5/wave5-vpuapi.c      | 10 +++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

Regards,
Sebastian Fricke


