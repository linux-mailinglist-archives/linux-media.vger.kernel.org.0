Return-Path: <linux-media+bounces-30586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A72A94E60
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D17B170A3E
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 09:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15ADF212FAD;
	Mon, 21 Apr 2025 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCE6ompp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4058CA5E;
	Mon, 21 Apr 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226203; cv=none; b=jtuXkoGRd5BrSsknSZBYQNxTxGCfrzMegDZ5lZ2itBmcamrGTzgT1xI18u+MQJoXSJCuF4emuw+38lbYOUmmJJTa0IF/n+ikZemB98rafv3JzGCT0clIa6NDrIHs7vKnw2L554DW2LiDR4229TTO+5DHO0Ut8DOor6kkPAhhkoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226203; c=relaxed/simple;
	bh=NaNLxjVYAiHVKkQcBc30sZU1PvjgM6D5TdHmW1yTgO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q0kByAjWTciCrSweoktq984qN0pGIv92Wd4Nvq9PNHNhT+uZ1Xwb867f7b8nhRU83wSj33UyOeSXWRkxgoaCioijxYmdHVynjwkAxIZOHEcnbhVi7e+COYnffJuu7702sKZBhABU9ZE+zxL6DHS49fsLAeAnSLq1ZWrBuUX5D10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCE6ompp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acae7e7587dso514583166b.2;
        Mon, 21 Apr 2025 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745226200; x=1745831000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaNLxjVYAiHVKkQcBc30sZU1PvjgM6D5TdHmW1yTgO0=;
        b=kCE6omppRet/Y6kPq/KpID0MWziJP9A42xZh5uuTiXV02/S26Yg6JJk2l4aOnH7X0v
         O16ccyfFRsQVDbX5U4OeHDM0bqOpFSuKKyZMV2zURLVzqkvC8ZCQw+HVT3ommMJM8GdL
         6xePzbrRCWKG0itbQQTwxFksxk3aZdEFb2CrWjboMuFmK+YbDDkqwnhuCphJzjo2zowp
         DTQarYBoO2s5K5g36XjjlBwJSSF84MYZBYqw+BJ+HZ/o5jUoCqHeFndaKY6U8kV147FO
         SqnGLwijvg0Pmi3AuIDF+lcNucOv4qeXOIkUih6GQcMlFOudd3uwLzL0r6+zRZhs3NX/
         cb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226200; x=1745831000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaNLxjVYAiHVKkQcBc30sZU1PvjgM6D5TdHmW1yTgO0=;
        b=NSU1V90X4Hp7z3nLvgLsSWIw+15RmAnMALGDk8C7n/QIpwkJaDKg6pTIs/qjL/SeI4
         OxJ4fE3W56HMraqsKYOd/WEVyPLZtMyJZzppQSQj00xowb7/erBOstLNFiZtjXlF4yqV
         ExxZ9wTxkhqDio3/SMkjwHv6q7GHWwox1fqkcgDglCopuEpLpqhKGTdW0YUttrIv20Ub
         91+7ivQE8JL8BVofzUqJ1q45TlgkSZ9DacC6hA/9ShB7UKf4f9AZt30GvfQExNhwdxml
         ojXePW0HRzM5GmONLLu8msQMlBh8ZeXuMlrsg4Op9755UVZdGFWfK0vtE67v2AyDvIVm
         W+jA==
X-Forwarded-Encrypted: i=1; AJvYcCXQbiLXTgF1HDvfUNgQUQNrrY50dOG657mSruheRA1F898ltmB6A0N8tzN1ru0rkqVutcZjFjqnUW6RROI=@vger.kernel.org, AJvYcCXegGTZHKvfcOk70PnQIT9nV42laq7GK+stSHgt0ZofY0R2bPB2zKFrWgexYPDDnK4/Y6dW9ilRrOsJBwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIbyFHFCi0ndbAb1KYwMWsU8W+gb7QJomFHlvUQ3AVLVzY2Kuv
	7PCefjG779CsPekX88UU1PsI2WgAXiRjvs90S6fXIZteP+NNBWcrIupqBu8SJAxLtfDG2kKEOkn
	ArBpHE0l30CaFLjrxzaU0LD4AzXw=
X-Gm-Gg: ASbGncul3yGjPH5t2bI72HyXd+kkJuriLBbSbSMmYv3Gjlz5hkx06/lQlaY1+avMnlp
	rWPVe6TLPcNhFClEDg3Vabf8MJdVV8KiMNG/PDRiSvbd+GAsZ4sDD/Z8KO1wGbXXKctVhWVdGG9
	iWv6fMZ2f9beZR4Wi1ax0JNw==
X-Google-Smtp-Source: AGHT+IGrgBeOr4Q/absMM+Za+LCqe/Lll5BRdgNYHJVgjNFROenyLOx65DMpqcEBtUSR/JNtqFQe9uIFaPpojiNX1i4=
X-Received: by 2002:a17:906:dc8b:b0:aca:aeb3:c220 with SMTP id
 a640c23a62f3a-acb74720810mr1148270466b.0.1745226199906; Mon, 21 Apr 2025
 02:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421052804.11721-1-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250421052804.11721-1-hardevsinh.palaniya@siliconsignals.io>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 21 Apr 2025 12:02:43 +0300
X-Gm-Features: ATxdqUEQ8x2EIouk8KiFcVlxbg2SzLuyxAZXaUX5Lyn4hOI7kkBZXG-d9UCmXRI
Message-ID: <CAHp75VeZy3+0bGCNKjzPaK1Y234ZnZtG7v5iygtF1+Uhm9bTEA@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: Remove compat ioctl32 header file
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 8:28=E2=80=AFAM Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> Arnd's patch [1] removed the compat ioctl32 code, so this
> header file is no longer needed.
>
> Additionally, the definition of atomisp_compat_ioctl32()
> was deleted in Arnd's patch [1], making its declaration
> unused as well.
>
> Moreover, there are no references to this header file or
> the function(atomisp_compat_ioctl32) in the atomisp codebase.

> Link URL[1]: https://lore.kernel.org/linux-media/20210614103409.3154127-7=
-arnd@kernel.org/

Not so literally :-)
Should be just

Link: https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@ker=
nel.org/
[1]

> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

P.S. No need to resend, I hope Hans can tweak this whilst applying.

--=20
With Best Regards,
Andy Shevchenko

