Return-Path: <linux-media+bounces-26931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C557A43A60
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07EC3A5398
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C459C2627EA;
	Tue, 25 Feb 2025 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="YeAPspYB"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848752054FD
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477293; cv=pass; b=WA4fLoGAR1+KM2ecXSMoBVIfPKSmUgaQvOu98ardw+XxcqA6SjceSWnoABcn2eFr+XuQhKjol1aaX/LD96SEzgfDHxYS+PUVbaK0afxclD5SiVaogmoiOS+U/HdL6VjtN7HkbdaXOAm/cQnYbsfVydK5tkz8dgT6qEqltLA/BEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477293; c=relaxed/simple;
	bh=j0Iwf06KCeMFzgZrwwRzlzYKAgfQRhQ/68+MfiLoGMU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QpWGfqYUbVBNBaCd44s4onpqnWRTg15Jds9kt+GD2zm0/PiauWg7l90wIeh5eAo9m2/gCmS6Gt1Od6wOytnbd4CSD9e1RhW1WXURsE215Yfq4Akndieqa3yHrGp+vbbsy4pBc2RSo4nuilLN6tgn6RcjJqhyTs0EHQMvcLFrFwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=YeAPspYB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740477289; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L+4JFGHaokneEvquPgZpteSWuj7Ly30bUBXCe6EJ33Sg+dJWmCrVEa018TKfunPPSBq2JzDMYvBclOj1tVbdFLBfdfAhmjZL4/0tXSBM3kt55XJs//PRyjzeZnUWLyyBNFXGdWsdBQQlmuPZ35i/8uSaZorZ0tJjRCXw59X+2JM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740477289; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=9leeQPKOU4Qe+5/Uqza/KYxhLAXeThDyWV1hNjQd3BY=; 
	b=JkBO4B9uadq0AwYnwQnzgAD9TzC0VI/UpZNSrz2aVifYJAqDfdiYq7MQbR0V9G7rY/3vZkaO2NZcq9PKyFf+4LdqKCwXHlgLHoGrGf6OxISZ6CLOMXt8NADS+NoPLZxEh3UdBmGONhhOHE44h4B7QLNw5vQJ78TtZTVbeVVidPY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740477289;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=9leeQPKOU4Qe+5/Uqza/KYxhLAXeThDyWV1hNjQd3BY=;
	b=YeAPspYBlTFiHuKVRYMJruXnaZF/4XakFD6u7bfGciv6gRrJPCq1z0v0cPNLpAnP
	9hNHIpHYFI8eF04FYFUj6Eq/ur6k9FWzrkAPTYqAzJZGPB4gG4C7rzhe25aIUDVa2mY
	xqW93nVoclMM+zQOzmq4z1Th7yOexqxf+7y6RB7U=
Received: by mx.zohomail.com with SMTPS id 1740477286072683.3888756838697;
	Tue, 25 Feb 2025 01:54:46 -0800 (PST)
Date: Tue, 25 Feb 2025 10:54:42 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.15] VISL fix
Message-ID: <20250225095442.dptj6jurbpu2bom3@basti-XPS-13-9310>
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

here is a small for the VISL test driver, which limited the usability of
the test driver.

please pull.

--- 

The following changes since commit c2b96a6818159fba8a3bcc38262da9e77f9b3ec7:

   media: platform: allgro-dvt: unregister v4l2_device on the error path (2025-02-22 11:12:59 +0100)

are available in the Git repository at:

   https://gitlab.freedesktop.org/linux-media/users/sebastianfricke.git tags/for-6.15-visl-fix

for you to fetch changes up to c123271613e9bee6d17443120036e275bc31db27:

   media: visl: Fix ERANGE error when setting enum controls (2025-02-24 14:36:51 +0100)

----------------------------------------------------------------
A fix to the VISL test driver

----------------------------------------------------------------
Nicolas Dufresne (1):
       media: visl: Fix ERANGE error when setting enum controls

  drivers/media/test-drivers/visl/visl-core.c | 12 ++++++++++++
  1 file changed, 12 insertions(+)

Regards,
Sebastian

