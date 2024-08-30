Return-Path: <linux-media+bounces-17238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED00966A73
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EBDE1C22025
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522881BF7F2;
	Fri, 30 Aug 2024 20:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KwfFWMSO"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85CD13B297;
	Fri, 30 Aug 2024 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725049699; cv=none; b=F/jUCvj7CgwDr2C7t4RvkIrsoQL62WDCQzAkCQQaF3DLQTdlFyYWBNVJoRjKdvoARasuZbI6meqsZ7cFDi8oJX+ek8b8MluPsTcuIxAmrnU68aX7E0gR7ftf9KUeDXyv4DKpLDm1HrooHyGi3xzeKkF7vM5dyt0PM58v7ux9fic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725049699; c=relaxed/simple;
	bh=8LEKb0uhp2A4HJXFfcjVpGZqK+nWvJvHYkdGnpkaJOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OL9Ce3JFs6NLQ8u1uQG3jegKkdP1NcssLN+tkoIPkV9VS/7fkCapIFq0a52zaQuXg42njgtsnyOhd3PGmC1NPuse8h/e6AOWYBOd2QiilvjEbEaJvGSFwfE05B/uvxs8JW4DTBraWEYG8m6oKx7+x5v58vrSgmksP4PQSvYV4Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KwfFWMSO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725049695;
	bh=8LEKb0uhp2A4HJXFfcjVpGZqK+nWvJvHYkdGnpkaJOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwfFWMSOXxuZ9aQ9w61rWlD/lHDZzxwvD4veZnVI0BehMjsAqB5424MhJRQ9mE4xs
	 kDE57UTl1ZFYFx3vvY6jNbGzXZOy3/FHTE17aoxt989ZCaduHorM3k7SSFjyVWgyO7
	 MdmVxXs4qQCdpbESe+pxGX+lzDlOxbaVa6cgREDQiLzP7p4z3H8i9vhlAYfIq35cr4
	 qBNNAf7TnQ1RHuD0gHHPzWj0leVhlleFVRCkGV0xPssf23VXA3p8FA7BERON01iGDC
	 xzucCuayX67jkvL1X6bYM4icXNI+wixHfTY+stS6lSyysYurF+NTDey2lzMaAwAksm
	 uD1JJGDwCoLbA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84F4C17E121B;
	Fri, 30 Aug 2024 22:28:14 +0200 (CEST)
Date: Fri, 30 Aug 2024 16:28:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 4/5] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
Message-ID: <2b03eacb-4cb6-451a-9b45-5c636ae5052f@notapiano>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
 <20240810090918.7457-5-chunkuang.hu@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240810090918.7457-5-chunkuang.hu@kernel.org>

On Sat, Aug 10, 2024 at 09:09:17AM +0000, Chun-Kuang Hu wrote:
> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
> instead of implementing mdp3 version.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 45 ++-----------------
>  1 file changed, 4 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 0cddafedbecc..48432d60b49a 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
[..]
> @@ -538,7 +501,7 @@ static void mdp_auto_release_work(struct work_struct *work)
>  		wake_up(&mdp->callback_wq);
>  	}
>  
> -	mdp_cmdq_pkt_destroy(&cmd->pkt);
> +	cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);

Hi,
this doesn't build:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: In function ‘mdp_auto_release_work’:
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:504:29: error: passing argument 1 of ‘cmdq_pkt_destroy’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  504 |         cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
      |                          ~~~^~~~~~~~~~
      |                             |
      |                             struct cmdq_client **
In file included from drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h:12,
                 from drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:10:
./include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: expected ‘struct cmdq_client *’ but argument is of type ‘struct cmdq_client **’
  111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
      |                       ~~~~~~~~~~~~~~~~~~~~^~~~~~

Same in other instances in this patch and in other patches in the series.

Thanks,
Nícolas

