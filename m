Return-Path: <linux-media+bounces-26168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE93A365FE
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 20:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B01CC3ABE7B
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 19:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93413197A68;
	Fri, 14 Feb 2025 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Lx7/gYv2"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479CD18B460
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739560006; cv=pass; b=mR/+2650JuCgUkxfbjLmgIbuO0ObXIrADJlzgSrf402uGVaTBsB+5pNHQqctqhaoAi5GwInscplNuxW7jG9ZnjVR2K0fDz3FHJ7d14QBLckFYz9Rgm92HKbD2KnOIZ0r8z//yoRblToHs1vT3QrPLpMeAADKFyT/HGY75scRh08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739560006; c=relaxed/simple;
	bh=b2Y78X7zcGrVlqsaNBBIaawDMKvOFyaSFEZcke1ha3s=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=t2plm9q+mmtsVokbJisb/7QjcVVXqBT21vX0AUhH0EecB7Uz6dvdq9omBBlztOg8JQcGRMvUOqN3Cvr2FP2P7NczIQk3V/L0S5TU/UbLwxPKUXybbyYuNZwvtYsHKT+EtbkGUW3iWDhrNA1B3CRbKcrIUjsRoOGmCxRXWbSKtCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Lx7/gYv2; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739560001; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GJHUCWNNKWSAL/Ik0ut0mEZZHg0z+Cd9WWXjyFYYylcjml4ctbWGAtoHQAzjMmoswGhjBQeKsmIbIA24ux+SdLb8zLQTxE+IyjL2/9XwpiiKdWr4TyATi/xPlgnVZkA1xLWIGJNZTcs5JizY4gZsS2HdcWjAMnnu1lG1b+XTnhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739560001; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=d48VmIfiKdfUo63iUZPFWnQojVRpUhmmv5VoiuNDEeM=; 
	b=AlOE1xLrsOAaZ41Tt9Xh7psbnMvo4PJ7PXAX0sDcG8up+tfNpNpXBPRDD2tdO72FFCQFjrRXq3ocUzPUOj4mDFmIxcGQzkMZAw8R12B1ML4Ys/b3aMcxnVzuTAFuwGnRkLsZqTpldTaP8LCrQNT7XlPpd5VuB4c6ibBGdLaVTHQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739560001;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=d48VmIfiKdfUo63iUZPFWnQojVRpUhmmv5VoiuNDEeM=;
	b=Lx7/gYv2HEEzumsa8tJ5tZE+hyzXSQCfTaGLYRlQG/882tlhdTwcMib0TlsuuCRP
	x+5TIJFCs8rL52K2qf0+4FhvAHQMF3iHrDTUGJ1jm8iOqEjFXMmxw67wL3z/H9btbXV
	tz3+npc/dvu/AWhf/g4Jye/DmlDTCWJ3+hFjNlZs=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1739559999968346.05626766339344; Fri, 14 Feb 2025 11:06:39 -0800 (PST)
Date: Fri, 14 Feb 2025 20:06:39 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "linux-media" <linux-media@vger.kernel.org>
Message-ID: <19505db19c0.e2080ead1566426.2114875391754427217@collabora.com>
Subject: [GIT PULL FOR 6.15] Wave5 fixes RESEND
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

here is my resend of the wave5 fixes, with the Fixes tags and the Cc tags to stable.
I hope I did the resend correctly, please check.
Sorry for the inconvenience.

Please pull.
---
The following changes since commit b2c4bf0c102084e77ed1b12090d77a76469a6814:

  media: rc: add keymap for Siemens Gigaset RC20 remote (2025-02-13 12:12:31 +0100)

are available in the Git repository at:

  https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.15-wave5-critical-fixes-resend

for you to fetch changes up to e744e450459ff3851e11965dcc34b591cff38371:

  media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster (2025-02-14 19:55:24 +0100)

----------------------------------------------------------------
Various fixes for Wave5

[RESEND due to missed tags in the commmit messages]

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




