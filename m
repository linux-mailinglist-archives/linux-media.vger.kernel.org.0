Return-Path: <linux-media+bounces-52009-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DG6TBeiQgGkj/gIAu9opvQ
	(envelope-from <linux-media+bounces-52009-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:56:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F21CBF41
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 373FA3046BAC
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 11:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F36E36402F;
	Mon,  2 Feb 2026 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CPQaZJKT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4BD3587D5
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033159; cv=pass; b=I1z5IEZR2Sn6I45anA6tAFq62tLgzJTHNh7mtxpcM6dlxBxEBot6VdYSskr+AVsQqudfjzpbBwK2l8wvq6qhTAULSaA9HYtu4mM+dFTSV/6b4j5vLrRMNsUySroZQaVvqkbeN8lXJEpvH3AWzU12WGVg7hFzx4oCq7TigKhTsa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033159; c=relaxed/simple;
	bh=bYO5n3kZQyfvDEXwM6OFYs1MAfC3rh/vVjm662kJ2eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8xTQDj5TMNJBbjt0KImv9twsLqUGw90BV4U3WuHFF/fVSmP+2NBh0oVJj9qADf8JHNSmtEebLeaG6B2ETa7TxJI3USAhjhBLWcxDtMQNARole7pu7gJM1RYRYd42pmLOhTNlTfUyb63/UrRY33CJE1TyY0pXMinwaTfKB6QOuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=CPQaZJKT; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64931bbf70cso3698575d50.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 03:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770033157; cv=none;
        d=google.com; s=arc-20240605;
        b=PtSyMJhYGFUn4icPsISwS8JStlCx3ohDnE8KRJ0D7RUbJZz+UhKJ3T5PSYUJrLK42u
         MHewKxoHvEJNxUtw8xNZi09AbFcLvMi5mxfeAyZcpAs6eWCmiPdTJ0MJzqAbRPkq9+BN
         iiwdL/ULIEYr5ZzEWzFXNUlb8Aq1pQoJ5VAfbBJ5zifma8oqw+/7VdKL6OMbYVItP7PW
         ByUCZrzIDf9nDaU+JZ8SE2FhWvYrYe43Ts1sqYLTJ4iJOmQkSH2j61ljgORjvuVxwVqS
         lZi/6JaJI7d/e6iW4IxXUmhSXl0BBtGLXktE+swasUmDqn2763aarUgZkbL4kGi4d2nO
         YNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RKJBDzgX/JrOYme6MxuxI7W3qT/HqfAcSTAp4ZI6AvY=;
        fh=IOrQf867fBZh4cHxGy3rqfDmQlhkoZu17qC5PnSoGfc=;
        b=RtmlCVScBmHX+9SdAGrdOQyW/8toUvvcat9wQaZLSQPbsOwSHMKMF+hM121i9AAPRz
         NZLjWTQf32ypx3N4OdGKi1oA3CS0N68EFKohymsQsxZU12JJaiufjlxbdUKEud1NnN0J
         Zytm6nOErWNSFqDE+uTfpUzIKs2jDR1FIcvN6FkP6xyWYj25p1RAMyJABGlO0aNh9CVz
         IhQjzfddfTjP9f63KeNxZ55x06fTRygxeLCTh3J5uXRBVu1Rp1UdEG4L6L+9sto1+mw2
         Eegll1sAwmZ2BcARUB5wznutm9xrzmurfz+G1cA1ILcvi09wF5MoI9SVUmTAUdjxPtW3
         wOyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1770033157; x=1770637957; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RKJBDzgX/JrOYme6MxuxI7W3qT/HqfAcSTAp4ZI6AvY=;
        b=CPQaZJKTq6TeCJK+SMNe6TWvKsu5Gld12M7Ckvp8DSvQuAMfBjwTRDar/kR5CIiRS8
         W9pWzleDfg7bO6LU2+azpb/F+aX27ePwGslJ6EIyATOHl3GOQZHPkqtExzeyMLwPBN3Z
         TVta0SIQ2r9MgTDibm+ycFkXNNgpgAqTNel03rC1GJC2OYLvuKVMUJD0p0Egdb0ugYTa
         gGv48iqQKT020eq7HHQgqNyhpw3i58rKYMTfGMJR9cpx46CfjsRZyzmhBWakKvO/or4Y
         PRnoLaj9QlzjAsqAj87UDPmddvxInBGU65cUnhw45p9JMH3Q5quS6ENl5Lw1iD7ABP5G
         zEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770033157; x=1770637957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKJBDzgX/JrOYme6MxuxI7W3qT/HqfAcSTAp4ZI6AvY=;
        b=IYUjFQHjoK8n7MxujATfm8gBHHAPbej2zME19QwqaNjcz0uKcgR+N6ru3gwwmSBlgK
         2yuQl3p7n+6yFx1Z6x7nPZl6lYoBPWJ/h2/SuQQZh+6D22FK7fjFfavJri0BwKANtPbA
         8KLLrbWnV9XhRVHhNdPLVoNWAON97DA1pnBigTdm1aytumGwMgpEr/B3LcW5MF+RQ59o
         HAlzdpX3iDNW2O1iXP2SiarBGBee01qfzIYUQxdOQatqdZ3MxbBVjIVuAB+Xvf72e4L9
         1+5ZN2/kr90TIKVWkVaim8CiUwago1ItINo/dfE8bxeyhehv4NaskqS7qu5IPJ4cN33f
         o/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrrLt3FuvkYhFPf9QTxgtpvyBMaaNRDZhg+4fT4Moz2WLGA7+pDeBAsofSHvAWASxJTAol+UyXCd2QGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxhplw5+wGfrh/eT6G1sZDxvrY03PSKYE7a2E5M0TaZd+ktubP
	c34AYA0DBoNttjT8MRlctA9bdC8QaDkTZF7fNZZGwQMAGuQv7bbBFH2Vwiy3/FGdZV/WAeVw1Ol
	RbcAqOWAn3V0C3SAwRW8bJr2/uMNM+FAJ8tGWr5GmlQZhwcsnHSk6
X-Gm-Gg: AZuq6aL8n2mzBnyndsRitQibPyOM7Nek29ax5cgycYR46Nyj5f4MBj413igkYbaOrAP
	HWFONYqVYnsgnPQuIb/xBLlnSPO+UmSZfISmhZNluaLiSJwnphLHGZ8oGBvbIUoOSOpKwEV6OJV
	d1N2lec2BRSrcK4xKkiNewO7p85c9FMHQbXc449w/X2q7cpGE0hgQQZo6BENH+eQSmm6Pjehl1X
	ByicIZN/dWk9gmF2ev56JctEja6dEj4ID3KTqwJ0OZLX4nt6vKDY/iN2QaiMg7nwU/3H+i/6HlG
	mVGGjNRFy85yNsuNSEdaCXVK1kI=
X-Received: by 2002:a05:690c:f91:b0:794:747b:b6bb with SMTP id
 00721157ae682-7949df20bf5mr217367617b3.23.1770033157315; Mon, 02 Feb 2026
 03:52:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202024024.3911367-1-nichen@iscas.ac.cn>
In-Reply-To: <20260202024024.3911367-1-nichen@iscas.ac.cn>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 2 Feb 2026 11:52:20 +0000
X-Gm-Features: AZwV_QjURaC25hnlzzTAdmM6uxVrIr_kSMhVT-ED5WpUb77qNcisx5Uei7Ve59Y
Message-ID: <CAPY8ntCMX0kY223uW1vzh4xs9xcdJ41j6pPJ8k=13V5Kvw=WzA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Check return value of
 devm_gpiod_get_optional() in imx219_probe()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52009-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,raspberrypi.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63F21CBF41
X-Rspamd-Action: no action

On Mon, 2 Feb 2026 at 02:41, Chen Ni <nichen@iscas.ac.cn> wrote:
>
> The devm_gpiod_get_optional() function may return an error pointer
> (ERR_PTR) in case of a genuine failure during GPIO acquisition,
> not just NULL which indicates the legitimate absence of an optional
> GPIO.
>
> Add an IS_ERR() check after the function call to catch such errors and
> propagate them to the probe function, ensuring the driver fails to load
> safely rather than proceeding with an invalid pointer.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Thanks for the patch

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

(Apologies to those directly on the cc for the earlier HTML version of
this R-b. Google appears to have updated the composition settings for
me, and I hadn't noticed)

> ---
>  drivers/media/i2c/imx219.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index fee63bc106d9..7da02ce5da15 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1218,6 +1218,9 @@ static int imx219_probe(struct i2c_client *client)
>         /* Request optional enable pin */
>         imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>                                                      GPIOD_OUT_HIGH);
> +       if (IS_ERR(imx219->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(imx219->reset_gpio),
> +                                    "failed to get reset gpio\n");
>
>         /*
>          * The sensor must be powered for imx219_identify_module()
> --
> 2.25.1
>

