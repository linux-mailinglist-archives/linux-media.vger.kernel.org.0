Return-Path: <linux-media+bounces-51712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKevCyl6eWlQxQEAu9opvQ
	(envelope-from <linux-media+bounces-51712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 03:53:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FADB9C6CC
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 03:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E37B7300DF73
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 02:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C96628C009;
	Wed, 28 Jan 2026 02:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiIQOE+W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E9D1AF0AF
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 02:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769568796; cv=none; b=BPFRBB6zXmZ1RqMFFHMEmIgP5TP1hoUMV22Cz4k8KIBry3OgEiGPXlSiQhCtMcVQPWfFUxw58qwTUCBhR/NT+2TUEFRs3shur9klkr1Ji71rYRm0Fkc8qLj04Fs0XaZYUtaeNuGF7+Bq7EZWwEgmcOm3C1aHcELAxGX50S+osH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769568796; c=relaxed/simple;
	bh=9KL0qFGhdBvOIIw6GVscMMDXp1h7L+qs/1b2H49sp40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GenfbRfxD593LN7qMahgbjVyZ4dkOqgALQbipoxusyMMrP1+QIVTD+M3mitjUueK9JGB0H1DdA41lP4quy3yeH52tRv910HzsbMh1DOjH4LbBaHQEJj9k80oY5nAS2VIHMdekMwxGNDGRSCesk/iFn5zcoEZh7kgzC75JBKy4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiIQOE+W; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8947e17968eso68858406d6.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 18:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769568794; x=1770173594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yluvfUNr6pH7GOU/s+jQXcqg7WVVoVQL2cZIk1rM12A=;
        b=SiIQOE+WNstIDMT5YlVCQsJtZWphJZJr3NdEDMdV5NDb67FflCWbfmi3VIVT0kk6ut
         Eqvh/niJq2sI0m/kI7RTwI5BZC9UZIq6s50meT0FW+1yG0LTGneqVw71RkKu2BH2L4OB
         uAdj0yV5PMH47KKYtVJZid4JEn/6KRfjQt8tWwF/ufLdmqQqAgUXOgkzCoMEdFoEUTk8
         tqlCWumtPztW5G/VJ6/2OdX/qUhpIsUFVtFjDQ+KAhc+rfUPFLpKr6IvGmxCsK8TTZbW
         riyZr8g0rDrhdE11+KTpoiCHOwkbxmeBXDglcBQKaGzWiTVtBM+a/TyVL0rClf2Plb27
         oK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769568794; x=1770173594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yluvfUNr6pH7GOU/s+jQXcqg7WVVoVQL2cZIk1rM12A=;
        b=uhQnMXellCoc9TfGTMfEe7NMmpG7iGmQiIeIiEv9ShaF+gAQxVU27TbjGfzlYzkdaA
         X0f8KUi+ktD+MiKgi5UKxgAAi/SJdizN2kP+JbS4tAWjs8ioNmkIla4+zfIFwv6CbzAR
         s/VyYKgAI7dUl7FTAg7PP6f0m0fJeepczMAS9Nnv4zki29waSrwEe1NGGQGgmf+kbANQ
         q3+5raWSvoD8GmHHjgkxZo1OPaE0p9D8eoXnZ6ZtYLEvLkXbS76Oa7H58rKKqHMI7TRT
         Feq9BA8jGMD1z3YaWGSfX4sNDTmyXVMe433VomoazeBT2bgdJdos+zxPVUmTrOMhCMpC
         569A==
X-Forwarded-Encrypted: i=1; AJvYcCXmyMLNzaozeKXkhK7nnpJJj1qgLCYpyb4kbRIsC/F0VejfY0m7yQqyVxHwuGPuUqwnG+Bpx1KUPH0SAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS5Vi19Y+lzDUmHWe1eulE44Wpwc+JXqPqlwQ1tnc5ABKpe2+W
	ZDQYwmZxIZTeGb+tiRzPOhM3HxnryahMP07qcCMHk9VTCeasR7QsXhIc
X-Gm-Gg: AZuq6aJGKjqf6R7q942cu0EleQFEMDY1iqSQEllUIABjWSiO4O1QWXGMZcpz7DvUNWZ
	CttUsTk7CM6QfpBGfYvvTeyLjlh/uW/89ZbqXkcwJMwvhXJQkV1u4VLmWeVXeoZcmkBGHZbdUy3
	VS1kc3+eIbL8+Ygzljx0TsbAJT6sw4LcJtJ7dDvyqeLiXkMaXbkBQYT6LxbWW1Y2hXSZ2yUXtb7
	jdFf+NWzdBMGc/V3r2EU/9M9u4/iaZS1nWhlNmr+R7JCRAwRI9M3UaUysmZIo3kkd1WgY8mR7k9
	S2PaCih775rjvMH/pLuJoONCyDb5vMVJp4JMeaeeyifXXkDSQrsYHb4wSWHNNXVB+A9Rdm4ZlsA
	+4pwSBBU4lXrQCOZmqQ58U/Vj8diLxRYeUkzwr8193/f6mr8sAQvbCDQH+1pfReqUaXeCGp5n0Q
	jvba4p2qmw3UW9cw==
X-Received: by 2002:a05:6214:da5:b0:894:6e5d:eb8d with SMTP id 6a1803df08f44-894cc8c977dmr49820206d6.34.1769568794147;
        Tue, 27 Jan 2026 18:53:14 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375ed92sm8696686d6.44.2026.01.27.18.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 18:53:13 -0800 (PST)
Date: Tue, 27 Jan 2026 21:53:38 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aXl6MpRB9ncCeu2M@rdacayan>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
 <aW-V8VTcOICLWqaU@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-V8VTcOICLWqaU@kekkonen.localdomain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51712-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FADB9C6CC
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 04:49:21PM +0200, Sakari Ailus wrote:
> Hi Bryan, others,
> 
> On Tue, Jan 20, 2026 at 12:44:24PM +0000, Bryan O'Donoghue wrote:
> > I think reset should be asserted before regulators and power are switched
> > on. i.e. before you try to switch the chip on, you should establish that the
> > reset pin is in the state that the timing diagram calls for.
> 
> Indeed.

I think the discussion is more about whether there should be an assert
in the same function as the de-assert.

> The xshutdown pin, as it is typically called labelled as "reset" in this
> case, functions as both hardware reset and hardware standby mode control.
> It should be asserted (i.e. be set to low level) whenever the sensor is
> expected to be powered off. Typically deasserting it is the last step in
> the sensor's power-up sequence. This applies to nearly all CSI-2 and DVP
> (parallel) camera sensors. (There are some exceptions that use explicitly
> two GPIOs for similar functions but there are very few of them.)

This patch has the reset asserted by the time it gets to
imx355_power_on():

- when coming from runtime PM, the suspend callback asserted it
- when coming from probe, GPIOD_OUT_HIGH asserted it (considering that
  active-low also affects the initial output setting)

Should it be asserted again inside the function, or
should the initial `gpiod_set_value_cansleep()` be removed?

