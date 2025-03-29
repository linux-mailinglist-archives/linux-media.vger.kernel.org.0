Return-Path: <linux-media+bounces-28985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC76A755B1
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 11:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD25E188FDA5
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 10:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456DF18BC36;
	Sat, 29 Mar 2025 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="athZkoKi"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A542048
	for <linux-media@vger.kernel.org>; Sat, 29 Mar 2025 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743243301; cv=pass; b=R1PU6SZMJ112dMoOFevRUm/abfd0WwsEZlTScdRLAjtVhJ3jIDkimutRIClEzjC9sJLJ3AMxikmDzw3GxDjIuLeqLPhChd4YX4Lgz7FqgSyFbKZGQY5/s5A0z/XsupP7DJKGhKGUtLAoU+92xwirbHkGWxF/vzqwMrB6HZGlCyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743243301; c=relaxed/simple;
	bh=7m3wEaqBTFjG5bdVHr5Sd3Pn0jQ2g7dFPZWCN0BOHP0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bz4Bub3OaIvCGu6gZUgRQZkROmYRTxizZnEJ+YltcbM3rnnZ9boc6re1Wi4BVWflrl4O54EcNZRdwm7koLSYEv+vezCIBTL4PvEejaJZnuLs/ho62hABgwEHGhBx+KB+48xHt50YQ/Ux1Q/jZOOwqNk+OKoUtAPmllTF0jUIYRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=athZkoKi; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743243296; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LSkUYIAQbPY+U0r385K/xQsapjOw0sYqcGPQT/V9FW4auIIZCNNxyB+ZM0sBGTPLGLJNi/kF1Thptb7o4svvHGs1VLy6+GfYaNWUBJUdUUxUrqY68qESOpBOmuZ/u2WEtJh+CpA9lHhlJcoDZo0UD0V1HaHoWdXaTL1aOIkWh2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743243296; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=btnN7c5RD8o0t0tRxWFh7mlUcWkCQ7+UTGUO2yM8AG8=; 
	b=DNteMXsIcksExpMM4DeFPgQt9cEi+LaYt7Bx6+6fP5aCXdIyGFWEml+v9mvi1CUE7zMelTyCuW3ZYIPYHui3purVT0lEwVH8MBk0VPGfT4KHTfuXKurfQgKDZJ8tA8m/qcCq0Sd5WSVqxAoYnrCZeOTv+Kaqrw04DUDEbxFu33c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743243296;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=btnN7c5RD8o0t0tRxWFh7mlUcWkCQ7+UTGUO2yM8AG8=;
	b=athZkoKiuZ08d7sKPGawChstRKlId3D1wAgz3oppjjr60BIGJldB2UnTudbZEhcq
	rVLIpBgDTk8Q7GhrTnfWcqXa1wYUs6skvXPFCq1o+hBDhYtwigFRSb2/72eoXRxjaJ7
	OZohrsGofVWS33QnNDj/CXXfskF9p2GekvayfnwM=
Received: by mx.zohomail.com with SMTPS id 1743243294369733.3202349791505;
	Sat, 29 Mar 2025 03:14:54 -0700 (PDT)
Date: Sat, 29 Mar 2025 11:14:50 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.16] Change V4L2_TYPE_IS_CAPTURE condition
Message-ID: <20250329101450.wzq67scm7t3sdysl@basti-XPS-13-9310>
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

please pull the following changes, these are core changes.

For some reason the virtme tests consistently ran out of time and as I
ran the tests multiple times I thought it is better to send the
patches as the rest looks good.

---

The following changes since commit f2151613e040973c868d28c8b00885dfab69eb75:

   media: pci: mgb4: include linux/errno.h (2025-03-07 12:05:42 +0100)

are available in the Git repository at:

   https://gitlab.freedesktop.org/linux-media/users/sebastianfricke.git tags/for-6.16-v4l2-type-is-capture

for you to fetch changes up to f24d1169af4b8ad9cc4f5054d3d7278460a70df5:

   media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition (2025-03-28 11:28:20 +0100)

----------------------------------------------------------------
New macro for the V4L2 API

----------------------------------------------------------------
Nas Chung (3):
       media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
       media: qcom: venus: Fix uninitialized variable warning
       media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition

  drivers/media/platform/qcom/venus/vdec.c |  4 ++--
  include/uapi/linux/videodev2.h           | 12 ++++++++++--
  2 files changed, 12 insertions(+), 4 deletions(-)

Regards,
Sebastian

