Return-Path: <linux-media+bounces-26944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09654A43FA5
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9733B189AB53
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AE32686AF;
	Tue, 25 Feb 2025 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="cHtd0TlZ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645F23A9;
	Tue, 25 Feb 2025 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740487589; cv=pass; b=JDN8dB0sQ1DdJtbfRgV2zsUtNao4XvSqcVenspvpaNGWQjZXQLAJropnngUzfggpnHDN05TuouFKQKtjczQSC99WnhcRDJdx2bZHyzAyEV0WtjKIeFNKBAtt8mYE+7OzQkaxQhf492n1MqCPa0X8U5EmOdM1Exd0LapBI4O8HiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740487589; c=relaxed/simple;
	bh=mRn0urmcylqBrShUfe5g+U6oWDrD9p1pgaRXLAAiGMA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=s1kAFccaJMWQKaFc77uKIR1bCI4PZgk+lRhXNsBtVSsBZ7kCE/9lCHV3wMIxJCHI6QY41y55r8aRaFC4lNEny6QbzSLtsyhXuCMl1ca51tsNck5eufBi4iLzHl35Y7XjeMBKa+nENbxrjyVz48+nOMVbyAqLYQ4tbNjHfagoWNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=cHtd0TlZ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740487566; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Kmp+aW4phAtAnXQshyMG1VGv9VxQ3kDl8jRvEdv2NUJz7PkLTy6xsztn8DyLvcN58tNaCtSVQnxP39h7zRt9MjTma+wZD0HXvB5Cul5sfxL+qqm5IWabtjJ2v9v4J5tulEMzxTaOurIIwDI3P/RGdfXTyqn6mEqaoAWTv1Kiz+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740487566; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=A5TQD7QobQ3Dhbbj5VbcHbkmPAOZf39Q9xSHqjBs79I=; 
	b=cZAowJ0KPDYQ8WnBxNkujmaQ9mAmLjm/YJ4B65Rn8jQEkO2nvxtSHbUFz+pDS6GFhfyi5KPiwK0QB0UEOEW/3BVBOGMW2RVD2rlOpFpEOC303/4CvxSMdMifbzdPe7kMp5eG2KSGniA1/gifRVi4U2j56o5HBkOyGEP7OpEJfzs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740487566;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=A5TQD7QobQ3Dhbbj5VbcHbkmPAOZf39Q9xSHqjBs79I=;
	b=cHtd0TlZ9uwKJuZBaiquiOgaD7ugIirgpBCMdEsQudHqb70lMvRppKHPL+CZ/2vw
	ZZkMKKoQHc7wmSpHmGhppNDRcjLToqdiJ606yf+IzRj/wn/fSYo/6RDpaCrERuAg308
	z2nD37oahp2gu8SmyW9zPbq5CQh4qKSJ2PymxXn8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1740487564371275.2248105795393; Tue, 25 Feb 2025 04:46:04 -0800 (PST)
Date: Tue, 25 Feb 2025 13:46:04 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "Sebastian Fricke" <sebastian.fricke@collabora.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Hans Verkuil" <hverkuil@xs4all.nl>,
	"Boris Brezillon" <boris.brezillon@collabora.com>,
	"linux-media" <linux-media@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-rockchip" <linux-rockchip@lists.infradead.org>,
	"linux-staging" <linux-staging@lists.linux.dev>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Alex Bee" <knaerzche@gmail.com>,
	"Nicolas Dufresne" <nicolas.dufresne@collabora.com>,
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>,
	"Detlev Casanova" <detlev.casanova@collabora.com>,
	"Dan Carpenter" <dan.carpenter@linaro.org>,
	"Jonas Karlman" <jonas@kwiboo.se>
Message-ID: <1953d249c3c.d1d6678f34821.5333341344528638254@collabora.com>
In-Reply-To: <20250225124008.195405-1-sebastian.fricke@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com> <20250225124008.195405-1-sebastian.fricke@collabora.com>
Subject: Re: [PATCH] fixup! media: v4l2-common: Add helpers to calculate
 bytesperline and sizeimage
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hey,

sorry about missing this in the patch series, if you don't like the fixup path, then I can send a new patch series as well.
I just thought the change was minor enough and addressed the final comments.

Regards,
Sebastian

 ---- On Tue, 25 Feb 2025 13:40:08 +0100  Sebastian Fricke <sebastian.fricke@collabora.com> wrote --- 
 > ---
 >  drivers/media/v4l2-core/v4l2-common.c | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)
 > 
 > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
 > index 07a999f75755..aa86b8c6aa75 100644
 > --- a/drivers/media/v4l2-core/v4l2-common.c
 > +++ b/drivers/media/v4l2-core/v4l2-common.c
 > @@ -360,7 +360,7 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
 >  }
 >  
 >  static inline unsigned int v4l2_format_plane_stride(const struct v4l2_format_info *info, int plane,
 > -                           unsigned int width)
 > +                            unsigned int width)
 >  {
 >      unsigned int hdiv = plane ? info->hdiv : 1;
 >      unsigned int aligned_width =
 > -- 
 > 2.25.1
 > 
 > 


