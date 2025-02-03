Return-Path: <linux-media+bounces-25559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E546A257CF
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA343A3842
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 11:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD92202C2F;
	Mon,  3 Feb 2025 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ciI8hFuJ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2994A200BA9
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581101; cv=pass; b=lvej2cVJ0L9VmLy4taA/BZ+qZ1sal6g4Ovs8F13tHWiq+qiP9Vi6G+rtHW6qt97PAVRAW06gRmun49zcSmxbKMaIONAcRl+sPbR1ybCdHPAuByJtIH/JWVKyF1MEKSOZGDtwV5symjujo+mX9MfWilE//yUYc8MqzJ0Gso+glag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581101; c=relaxed/simple;
	bh=oDmNZCf5Cpghnzn5NqO3q405FJWkjpmVRJQ55t/eQ+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnZteK3g4dYQCHVT0iTMIWfP454abKsAriAY/TGkPNLRhIcWV+Qeh5TFqWA7uZBNed2KrMSYxYFPCFmNSC/c3bEGB6zI/z97sD2c0nyQdthOMAqe8Ej3r/ABhA1M/qMNvTwEj+HFLhsf222b6DDnup4Oan4fOOZbGedSMyRyeiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=ciI8hFuJ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4YmkMf53kFz49QC2;
	Mon,  3 Feb 2025 13:11:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1738581086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UhRsXrZAACbNbMRV43iRl/LTcnxDkfcIe+nF/rrsYY4=;
	b=ciI8hFuJwq3XQdXkU2F3hEOBnsjmZYdZS/ki/KFnhFzc49kTbFfY64Py/CVMrDOy6SaTiD
	l5L+aYOIQs8krH8IHFe1O8APDvbmI9XWtgLfwlFV+9fOFuKz6Mre92aSaJWhkZrSazEDs+
	C9kKxQV2BlUKQXlWfbFzWJ8W2QT3fPzG4J/vCSB0MxgYm4/lsqVy3oUp/lXR/AdO1nOYD7
	BPNAbQ091BpzUFGTIZzbMBRfva46lHfq7HeL1oX6xi8QRE7wNYP81h6r39plC0lS+eIii8
	vRdDrKNOBi53hVlfr+Ev/B1qFs60En/Yrm5Z3Gb3r79IcNvlty8dGDEHZr4sOw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1738581086; a=rsa-sha256;
	cv=none;
	b=QUUo15277Guwm87dgRuBQNs04zh4Q0hQyyR8FQt7TU5/FSaJ5o9sefc7TexJOjiol1qK71
	iVK0LPG/ptW3i09yNPrc615JsQcj1zKwym6UjVN+ZMamW+uoJP1vpmX3w/+iA3ixKahtZu
	gc9ac0DF2g+kof+5E12Ct9xp8dFnEH0UI//y3kzF/Vdxiaib+UXViyWdGWCJp5un5CzXoZ
	vUAmS7QX8Sb3txnIpJy7DkIA30LwLRKlF0u/OLYGHmqIhn5f3UmODiW7HQxgHb8onI40w2
	e3NM3rSJjfsdwwObQaUTVEk7Yce97Y4PYaw/Jhm56P94BIsP1Ic2n8X8oWZDmA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1738581086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UhRsXrZAACbNbMRV43iRl/LTcnxDkfcIe+nF/rrsYY4=;
	b=Kb8teqZ53mqIPLay/TISWpyweiZahNaRj0/J2xQKmYL5dDt4S+II9r6cbtCYkkwYjQtknU
	3C5dqj8PIj3Zlu/JkiJWPaBQJdynqFYmFkMHArwvpVdB/D9O4/3RDuArkEDsLJkTMIuQcL
	DZ28N9hpWji/MAcwAeVeA1BKfO0L0rN5OCJjDgmzqU+bwqlrPseD13Km9OXzsKx7q63m/2
	Y/OIbokZL8ldZxFym4HVY+lIpuKQJtyz1beNi5UPV96Lj3XRLZjKnZO3EQwalhqlpNiv9u
	UHlGdd6qVkaL2vLh2D0M+aR48tlcaGkJ00L98vx89lOVK8MR3zPlPefbOH8pfA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 471E2634C93;
	Mon,  3 Feb 2025 13:11:26 +0200 (EET)
Date: Mon, 3 Feb 2025 11:11:26 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add 2nd media maintainer, fix patchwork link
Message-ID: <Z6CkXv5-gUfHzGcU@valkosipuli.retiisi.eu>
References: <e7a4c286-13ae-4025-b765-ee7055476cf1@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7a4c286-13ae-4025-b765-ee7055476cf1@xs4all.nl>

On Wed, Nov 27, 2024 at 12:55:59PM +0100, Hans Verkuil wrote:
> Add Hans Verkuil as second media subsystem maintainer.
> 
> Fix the patchwork link: we use the patchwork instance at linuxtv.org.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

