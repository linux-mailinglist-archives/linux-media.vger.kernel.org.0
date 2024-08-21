Return-Path: <linux-media+bounces-16568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A1E959C9C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 14:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D7112815D0
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 12:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2908A19995B;
	Wed, 21 Aug 2024 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="I6loUYkS"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03F192D6A
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724244959; cv=pass; b=KgQGWERyKmUjtJP84fdIEtIKHP+Kn7Ei+Y+J6HNizwaF3XIbk3QziaR/YJUaNwcZZ5hFsjjDD+2lOvKJOcZ+MgHPuFiFHXRlodZ3sJIM6mQKLJlOB23KRktxQj5pS+jjlIYWtaT7852d2HUVraakGeHdvm6GsquDx7B8Crwu6hM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724244959; c=relaxed/simple;
	bh=dy2tTk4M5gvHzZMxnZ5z6b1locyrcZpnMIc0XKymCig=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZC3cNZDRbyOMwcL2o0C7gxwcnyh7sOFrCz+HXn5b2I5wA+httKfwgJIE9HUpPkzKPyIP/gyiaQADQ3MhFf4AMFXM61oO7+5QeMekKvx44fvq6u+AEu0hoRPzF4Lnn9hlEQoWvt+gxx++aRwsYjpQ0FXa9prNEC9ubZ/UDofDHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=I6loUYkS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724244955; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=evZLEeVAUnUuGU31xOaJg7NzsjyL6FmQd5RWNSobtdvqCxOPlcmFozeKNn0y0RWRWZJNkq5OBYvY38bF+BV1S3uYIiEXpIDrCxznrWTG6ej2JGT9z53kHV0RpvtCCEaSnmyHAdmG/ZkAorzgefPK6aM4UeLkTAda0EyCDSYnpeE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724244955; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=/VlLqsJHXxlPc4UMqWgLKbBYFNhB3KkoEQ+ByE0aF0o=; 
	b=aZFA5pPjhJTsABXiU48ijDbJ1M/AJKhcwh4Y5JIbmPMfaemWn18Oqpr6JdQ67VOqeJuqqJ82B55fsc9sB02AZqvJk2eQuel1O4lZbFgoaU16GwnsFHpdFrsZtXzBNGejcKqQY66F0M6XsHvbtr2ghtRITZ95XXhfj5fGtlYauMg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724244955;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=/VlLqsJHXxlPc4UMqWgLKbBYFNhB3KkoEQ+ByE0aF0o=;
	b=I6loUYkS2SfrqAYxN2yXLOUASOLfZcSDC7ORN6YsPH3KJsehgofFjGKTyBFwcrR1
	ZWXnk8uGD4uAg6kUuxRVaOCCgabnY31FL56xS7lHPLa9lNmeb2hvhrzUBkOF2aLet5u
	BOj2y7u/uOrgzvJhiwwNZnTwOaiQktj3OrRAmes8=
Received: by mx.zohomail.com with SMTPS id 1724244953892187.92443349083885;
	Wed, 21 Aug 2024 05:55:53 -0700 (PDT)
Date: Wed, 21 Aug 2024 14:55:51 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.12] Various codec fixes
Message-ID: <20240821125551.hkg7bittkeoqvf42@basti-XPS-13-9310>
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

here are a couple of fixes that I didn't get to in the past.
They applied well but I did some little changes myself before creating the PR like:
- improved commit description on various patches, fixing typos and improving grammar
- Added Fixes tag to media: vicodec: allow en/decoder cmd w/o CAPTURE

Please pull.

The following changes since commit a043ea54bbb975ca9239c69fd17f430488d33522:

   Merge tag 'next-media-rkisp1-20240814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-14 17:18:47 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.12-various-codec-fixes

for you to fetch changes up to 8f930905c7d1265bd3faaa69159ec6cc0646ccd1:

   media: verisilicon: Move Rockchip AV1 hardware drivers to the corresponding option (2024-08-21 14:26:51 +0200)

----------------------------------------------------------------
Various codec fixes

----------------------------------------------------------------
Alexander Stein (2):
       media: verisilicon: Move Rockchip hardware drivers to the corresponding option
       media: verisilicon: Move Rockchip AV1 hardware drivers to the corresponding option

Anastasia Belova (1):
       media: coda: cast an operand of multiplication to a larger type

Benjamin Gaignard (3):
       media: verisilicon: AV1: Be more flexible with postproc capabilities
       media: verisilicon: Fix auxiliary buffer allocation size
       media: verisilicon: AV1: Correct some sizes/positions on register fields

Deborah Brouwer (1):
       media: vicodec: allow en/decoder cmd w/o CAPTURE

  drivers/media/platform/chips-media/coda/coda-bit.c         |  2 +-
  drivers/media/platform/verisilicon/Makefile                | 14 +++++++-------
  .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c      |  3 ++-
  drivers/media/platform/verisilicon/rockchip_vpu981_regs.h  | 10 +++++-----
  drivers/media/platform/verisilicon/rockchip_vpu_hw.c       |  1 -
  drivers/media/test-drivers/vicodec/vicodec-core.c          |  6 ++----
  6 files changed, 17 insertions(+), 19 deletions(-)

---

Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

