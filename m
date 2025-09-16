Return-Path: <linux-media+bounces-42600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982AB58C77
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 05:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54B34522FF4
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 03:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276042737E8;
	Tue, 16 Sep 2025 03:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNNZItGZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793EB2222D0;
	Tue, 16 Sep 2025 03:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757994250; cv=none; b=AIRi1s0IGHqqITHaa1rY2MMTpYr3XiGA4tZwZWB3q3cPy7jdLHzVnwxahp6vCILOs8DRAkqnrNVoVAHv0rGJXMdjyrtaupyp+pJ2Y7yYXljUtgvIDjfGW20LlfGevsIHxlCYaXuISETKkoJCsQqTrvp+EZMUTcQFrrDmDZF/07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757994250; c=relaxed/simple;
	bh=6C7Ju+dhzY1OJEKfUPdFBki4vKRrlbJv3fbezkMeJk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chUYpW5dN0j9wZR63qdx/H8/mb51+b5OF2HXU2tSDS6tpUTKjofO/qm2gto4ARwmGnHQQX95UGZ5YZpjOC7nOtNS42MhfUT6Dm/cYODMAohq9dvfn+nSHre4nt/PVF95JN2Bzti42WcibU0082/hkcgx5qZvpxbI5t8py5UTK/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNNZItGZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E694CC4CEF7;
	Tue, 16 Sep 2025 03:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757994250;
	bh=6C7Ju+dhzY1OJEKfUPdFBki4vKRrlbJv3fbezkMeJk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNNZItGZb1zzUcgKo8bdMydHebPYljwB/+qgD7tXublQltuS7e6zksLyIcfzDCC/V
	 vRT+DZyi6pQA/8voeBFuSq0EhjDv5g9HOkBhE9MhtWnTypGWEhqtioZQTFq+WkngqU
	 JgALwfNB2dxONDB4BTYzowwbCnZdXE8zMYWIAzITUtrDrl2MlMpH9B1w2F/neg+ghl
	 1Ri5D6s9eZst03L8ZkW5F4whXj1BFvEqwRm7Cb53ZgfjR0TfmLLbQxWx/kyFmeBfO6
	 RmhULbDroggV3OxPE9aPrS4jNQ8flNX2G3/1h6nn5tRzn7N2QJsac/iLvF57fPzjYa
	 LyG78h4prP1dg==
Date: Tue, 16 Sep 2025 03:44:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	hverkuil@kernel.org, jiasheng@iscas.ac.cn,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: mediatek: vcodec: Fix a reference leak in
 mtk_vcodec_fw_vpu_init()
Message-ID: <aMjdBSP1bvwvTRiO@google.com>
References: <20250915120938.177691-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915120938.177691-1-haoxiang_li2024@163.com>

On Mon, Sep 15, 2025 at 08:09:38PM +0800, Haoxiang Li wrote:
> vpu_get_plat_device() increases the reference count of the returned
> platform device. However, when devm_kzalloc() fails, the reference
> is not released, causing a reference leak.
> 
> Fix this by calling put_device() on fw_pdev->dev before returning
> on the error path.
> 
> Fixes: e25a89f743b1 ("media: mtk-vcodec: potential dereference of null pointer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

The reference, taking via of_find_device_by_node(), needs to be dropped after
use.  mtk_vcodec_vpu_release() does but the error handling path doesn't.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

