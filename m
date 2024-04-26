Return-Path: <linux-media+bounces-10191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3698B337A
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC98D1C20F56
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A192913CF99;
	Fri, 26 Apr 2024 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eq6xB70t"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908DED512
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121985; cv=none; b=pfHqjY9LEs7Z1Etm7XMuf/aJY2yl53zqjdWEDv1AiGTYupA8XbAXpsZj/JfKMcQj4fimb9Ssfut9XEY/nLHsmMiGSDHn+b0cDHoVpxx2WIE0Tp4LmiQ+vZ4y1I24AMQcc4pWxlDY6xUqI4q8z50U6tcOV3Jz2HMZXGFZ4lEMJHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121985; c=relaxed/simple;
	bh=LYgJ7z+i6OQ6UxwNfLCjlxiiFUYwDP8IOqG4aMNBLTU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ieXqewqtHzJ6VJXihCoMEnaUp2SjMjqFadoD9hA1hrUSsu1OUHLRa111nOnxV3zokBm/aDr4Tqlr37TMGcMMAPejyDY6jQpqC97xW5XMZWmnVqkfNJmbytOxj1JrYq45zPMnr0+w+z/CVSZ91YZjlds5Y96rY2E4xsQ9xsjRvFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eq6xB70t; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714121980;
	bh=LYgJ7z+i6OQ6UxwNfLCjlxiiFUYwDP8IOqG4aMNBLTU=;
	h=Date:From:To:Subject:From;
	b=eq6xB70tYkNO4IX94C/F7QR57MQGwFSJD3rYqYZ+dr8jc0TJeKtUXxJMjAWxDDL3o
	 lXcDQ5to7yHGL4pihNsWwQYlICMUgFQSczSIWw3PCkT2tJYRUpSHwYOahwHR5j5vqY
	 S6YFfopabk+snbPaiM3Bw0rvpkMaR6o7QpcqenGt4GvMh2CnskMjwNYDeRX8CQILPk
	 m2aK3gX8veD3qgwU7jHM4vma2ajRgK6hy1SOwA8FgVzRLqAozj7lSu1mJQgrrix8vQ
	 B+vmmsd+pL6uYU4CtnhxsjmyIvv59FxkNQxZZ3c/lLsXZcVrmwDlhzB/ngftsUTdfx
	 COdnIgWQ4emNQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 80CBF37809D1
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:59:40 +0000 (UTC)
Date: Fri, 26 Apr 2024 10:59:39 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.10] MediaTek Vcodec mem free improvements
Message-ID: <20240426085939.cb5e4pcp5qoax67b@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

here is an older set from december 2023 that does a couple of
improvements on freeing buffers in the Vcodec driver.

Please pull.

The following changes since commit faa4364bef2ec0060de381ff028d1d836600a381:

   media: stk1160: fix bounds checking in stk1160_copy_video() (2024-04-24 13:49:56 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.10-vcodec-mem-free

for you to fetch changes up to c8c81cce52b50328840c2bb240bfc8fc811a8006:

   media: mediatek: vcodec: Only free buffer VA that is not NULL (2024-04-26 10:48:27 +0200)

----------------------------------------------------------------
A couple of improvements to mem free for the VCodec

----------------------------------------------------------------
Fei Shao (4):
       media: mediatek: vcodec: Replace dev_name in error string
       media: mediatek: vcodec: Drop unnecessary variable
       media: mediatek: vcodec: Update mtk_vcodec_mem_free() error messages
       media: mediatek: vcodec: Only free buffer VA that is not NULL

  .../mediatek/vcodec/common/mtk_vcodec_util.c       | 23 +++++++++++-----------
  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      | 22 ++++++++++++++-------
  .../mediatek/vcodec/encoder/venc/venc_h264_if.c    |  5 +++--
  3 files changed, 29 insertions(+), 21 deletions(-)

