Return-Path: <linux-media+bounces-45218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24564BFB610
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 14F8C507C91
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988C1320CC0;
	Wed, 22 Oct 2025 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="q1SYJcrD"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99BD3112B4;
	Wed, 22 Oct 2025 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128462; cv=pass; b=PfmOBDt6xmSVX7/nNagdgLrXTVKARywNro9jEkgviZkIxckqWCMht/qUb2bUGKdOQuaHlblzSW+sQjAsH0x1Ga+hFXQQUP6AQ6NFvNAh1UwCuSUaZbXE9Fn7ZUFHLnsnKDYxNZC1ymxr/RFCHJrwKbx8xUpmohMxjsdrLksm8xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128462; c=relaxed/simple;
	bh=WcfCzMLF8yV2yEQ6rPDAP/t771wdXiySU/gL/myOyPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Az6SZtbU86jmYb9X69ju/WDcTdA2pZMdXZ/mBnNC/5AkRwGvvch1YbLp++B26eRaM0yjX+J/piMtMrIFur9oIsEsukgeyopy2LCU2BH2i5JblFESXrU75XajEy9Wtd2mjzFkUVSq/5gXHJeKvJoJI9tUfOzhddh9tvaTMWFcHHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=q1SYJcrD; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cs4tr6GKKz49Q6J;
	Wed, 22 Oct 2025 13:20:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761128453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pn7qKP8Rpk5Pgq16U+bd7DU5EUgj2YSuSsmwYajklnI=;
	b=q1SYJcrD/B/ahKHshzu27S3V5xQHi01Q0NuSFa/2VCMSLOKjdQGyBzdU71tDo8wQCTA8AI
	2VMUWhwHowhEuQrASr8dF2mFjlj8cCOugblnJQNyF7ULVSkfUEgnYEUbGcRBvugnmmtGAL
	LJEl+x3MrZsTIAVtZnF5goWjNJQzlHhQ7+bz9O6G4Wi3JKkzQwS/+0AxTb0RYOfnMqyGoa
	VgLk3SOJRPRjx3N3bIhg44QqHd5TyVTJONYwThGFl1fcpyGuvBSFa8NsiDs+PPHF6b9nLf
	9+jY+qis0j1in6LoZ3hCY9hWNqaQREZ6hqGdKT7+/idXccHVGqf+4ZtOGnu4Ug==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761128453; a=rsa-sha256;
	cv=none;
	b=i1kE/TeqbInP7eLcIo8elgAtVBQERXIz2iRP7kYtU1hgxtiYKFcutgDsbhS6iXhXfvnSnS
	Qei0AwkGVI+AN8UzlK3tpNRbWJMD2sKOWi4cbbW8XQl81O1IvAq1EAP38l+pLlkUUxx3zY
	zSJd+/d582b074pm6BVKk1uAa6wJCL9y3mT1bxPN3EgNzjIQm9VZTgVIwO3iTaVPK6egrm
	O+jlF1psKi4ZcEexP6h1yQ37zYcm8dKDShOoU4PwxWqXDbARlh74qEeP0OIagm1gxNkaxE
	u577BbhCK/YYo+Lmr5Ix7mbZp/8xfnfXC1DHH7PjIW3SdyCzrgzfk9Qdf1eddQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761128453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pn7qKP8Rpk5Pgq16U+bd7DU5EUgj2YSuSsmwYajklnI=;
	b=msEtWGvgAWssFw44DGFf/CvsAMqKV9Viy6jjbtFa0t3uZq9Uc5fRAEQFu3+wKkEwBCA1+/
	atxBG7cukuauvptvq8FaWTqN2MPaJvMPzsF5OihLsFW2IbL0XtMzCGlNMA3iEF0M3qiqR5
	PZPgwU7opztlpI+30dlRfUyjCt5cloLnaFcUU0eJbIiZf5M0BFPx2nYpYTOWcbEc8i2I0H
	9SKDLIjfEAiI5/HErPKIcbHV2opi2NQliTmgUOscvsD54n3xD9yaPeoGq9tVjwCnxvLkjz
	3FrRrbJHJT42I8ziDzqzWSr2rBYuM/pHTc2vZpUIus7vmIoezv1PYiqAq9Jevg==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 95B93634C50;
	Wed, 22 Oct 2025 13:20:52 +0300 (EEST)
Date: Wed, 22 Oct 2025 13:20:52 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Cc: linux-kernel@vger.kernel.org, awalls@md.metrocast.net,
	mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] kernel memory safety check in a block
Message-ID: <aPiwBG0Iusmy3jeZ@valkosipuli.retiisi.eu>
References: <20251021201704.178535-1-biancaa2210329@ssn.edu.in>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021201704.178535-1-biancaa2210329@ssn.edu.in>

Hi Biancaa,

On Wed, Oct 22, 2025 at 01:47:04AM +0530, Biancaa Ramesh wrote:
> Signed-off-by: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
> [PATCH] media: cx18: fix potential double free in cx18_stream_alloc
> 
> The function cx18_stream_alloc() may free buf->buf and buf multiple times
> if dma_mapping_error() occurs. This patch:
> 
> - Adds checks before kfree() to avoid double free
> - Sets pointers to NULL after free to make accidental double free less likely
> - Improves overall memory safety and robustness in error paths
> ---
>  drivers/media/pci/cx18/cx18-queue.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-queue.c b/drivers/media/pci/cx18/cx18-queue.c
> index eeb5513b1d52..025ba4e6e4be 100644
> --- a/drivers/media/pci/cx18/cx18-queue.c
> +++ b/drivers/media/pci/cx18/cx18-queue.c
> @@ -383,9 +383,16 @@ int cx18_stream_alloc(struct cx18_stream *s)
>  						 buf->buf, s->buf_size,
>  						 s->dma);
>  		if (dma_mapping_error(&s->cx->pci_dev->dev, buf->dma_handle)) {
> -			kfree(buf->buf);
> +			if (buf) {
> +        		if (buf->buf){
> +            	kfree(buf->buf);
> +				buf->buf =NULL;
> +				}
> +        		kfree(buf);
> +				buf=NULL;
> +    		}
>  			kfree(mdl);
> -			kfree(buf);
> +			//makes accidental double free less possible
>  			break;
>  		}
>  

Please read Documentation/process/submitting-patches.rst before submitting
further patches.

-- 
Kind regards,

Sakari Ailus

