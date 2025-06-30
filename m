Return-Path: <linux-media+bounces-36232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CD8AED47A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 08:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C7E31893966
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 06:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AE51F3BAE;
	Mon, 30 Jun 2025 06:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="S6IbAVcY"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5666C125D6;
	Mon, 30 Jun 2025 06:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751264740; cv=none; b=T9Pon6UbE+XLqw/M20O1X7eogPDqapsX8scgi63Y3tvspj3RvuOl7yHktQX++35VErYTvMD8VRQUaQ1oJZxB2DcZxiYJRg7Iq8vwNMYDITLMVhSfbBF2qS+uKuoquqsdtAdSjOpJlnwQ/L4hzUBp0vOgrgHxiymaUb1pAy/pC2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751264740; c=relaxed/simple;
	bh=uhKfm6SFoNAKkWDsDPV9BDr44NXk2OYfTWdRBe/87tY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=TxVebCBI1C/9Kz2++rttafyst6EQg8jWv7mx56uWEiFXxOeWbceGtakq3VobZF4Q1vh5gOJjyhuppTlW2D7kwSTRxK35NLhdT61En0rVUi20JXljmZWtDI6AxN8eGIpl4k/dsPl/yEMkwr2MbqCM23mEUWde2izuFkI+xpf8Fz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=S6IbAVcY; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bVx3m6jVBzZ5K;
	Mon, 30 Jun 2025 06:25:24 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bVx3m0hKRz2xVH;
	Mon, 30 Jun 2025 06:25:24 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=S6IbAVcY;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1751264724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lL6lebYjDuTRQr9pUaFGA/goHIWmDYc3AfHRflDPfSo=;
	b=S6IbAVcYS58gXV4PEr3bWQ7hkyEFJtRzhE5HxCR2tqsM2uDkzPA4OfXT2xdTUr3FlHXjwG
	BkNvHJyU0tzWmVYR0r5VcAXEHmE/DAHBz+L+ygLMVL09NguUK9EIzZHnoinmMSJWZCKn7Q
	VE26odylBhFDo3DtH+vlWST+6Xg7+wVOatdDYvjMjcs/tgbY0E58feNbjJduEMuEW1ohRo
	Q9bIqqDX7KPC6nXV7qt9yeUS3sX/bm275ZzwLL/qbGBQ7+DCRybCWeq3BRStL1D9qwL2Gh
	8P0tr+bjcT57ARkwcd0o+a4RG0SrlEKOwfFcprCl0UKjjUKF08iz6peGkXLYPA==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=68622dd4 a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=6OfKL2sbsP6cvxtWXXgA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfAFoZmH0uTa99ekqe0yfqcN3SFDYEp4k9xWdpsryDyOCgfpM26G6727lVkocdXXj5GFZcJM4Yf7+r3+wnHhC5+AHCBh7CTehRFhSVMPCQO04vnCp8EiR 6mlJr6NCH22101vp1U6Bfs4sZhjnepJ0+ctycahLHGLG1Ka1cbDi0xnvPepHv2kh//Fxo0slAIYPkvMtei21s6Ehq7y/Kdzb1Se98Ph+XCBjcoROJtEx1JPW QoLn7HZ7LSJmSQcY3BT4d1EETcoYfzFjfNnLIM14DRE9WDDb33qZm4HpBE165avcssYSHigAiDR1BfwExuYAi36fnpowiv6/M1Rxu1SNK9/zK+jQPr8U2U1H nsMkNFfqK31ttEv6HbAYsF9xfCBCFE40aLOMWSMoriNFaeFS+oAv9TfAn1a4g911VJIWhSqPh+jVn1QzWJwWoDIhjB+8DwWH1sbfn1xjxofzBg3xJi8=
Message-ID: <c8b65585-18bb-435c-9667-b202fb768299@jjverkuil.nl>
Date: Mon, 30 Jun 2025 08:25:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: hans@jjverkuil.nl
Subject: Re: [PATCH] media: cros-ec-cec: Add Fizz board variants, so driver
 can detect them
To: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, linux-media@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mr Chromebox <mrchromebox@gmail.com>
References: <20250628181530.873795-1-pedro.nariyoshi@gmail.com>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSBIYW5zIFZlcmt1
 aWwgPGhhbnNAamp2ZXJrdWlsLm5sPsLBlAQTAQoAPhYhBAUs3nvCFQU7aJ8byr0tYUhmFDtM
 BQJoBTEAAhsDBQkX+5V7BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEL0tYUhmFDtMb8EQ
 AK6Ecb5mGBanCa0R+J/WkWxGVsgqsaTjNU6nS5sl9lkiY64Tad6nF8RNO9YKRyfuokm2pxAD
 a91Tk92DFstszKGwiisEG7PQ3zXHEJTqxIosy9ueLbHTOvB4CnWVChcvaBWZ2uilyKFsWNTq
 mbDQf3/0UC3LxbEvGsYNU1Q6Pz+h+Pdv7GgdOJhYGKSLCpQyPYOyaU9tenHDKx6aNedNG4ZI
 2OAM18nDfKrEplSjDF9E9Ras65/n9iWQfGoUdxSlGrxM/t3EVgi1FXEq14FaCi6HhvreBZuw
 3NTHg4Za6bqnYsZnbyHY36bgnxi2YJYxKlh+IMT/TpfEh8nf2nnJTgs3bsNIVVaaYxJtl4w/
 Y48gKt6YzcWsHR6l0CSMQhZXQqp/Ljpi+/xtE6JJ/tJnG9Wyi3+hA11GFQ50uciXTpp9/w8s
 fScrv8qrfRiUsd+zfd0MC6EJmHSlW7qSVQjEauWDsdCFmsER8y/ab3DQb5uhrsyuooB+V7uj
 476vUbH/fM3KMrvh8HOTUBoAE/Mf82/bMlrduuU5PkbO+3/PcUR0WFUSK2yRK32GX/Tt2tD+
 YJq0RnyR8UeYslVLzyehrt8Cgc9KgHa8VUi/vkSTenjieYJYxgrd+oTYXB38gKlADnhw+zyp
 CsqeGGZu+SS2qrPUyUkeruRX7kC2tQ6gNoYpzsFNBFQ84W0BEADcy4iOoB5CIQUCnkGmLKdk
 kqhfXPvvSzsucep20OLNF96EymjBnwWboipJFOjZxwkmtAM+UnEVi2kRrtT844HFcM5eTrA2
 sEdQbThv16D0TQdt+dT0afvlvE1qNr4mGGNLiRyhRzC/pLvatD/jZHU8xRiSz/oZ+8dEUwzG
 4Skxztx9sSc+U1zRPc0ybiHxgM90oQ6Yo782InmN99Ac2WH6YLwpZQ1TOROF4HxeBfzfdMFi
 rudHzANNbn8LvvfRhMExVRtms+U/Ul3e730oEUpM18u4XJ8Y+CITnzOk7POfwYzHiKXqskw3
 bLnrQYF/QzDFsTFpewS3ojMzBq35CeLb5aH9LFY7q14m04m2cn8hkdq4nIPIk2x8hWgM19rh
 VaGWj8a6e7nQ30PerH89IXrBfWYvHezZzZzGG1JlLWktPNy/5dhAyrwiJIUo3ePFxfmjvFYa
 wn211qRkWi3GP4MYtk10WBvcQmuzyDYM/Usjt+LC+k3hT0mZ+Gz0FeTtY/OQ4+IwXnAdZM9m
 q88JVlijGVG0dOB03gLrr2LwihDJ31twAc3aJ4e9EHaiW6UBnwBdqeP4ghEylrqnn4jmJ6Uf
 D6qEANQ2L97e8vQyDeScP/Do+cDnhMm8Or0zAdK658fiWl78Xh0pRcx4g+opfwoQw5CfSf3o
 wh1ECJeNMC0g0QARAQABwsF8BBgBCgAmAhsMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU
 3McFCRf7ldoACgkQvS1hSGYUO0zJTw//aaYKzeGfYF7WvSHUvGvtBO5Y/3XNC5xfU+jDKmlA
 vghX304jqDQ5314fLH7Kk4wE+dE7FaXZR+mMj5W1ORUfGwvMJ7ayemUVg3RyYggy6jQP5Rlb
 SCj9WFvHwNNbYTHFVMkAnVVKpwcjCYiUA82WK1/hP2ClE4dkS+WHtH6ABhO0hs32WoCNAzmT
 fdsOfXtSYN8wYWF0CI8wW4RiMu7rAX7xPPNhnVGz9vWyn06XDipCSIDuivsPNg/9XeUzjUg9
 eOvlMkphJ42MRyPJAWGmSeLm8mKwxoF094yAT6vIvYmT9yUnmf9BfVCJV+CnjEhvMpoAkUqi
 9cvaZfUdnsAnqQmoRJE0+yInhlMyWc+3xlGsa0snsTxNfqjaLH61CLt8oUQOgCI4cD4rJWks
 A8SyOqlgxEHnljUGmFEhCBUOV5GcXf1TfCXjMBiAKtex5cpvic4wZIJJtS1fS18PQ/DEC3vL
 UnhF1/AWSHp+sv8vlNgnncxLDCho8uVjZrn4jzswd6ticBUAsPAKDYnO7KDzfQlQhIHdq10v
 jlGW/FbxA1UUiuWH+/Ub3qh75oQHTTlYe9H+Qr8Ef231/xItks8c+OyoWV6Z9ZcZnHbOmy2I
 0wGRdGp8puOL7LzhLkIN66sY/+x4s+ANxyJK6U1nJVeq7tbbhqf2Se2mPG3b87T9ik8=
In-Reply-To: <20250628181530.873795-1-pedro.nariyoshi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

Hi Pedro,

On 28/06/2025 20:14, Pedro Nariyoshi wrote:
> I recently reflashed a Chromebox (Wukong variant of the Fizz board) with
> coreboot and I noticed that the cec driver refused to load with a bit of
> tinkering, I realized that the dmi_match_table was expecting the product
> name to be Fizz, but `dmidecode` reports `Wukong` as the product name. I
> am not sure if this is the best approach, but adding this patch lets me
> load the driver and it works properly.
> 
> Alternatively, we could instead match the DMI_PRODUCT_FAMILY, instead of
> DMI_SYS_VENDOR and DMI_PRODUCT_NAME. In my board at least, that says
> "Google_Fizz".
> 
> I am open to suggestions for alternative solutions and I hope I did't
> break any rules (this is my first kernel patch). (And sorry for the
> previous submissions with errors in the subject line)
> 
> Signed-off-by: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>

Thank you for your patch, but I would like to have someone from Google
review this as well.

The number of entries keeps increasing, so perhaps switching to
DMI_PRODUCT_FAMILY would make sense. But I have no insight in how this
is done internally at Google.

One question for Pedro: where did you get all the other code names
from? Based on the commit message you have the Wukong variant, but how
did you find all the other variants?

Regards,

	Hans

> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 419b9a7abcce..a26473c3cd84 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -302,8 +302,15 @@ static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
>  static const char *const port_d_conns[] = { "Port D", NULL };
>  
>  static const struct cec_dmi_match cec_dmi_match_table[] = {
> -	/* Google Fizz */
> +	/* Google Fizz and variants*/
>  	{ "Google", "Fizz", "0000:00:02.0", port_b_conns },
> +	{ "Google", "Bleemo", "0000:00:02.0", port_b_conns },
> +	{ "Google", "Excelsior", "0000:00:02.0", port_b_conns },
> +	{ "Google", "Jax", "0000:00:02.0", port_b_conns },
> +	{ "Google", "Kench", "0000:00:02.0", port_b_conns },
> +	{ "Google", "Sion", "0000:00:02.0", port_b_conns },
> +	{ "Google", "Teemo", "0000:00:02.0", port_b_conns },
> +	{ "Google", "Wukong", "0000:00:02.0", port_b_conns },
>  	/* Google Brask */
>  	{ "Google", "Brask", "0000:00:02.0", port_b_conns },
>  	/* Google Moli */


