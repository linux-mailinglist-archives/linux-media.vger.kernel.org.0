Return-Path: <linux-media+bounces-7061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C36687BC97
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 13:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72251F2261D
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 12:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79CB6F08B;
	Thu, 14 Mar 2024 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rT31MxDG"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ECA6F532
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710418667; cv=none; b=c6fA5okJaEUUcilPSR8q43u1t7NP5xpCcRjeJwa7hUrr/X2jI8BihPiygcOaDyvUUoWSXXGdg/QOtWVMfEYe5XuenzKockhUlItihF23cUUFg3GHbg6zozlQ7ZcF23A/IgtDr2i7wXoweyozn2Dh+9jZcWVaif4rD5OIErvXDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710418667; c=relaxed/simple;
	bh=Bk4wcUYsVQMbxlrkrH4UottbYDk/tjcFvYQ7l+IHZD8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvgEawpQHyahIDFNCnM7CXqksLshz6B9iqB//E0vnZphw/FqtDPeUondrUbe/LATyrEpL1P1F+tlsLzeICEazoiVNVkP3dLkytDkucUVpqY2JinN3Fni8kkclGrU2at2Nnzuz22iouuTes7QZjKnNnwoeWkoSWPZ1yfPwV8zI4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=rT31MxDG; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710418662;
	bh=Bk4wcUYsVQMbxlrkrH4UottbYDk/tjcFvYQ7l+IHZD8=;
	h=Date:From:To:Subject:From;
	b=rT31MxDGqImVJ7wWEBf3Y0fUrwIbs6yOFTZ3o3irWhkPcvIxeEpiTKqB0kvGzaPaD
	 LXyCcx1jsfikpd4iHLaM2f5ylnwECcj/jzkpXXpWC8gFbpPzu2HFRTt8YgpQ/K+MJH
	 vAxDlBFKYlaIdlsrzVmzhvz089wf3/YVgeIS5PDAW78/RD+UpTzsyeEl0jlO8BJZYN
	 A+PwzuackZuxzlMR67AHjL2BS/I+tRt2nDeRvo/UaMnk8P8t3HMP5f4LdkDt0Ej89J
	 VWxTeODTQLsJxDsNrilxRKvrO1S/pyksu+Z0skcNtgI2HwoJZJo1vasVghsBwJxSeb
	 l4q5oDHqKu0Dg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0FFD337820E5
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 12:17:42 +0000 (UTC)
Date: Thu, 14 Mar 2024 13:17:36 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] Mediatek Vcodec typo fixes
Message-ID: <20240314104157.fm6ft4dgrwefgpph@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

during code review I found a couple of typos and grammatic issues in the
mediatek vcodec driver. This list is not comprehensive but everything I
was able to do on the fly.

Please pull.

The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:

   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-mediatek-typos

for you to fetch changes up to 44ca503c36e797603ef1999952e836f3797bd00d:

   media: mediatek: vcodec: Replace false function description (2024-03-13 16:52:20 +0100)

----------------------------------------------------------------
Multiple small typos

----------------------------------------------------------------
Sebastian Fricke (3):
       media: mediatek: vcodec: Fix multiple typos
       media: mediatek: vcodec: Improve wording & fix grammatic issues
       media: mediatek: vcodec: Replace false function description

  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c         |  2 +-
  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  4 ++--
  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c        | 20 ++++++++++----------
  .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c      | 12 ++++++------
  .../vcodec/decoder/vdec/vdec_h264_req_common.h       | 15 +++++++++------
  .../mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c  | 14 +++++++-------
  .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c     |  6 +++---
  .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c     |  4 ++--
  .../mediatek/vcodec/decoder/vdec/vdec_vp8_if.c       |  4 ++--
  .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c   |  2 +-
  .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c       |  4 ++--
  .../mediatek/vcodec/decoder/vdec_msg_queue.h         |  4 ++--
  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.h   |  4 ++--
  .../mediatek/vcodec/encoder/mtk_vcodec_enc.c         |  2 +-
  .../platform/mediatek/vcodec/encoder/venc_drv_if.h   |  2 +-
  15 files changed, 51 insertions(+), 48 deletions(-)

