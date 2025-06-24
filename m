Return-Path: <linux-media+bounces-35762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A79AE638E
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0394C0B2C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26B1280339;
	Tue, 24 Jun 2025 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="cS0uDzCx"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B84221FBF
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764609; cv=pass; b=Y7CqBgVZd6AF++rS9f6opdMZiNqNLmyMfVPwSQ9cFJVtmWiNR+E5IKD94LxChaEvZHMjLwgRiBySjtgvQAiUxkmfphXhYo9R4Oi5ZyLKeoclF+x50sgxkvWpBiUJDmcg4PulwLSpvJuEskAjW66moCG3Yv2w6A23uUra6RNxgNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764609; c=relaxed/simple;
	bh=ZvW0b/YHyiYLVg8xm+jkY5Q7k70jt7fv6KBXEooCr10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psK3sUZzZrUbw/P7MVKBYasvQvW39+mgP76EMFpsJvia0mVDOdU6JZ/ky57+UJ30chYZ5RGAgmm2mvWKmMOJkavS/dZEE2FH7/LzLmGiEQVJeA/RyjXMrQPdKhec1ucpfcLEIGtLoAmY12Ew0u52kYkTdDY7wabHnT/JsB+Gfq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=cS0uDzCx; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bRN5t1yvXz49Q30;
	Tue, 24 Jun 2025 14:29:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1750764594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M4Nct75Tso5bPLeXj+r0RRLbmvaC5LlqJwRNv2aZums=;
	b=cS0uDzCxrr8ibGZcqKXchT39khvFSBbeBhIACEwSkbo9JBjNUz1d0jr6eBrT0nq7Pc2tnk
	FDvKf2sD5bmVOIuQvVHkC0yptSdzqTf5ShLIDYhC7b6xFth8Jh04dcpUKLhQpqoXZQFmvn
	PlRE91qTME3WyEEddnqXaq7ZVAEvO8n9VdNw0rLy82dz7ymaS2baxZwvQCpz7mJIwotdAz
	jK4mK9nL+aYnTjZMY5+42aHxb4EY5jHr65MtIG17HVFNBJyBfbE0QJg6Lvfz9pPrFtzwq0
	bwlTfPXPdOPQYaiQOfnqKGK4lqz1RQa0ML8JiQDfNkYuTlraqVPqKw37yo9kSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1750764594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M4Nct75Tso5bPLeXj+r0RRLbmvaC5LlqJwRNv2aZums=;
	b=e+SEanU6gYJA7foa1RUCUWZWpR0mqINkikRcDC+NLxSY289DZMC1dSXOSk+nhXyoiyOOtA
	XqCb3QM/Za8vNhZWjEkuN7Mf/pD/LmHYfVaDB9kOIr3bmkbnidSK29JihcSfar4idnQjuC
	Cw059GbtQI9GQ8NVRtpur+co9giDH9AEL24u0e5Tlv5eULe0yOyz/umfTzuotokd/OJBs6
	9BFlhVIFthVBIVT9sowAPopke+AyoDFn/cyzb5JrainueT8oqMLJJ9Gi5pRL2y1Y1YcM9T
	eHIuoGe44Lo4QAVzF9M6CzpMtOSH6ivTO1XNcT9VMPqj7YOoysCNpukJmISy3A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1750764594; a=rsa-sha256;
	cv=none;
	b=h/2xInfXBvZA67oX5TLDzD7qF7/IrFnOZCrEbqbTrqURTUw1e0pMX9GNBqMY//3nuxHrru
	eyzt2uRbdVI2tWQz8KUTeASIvNyFNiGn6mSvPLAK8GfZ6In7r0ydufQ8NlFNAK4HF/Yh+n
	roQkAb4bDakamfg2b3GPY/DDoAese+YxZQzlEGxOHEIGyZML+iN8uSghcR9sm/HME/0pil
	IUd0cBm/j8Qa+xla8AAUPkxob+tjQp0Fa0fkllbl/tu9WApqVJm4I4Rpak/4SOFjHg99gQ
	vT8jIgVmGi5tnfbOWBdCqJDvyp8HnAAfeuCrqNrbdmVvC+OPpkiUGBGMMOZubA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E80BE634C93;
	Tue, 24 Jun 2025 14:29:53 +0300 (EEST)
Date: Tue, 24 Jun 2025 11:29:53 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <maurochehab@gmail.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [GIT PULL FOR 6.16] New camera sensor drivers
Message-ID: <aFqMMdGoxm83ZKcM@valkosipuli.retiisi.eu>
References: <aBh7NzWRlLmqOIsa@valkosipuli.retiisi.eu>
 <20250527090240.511583ae@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527090240.511583ae@foz.lan>

Hi Mauro,

On Tue, May 27, 2025 at 09:02:40AM +0200, Mauro Carvalho Chehab wrote:
> Hi Sakari,
> 
> Em Mon, 5 May 2025 08:47:51 +0000
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Hans, Mauro,
> > 
> > Here are new drivers for SD VD55G1, ST VD56G3 and Omnivision OV02C10 camera
> > sensors.
> 
> Next time, please place the new drivers at the e-mail subject, as I'm using
> it as the basis to prepare upstream pull requests. E.g. something like:
> 
> 
> 	Subject: New sensor drivers: ST VD55G1 and VD56G3, OmniVision OV02C10

There's not a lot of detail in the subject, especially when it comes to
fixes it's more verbous than fits to the subject. Could you take the
information from the message instead? I can format it in a way that might
be better usable for a larger PR.

-- 
Regards,

Sakari Ailus

