Return-Path: <linux-media+bounces-18915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7798BBEA
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E864C284809
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 12:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39EE1C2333;
	Tue,  1 Oct 2024 12:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="Pge7BPjP"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765F41A00D1
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727785086; cv=pass; b=EUuqjLJhwjMj+OFk9LPGG+nDvdkVJBhPEEuUUphxllEOmtsogzAjQAWo/3C46rwQm07wBIB2QnCCyYrgb4E3Be8jBM4tvTYa0Hj0lzW/jymE7HaI7yikJ85ig2DmPdzY1txozIbpup96xuEoGa/kuxMJNWrzjrH6l5nIbRYZXb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727785086; c=relaxed/simple;
	bh=Gn2p72HHQvBpAJKnE7dSlIL6KYuzalBZSyDdBnJCta0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qttjjHliQGMsIz3CFsxTU2noQt8mHsMi0yl3D1OUPQ4SfgjF+Q3wK3o9/yUMuB1IRCOue9hS3s6L8RFdb+JTqNRG9C9lcejK2ljgS2VKg+LtqPWOb4/jUVlcZbnGNF39kuMcKwMiM0c9x6w9oeBaMG3SmAGUzcamw8GayLpqy7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=Pge7BPjP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727785076; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J3n8STfB3YylAinVTGFt4X9+1se8GBBOeEEZQMjQG1hkq3aANgiBpxSkOofD2Q2WW+L1ZcIInH7UPUF4+qRl3mHAkcz88wzXgwFq363Gacn/pR2GRVxHJlG+agmD6BBlJN0QgiOi4lleg7YooTjSUYJ53mZGS9sXaetbnyVK4vo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727785076; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=miRreCDsUqTlF/lqctM/p4GvuSiKwccfSdJrcv4xQAA=; 
	b=UKxyCeS/KlnWf6pGv+HI+0lBrmd7gx9lBPFxk/kafICuj1eLFLWe1HReI2+xw00oKce4X2s7UMBXw53GcrjRd/RN0d5k1lKo/jgrcGaiPMiLjRt/i3oAMRxw0JA+j0vR7oyIb4DTesy2PA28PiVJM3CaL5R2rBD40Glng5iaHjo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727785076;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=miRreCDsUqTlF/lqctM/p4GvuSiKwccfSdJrcv4xQAA=;
	b=Pge7BPjP45S0NEnqZtIorugoRU3a6AyXAACi9ijd896ncy12+FlQxWG9bjwGAfLO
	PQMdmUkF9jWhQAa5Kv/5ts4qL5CMJd5EK4wh4kTviFkZn//ebVucNsyVaIbcFa9QA0o
	LPIQ7TYvhcI5rfYwpqE9ULaNIm/SDGQXMjpsh6UE=
Received: by mx.zohomail.com with SMTPS id 172778507590366.91131628967605;
	Tue, 1 Oct 2024 05:17:55 -0700 (PDT)
Message-ID: <0cb9ed7d-3818-4429-9674-c5f9910f44c8@collabora.com>
Date: Tue, 1 Oct 2024 14:17:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for v6.12] media: dvb-core: add missing buffer index check
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chenyuan Yang <chenyuan0y@gmail.com>
References: <373c1bd7-8c1c-4cee-ae06-0b4dcaf78f9f@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <373c1bd7-8c1c-4cee-ae06-0b4dcaf78f9f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 01/10/2024 à 14:11, Hans Verkuil a écrit :
> dvb_vb2_expbuf() didn't check if the given buffer index was
> for a valid buffer. Add this check.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 7dc866df4012 ("media: dvb-core: Use vb2_get_buffer() instead of directly access to buffers array")
> Cc: <stable@vger.kernel.org>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
> Resent, noting that it is a fix for 6.12.
> ---
>   drivers/media/dvb-core/dvb_vb2.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 192a8230c4aa..29edaaff7a5c 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -366,9 +366,15 @@ int dvb_vb2_querybuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
>   int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
>   {
>   	struct vb2_queue *q = &ctx->vb_q;
> +	struct vb2_buffer *vb2 = vb2_get_buffer(q, exp->index);
>   	int ret;
>
> -	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, q->bufs[exp->index],
> +	if (!vb2) {
> +		dprintk(1, "[%s] invalid buffer index\n", ctx->name);
> +		return -EINVAL;
> +	}
> +
> +	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, vb2,
>   			      0, exp->flags);
>   	if (ret) {
>   		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,

