Return-Path: <linux-media+bounces-54668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHKUEOS/qWnNDQEAu9opvQ
	(envelope-from <linux-media+bounces-54668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 18:39:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 73736216605
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 18:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C749302B447
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 17:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC60D3E3DBE;
	Thu,  5 Mar 2026 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="vNv6Wiw4"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0833137C90C;
	Thu,  5 Mar 2026 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731912; cv=pass; b=DnlBHV4TuQWSzdfGcN6uMilYE6uPFxpiY2/XoLIsYdgvMy8wVmG3P9FmoN+hLYiRKupNDJ/LgMCjSbeL77gpamqRVfLSSa8vH74zgqHiYUKzUfibpGp4PcAomwSmXKvPJnHtOfHGYl4lMa4lxpp5cgWDJnm76KzzRRLAkzJ3C+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731912; c=relaxed/simple;
	bh=s0EL37c/sYAI7xLRxtgwb9yg+DOGpx71GcVMR6WcoLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eczAi7GBFm0dpLM3plcfY1SwqhMVusF4+EAyS9bv0NVfGGh1WIxblNo7oYm8g5jEjJbZyrwj9PVHTvpF7AK/ycygFXJlQBqbIjRx3SiNgDiea3L3lRgBwWWFd/xSZ7Nw3UdL4WHjcNrV3AGvy3xGxN3Fxto019W8OSqwXaUH9Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=vNv6Wiw4; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fRc626652zyVM;
	Thu, 05 Mar 2026 19:31:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1772731900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
	b=vNv6Wiw4Xvfi089Fq9+E6JNNhi2Y3WR1Jzfwss0xjhX/7G2yJZZYQHoZz9YgAgFIOayfET
	lNoOP5MnaphYFWQVqURtju+aF1rSq7Pr64avVr2C/id7Mw9Cf/rJCyEX/ibXggi5vRM6yq
	uZex9HmZB9dXwtCHOSDz6UpugIwZm4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1772731900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
	b=GkNFEbEgaSmMs7tpq9OaKpiNvpUEkhiAShomlplPZ9KgCQoUfqsJergpyp+3V2Rt1rIlx6
	o1BtqZHo+miimEoMzUbXqJ77um/IcWBWhXf1aef5gLySzMAG7o4ihICa+tWtwaRaN6O+DL
	D7u+6eJbesIl20NAFz/mkv4j2yBUQx4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1772731900;
	b=Qpjs3xn3xCz6V2Mh2vyntKIo+H83uUw7anamRayaNabMsetmEyZPDGwaloVk7828MPwgux
	kwsOEzJLotnKGG/L6qRItFrqBFyZwucxeQPzK+MLPEq4xE06GAq4IpE0EKQ1nYIZ7d5yfz
	R5BwA2a9kpFeYpfBUsnff7wbQ50XMGA=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 60946634C50;
	Thu, 05 Mar 2026 19:31:34 +0200 (EET)
Date: Thu, 5 Mar 2026 19:31:34 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 00/12] media: stm32: dcmi: stability & performance
 enhancements
Message-ID: <aam99usPtkwo9GbJ@valkosipuli.retiisi.eu>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
X-Rspamd-Queue-Id: 73736216605
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54668-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,gmail.com,linaro.org,amd.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[iki.fi:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,valkosipuli.retiisi.eu:mid,iki.fi:dkim]
X-Rspamd-Action: no action

Hi Alain,

On Tue, Jan 06, 2026 at 12:34:28PM +0100, Alain Volmat wrote:
> This series improve stability of the capture by fixing the
> handling of the overrun which was leading to captured
> frame corruption.
> Locking within the driver is also simplified and the way
> DMA is handled is reworked allowing to avoid having a
> specific handling for the JPEG data.
> 
> Performances of capture can now be increased via the usage
> of a DMA->MDMA chaining which allows for capture of higher
> resolution / framerate.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

I've picked the 10 first patches to my tree, I presume the rest are merged
via another tree?

Please cc me on the next time. Thanks.

-- 
Kind regards,

Sakari Ailus

