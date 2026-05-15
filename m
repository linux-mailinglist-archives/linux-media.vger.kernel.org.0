Return-Path: <linux-media+bounces-61654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BcIGhf6BmoKqQIAu9opvQ
	(envelope-from <linux-media+bounces-61654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:48:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58554DAC6
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BFB831EDE52
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA92B3CF952;
	Fri, 15 May 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="gP2r67rt"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59B03F1647;
	Fri, 15 May 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840880; cv=pass; b=qngc3F+hxQzADvdAYKlJmIpJ59fGIkV4bFPJlzItSz5+zKrOdtXk357QVPqIQkLd7/IY+Dxpez8XgRswsP6YuNwjTT2j+jN6o8/VwUk8LqrgdmYfTq52TJKQpTKFkznj9BCaG17o86QHh3QGbfavIk24KalO1OMUsbL35eaZy9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840880; c=relaxed/simple;
	bh=Zmvtf+ndIhWbwpMvh1AWMsW62hmvFOPCpcG+EQ5f1bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxTl5n14+zGX+reQa2FlGoVIxNwxl0ASvZ0c1vePrXYfPllhLvdywUF+WmZBfbSblO3ttNoolbgRAlLVMheagysAmb1NZHNOtdxcc9SafgUS85qYTlk4Cz2+jFK+lfOpiLEsdGPC28Ek+SOyeOIz+3d3I2VCqjEifLqeTAmcJZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=gP2r67rt; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4gH3LD2lwyz49Q0t;
	Fri, 15 May 2026 13:27:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1778840868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sJl+PyuezvhnTK+av3c/B+WvUp/rISj//64bQ8JdU3c=;
	b=gP2r67rtkc3QbVZjGxLUWNz7tiRZaENITk+u9QHpeloaqGczGWJXvSTLk38jF9gU6Yw2Qv
	dtRYowvCus3su6yN0uzMdyzXFT3D30vzk//hpognMD3wZSm+Xm9s0bslHHGGnl61uQKRvo
	ubL8EeOfJu/m2a+cigcnOlfmhOPdQhLMka4kpX2R+DSSS0GBjEUmTVUBYHtW7Scx0nonuZ
	LAitZb31TOxZQ53LGWLKpr4ApzsFFNn7pocZdKZmwR3bvRCYcR9CzOd0ima1a3sa6shlE2
	KwtMkUX9Js8jtTKjah+ocT9SIKO7VdF0JtpCO435Eewm1K75nRP180mP28nrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1778840868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sJl+PyuezvhnTK+av3c/B+WvUp/rISj//64bQ8JdU3c=;
	b=qB0fqcDjc4JHV+zVbQ+3KAsJKdxqaN5n9r0eqPRdNgp1tVVT/VN8xrYq1JYIUC3LMpQ8fg
	RJziDjsdvCGuWNRMl2yCSGsmI9admrd7o2sWWHUgUVb61ieouQLkbn6TkP9QhuDlbo3vXt
	NN5n6on0/k/Wqv+RPiWU6NhIlwXHNEi2nhw3yO4ypRu9m8mJPbLsZSDf4LODASHuDQ55Xk
	zdRRiTLZ211smyTZsi8rV9DPz4BUzvpDNq3R8mx+vWF1JS0kIx+U357i2Q14nmN8y97Bw3
	vZI/kttttPo4SgaUAoNaPx5fILg8Wo4RJRd4wves9kjPl9+pguOfL2OA5iT5Gg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1778840868;
	b=t9b4pUSGG7F3/ubRtDXfHkw4d5Fe8/gyy6CuTuJ090mcPAmGbJmGS/J7HdRL/7dVTZfSQU
	gY5gc+QbnwIHTjeRkPwwx97bFGKvvdHMrTEA9wqpck7kvTHZ15lQlu+M/XDUaQfchuqYHG
	paTq7CEkm5Dj5z9ePSqmGt/fAD40Wouy3h/JnZA7TB6bXYzzw8faauzpY0sJDVPPIxdOkD
	zu3ajLx+WV75mk1Z6KWAiomDHFWkU5bvqTj6awGF225w4nIXWPRNfLDFJ2+PPdlC7tHnAP
	Rp581WPmQKJmTO7WLsIxV5m7N12uQXzkmhmdyQvn40xGfDeMdYLk/r6aRs0IkA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 18CDC634C4E;
	Fri, 15 May 2026 13:27:48 +0300 (EEST)
Date: Fri, 15 May 2026 13:27:47 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
	nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/15] media: microchip-isc: fixes and enhancements
Message-ID: <agb1I1l0CvKQZp-U@valkosipuli.retiisi.eu>
References: <20260512154339.210444-1-balakrishnan.s@microchip.com>
 <20260513071742.97263-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513071742.97263-1-balakrishnan.s@microchip.com>
X-Rspamd-Queue-Id: BF58554DAC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61654-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

Hi Balakhrisnan,

On Wed, May 13, 2026 at 12:47:27PM +0530, Balakrishnan Sambath wrote:
> Bug fixes and feature additions for the Microchip ISC/XISC driver.

Please avoid using git send-email --in-reply-to argument when posting new
versions. You could add a reference to the old series using the Message-ID:
header though.

-- 
Regards,

Sakari Ailus

