Return-Path: <linux-media+bounces-59245-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNYAMzXd52noBwIAu9opvQ
	(envelope-from <linux-media+bounces-59245-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:25:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF743F6D6
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9191A3031CE2
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7C03DCD8D;
	Tue, 21 Apr 2026 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ZyZzdrsX"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23034DCFF;
	Tue, 21 Apr 2026 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802855; cv=pass; b=T2L873ogtIzExZHS3PgajqdY0IUFr1LrUQbziyHke4JbbLT4RDY0bcZTT8WDv5aGCSdfF6zpTLMeqrjXjPprf/zlJc0LHxZGxa67okGqV3a6SJRF4lRu2CVzPYIfhKZHYxSTSpbgI+kLtd9q47ADYV9a4+qUWJ8OiPTgfmlZKtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802855; c=relaxed/simple;
	bh=54Ki2xasZTiDPxhz1XEHpkDHT5KJs/D+CQ0eZRSfmis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZeQJSkC8UAKVOX8CRn/h3QvbgywSRzyxZrKbQLe+tAYsItI0kjYosZL5Q3mcPhaKUNN2U24xZKQjdAOFEZQsi2ud2pSV3Eh+DRq+tjDpbnBKr5bFzr021a2IUhdn0L0uPY9zEhbv2snp/oRuJ2XRVBpUv08LcQDlXTh+9QEXIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=ZyZzdrsX; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4g0YdW1plDz49PsT;
	Tue, 21 Apr 2026 23:20:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776802847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=McGmyMtfqQD2hpNud2eA1BJmo2yjh3bYk0pWVAnm1tU=;
	b=ZyZzdrsXgwI3z+ZyHSdOcfYP3ArfZ1ZT6G6f0HHYr18ZK1AYSyHVUDGCojYhJ6GsLsEsbF
	TufqenBzWkv+VdLNadLGGaqHpxjMBo9hYyHI+EMOQ4Gm4qIQ63TtpnrhNr5fxGdOLYn3L7
	J9stbLieZrh+iSutpienN5kniAyazwkD51uHbRQm4MKsv8l5uyCbKJcQz8dHIp3Tba12Ue
	u45I0wv1+HEXuCrIaBarFwbOZ0gKdqX3ADA2Va0UE+V2QmYeAa9GY8xmLIzFSGU6jN7dgM
	LvP6GPzKTQJ5Vs0BO13wRZ/P6cchuo2Ae6NAv1CEZ+xo3TfAAKW8eWeuydxvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1776802847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=McGmyMtfqQD2hpNud2eA1BJmo2yjh3bYk0pWVAnm1tU=;
	b=oxlppU5rcJi3jWWgXMksp3ocBec2UYfZSIx27uU9z3E8K1h9X7ZcUd+0zUNL8cbabjWNVt
	nL5i6WABVtD+5mphha1iIiqHR2VUQkyuyLjQbhUf+FvONqODDTYDZbD2Kebim5yWgVXsDO
	iH8wvGtkkUHObKLSOSx+Uk4WinygskN7T5c09XNtICfhF/ShRCgOdizdOTScOU9IAGr5Nb
	D+Wl5qaPFcADkDCgekVmSuAE9hj5+ECeZZPgFxYKaEDTewJj5EQAjlFhpkl4lGuteMu2Ba
	qbawCjrfIkpnKDt7Cm0TQiM7pwXzcaYqVO2VcCouck7u3ZkY18HkYOF1F53N/Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1776802847;
	b=nvmAPubTRCV9K6CV29nWBxkWE/DoNjDoSVoNFOQTQSUWcly8+loyjavjr9jk++XQCt4x1C
	7GGwiIMU/NZ1/vtHT/uzU2ylNq47sY6lDzF7WLsjN/pl8dNWu95J0uBtw3Hka6Ho3n950C
	v1eS+2oOUW3Sp+jyKv9B86hfCdR7rCyJRy1rzzF6ho3vcFFlZNk4+dJ1ojgmCxS+s3zNIz
	DLP4j0RBaR7plDGqvwrFEuRu/464QHcf/AjSa92ziU+yDsKl45GlRehr4gYB+ZodZkf9Vu
	Lexpa65yQuf8UizEuT5Bdux67cyOJ62I7+0bzEyZqBdNlhC6IDe41tDv9TkVsw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5F2A3634C4E;
	Tue, 21 Apr 2026 23:20:46 +0300 (EEST)
Date: Tue, 21 Apr 2026 23:20:46 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: nekocwd@mainlining.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, david@ixit.cz,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Vitalii Skorkin <nikroks@mainlining.org>,
	Antonio Rische <nt8r@protonmail.com>
Subject: Re: [PATCH v5 3/3] MAINTAINERS: Add entry for Onsemi LC898217XC lens
 voice coil driver
Message-ID: <aefcHhNAD1hpnLgk@valkosipuli.retiisi.eu>
References: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
 <20260411-media-i2c-lc898217xc-initial-driver-v5-3-c71ddcf40bad@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-media-i2c-lc898217xc-initial-driver-v5-3-c71ddcf40bad@mainlining.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59245-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,mainlining.org,protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,onsemi.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:email,iki.fi:dkim]
X-Rspamd-Queue-Id: 33BF743F6D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Vasiliy,

On Sat, Apr 11, 2026 at 04:13:10PM +0300, Vasiliy Doylov via B4 Relay wrote:
> From: Vasiliy Doylov <nekocwd@mainlining.org>
> 
> Add entry for Onsemi LC898217XC lens voice coil driver
> 
> Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d4b396dccfe9..a87c03ad740b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19938,6 +19938,13 @@ S:	Supported
>  W:	http://www.onsemi.com
>  F:	drivers/net/phy/ncn*
>  
> +ONSEMI LC898217XC LENS VOICE COIL DRIVER
> +M:	Vasiliy Doylov <nekocwd@mainlining.org>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
> +F:	drivers/media/i2c/lc898217xc.c

This should be squashed to the previous two patches. Please add the F:
lines with the respective files.

> +
>  OP-TEE DRIVER
>  M:	Jens Wiklander <jens.wiklander@linaro.org>
>  L:	op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
> 

-- 
Kind regards,

Sakari Ailus

