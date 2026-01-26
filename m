Return-Path: <linux-media+bounces-51569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFuVEbhid2n8eQEAu9opvQ
	(envelope-from <linux-media+bounces-51569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:48:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D29688775
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EB8B30089BF
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB71336EFD;
	Mon, 26 Jan 2026 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYpWi8RU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B03376A5
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769431726; cv=pass; b=P6cMMMlYG7NR0WOP9kT7tTj6oThIAkfPldvlTiOlrECd/PnsYHXFRYj70WKEJrSe5zX0ykq7jev28fhNWmpeKJveVhEBaoTczgY+lP5908o1rmFUHlkCyHATGGUTktMd5tSMGyuSIT3oR3Mhz/xSrN7/tKxuykrwIkBWQQ6mZ0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769431726; c=relaxed/simple;
	bh=4wbUefewEyt+Bxa1epr+p529X5zn/t+qG9ZDeOzVm8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y56jWBJOLPiEvHLOUHUlcg2aHoq6JO2liVm+StocA0LGtWDFbhlZMn+41+hHE5esr8cJuyKRypiuIWYinPoDjesSf1YZ9LzK2BPC2PsIVZrqWQPXhK0w5rDeoWKm/hDCBTjU8hgyyTi/g8q9xbAHERz9mq46pFImSqPb1w2FOBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYpWi8RU; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so3640475a91.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 04:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769431725; cv=none;
        d=google.com; s=arc-20240605;
        b=eombtEuA+XHzmA/F/ShFYL1H6I3q7cTDcmG5/jYAhOvgHUKZM1RULLV2lYIUgjWF98
         v0ZecVfAlNDEySpVnJuNCxWTBZhWMk2cBwm9qDMOll03celpQJ6AG8POGE+rrnceh3nH
         VOA1WBZNiv/I33/nbI/XwlILEhJjuD46zq85ygtBh9+Tdj8sAnoa6INKBU3SSHbhHn+B
         sAYSf9FjDGj5U21XWw+m3pU0daULLR7/h9j7QNW3MYM8sXS36uQZ/Vvu1sykFD4UTgY7
         0OhrfRaoWR6966T/Cx09HUZKHNb9yjFtEOooQ7F63Q+k48anEz4iifKhIeZgA0DhEkib
         X9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4wbUefewEyt+Bxa1epr+p529X5zn/t+qG9ZDeOzVm8Q=;
        fh=4/FCFxqEmMTU74LJA0L+SsIByUNrhwGQgrBbX9j1RRo=;
        b=TspkLyHTEAl4Y2AEwUN56qfIbOFBs8441VDS4cJ4ytNENDJb0VlHcy0XMlxIB0Rl6L
         XHRW88Tp5CysFJySbB/xmczImDeUHemkHjsEFRHKh4mnLJS32y2g1+xWhkFW3WNrmfgj
         k8NDYib5Xv6rCKQa9dUu1kWTHm1GnAjDCP1M/Cp7bPf2Ws3aGjRGFnpZsUKaeCDpd0Px
         dHgqtlm4s/K6oOnxlRVzi8zf+sQLdeT+3JCIqCLYVBbBpPBCXBYeyOssDuCQ8U2nmHPO
         FDHBKpgGrppGmaKa90NPK41HTudXUUZEuTHd/m2aqMfoHGtLQT9kVaP0lf+Crw/t9yd0
         vhkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769431725; x=1770036525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wbUefewEyt+Bxa1epr+p529X5zn/t+qG9ZDeOzVm8Q=;
        b=KYpWi8RUg787QneWLKwB4NlSNNt9xJ/iiwz1p+mhJKvGzpGPQWZv0ZK9Y+2INa7Em4
         c5TD3qBEAEmPVbKHPMqHX1/O4Yye8fU/7W5T0VyC6MsrV3Qx5Q1aMF7wJrVWbqAotDXR
         bVdNMhVnp9sF3al4cN16ilESVGEHeD/ARzo/NqtWEftzaUoN9TWKkSdVbTeSO7eyfJ0u
         pIPVRVC3rPg16vhRs9oFBqWZHs+EdnOOfJQx4gg2QQF5xR6YGmN3Jzv4ICp50kpgJaYc
         AH2rlhJLtL3Pxaqyo65rSHzIGRabdgNnmL222SBTHl/sFkydYPrs3HHL7A1BNZvAYskw
         Mp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769431725; x=1770036525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wbUefewEyt+Bxa1epr+p529X5zn/t+qG9ZDeOzVm8Q=;
        b=HbHkEAGPGFsTXIjgm5p9oP5luT158UFvgN2QTt+BG6C2BlwftYGTlSOD0lg7b3qruZ
         pwQ8nAypdLQfcnsaZy1w9m9rMjqHLQYcccWJKTTk3iBIx1AzLBbhMd+sIdLeKPXsBJLZ
         PUgtSSd88m3ZY1VrkiztDkgwAqsdXSpbIE6803K6McWmvKaJWISbS9Lj9MF+My4ovoKa
         RvZYO7J2qYRJXSxCyIU7b9lPmIARaWUfTxuypaR6RFDCdeHREPsVEsvKHzz7TWFL/jg/
         MMPxtjMiwD4CjrTIpFmZubMxJsOO0sj5Zs5KyyGXALIfI3t8aO6mjM7ACEnYJWC0R1E0
         gVyA==
X-Forwarded-Encrypted: i=1; AJvYcCWVrzmV0zxfSfr6khged7euhyaqoNq8/IwGEQjqjSIDTyQqU251FD1Rmld4nGRqXg15C15B3vtqVI6qXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz1EZ7KJEX1XdwAsRuKUdZAr7ToBuLHnboxpPAkJ512o9dokl2
	mExcOpyitGJMrMrcMzVv6knfaXFNSUppvbQ6QDW5sHR54DDszdSHrKaDhRz+0nP4cZPw3M2gfjH
	g7nVf85GcP09IdbhWsAfe2yXvo7HvNKk=
X-Gm-Gg: AZuq6aKDqX+OlrG4cdg7kCuGXs4RXcw01PPSlGb4lOHrK3P+7R4Tp0WTW7Ozk4IrdNW
	wOsNVvMss/Q6EVkL6vQMoeCu+8wGZrwzlTYwgVkGBnscDBvxRuUhjAipb7LpKTS6NbvjbK3ev7F
	+cpWJ7iEnWewUFjVj/wXM1GuTCROWWoMFU9x2MdQJNsWNVkoda23k2L+gz2RuIAnmQXTbGew0TI
	/a0QvZndov0POPEil1bp7tIGb69HVVdQaIKS1kzFN6T6RudMimF70NSP38Bi/FaVLcGaHHlcJHY
	KCHW4JyFIgDikAQOzo8Hp+q5yPNZ
X-Received: by 2002:a17:90b:558e:b0:34e:808c:95eb with SMTP id
 98e67ed59e1d1-353c41bc40emr3364991a91.32.1769431724676; Mon, 26 Jan 2026
 04:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125171745.484806-1-bjsaikiran@gmail.com> <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com> <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org> <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
 <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org> <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
 <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org>
In-Reply-To: <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Mon, 26 Jan 2026 18:18:33 +0530
X-Gm-Features: AZwV_QiImwHoTrhadZXSVk9XMUduYaFg4Doi8X11Lf0vWvPz9vytxnHCfMsQkoM
Message-ID: <CAAFDt1tgFf5MQcHm3s5DJEDHDtbTfj56_0-=fTz0ekDjSqY3CA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com, 
	vladimir.zapolskiy@linaro.org, hansg@kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51569-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2D29688775
X-Rspamd-Action: no action

I used a 2ms delay for the initial reset assertion.

Thanks & Regards,
Saikiran

On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/01/2026 12:24, Saikiran B wrote:
> > Yes, I implemented your suggested sequence in power_on():
> >
> > Assert XSHUTDOWN (Reset GPIO =3D 1)
>
> +5 milliseconds
>
> > Enable Regulators
> > Enable Clock
> > Wait 2ms+
> > Release XSHUTDOWN (Reset GPIO =3D 0)
> >
> > Even with this sequence, the brownout prevents detection if the
> > off-time was ~2.3s (I got this 2.3s number by conducting extensive
> > stress tests on the platform starting from 50ms to 3s. At 2.3s the
> > success rate was 100%. Anything below 2.3s, the sensor entered a
> > brownout state atleast once.)
> >
> > Thanks & Regards,
> > Saikiran
>
> ?
>
> ---
> bod

