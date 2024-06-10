Return-Path: <linux-media+bounces-12804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8081901B8F
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 09:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41E6AB2295C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 07:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280B51CFBE;
	Mon, 10 Jun 2024 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="C3hElL3B"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F81B25634
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718003318; cv=pass; b=t3x4VibJwkxqR9aCaBqSyyiKru+HNUN69l2SMF5KD6+Pl7NxOLdRR4PnzI2KFL+lpz3oalPNQvtAcpQ1vx+beGK0Danltfmd7AJHTGjrWSlJCgDQJLvcxAtMD/k82IzrB4ABzRtMcVlFbYlcY7QlkuEw8CSsKm6N+zvKkXvXASI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718003318; c=relaxed/simple;
	bh=l81g3y01aZpbgIaEKk44dYu//Glt1kxHQlPHAFa19Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svuJyxUl5ztdMxnCTDpqIEJzENNns2RcPSty/eHzvpbayF7IHDSj/bfsnmyLgM1V27vXYY61wieHD/gkdL4+BOBiRJkZ403pbJjime+EBTAWn4ULO0YRC/Yuwqjxs+Wwy4Q00gTULJ0bN0SZSRwhWdo6AGiqxZVUbcTUMsqP20k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=C3hElL3B; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VyNF63XSYzyPV;
	Mon, 10 Jun 2024 10:08:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1718003306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCVoQglsbCgbYii1rXUxKMd86u/aNBJJQuiG3YaZc64=;
	b=C3hElL3BIyZsFCO/tgzq9rniu+e2zMe7tJTzcl3bBQoI1RjrgWoYVy528/bMWtp1uVjPKM
	NcCnR/y5PGvRkXvYd6TfeRP7R95JSwvAGSfm1W2eky0XMk+O79n+Fb1ABd58y0lBg2sUQX
	ugN6uQSrXIVHPIboX0jXFRqvJDOcRbk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1718003306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCVoQglsbCgbYii1rXUxKMd86u/aNBJJQuiG3YaZc64=;
	b=ItrjA/+w5TxpseeXarogJsRty0pq5ruODOP1spau2WHxcfNLetgdsGNl15bQyJgoHMHbZe
	JOvdlp/uxQ0n7EKaj7hLJLIR7SGP1poAqDODDgTzGwXX4efDBoOZq5wFPRxTOgcX2YMqXK
	PqbEsKKd7Ff9BamBtLXkVC6AiHgfD3E=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1718003306; a=rsa-sha256; cv=none;
	b=JCW2jQesI6lPq/imQXfRkE5AQr73dQzknfxuenMnKBtH8U1YZdKjQobpBWLrOPH8TP9wZ9
	GR3MTAegg5bYem4S5pTwLzfpkJbXrIhgWbhYQvMKlf6wcE+3Ouip8ilBuaQnZTZhr5E+OH
	MQilSWMekaDhztK2VBCN/m3K8E50qA4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5C773634C93;
	Mon, 10 Jun 2024 10:08:24 +0300 (EEST)
Date: Mon, 10 Jun 2024 07:08:24 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [v4l-utils] [PATCH v1 0/3] media-ctl: Add support for subdev TRY
 state
Message-ID: <ZmamaIVmg6qoGbmF@valkosipuli.retiisi.eu>
References: <20240610012238.30462-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610012238.30462-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Mon, Jun 10, 2024 at 04:22:35AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series extends media-ctl to support subdev TRY states.
> Doing so allows retrieving the default state of subdevs, or trying
> configurations.
> 
> The approach is quite straightforward: patch 1/3 replaces the hardcoded
> ACTIVE state in libv4l2subdev with a 'which' argument, patch 2/3 does
> the same for the internal functions of media-ctl, and patch 3/3 adds a
> -W/--which argument to media-ctl. When the argument is not set, the
> ACTIVE state is selected, preserving the existing behaviour.

Thanks! For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

