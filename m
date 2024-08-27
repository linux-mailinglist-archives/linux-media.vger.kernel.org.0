Return-Path: <linux-media+bounces-16882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C2960558
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 11:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70B84B20DAD
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 09:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998D0196D98;
	Tue, 27 Aug 2024 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="J5NWrcSj"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4373F16426
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 09:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724750255; cv=pass; b=oitLRHhK0wXNvw/DkMcxpkJagrGhQ+LzMPBFmdQFzdncAfn6SWFYLuVu1Db55u1CQW36OUUlkXu0baCe/e8NFtp+ER95K8uDmsAj6PFjDUQQjvKYMnbNHiVLlqe30+ihWrkiwu9PGjrk2Lm0JMDAVKkwurqdVVPIUoOfQg1yxQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724750255; c=relaxed/simple;
	bh=/ZislyBoKVg8vNqppW0PP2LU8C5oprdjJj23gmdsEgA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PzgCk/JL1uyxlvkRLFhxdmv/a4Cx3vmVlF48VQEufJiJ1WGWwIgdti8VBXxmJBWrzA4lXBN2gt8+XywftEZs2b73fWH8Fm4X26n6eS06hI+bepG+Lf31gaZSJsohnH/ppN41rvEk4fOUy7pWRpO6BNIfZZRWNCdLZNmqKuusGyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=J5NWrcSj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724750251; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mpsfFObXQTI06Fnza4wpmBKcAIDOKBshu16ZvfJ19OWRA/p2BTkN5Bzt2HjuHljtjqcAIB5jjPvdh5EkkgovhweXWDjpuxk15kJBGqIeSzJZ1v1opljjMMbvsba/qc4wunzhUAowuyVItQ+a896dlskaz31mZYsZv0nW94leg/I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724750251; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=467PJjAwZ/8oOpfNS3gNu71BtLsfPl6ynDLemrKj7hQ=; 
	b=igUOGiskxU1PSfoevGyu+opowHNSwuU00AETDtGJbuz+S5ikO4zMQPcU7gQQ3QOCD4JuG5RymNWVFl4bOdmUDkctpDm1YnJmCCmg8k5hva/tijkUL72qqHmsmqIQQbsnJ1v93PEJooubZ2OkLPKkDZvk4cOYhy7Stepy8Bczg9A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724750251;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=467PJjAwZ/8oOpfNS3gNu71BtLsfPl6ynDLemrKj7hQ=;
	b=J5NWrcSjKE9QTFvCRuBifXbLeR18Lx0gq1n4LC6NTjrfIIlgVkJ6ZNQJeTh+QkWY
	AuQNB6CxR3186ogbxVa+pw/fPc9aXgghWQi0Q6eZ7nPtzf+AzFi0RjwOUAsaE6OZ2Rf
	bVanDl4VqggfgAbL+8H9l/xRQ7PWGivlAnZ0zPV4=
Received: by mx.zohomail.com with SMTPS id 1724750250178454.3448956850209;
	Tue, 27 Aug 2024 02:17:30 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:17:26 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.12] Various small MediaTek changes
Message-ID: <20240827091726.3lendiker76dnzov@basti-XPS-13-9310>
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

a couple of small changes for the MediaTek Vcodec driver.

Please pull.

The following changes since commit ea2e2ea551abf0ce8350f82e8cd431b7f8a1e5e9:

   media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry (2024-08-25 09:16:08 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.12-various-mediatek

for you to fetch changes up to f0b4ea965359402eb2f1f5b1c602ae81c58fd9e4:

   media: mediatek: vcodec: Constify struct vb2_ops (2024-08-26 12:46:03 +0200)

----------------------------------------------------------------
Various small MediaTek Vcodec changes

----------------------------------------------------------------
Christophe JAILLET (1):
       media: mediatek: vcodec: Constify struct vb2_ops

Yunfei Dong (3):
       media: mediatek: vcodec: Fix H264 multi stateless decoder smatch warning
       media: mediatek: vcodec: Fix VP8 stateless decoder smatch warning
       media: mediatek: vcodec: Fix H264 stateless decoder smatch warning

  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c |  2 +-
  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c         |  2 +-
  .../platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c   |  9 +++++++--
  .../mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c      |  9 +++++++--
  .../platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c    | 10 +++++++---
  5 files changed, 23 insertions(+), 9 deletions(-)

Regards,
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

