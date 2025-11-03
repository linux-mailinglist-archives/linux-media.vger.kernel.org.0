Return-Path: <linux-media+bounces-46181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77132C2A8DF
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 09:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D1CB14EA0BC
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 08:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2549B2DC777;
	Mon,  3 Nov 2025 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOnVe8YS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE9E28D8F1;
	Mon,  3 Nov 2025 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762158336; cv=none; b=htGxj3rkj0UgkOx/9srI1+IOEyy93xV39r1rjeY0VDzJ8q4GoPLCEyNTVwUuY/ZENZPJ20L3YW69s6pbWo1+6C5DzVFbecTIGJ8aaCMH6SWwRtv4wKL8WAUwDOKfo9g34lNADUEn6B2L2sRQbUEYCSORALQlh7N1bi1eqj06yGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762158336; c=relaxed/simple;
	bh=F5aVqdw4ylrut0vH7us2KkUmhnLaDIfWT7Jmh8UeHiM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V0UK00tUbBZJ6GRBq5dS4KmQT5yC6ntpq5TivThczsbkuQsZrhxrJninlVI865/A64E/u+cj/YMFvVcGbzvUqssOQMmBWYJ6BRaKT08NVcRphe2YITUK115sTEQfsmtpEyKXDNYN81IX+5LvTMD2DFOcDMvSJmWP9zLrIArbH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOnVe8YS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF73C4CEE7;
	Mon,  3 Nov 2025 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762158336;
	bh=F5aVqdw4ylrut0vH7us2KkUmhnLaDIfWT7Jmh8UeHiM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=SOnVe8YSEu+ue1pID+odYB2F9GCnoD8x9BrSk1fPnF9h8If8hxdQioDW0fU0bh2vR
	 MCiTaZWUw9NgaFHcRKOA4PV/L5E+4Eh9hezH/BqrkjYgKa3DHt6O0pnY62oDp1aQ1P
	 ivqPKDwDPS/ChYFh2KcvLB1hXK5zQTTN74JX7ZhGCXPLegxW+1a73Wtsr8cz4wjHOF
	 5TLnQsL61LXi0WkUcz5/5LCHpglw0ON+nFhsf/CIXo6xgdhoU0PiADQW6ytjOEYwgS
	 oAlNiR69Gfdyz6mylStaKRqxRwWqPniOQAUcy1YXpfxfLukAEa2KvNhOA2K70h2bvq
	 5t/Gb+bxOw7og==
Message-ID: <dd0aa0bd-17ec-42a5-9ddb-ed564993aa9b@kernel.org>
Date: Mon, 3 Nov 2025 09:25:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: dvbringbuffer : fix space issues
To: Nikhil S <nikhilsunilkumar@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925181032.7862-1-nikhilsunilkumar@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250925181032.7862-1-nikhilsunilkumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2025 20:10, Nikhil S wrote:
> Fix the space issues detected by the checkpatch tool
> 
> Changes in v2:
>  - Split multiple assignments into separate lines

This patch is a duplicate of:

https://lore.kernel.org/linux-media/20250718130807.87691-1-darshanrathod475@gmail.com/

which has already been merged. So I'm dropping this one.

Regards,

	Hans

> 
> Signed-off-by: Nikhil S <nikhilsunilkumar@gmail.com>
> ---
>  drivers/media/dvb-core/dvb_ringbuffer.c | 34 +++++++++++++++----------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_ringbuffer.c b/drivers/media/dvb-core/dvb_ringbuffer.c
> index 7d4558de8..99c2d700c 100644
> --- a/drivers/media/dvb-core/dvb_ringbuffer.c
> +++ b/drivers/media/dvb-core/dvb_ringbuffer.c
> @@ -37,10 +37,11 @@
>  
>  void dvb_ringbuffer_init(struct dvb_ringbuffer *rbuf, void *data, size_t len)
>  {
> -	rbuf->pread=rbuf->pwrite=0;
> -	rbuf->data=data;
> -	rbuf->size=len;
> -	rbuf->error=0;
> +	rbuf->pread = 0;
> +	rbuf->pwrite = 0;
> +	rbuf->data = data;
> +	rbuf->size = len;
> +	rbuf->error = 0;
>  
>  	init_waitqueue_head(&rbuf->queue);
>  
> @@ -235,7 +236,7 @@ ssize_t dvb_ringbuffer_write_user(struct dvb_ringbuffer *rbuf,
>  	return len;
>  }
>  
> -ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8* buf, size_t len)
> +ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8 *buf, size_t len)
>  {
>  	int status;
>  	ssize_t oldpwrite = rbuf->pwrite;
> @@ -245,7 +246,8 @@ ssize_t dvb_ringbuffer_pkt_write(struct dvb_ringbuffer *rbuf, u8* buf, size_t le
>  	DVB_RINGBUFFER_WRITE_BYTE(rbuf, PKT_READY);
>  	status = dvb_ringbuffer_write(rbuf, buf, len);
>  
> -	if (status < 0) rbuf->pwrite = oldpwrite;
> +	if (status < 0)
> +		rbuf->pwrite = oldpwrite;
>  	return status;
>  }
>  
> @@ -258,8 +260,10 @@ ssize_t dvb_ringbuffer_pkt_read_user(struct dvb_ringbuffer *rbuf, size_t idx,
>  
>  	pktlen = rbuf->data[idx] << 8;
>  	pktlen |= rbuf->data[(idx + 1) % rbuf->size];
> -	if (offset > pktlen) return -EINVAL;
> -	if ((offset + len) > pktlen) len = pktlen - offset;
> +	if (offset > pktlen)
> +		return -EINVAL;
> +	if ((offset + len) > pktlen)
> +		len = pktlen - offset;
>  
>  	idx = (idx + DVB_RINGBUFFER_PKTHDRSIZE + offset) % rbuf->size;
>  	todo = len;
> @@ -278,7 +282,7 @@ ssize_t dvb_ringbuffer_pkt_read_user(struct dvb_ringbuffer *rbuf, size_t idx,
>  }
>  
>  ssize_t dvb_ringbuffer_pkt_read(struct dvb_ringbuffer *rbuf, size_t idx,
> -				int offset, u8* buf, size_t len)
> +				int offset, u8 *buf, size_t len)
>  {
>  	size_t todo;
>  	size_t split;
> @@ -286,8 +290,10 @@ ssize_t dvb_ringbuffer_pkt_read(struct dvb_ringbuffer *rbuf, size_t idx,
>  
>  	pktlen = rbuf->data[idx] << 8;
>  	pktlen |= rbuf->data[(idx + 1) % rbuf->size];
> -	if (offset > pktlen) return -EINVAL;
> -	if ((offset + len) > pktlen) len = pktlen - offset;
> +	if (offset > pktlen)
> +		return -EINVAL;
> +	if ((offset + len) > pktlen)
> +		len = pktlen - offset;
>  
>  	idx = (idx + DVB_RINGBUFFER_PKTHDRSIZE + offset) % rbuf->size;
>  	todo = len;
> @@ -309,7 +315,7 @@ void dvb_ringbuffer_pkt_dispose(struct dvb_ringbuffer *rbuf, size_t idx)
>  	rbuf->data[(idx + 2) % rbuf->size] = PKT_DISPOSED;
>  
>  	// clean up disposed packets
> -	while(dvb_ringbuffer_avail(rbuf) > DVB_RINGBUFFER_PKTHDRSIZE) {
> +	while (dvb_ringbuffer_avail(rbuf) > DVB_RINGBUFFER_PKTHDRSIZE) {
>  		if (DVB_RINGBUFFER_PEEK(rbuf, 2) == PKT_DISPOSED) {
>  			pktlen = DVB_RINGBUFFER_PEEK(rbuf, 0) << 8;
>  			pktlen |= DVB_RINGBUFFER_PEEK(rbuf, 1);
> @@ -321,7 +327,7 @@ void dvb_ringbuffer_pkt_dispose(struct dvb_ringbuffer *rbuf, size_t idx)
>  	}
>  }
>  
> -ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t* pktlen)
> +ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t *pktlen)
>  {
>  	int consumed;
>  	int curpktlen;
> @@ -339,7 +345,7 @@ ssize_t dvb_ringbuffer_pkt_next(struct dvb_ringbuffer *rbuf, size_t idx, size_t*
>  	if (consumed < 0)
>  		consumed += rbuf->size;
>  
> -	while((dvb_ringbuffer_avail(rbuf) - consumed) > DVB_RINGBUFFER_PKTHDRSIZE) {
> +	while ((dvb_ringbuffer_avail(rbuf) - consumed) > DVB_RINGBUFFER_PKTHDRSIZE) {
>  
>  		curpktlen = rbuf->data[idx] << 8;
>  		curpktlen |= rbuf->data[(idx + 1) % rbuf->size];


