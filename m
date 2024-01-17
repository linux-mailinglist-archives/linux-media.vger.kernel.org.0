Return-Path: <linux-media+bounces-3792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D479830489
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 12:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E7A2288520
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 11:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5FE1DFCB;
	Wed, 17 Jan 2024 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="n3TDzWXm"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D685CC8DE
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705491001; cv=pass; b=h6iD5ZgO4R9ttn9WXONWKu0o1/U1UbEh/CSknkAhVM0ccDB0YtN3fHSQGdZIsuycUxHfg6rnn2I0N8iaryiI5qo9h4qmgSsw5HXgdiEn1jBGAY8wD20exVtt93pPlw/s1S0KebVoQYJ9HLp8rVpQYMpoOmvZEANImt0Xe/hbYII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705491001; c=relaxed/simple;
	bh=V9VrkgSsNfvWiBHGiLQxtRX5xxkseSbRrTmdnzNGfW8=;
	h=Received:DKIM-Signature:ARC-Message-Signature:
	 ARC-Authentication-Results:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=M26de2JRieZD8TGvwy5aLPRA9et0fe6PMbyEGdiBl3h4SMqhPLOS9mtKkpvsDGEeumxTnR2AdRXTiw+bU0KCoDk0tTErzsPkhnbHV8b4moB/N3PednE/ViUO2GXeUiNmeeG2kidgFqpCq4fb9c01YZ9Phktoi/JWgnj2T1kYXVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=n3TDzWXm; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TFNvn3kJKzyVf;
	Wed, 17 Jan 2024 13:29:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1705490997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15HDGkf9inzOTvn+d652kUAa1U3ukfyaBp0W1k1NQDY=;
	b=n3TDzWXmHogR5LYDLtRO6RI35oJ4PKfUVxrQMLTONfQYuut7kKS83FaGDbk8lBh6OiIOgs
	I6RvA10RU9U3OtumqmgosbgBsU/ONf9L63+zN58uj+pmGxKxJhhG+ZiBH2HpzU7jOn79qD
	h1yFs/4QWAKbpIp1o1H5zm0NEBVQTg0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1705490997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15HDGkf9inzOTvn+d652kUAa1U3ukfyaBp0W1k1NQDY=;
	b=IB06xW/t8/PJASQGs1sGNwyrBBuB8UmRPi4OcZ7uRCq0ER7gt88cXjl/wZV16g6eH1oPaH
	clwXZJDuVSpkKosuEokyI0VH9FwUIS1f23hDRC1PaarJJZtyEmw8y08OCSfqxqtuYxLGQv
	Qzy2AcpfLUw1oY93xmDzq9DNtL9+T8I=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1705490997; a=rsa-sha256; cv=none;
	b=FIrjay+0/dEEJLahKGJaGTtIAhboNNx50EXtmC7WyTZfNFRtATxtxv8U7VmruYtFFTkvji
	GWOYarS9H7rqgYrYvAP9ENHTUHYARU/1JF3Tba6XEQ/mf9lQfNn1V+q/OQqPzQ8qa6sNk/
	ACY0C2KsZ3+89BSTW8sOwvOwF3KoRz0=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2D53E634C93;
	Wed, 17 Jan 2024 13:29:57 +0200 (EET)
Date: Wed, 17 Jan 2024 11:29:57 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v3 1/1] media: tc358743: register v4l2 async device only
 after successful setup
Message-ID: <Zae6NUouoPS7b1lR@valkosipuli.retiisi.eu>
References: <20240110090111.458115-1-alexander.stein@ew.tq-group.com>
 <Zae5w_JbrLXikmTo@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zae5w_JbrLXikmTo@valkosipuli.retiisi.eu>

On Wed, Jan 17, 2024 at 11:28:03AM +0000, Sakari Ailus wrote:
> Hi Alexander,
> 
> On Wed, Jan 10, 2024 at 10:01:11AM +0100, Alexander Stein wrote:
> > Ensure the device has been setup correctly before registering the v4l2
> > async device, thus allowing userspace to access.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Reviewed-by: Robert Foss <rfoss@kernel.org>
> 
> This should be backported to the stable trees. I'll add Cc: stable.
> 
> The patch seems to co-incidentally fix error handling, too. :-)

I'll also add:

Fixes: 4c5211a10039 ("[media] tc358743: register v4l2 asynchronous subdevice")

-- 
Sakari Ailus

