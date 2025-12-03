Return-Path: <linux-media+bounces-48137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A5C9E6EA
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 10:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0C454E184E
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 09:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8742DA779;
	Wed,  3 Dec 2025 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IXiBoIKt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509931EF0B9;
	Wed,  3 Dec 2025 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753440; cv=none; b=iwjyx+ZanInm1tGejQDa7UWQlXZZL/SKqV8mhjZr81NGn0fuyA0MFlgvViD6Snf1ND+R3mQt8rS0cRsqR58EHT3S8u5hBToo5OFUUWc+24QtHEZ3zJ9iKuZlDanvktBDqrXJxr8SLdOMhD+XEsWtvg4n9t1clITx8EFN7Zco99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753440; c=relaxed/simple;
	bh=zJPoFFDmgvv98VY8U9k6gQzIrX+VTMD1Dx9s/DmtYCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diIWaVVLiFKCrHmeNZBoyCplUUQ0cLyEmRhjwTn0BdU76ENbnPBwxsl2Cz3tXkShWLCY5gh+I6BYccMxI0lYGJCj759djzo0KvPu20e0svAK/8uwpLl8z02jRF6Mfwxsag5s8HaKJ0rowvrBqkzv03FKPAqbAk67I8b1+IgM8FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IXiBoIKt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (KD106146000088.au-net.ne.jp [106.146.0.88])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 59C04AB4;
	Wed,  3 Dec 2025 10:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764753299;
	bh=zJPoFFDmgvv98VY8U9k6gQzIrX+VTMD1Dx9s/DmtYCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXiBoIKt0QHyA6lEPXKI6biDf/Sx8XDblHjVWjThIXSUFWsiz7shMJ9C3qSERGB1r
	 0nd3ruORDiiTD4IuZd+xB9Ldj1qPaLJqzUv9hdKeKZ4ystntzkRmQL9avv4yQNI5nY
	 d6hTIDbwStFi7yXOnyCLkWzmBbR/P6bs5SzVZ4r0=
Date: Wed, 3 Dec 2025 18:16:49 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Keke Li <keke.li@amlogic.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] media: iris: Document difference in size during
 allocation
Message-ID: <20251203091649.GA13064@pendragon.ideasonboard.com>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
 <20251203-warnings-6-19-v1-2-25308e136bca@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251203-warnings-6-19-v1-2-25308e136bca@chromium.org>

On Wed, Dec 03, 2025 at 08:55:35AM +0000, Ricardo Ribalda wrote:
> As we get ready for kzalloc checking for invalid sizes, let's add
> documentation for the cases where the size is different but valid.
> 
> This patch fixes this cocci warning:
> ./platform/qcom/iris/iris_hfi_gen2_command.c:1215:9-25: WARNING: casting value returned by memory allocation function to (struct iris_inst *) is useless.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index f9129553209922fda548ca320494ae6ae797854c..ab91afd0597045bd876d0411b08b5a3421b12c70 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1212,5 +1212,13 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
>  
>  struct iris_inst *iris_hfi_gen2_get_instance(void)
>  {
> -	return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
> +	struct iris_inst_hfi_gen2 *out;
> +
> +	/*
> +	 * The allocation is intentionally larger. The first member of
> +	 * struct iris_hfi_gen2 is struct iris_inst.
> +	 */
> +	out = kzalloc(sizeof(*out), GFP_KERNEL);
> +
> +	return (struct iris_inst *)out;

	return &out->inst;

would be more readable. You can then drop the comment.

>  }
> 

-- 
Regards,

Laurent Pinchart

