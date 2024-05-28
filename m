Return-Path: <linux-media+bounces-12071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 625568D1739
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 11:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FA7F1C21F84
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 09:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A137715443A;
	Tue, 28 May 2024 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="GasGNw9k"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCE6E614;
	Tue, 28 May 2024 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716888317; cv=pass; b=RITR7svzLTlDevQRbOJWOfgT+Cyqbg4NqjIqUSFcZTS+sQ8fIGI7JZINBLwnv12YuzViSnI2VKsghNHLmTQSoB89BZxwmGWa9pST0J59rE51w/QHqqq0lTco/CAvfVoCZ3ZhrQMQycvMMby8mUhemJ1KxlUYG52Z8BSa+wlPgF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716888317; c=relaxed/simple;
	bh=Yxjxyi+/wzR+kE++P52jS3GR5UN/GbK8t5w5grkYLTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PemHkeyybfp1XoFqtbp3h5LOl1mJQ8g4qLBX6rcGItL+a9rA0BwmyxseAbdMPADgH5vB6QdRfpPz4m60peABHXNJn6/HxalQKNL72CBTEkZqCh2qCjCeOJr5qa31lmIXQyQT84eieTXmdXuNl2j0zKraOAAARcXq3PQCG40Nixg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=GasGNw9k; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VpRtv3CvhzyS6;
	Tue, 28 May 2024 12:25:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716888311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9pxRuM1nEksI3+6016Wll7s/hQaWTfJSV71auwLa+Ms=;
	b=GasGNw9kT1rAQDfbUaePGiBF3j7DIKVsne+6ouEFnjXOdIjctjRBLQfk5uZFRIqEsiRrVB
	fzApkcn6DN6o8h4IlyCQul2cVZivnnn8aNu3HZYfWjvZNmauc10YbdFWxi0B5KBhOAz3gu
	UcOf01z93Nh5fIbuIb1pDC02LVqGf8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716888311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9pxRuM1nEksI3+6016Wll7s/hQaWTfJSV71auwLa+Ms=;
	b=qoEvj1liM40zoNr6hvLHxrdv/+T+0QLPjarI7Bx9TyzfxWkBz6I5RuW3rzVeo2kwvy0bc6
	D4NotM29GF5pnyq+hXDhYxkY5cu1p7jRvc+TTdfhEA/oSONjSF/JjAv3kif0SGB6slPPQi
	E61GhtZIoXxOrmVt7X5xVDJnSpgJmlQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716888311; a=rsa-sha256; cv=none;
	b=CQjSvhVcoszbZywAjuxQLpGXVpZQiMOC08mq0jNN6NwTXp6+Jt+/MoKDsarnOKd0faRMrX
	w+Nj2oMQ0cuVNM7arQOun4I9K05JvSA9Gswdwpqk2L5xD5VsnuEexFNYv0/cUqbx8UDpj0
	GEKd0m20yBdkQjuSPdmgeA3Xk8+WGXI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5D41A634C93;
	Tue, 28 May 2024 12:22:10 +0300 (EEST)
Date: Tue, 28 May 2024 09:22:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
Message-ID: <ZlWiQTfag5yTA4YM@valkosipuli.retiisi.eu>
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
 <8afe1888-5886-45fc-b576-98db3d392d37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8afe1888-5886-45fc-b576-98db3d392d37@linaro.org>

Hi Krzysztof,

On Mon, May 27, 2024 at 09:04:38PM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2024 18:29, Sylvain Petinot wrote:
> > Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
> > sensors. Update MAINTAINERS file.
> > 
> > Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
> 
> 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ef6be9d95143..554e6861425b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20885,6 +20885,15 @@ S:	Maintained
> >  F:	Documentation/hwmon/stpddc60.rst
> >  F:	drivers/hwmon/pmbus/stpddc60.c
> >  
> > +ST VD56G3 DRIVER

I might add this is a sensor, i.e. "ST VD653G IMAGE SENSOR DRIVER".

> > +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://linuxtv.org/media_tree.git
> 
> This is a friendly reminder during the review process.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.

The above MAINTAINERS entry is roughly in line with what else we have for
the Media tree. I'm in favour of listing the people who would look after
the driver, not just those who merge the patches (or even send PRs to
Linus).

In other words, I think the above entry is fine as-is.

Sylvain: could you also add the file under "V4L2 CAMERA SENSOR DRIVERS"
that lists myself as the maintainer?

Thanks.

-- 
Kind regards,

Sakari Ailus

