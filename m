Return-Path: <linux-media+bounces-34082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E277EACE7B1
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 03:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602103A99B5
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 01:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D954315F;
	Thu,  5 Jun 2025 01:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="AFT2sil/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4072F2A;
	Thu,  5 Jun 2025 01:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749085817; cv=none; b=sv9T06SabbGH3LSixRurk1moCBauHlVZh9cKMUxSoNRIsMZcag7RJ2yX/513/eUWaEzfK21Ul2FikEiPGHPKfP0B6RUE1kKZdINE2pMb2JoD9GMXKDmPZuGENp/OQa4qH2PfSJLE3EvfD5WasAoT44TmE1LCMQioNo8yLGLALy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749085817; c=relaxed/simple;
	bh=DWevXM9YzLaAYkxh7jSZdK26cqIUSzxp1LYnuQCX7U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7GU2gY9DyKiByV3v4/sbL7dNIjnlFQGDxTqg4TkSheZG2k37GMzL+70tnZOwCTXOVqYzgDDL/02jYTQ9HMfrL94ToG8ivg+m3/Xhm0eGVfoiSMEkx37Wbz1O0xF0d7SDDyFhu776KyA/hOIhuiMhQOeqiatewU8PhXDdH03Duw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=AFT2sil/; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=h1I5H+m7Li/Hz79oqg25+G4/LoJeOM6FZZuy5d74vNE=; b=AFT2sil/AohDpzM/
	Y/ouSTaXx3p/6V4+/Mobvxft8ooro39sAq3GgtEadHZDrb4nzcSepYSlHQJRGXojt5wqlqQm6uyKp
	yhAEdCEtS/xY7QkgYcm/bjkgVwemkdwqenVNUmtFGeJ4wiWaHfs4/xOZxr6HG3WFhLzycjPTGHJNB
	3X1lISVKf+GHB5EvulEQIPwfLrYvb7RgG6gsK5pw09isIXpT4j8raTDGehmeI7PscP/z/4CAabone
	Wgctjhib6fmWDYd84jFKVtfYWTrAsW+3CJ0DzWTwUTPAgIzbHlSp3oOAOwfw/s69lDE6fJJ6y94lr
	Ui8L7IX4P+VDroipzw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uMz7I-007h7X-0m;
	Thu, 05 Jun 2025 01:10:00 +0000
Date: Thu, 5 Jun 2025 01:10:00 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-tpg: Remove unused tpg_fillbuffer
Message-ID: <aEDuaFSzA37QtuOf@gallifrey>
References: <20250603225121.308402-1-linux@treblig.org>
 <bb65cb39-eba4-4e0f-a83c-285ab6bae753@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <bb65cb39-eba4-4e0f-a83c-285ab6bae753@jjverkuil.nl>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 01:04:31 up 38 days,  9:18,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Hans Verkuil (hans@jjverkuil.nl) wrote:
> On 04/06/2025 00:51, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > The last use of tpg_fillbuffer() was removed in 2015 by
> > commit ddcaee9dd4c0 ("[media] vivid: add support for single buffer planar
> > formats")
> > 
> > Remove it.
> 
> Ah, this can't be removed.
> 
> This tpg code is actually also used in git://linuxtv.org/v4l-utils.git which
> copies the code from the kernel source. And there this function is in use.

Ah OK, fair enough.

> This function is really a helper function. I think the best approach is to move
> this out of v4l2-tpg-core.c and into v4l2-tpg.h as a static inline.
> 
> That way it doesn't add to the kernel code size, but is still available when needed.

It feels a bit bug for a static inline to me; personally I wouldn't worry that much about
kernel size in that case - the tpg is in a separate module isn't it, which I guess
is rarely used in normal use?

> Perhaps add a comment in front of this function noting that it is used in v4l-utils.

Yeh, reasonable,

Thanks for the review,

Dave

> Regards,
> 
> 	Hans
> 
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 17 -----------------
> >  include/media/tpg/v4l2-tpg.h                  |  2 --
> >  2 files changed, 19 deletions(-)
> > 
> > diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > index 931e5dc453b9..d51d8ba99dcb 100644
> > --- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > +++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > @@ -2710,23 +2710,6 @@ void tpg_fill_plane_buffer(struct tpg_data *tpg, v4l2_std_id std,
> >  }
> >  EXPORT_SYMBOL_GPL(tpg_fill_plane_buffer);
> >  
> > -void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std, unsigned p, u8 *vbuf)
> > -{
> > -	unsigned offset = 0;
> > -	unsigned i;
> > -
> > -	if (tpg->buffers > 1) {
> > -		tpg_fill_plane_buffer(tpg, std, p, vbuf);
> > -		return;
> > -	}
> > -
> > -	for (i = 0; i < tpg_g_planes(tpg); i++) {
> > -		tpg_fill_plane_buffer(tpg, std, i, vbuf + offset);
> > -		offset += tpg_calc_plane_size(tpg, i);
> > -	}
> > -}
> > -EXPORT_SYMBOL_GPL(tpg_fillbuffer);
> > -
> >  MODULE_DESCRIPTION("V4L2 Test Pattern Generator");
> >  MODULE_AUTHOR("Hans Verkuil");
> >  MODULE_LICENSE("GPL");
> > diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
> > index a55088921d1d..3e3bd0889b6d 100644
> > --- a/include/media/tpg/v4l2-tpg.h
> > +++ b/include/media/tpg/v4l2-tpg.h
> > @@ -248,8 +248,6 @@ void tpg_calc_text_basep(struct tpg_data *tpg,
> >  unsigned tpg_g_interleaved_plane(const struct tpg_data *tpg, unsigned buf_line);
> >  void tpg_fill_plane_buffer(struct tpg_data *tpg, v4l2_std_id std,
> >  			   unsigned p, u8 *vbuf);
> > -void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std,
> > -		    unsigned p, u8 *vbuf);
> >  bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc);
> >  void tpg_s_crop_compose(struct tpg_data *tpg, const struct v4l2_rect *crop,
> >  		const struct v4l2_rect *compose);
> 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

