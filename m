Return-Path: <linux-media+bounces-7128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC687CE13
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 14:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C51A2B214CC
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF47F288DB;
	Fri, 15 Mar 2024 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lNbEtw+n"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDEF24B2B
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710509192; cv=none; b=oVkxFnaTv1zFhPHMzjb1t9cOQszYVEHp3V0kqgFoKaDtCSV24I0maqvwO14dIqW6Mf/nH9VZhsznnnE20PMq9ZHSUpsuTVIMrOItlTOzvOaf13vV8mdE9mHXJGQ6qk9zn1Nb0VQ8sDzVLlQPx407w1pdh+aXLNKGpeqAIJ8X1C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710509192; c=relaxed/simple;
	bh=JojbGJfE8lNOobrQz1ocq7qqv8aUJHWjl4m6AkC2MAM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6f3jghG5jVuoKFGRhUXH4ASvqmpYtxbNcGgWk1fna5WjTNgyi90i+PiwfJv1eDkjPBgOSKGPDl68hz92wF7tmkT6G7lXzz9T9lGYo9wnqFu0EOcfvrWVd3Dz45GTgFpxYa5LN477jVaHC0I04V7DrnLQaUucAAvJUwvTZVE+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lNbEtw+n; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710509187;
	bh=JojbGJfE8lNOobrQz1ocq7qqv8aUJHWjl4m6AkC2MAM=;
	h=Date:From:To:Subject:From;
	b=lNbEtw+noeXZbbnFajGEXfsZgz0nIl3klnxBpgTqLNScUDY4M6DMOgPfuyLj7sffQ
	 qAU1Ju8k1ZsnD9qG5QNc7X9qhvZggmeod9fmEcPTXnxBSEySCY21HQBRDaI5Xd+G2p
	 9QpMQXH0OX1QbT0ZPilPKm8BwAwO6FrccQ5qMq0qttlc5CMGxgJ3gsv1jyiLsJTiKo
	 sRpm8OdRszvqviNZR1lpoKOMXuVQNPST1HG2UT15a7dAQYbhD0fNY1qCnPY4m0D/RK
	 pf91Wwzjt5j9+lPU4yPWhZQybo/746UzsKWaVlwCax5cKTlvcN7HWLNNU9fMJGwL5P
	 twtkUeH0x/Olg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 23E293781013
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 13:26:27 +0000 (UTC)
Date: Fri, 15 Mar 2024 14:25:49 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] Various Mediatek VCodec fixes
Message-ID: <20240315132549.vbhui74yxjg2t36v@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

this set contains 3 fixes for two kinds of Kernel panic, one fix to be
able to access the last element of a list and one fix to be able to
access the high bits of a register.

Please pull.

The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:

   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-mediatek-various-fixes

for you to fetch changes up to 27821568df7da25b1f454cf5461ad4b428df536e:

   media: mediatek: vcodec: support 36 bits physical address (2024-03-15 14:14:08 +0100)

----------------------------------------------------------------
Various Fixes for Mediatek VCodec

----------------------------------------------------------------
Irui Wang (1):
       media: mediatek: vcodec: Handle VP9 superframe bitstream with 8 sub-frames

Nicolas Dufresne (1):
       media: mediatek: vcodec: Fix oops when HEVC init fails

Yunfei Dong (3):
       media: mediatek: vcodec: adding lock to protect decoder context list
       media: mediatek: vcodec: adding lock to protect encoder context list
       media: mediatek: vcodec: support 36 bits physical address

  .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c |  8 ++++----
  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     |  5 +++++
  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 ++
  .../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c     |  2 +-
  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c |  2 +-
  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c | 11 ++++++-----
  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        |  4 ++--
  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c  |  2 ++
  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     |  5 +++++
  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 ++
  drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c  |  2 ++
  11 files changed, 32 insertions(+), 13 deletions(-)

