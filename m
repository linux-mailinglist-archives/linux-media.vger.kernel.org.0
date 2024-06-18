Return-Path: <linux-media+bounces-13524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F3F90C975
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1E7F1F20EFD
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FA21442FB;
	Tue, 18 Jun 2024 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JuF1UB7l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D361304A3;
	Tue, 18 Jun 2024 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706775; cv=none; b=D+evALVAzNj3EAHVc7L5ilIi/MvwLKYJwAFAFKtHtq7xih/pirp0GP84S2+G97kPiug1kwCOs9qnqUv/Wzjj6Q4GbxQ9Mo38L69cRwhtkcHZBE4FmEwAzvWnMrkJGD/40c3UmCP99qMZjh7mf7BEjRw9QimtgLymEKA3EddHmXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706775; c=relaxed/simple;
	bh=EBqSQLPyaPek1BoqwKC7mqnmH034pNcPdTdq9SO/p+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzqHw/9PrUEXzvc6QpKfcZVxbznCJjtdqhAZt3p2V5NJd1CMJfQRPPZmz0U/wofMCqlCxSTv8rxDpgecc/cqSRsXiTj7CSs7vmBM4AB86M+g/aaT7iVd47ZHKCAHQB01hp8H8jj0YGZq1foiq7AqBfAAo2oKhCXJkARjh3dQ21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JuF1UB7l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65146564;
	Tue, 18 Jun 2024 12:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718706753;
	bh=EBqSQLPyaPek1BoqwKC7mqnmH034pNcPdTdq9SO/p+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JuF1UB7l09KOEP4VhLa/JGHIaNre82HBTlv6cnst8DzX/8zkcG19TpzqHouRDV27F
	 r1qaVJfUUR0zo+W+Us/RWaFRaH47bBtipFy3lz2Wgkl7K6NfW8cVJV/0xGGazuQUwV
	 Se92PTvSJnmE38Xm20eHkjDbIVEyKaanqg88H6SM=
Date: Tue, 18 Jun 2024 12:32:47 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 08/19] media: renesas: vsp1: Store RPF partition
 configuration per RPF instance
Message-ID: <fzdn7eq4xhofryqqquo3eqpixplegswvkfomhp227fyskhvh7b@la56opfmfr4h>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-9-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-9-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:29:58AM GMT, Laurent Pinchart wrote:
> The vsp1_partition structure stores the RPF partition configuration in a
> single field for all RPF instances, while each RPF can have its own
> configuration. Fix it by storing the configuration separately for each
> RPF instance.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Is this worth a Fixes: tag ?
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h | 2 +-
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c  | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> index 02e98d843730..840fd3288efb 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> @@ -73,7 +73,7 @@ struct vsp1_partition_window {
>   * @wpf: The WPF partition window configuration
>   */
>  struct vsp1_partition {
> -	struct vsp1_partition_window rpf;
> +	struct vsp1_partition_window rpf[VSP1_MAX_RPF];
>  	struct vsp1_partition_window uds_sink;
>  	struct vsp1_partition_window uds_source;
>  	struct vsp1_partition_window sru;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 3e62638fdce6..42b0c5655404 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -311,8 +311,8 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
>  	 * 'width' need to be adjusted.
>  	 */
>  	if (pipe->partitions > 1) {
> -		crop.width = pipe->partition->rpf.width;
> -		crop.left += pipe->partition->rpf.left;
> +		crop.width = pipe->partition->rpf[rpf->entity.index].width;
> +		crop.left += pipe->partition->rpf[rpf->entity.index].left;
>  	}
>
>  	if (pipe->interlaced) {
> @@ -367,7 +367,9 @@ static void rpf_partition(struct vsp1_entity *entity,
>  			  unsigned int partition_idx,
>  			  struct vsp1_partition_window *window)
>  {
> -	partition->rpf = *window;
> +	struct vsp1_rwpf *rpf = to_rwpf(&entity->subdev);
> +
> +	partition->rpf[rpf->entity.index] = *window;
>  }
>
>  static const struct vsp1_entity_operations rpf_entity_ops = {
> --
> Regards,
>
> Laurent Pinchart
>
>

