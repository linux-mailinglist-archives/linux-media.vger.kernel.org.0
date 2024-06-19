Return-Path: <linux-media+bounces-13696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD590EBCF
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 15:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D4211F255ED
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 13:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F36814B06C;
	Wed, 19 Jun 2024 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RLRSZxz5"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F772145FEF
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802043; cv=none; b=XvhhATxO+1URV1dNGwRy7nAx7xSwH8hXalgnXV1dUcKTFCsAitsgNYNv0wVexQA0YXM2e1IWqRJ1WaMRJMWV/ZpVmkyuPIj3q1s68T++0ghUHa8QFHjVu+W7dpf5rckOUtHZanL7FSD7hUjBEEZyxQUXstg+G9iSwuYOw2fRJrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802043; c=relaxed/simple;
	bh=qCA0rAC3H4O7CcQlMJFqD6klcqO3YLlPfqAdC7yGQdc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfqDOMcuFMFC0+5g7BS/2d1sbBSM/R7lr5IW39PZqFPnda6v8g8Ctv1KnLPrWHhC2Xc8NX1ZRE6KSmIO3W16RAepwIkZvY7cn3uxG45yDi8TVN5vz/qKS9qFlUtiOHYX3S+UUrjPba3cPBFR/cx9/s4OqnN/TgIIE/ZG+IjNgII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RLRSZxz5; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718802040;
	bh=qCA0rAC3H4O7CcQlMJFqD6klcqO3YLlPfqAdC7yGQdc=;
	h=Date:From:To:Subject:From;
	b=RLRSZxz5j449yQAR7Djk3OvWnyol3qTj312FmRS5D/t46e8rAlwsVf/EdzM04lBXg
	 g7orVdnHE0ZhMWKKkY2Oux+Qu54buYKwBg2tj1tM+gf5lrFlNUss5mmM2AU/HdfIhA
	 r+eBLw2GXNjQojQPkSLbLY19EIAkFZSY2FdKPBkJhHgLFQ/3cNC9OLMa9AuvQS3HTD
	 MmCNUi8Lqg2r0lBGe3PT7t6CZ6yupHM+WxrR39Hx7jukqtYDFm+dXZAshKCLTkZAuq
	 eIFXuthjZMkJcyxu403PWLnWOcSVYg71u/tqKb1FytLGheIItcE4geoAUhkXtptCd0
	 1KNusl4dp4uyw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3E3ED3782159
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 13:00:40 +0000 (UTC)
Date: Wed, 19 Jun 2024 15:00:39 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.11] MDP3 for MT8188
Message-ID: <20240619130039.zmdxrdo6yqhhehgi@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

The other changes in that set are already merged, please pull.

The following changes since commit 91798162245991e26949ef62851719bb2177a9c2:

   media: v4l: add missing MODULE_DESCRIPTION() macros (2024-06-15 11:16:40 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.11-mdp3-mt8188

for you to fetch changes up to a3c00c5cc4f60aa6ce2962802b809b2c61ce9f79:

   media: platform: mtk-mdp3: Add support for MT8188 MDP3 components (2024-06-19 12:53:51 +0200)

----------------------------------------------------------------
MDP3 support for Mediatek 8188

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
       dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
       media: platform: mtk-mdp3: Add support for MT8188 MDP3 components

  .../bindings/media/mediatek,mdp3-rdma.yaml         |   1 +
  .../media/platform/mediatek/mdp3/mdp_cfg_data.c    | 280 +++++++++++++++++++++
  drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h |   1 +
  .../media/platform/mediatek/mdp3/mtk-mdp3-cfg.h    |   1 +
  .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |   3 +
  5 files changed, 286 insertions(+)

