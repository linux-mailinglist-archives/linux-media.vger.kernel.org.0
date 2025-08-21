Return-Path: <linux-media+bounces-40643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8510B30095
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72327A227BB
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6600727CCCD;
	Thu, 21 Aug 2025 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="VIESqWvF"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619822DECA3;
	Thu, 21 Aug 2025 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755795206; cv=pass; b=BXfCUG298kfgOx/vWhyBD0RnAHHM2NLW2/SJaOoh4jfaWK6exVGHGig1Xihyfg+++4q4LqATMDxSBeR0kNJaLejlbZK5kAH+NIBjeF61zqai7sXjLA3VNGlgttUVFTYWVrfLtPVMPLMx+belkr6YJdzE1yYGfv4NK2LQcP/VGdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755795206; c=relaxed/simple;
	bh=zqxpAlVWLYPGLuJl5tfFDLLNI0m5LK2fyC2lgAQjeVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/i9D07ilQlldjxuDS42ljXESHeXnHNm6kh8m0aQWt5oMLytGoehK5WAZLqKJDezvje1WBLe0G5LxcUno6cbvITje5GZpNvr7i8lxRjipLLSdzQubWvEvP0BNYDt/eDHIHx2N79P3XX8TkgYw4Pwl49mwP5sP59tTFs4jklHFXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=VIESqWvF; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4c78XC55LBz49PyC;
	Thu, 21 Aug 2025 19:53:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1755795196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlakafP8cKS6Ll5TiyPHHDp3dHuCgDtGkj3loayRdEY=;
	b=VIESqWvFUz/Db1S/0wAtr2A6X/rAIBI4rSyOBbI/qDQn+ufezgAaBfWEAVj/SnWRSX1cEa
	opt/urhAWILdoUXSq51I8XW4Sp2NjpmdgHXUEeqE/4WGp0s4DCdE/WBtv8ixLN85bUl0MF
	sH+0L/uDZs2aqt8XbwXHsU+0uPqSYy2zkMjTe5q7plprWTe5d6JK1X3wi+Y3Fd44X7mxrD
	pe/L7cTBOzLjSbMpinRZy55U0x91csHmX9j6CDr63sTJ8oe8Sxm+Zs2syAov3wRurX17O9
	TstY9BT1QaMqFIfckGL2aC78bNe3naTWKVjOnN4K/b+Y6aw9XnhwEJBZcX8/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1755795196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlakafP8cKS6Ll5TiyPHHDp3dHuCgDtGkj3loayRdEY=;
	b=Tq03sU/uP6jaQ7qx4TYRJvHoXPH42lodd76b8CJnLwvwSwpQRDxngptzIqxP1ileYjPXuP
	X1goGbGp0ZHPyRY5bHLNvYNCMHJYPG69yPLwfRa+sk8StHsJwscbEFLnuHt2OiphWwk7rg
	MltFZS8LH0X+S8Ag2yhVy6dVPYmau4QzHG6EQ40lrJmB4hl0zWs/6vO402IoGZul7EoevK
	ATWiftNESQeu46ar28eSvy4JhJSl6oXXWz9vlc1GfkAsQ2DJgG6AnPQ+8CLCefJ30o7C//
	MXF9BUwQ4t2sHLzVNfgxxN/xzp67i5D9ADSoYL13pe6qkv9DveRr912hCA9SIQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1755795196; a=rsa-sha256;
	cv=none;
	b=j0e3fAwEitCPmEVLDZh2tsI+0BkFVhPa0ThcfSaK66NApSsPcWR0iHs3uCiD0j2+Nq/ZSs
	BzfAQnqEtjD3JqApvSzx1v8/ofKa5zFfn10y8U+XlL5qN5u0/59dQpAACVfS12MMY64lBs
	nQGWgA6jaiHwpJ9PvJi9EkfE9bhS+kpy20W86jjwlOG5PORNhIlwqaWhNQXtoDWDORr6sk
	v1Kv/PYufZOpogFFoPHn7Ged4v8Q9yiWOpxdHX1BsN7pmCjmRXrWPn/CD9yIjRZAUjlkJt
	DUJBXRaCkyXdaRt68IvKAa4VQL3O5eD6co/6clgQPnkRkCQ1O4/guhA+F71XXw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 655F1634C94;
	Thu, 21 Aug 2025 19:51:50 +0300 (EEST)
Date: Thu, 21 Aug 2025 16:51:50 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Martin Kepplinger-Novakovic <martink@posteo.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>,
	Maud Spierings <maudspierings@gocontroll.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: mc: Fix MUST_CONNECT handling for pads with
 no links
Message-ID: <aKdOpmqnPS4RCVrT@valkosipuli.retiisi.eu>
References: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
 <20250820140021.8026-2-laurent.pinchart@ideasonboard.com>
 <8bd925340d6297bcae69f4a9b5e098e79830b528.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bd925340d6297bcae69f4a9b5e098e79830b528.camel@posteo.de>

Hi Martin,

On Wed, Aug 20, 2025 at 02:48:39PM +0000, Martin Kepplinger-Novakovic wrote:
> Am Mittwoch, dem 20.08.2025 um 17:00 +0300 schrieb Laurent Pinchart:
> > Commit b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always
> > require an enabled link") expanded the meaning of the MUST_CONNECT
> > flag
> > to require an enabled link in all cases. To do so, the link
> > exploration
> > code was expanded to cover unconnected pads, in order to reject those
> > that have the MUST_CONNECT flag set. The implementation was however
> > incorrect, ignoring unconnected pads instead of ignoring connected
> > pads.
> > Fix it.
> > 
> > Reported-by: Martin Kepplinger-Novaković <martink@posteo.de>
> > Closes:
> > https://lore.kernel.org/linux-media/20250205172957.182362-1-martink@posteo.de
> > Reported-by: Maud Spierings <maudspierings@gocontroll.com>
> > Closes:
> > https://lore.kernel.org/linux-media/20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com
> > Fixes: b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always
> > require an enabled link")
> > Cc: stable@vger.kernel.org # 6.1
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-
> > entity.c
> > index 04d69f042a0e..928613d60e8f 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -696,7 +696,7 @@ static int
> > media_pipeline_explore_next_link(struct media_pipeline *pipe,
> >                  * (already discovered through iterating over links)
> > and pads
> >                  * not internally connected.
> >                  */
> > -               if (origin == local || !local->num_links ||
> > +               if (origin == local || local->num_links ||
> >                     !media_entity_has_pad_interdep(origin->entity,
> > origin->index,
> >                                                    local->index))
> >                         continue;
> 
> hi Laurent,
> 
> Indeed this fixes the crash I see without checking
> media_pad_remote_pad_first()'s return value.
> 
> Reported-and-tested-by: Martin Kepplinger-Novaković <martink@posteo.de>

There's already your Reported-by:; I'll replace this by Tested-by: which is
preferred in any case. Same for the Maud's tag.

-- 
Regards,

Sakari Ailus

