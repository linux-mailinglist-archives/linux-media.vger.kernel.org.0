Return-Path: <linux-media+bounces-26167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334CA365FB
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 20:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9D7818950B0
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 19:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC170198845;
	Fri, 14 Feb 2025 19:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="AWlw700J"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2A18B460
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 19:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739559840; cv=pass; b=f1+5W+UvM+CMzuadVA5pVN94ZS3ZShc+eHb5pbgjyyMWb+pUIWNd3ShGuSlJxmdLH3cP7Anbi0LbCLuc2vUVg81BhYk8QL9WuxfYkmYRl2wIuXe/V02fOZoDcuSDfN5XC6WAnvs0yOFQRbVyRhRBC4DxTLkvwjGxritu2HM5X3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739559840; c=relaxed/simple;
	bh=b2Y78X7zcGrVlqsaNBBIaawDMKvOFyaSFEZcke1ha3s=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=ukYfJRWQE0Kpwa3CnZn2eKXfePvqL+M3SkTgf/vjoQfPFsUg93l5a4ZI5FP0YLBQr7kuM46rL0/yLQ46rSvgBrr6pI4l2pgJ99UpFBntTc4EJGVw2BLvLznXGmce7p0kW77M0so+cXxPus4aLG0aDJXbIlLTbfHCakXoRWNEV+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=AWlw700J; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739559836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O9WZWN2OiwT30E9iPeg9NLfnEdhrwHIdIl3UT81SeyrN6FijLtApSfeg2FJTtjxakPCXFLE18J1yRYJ0ixG1br9kyzjFDKTxWOLIZeI4VQHYhq6nd5nDWJYxjCn/vxTN+2XdFEwgh9A0h7kOFqCnLh/vl8JarfAB9NEv9FSrs58=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739559836; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=d48VmIfiKdfUo63iUZPFWnQojVRpUhmmv5VoiuNDEeM=; 
	b=gzEsAf6fvyeJ8ORhuQQkdxUu44FqQHQYNeqdVpMNfKkzut5CSDPm91fPahZEIG8hboaM2YURZIyklILcvJtsR0IqhFVISFzdRxj7BLuKDFyKKx8ts5XnSmxEvWEAuXsRbYvAp2B5uA5JNqwPQJXFOxGduAlkxa/gow/AKjQw2H4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739559836;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=d48VmIfiKdfUo63iUZPFWnQojVRpUhmmv5VoiuNDEeM=;
	b=AWlw700J1RBOOO6bGXZzUgWKhTDq3uKeyYJjJ/fHpwWGSGtzNc2IxvtX7UhKjg7Y
	jk2R/zJC1gqK4E6j8vW/ky7EeS/iHozwF+oYmgcaChKIywGSAqIl0nddnkmDhTg/Cza
	ZLL+oW1Zvw5Gtk81lYgrc3jaVROZFF8du3XB7/Og=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1739559834209705.7921322525995; Fri, 14 Feb 2025 11:03:54 -0800 (PST)
Date: Fri, 14 Feb 2025 20:03:54 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "linux-media" <linux-media@vger.kernel.org>
Message-ID: <19505d891ea.ee8796b41565499.4407790955986503740@collabora.com>
Subject: Re: [GIT PULL FOR 6.15] Wave5 fixes RESEND
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



