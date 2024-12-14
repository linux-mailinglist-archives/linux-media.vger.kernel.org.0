Return-Path: <linux-media+bounces-23411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C61509F1CAB
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 06:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBE68169907
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 05:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BEE85270;
	Sat, 14 Dec 2024 05:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBKrHcB1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD56926ACB;
	Sat, 14 Dec 2024 05:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734153902; cv=none; b=KLV/Wt711spDWY0kR1BwyITEpQtz/Xw8Yj+X5mPYS6jZI7jGmSBxbfY17cQE7QzCjqLUEHPMrMg1lkyet5pOaw/ro/WLw9QjFdoJYmH1+cGmnbHIzLtQngo0efHhJU/5Bfu5UI3z561cJy6+KW3+ROw3GCkWZpcawUigfKWvDPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734153902; c=relaxed/simple;
	bh=yCKPaSDPWu9ijkR8dRggFdS14+bDnHiwg7cvZnBFGZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+pzpfWuMjPtTum1jNzNVUeRSiqrb9QZL+zk98PO+kAQ9gWOrbhgnW7ZLWXrtNDEtWpJex9aH4sdwt5yHtq+cPwvbiOVvUhq9tm4/4oODIN4ZPpg4+f33IBh1GFovggWI6QLdXPsrqU4ThV6TzBcd7ZRS1KFU0lIk+5CdVamtho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBKrHcB1; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a7d690479eso19730345ab.0;
        Fri, 13 Dec 2024 21:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734153900; x=1734758700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5/REfcjottcanoq26NG1WWEVdjXVYlFfnaZxlVc7DI=;
        b=YBKrHcB1D/DTKsQaTLYMBk9ucmICZGTI3fnKdSwh2vKmQGAFYjVRSkno9MAzkF6lj6
         mBJM+5w8il+sShSSpXoXnEZzGQG545zaB2N95QypkbxWQ0Kvquv3XOSgzZrBiSNxmoH3
         BNoijJBxhBjMFRTXBDqwUHLH+SLFqOaBCTvnje1KUDzc05He+6mcB7o/5cMxZAMvPMEo
         f5lGqUQgcEhqegJvw+1jgyC2uSKI1XneczOW0IPiLrB43aZ5oDjKADvKBsmpjPh5VP4/
         5kBNm/BVvhMh7CN04cK7s319syy5hAuYxuTpF6IstPbDbAUsMqNJSXSRnjSP5Jqqhgcm
         T7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734153900; x=1734758700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5/REfcjottcanoq26NG1WWEVdjXVYlFfnaZxlVc7DI=;
        b=UpHqV7j7gU7aMdTVkNYQfOxS5Fr3kwMFomiTZelUm9YaITtdVDbyQshLhXFO7tkVIt
         ZkSMgbMd8QtnO1IOqSZ5vqz0QeoDIbhpAkWbTLQOmvpE+zUF069qCRqLYCxcpXEjOFAQ
         Bpa/Jli8dsgrNu7dNTF429RpZool/rKF8iPLh1W2TlPXpjxxQAKPrGUrUG87kRye8zNM
         8xVlTmWwT3hCQTO1k7EoUZtxXHyjXSi42gy4CSB/V/pVKq8xm7DY/qyLbXdrLkCrmDyu
         akP0kzgPTeVfEwb8rjXsUtmMuc2TT7YEx12lijYnSr/g81Gpo7g0DDj/D2SeABpus/5f
         glIg==
X-Forwarded-Encrypted: i=1; AJvYcCUhoGyZqC8bA7wjjxdcpBOIIy7J1p9MvCcbqB0jaAIDduD68xudsrWcf0ky8p4mIdCYgemZUIxvRjXP@vger.kernel.org, AJvYcCVe/vY9Qxv/ZyOAMmUhG/hBlV6y1+HlxsgZs7sb5Ql2NrDIW0CEjEeOkhm+2gBQ0iFUR17NS8UXKZG9@vger.kernel.org, AJvYcCWl45tt5BCV3kmUp5ByELE3gHQTS+OXHpwHkPpNulbcuezQyxyGybwdAZv1X4nV9LD2PNBR58oYEfEtbqthwQ==@vger.kernel.org, AJvYcCXw1LMkHmgS0gX2yUcwX7XDoFaYq9I4wGvie5XnkSW++efKL1KqfS2JLzCV6dqJthMBX7FtYTv7iFDiAGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLjpALjWLkZp5NsTa49w8OtASn/qgF5TPzCiqLuaVCf5fujka
	BzFakvdluornsWu4TLaBb+JnLYaNC1TS4n3eS0pwvzs6/PP0A/fUONnmDwDP
X-Gm-Gg: ASbGnctpacXgDzVN+2FzVHzdXitNbNPdWLbbpcLV1U24T1C/9KT+mWPl/Wy5bs+3XTm
	Cy9kU9CVWyc1iJ06jQUZNPJtMzGRqkJxiyMcSHMPodE1gmbGXciah0JdsAr1e83xorQtPp9t5BO
	j7Unrm8Lh6tKPcPzCSL+7Vn8L+WSKJJuRsLpTMaHFfrCqOkfoGyNsD0q70fErfuHAyS9OjzD0zI
	ttIPKZWyUO6Az0O6nJl3H79TSZLY4QUvEHAsyNVdUY/
X-Google-Smtp-Source: AGHT+IHx+9/iV9cCnXHcndeIm4J/8/nCLAuzVn3WqCo+4I1hlhQji8gB3twwfLcGd8mH4Ly/1nWb9A==
X-Received: by 2002:a05:6e02:741:b0:3a7:e3e3:bd57 with SMTP id e9e14a558f8ab-3aff7f1646emr62964095ab.15.1734153899702;
        Fri, 13 Dec 2024 21:24:59 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::8f60])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b248228c81sm3080105ab.23.2024.12.13.21.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 21:24:58 -0800 (PST)
Date: Sat, 14 Dec 2024 00:24:55 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670: add camss and cci
Message-ID: <Z10Wpwhp_ulC2KhF@radian>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-12-mailingradian@gmail.com>
 <fe8dbb4e-9d0e-4ecf-874b-be9225ae1487@linaro.org>
 <Z1jdNaeoictuCK7N@radian>
 <a499bc08-1505-4f7c-833c-68240fdec275@linaro.org>
 <Z10FkmBq95HQkOgv@radian>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z10FkmBq95HQkOgv@radian>

On Fri, Dec 13, 2024 at 11:12:02PM -0500, Richard Acayan wrote:
> On Wed, Dec 11, 2024 at 11:24:30AM +0000, Bryan O'Donoghue wrote:
> > On 11/12/2024 00:30, Richard Acayan wrote:
> > > > I think you sorted the regs, interrupts but forgot the clocks ?
> > > Do you mean the first three clocks placed first? The order was suggested
> > > by Vladimir in [1], but I can undo it.
> > > 
> > > [1]https://lore.kernel.org/r/40cd7a52-1c60-40dc-aee6-730b5247b216@linaro.org
> > 
> > We've had a long, long discussion on ordering subsequent.
> > 
> > Have a look at the sc7280 and align your ordering with that.
> 
> Ok, it seems SC7280 renames the CSID clocks to change their alphabetical
> sorting so I'll rename them as well.
> 
> 	csi0 -> vfe0_csid
> 	csi1 -> vfe1_csid
> 	csi2 -> vfe_lite_csid

Let's not do this, the "csiX" clock names are also used in camss-csid.c
and would need deeper driver changes.

