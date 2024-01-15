Return-Path: <linux-media+bounces-3693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4482D7DA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 11:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 785CB1C218BD
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 10:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13561E869;
	Mon, 15 Jan 2024 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="iDfcUajt"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5FD2C68A
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TD8CS0Fd5zySZ;
	Mon, 15 Jan 2024 12:54:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1705316052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84jTLptQnsfB8VGp0tMs8erknWK1z+3UcsR6MH30K8Q=;
	b=iDfcUajtynJL5kACLe3omIqaxbmZWt3ZEmKSGZT+ojrCxp/6ZAW3+W/TJsZesIoDK29I8c
	IRBH3ya5fiwZ6ax0cKoXImcWnacMIEU4c9ZELqELcu9haA/yhlAQYnrb0gqpnt39zD8t4J
	Cd1K927eUM6i42dsW6JKeGPnfd+Cvm8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1705316052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84jTLptQnsfB8VGp0tMs8erknWK1z+3UcsR6MH30K8Q=;
	b=vQodX/xqJP4cDgVCYXdlRE6JhsQPZaPozhPewaJiDL6ufyz0/ZFSVYsnkTSfzbwbw46C9V
	kG+p/sLMEy6OpPavY52CwKYnLulqD9SUFlXiK3K6f3oXgZ1vQNDIH760eTWQx482+L8qi0
	X0RUHIPggaOohu7wDPRwuiOS0YKuDP0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1705316052; a=rsa-sha256; cv=none;
	b=EEOk1gpbYWs1fWgCVyZHypM7PIyoMT8yLihxVWGgZ0x7gXnu2NC4DE0D+4JOUmSpLGXrg+
	aW3Phin2OAduomqg/Y8KqczR2z/rM8oaiSWC3W0HTaivlLg/uHDypSK8bmkTBJDodyCgEZ
	XgaHK+h01A9/n5M9rAjMGuQJfDcujP4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 95055634C93;
	Mon, 15 Jan 2024 12:54:11 +0200 (EET)
Date: Mon, 15 Jan 2024 10:54:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: Re: [PATCH 6/7] media: mc: Expand MUST_CONNECT flag to always
 require an enabled link
Message-ID: <ZaUO0ygEoZ8EVMEB@valkosipuli.retiisi.eu>
References: <20240115103029.28055-1-laurent.pinchart@ideasonboard.com>
 <20240115103029.28055-7-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115103029.28055-7-laurent.pinchart@ideasonboard.com>

Hi Laurent,

A small addtional comment...

On Mon, Jan 15, 2024 at 12:30:28PM +0200, Laurent Pinchart wrote:
> +       -  If this flag, then at least one link connected to the pad must be
> +          enabled for the pad to be able to stream. There could be temporary

How about, instead, to make the meaning clearer:

	  -  If this flag is set, then for this pad to be able to stream,
	     it must be connected by at least one enabled link.

> +          reasons (e.g. device configuration dependent) for the pad to need
> +          enabled links even when this flag isn't set; the absence of the flag
> +          doesn't imply there is none.

-- 
Regards,

Sakari Ailus

