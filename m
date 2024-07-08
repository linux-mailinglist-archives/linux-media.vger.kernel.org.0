Return-Path: <linux-media+bounces-14694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48D929F70
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 11:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB899B27C61
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 09:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F97A78C92;
	Mon,  8 Jul 2024 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QuIACxNe"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2678B4E
	for <linux-media@vger.kernel.org>; Mon,  8 Jul 2024 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720431727; cv=pass; b=Hy+jV+e+feVD0/01p6yKHsLTNhCy07fa0pX8aNnYKW5lB4norqn1pf0jwQwRGGyNPUx1Pyx+y+JVDbBCqCxI4Y6cr5YR3EYn66iDjAV7GVdshwOTKiqLVxJq4GCEpjPT08psdcncbi7pM72UCikJkcbdp/sxYCBwgGgMXow/bHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720431727; c=relaxed/simple;
	bh=s4vt3OhyrCQGydwOlg+hW/zNBbk1h21TuM1MVFzJPwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/8xGQNmZ1RvcGveD5pDj9jF9M60d/W6NL49J+wdTveh8kLEcitw9ccTbPBubTwEbyXnuJQENN4CowLt/b+Ix4v5DVlc2fdsIA1BHsIQe/MdLbQZ4bhRjOia7HSnxRQaHR49j1T+SZDI3gafl2eE/vvgro4Cjv9RLovgx9M1xpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QuIACxNe; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WHfKJ1VpXz49Q3G;
	Mon,  8 Jul 2024 12:41:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1720431716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6lEjLuu/78LQJ5Bqv6D8KPxkyUa9y/Bd9QNVmJdOZao=;
	b=QuIACxNe83gHHVjIeKRO4T7WVZoy9d7JPixFjuQ9aZh2ccO+P0A0Ra15SSE6qocr/xjAFu
	l4FaG3AOm67BQk6JRacxYdY924URcpJ5bGu7niEnDRqn8GSGp+NSGmU5PXPIgjQ/tXmo03
	D4w9IftL3bCmF41Bnp1F8jHkxGKFhhaQLLKg8HfsyVTjKDg147ykb821Chwm2wOW2+fOfn
	J1RXSkW9hj59WeenpLcH2K3MH0fV94rrFeBhDcdjaIKl/G4Lrps/34IQLbRYYiGf76KD5d
	aBc8VHJSmh9Eg/JL5ceFiyBKVoLH7qTHtindMuWzF3JrkoqEtMshZ8Zrr+9V1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1720431716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6lEjLuu/78LQJ5Bqv6D8KPxkyUa9y/Bd9QNVmJdOZao=;
	b=TTaWVgnNHdkgTmAfMo2K9P/vsU5pm+jYHe86VXy1yCkkyfMdkjSURulleY9hMMM2T6oe3e
	xZqax4JXeUMUSCanBGtwKP4mJXznTIyMTBkw8fDte7//nr0IoqoaMkVczceFFcx0eQ25RD
	qPjWl0ucWwpU4zlJIvrgdc4XciB55h30pJRf/L1EfFWQgU05apuO2d5HgmZNOlu5crx7dB
	id5NwploZjoTCg28n/m+a9f6hJEV4WNkR+m9YJqh30fux+aHFyH+aWMCEKD9ZtkTZJMgp6
	dUwZw7emX0L69TVN7NAbgmrzxFHG5ciHyYtZgltfSllwHWwdztAYLlQL2L3/uQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1720431716; a=rsa-sha256;
	cv=none;
	b=hiA9K9eUwvvlB+2/tc/3k3GVIEKIP8pmaUBkMLSOD+rX89AiIueLKdvRIgBisgedm3GAGI
	dpiPgXNjhev16rLwhwv4Oftt/U1H4HNq+EPziIf4PjONxJ3+JwRsicw0Fd320+MgkNuv2Y
	uXxRhZjSlO24M99+/asVq3K/wGo7/aj60x54m59k9a4gwkgyXqDi/Xp/VSxMoq4vONlKq/
	skyuVBiLeQA51lB6PcOpfdNOmOLZwoWmbhdadtjRmYOHIjLEKk9FH/5GoV3J8153vJ9Xzh
	PnnPUifLra5PCRUHK36szpO23b+VYxYvVEp9Xnk5MOAlTEXwu0uRpjsN3D+Lrw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5107D634C93;
	Mon,  8 Jul 2024 12:41:54 +0300 (EEST)
Date: Mon, 8 Jul 2024 09:41:54 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 6/7] media: rkisp1: Implement extensible params support
Message-ID: <Zou0YlPN6tWD2nWv@valkosipuli.retiisi.eu>
References: <20240703161048.247124-1-jacopo.mondi@ideasonboard.com>
 <20240703161048.247124-7-jacopo.mondi@ideasonboard.com>
 <Zok2Dren177xsYEr@valkosipuli.retiisi.eu>
 <n7s4p7a6v2ucyoybyyyvvnvfclqcnkkqz2fjpkdzsc6dg72yca@fqyo4lzt6rtr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n7s4p7a6v2ucyoybyyyvvnvfclqcnkkqz2fjpkdzsc6dg72yca@fqyo4lzt6rtr>

Hi Jacopo,  

On Mon, Jul 08, 2024 at 10:25:34AM +0200, Jacopo Mondi wrote:
> > > +static void rkisp1_ext_params_config(struct rkisp1_params *params,
> > > +				     struct rkisp1_ext_params_cfg *cfg,
> > > +				     u32 block_group_mask)
> > > +{
> > > +	size_t block_offset = 0;
> > > +
> > > +	if (WARN_ON(!cfg))
> > > +		return;
> > > +
> > > +	/* Walk the list of parameter blocks and process them. */
> > > +	while (block_offset < cfg->data_size) {
> > > +		const struct rkisp1_ext_params_handler *block_handler;
> > > +		const union rkisp1_ext_params_config *block;
> > > +
> > > +		block = (const union rkisp1_ext_params_config *)
> > > +			&cfg->data[block_offset];
> >
> > In validation, you only check that if full headers exist, then headers are
> > fine. But here you don't perform that check, meaning you may have partial
> > headers here only. Either check here, too, or check that there's no more
> > data after the last block during validation.
> 
> My preference would be for checking during validation that there is
> no data after the last valid header.
> 
> I think:
> 
> @@ -2438,6 +2438,12 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
>                 cfg_size -= block->size;
>         }
> 
> +       if (cfg_size) {
> +               dev_dbg(params->rkisp1->dev,
> +                       "Unexpected data after the parameters buffer end\n");
> +               return -EINVAL;
> +       }
> +
>         return 0;
>  }
> 
> would do ?

I believe it would. I also think it's better to address this during the
validation.

-- 
Kind regards,

Sakari Ailus

