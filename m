Return-Path: <linux-media+bounces-63317-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOg3HJbeHWpsfQkAu9opvQ
	(envelope-from <linux-media+bounces-63317-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 21:33:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C442D624AFB
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 21:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C17B230137B8
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 19:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995213812F7;
	Mon,  1 Jun 2026 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g1SfaUWc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A637C115
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341996; cv=pass; b=hMUVSmHDz+ToNPVQCAgSLB8IMGQ5xLyh0lH67wQoru+ihnuWxwSysAKxL60U6ZRug0lzy3l4bcNFfofWTBpQM3qGyabdh/Ko2AxGyG9ISbf08l/SOn4S/MHRukkFAe582VEokj+si0KkPeXzVjDMrzQxFqt0eqHwr2Ly3oPUvX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341996; c=relaxed/simple;
	bh=hpACHX8gpPgUdVyv1/sEpHCxZ58roJACIEZKoxqYnKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFaihz5nwdiSUpecuYZmoj7DW/mQY0/QWp+dXwm0Zd7b7rgqh1bwhdsAFFCs4CQwp68vxh44FbezODdWQodvSFVOEKq+oSwVBZZcbpm2XSBde9wRUFTeVpyb+b3jvg7CR3ozJ2ZQUMXASYpIwonELi8ojoGV4USfzUVIeQlTcyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g1SfaUWc; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa5cf787cdso41e87.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 12:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780341993; cv=none;
        d=google.com; s=arc-20240605;
        b=hQtPjPzRe52kxlvlOD2x+5C9srJuHvM4VjVaFuVoR4sWVd/dLnzHs4yWmB3wevumXc
         Q6pmxMmuT+P68J9pd57YE6OiHdv0sdk0k20rAvIfAO+rgYMxqxWJEJSLAut77KMpNFFJ
         ydNPPkzDL8mDvd8d7yPrRhL9VtjfgAHfCTD6Sv/zNxobQCCR4ywZQTHzeKBWRI4QAvoO
         1aT8DlqYpl3edTh1pCtseNSPtDkUXVjwbGa1W7j7JmeJI+1dzFzIi8dWSQd7BppJYGEY
         mpdGJVG0pc67roF0vlSTg7LfWaNzKQ03UMGO05zuPR7NSnPifU0UHUV6+S+ipMTjVUhd
         B1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RUETtszvlgjxvwcIcmAnMCzPRiN6e9NnLidclBHMCNQ=;
        fh=0ypUwrHPmYRRAEbptgs74WwOpbVnyQIvI/zRls+z2nM=;
        b=bR18EkvzfGnUPgqiO2oQh50XFh9lH+m3EZw7ZojUi5cmXgUZ3mAUn8rTk148+LutNZ
         U6R72TnQA1+OXoIsObDxQLbv+99yWEbrYdp4xKnEJNd/u9cLOwfrkkQMlwIceQP6Dy/d
         AUc8IC0KuBkmCVlb1LX+8bCENq86Q3FoU8WKMtehqhWvymqAbWjsgXPRZ9uFrQLeWJF8
         PvUYtdja2bsuaDrPLTEoJvvLPYLpfhFJhsrEP3YiZb7xV+nZ2PskSGnPqmvYXRN3jYfH
         AWS92VwxHRmS1JKuBZEZbHLmdRutyc0AsFo1uxkTH51IKLQfqlO/aE9vY3aLJiReFMrH
         bqsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780341993; x=1780946793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUETtszvlgjxvwcIcmAnMCzPRiN6e9NnLidclBHMCNQ=;
        b=g1SfaUWcyQfxtm+ARSabOP/RUnigKbuu3d9hg5nA8FOKVAHYlSX2ZLkM48ndQ1ICi9
         xuVhCLN7TC/2gwIVgWDpZHxN8JZZPZTlNdJR/ceEYfEOqCMOznvXa2+yNqs452UhluxE
         H1b0eXKxvY4gh6fmLh5AsR4YYYmxQAmENqdzVaGHZB3a1gcoE0+WmnIIrxYWTvSZFJE2
         CD9LD+vuerFATuIxin2D0q3oxUfINdIq7HbeBzrClapZAybB2twd73bb02GaI/6DQ6sy
         JrnP6aZa0trtstbimbx05j3iDcfgrsdOUV1KQcP6Fts3Quu20gVcsFjUic+CUbaVDvdq
         skJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341993; x=1780946793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUETtszvlgjxvwcIcmAnMCzPRiN6e9NnLidclBHMCNQ=;
        b=ORGgokMYdjKJ2PgAAP2xe4XKaaHjg0CkwwJF9aaikEkPbofhT0UfeHHmS9DeOzFxwD
         MJW+wyVZYW/4RewZS6ltKPzUi0cGzIpvXHc+e0g5i3VXZ5WrhjIwyxiQwjWCooEh77tw
         PxNDgbtN1hoQg4Mi6xKlju51d12N/U5K1JGlrrrzsQnbQwzSK4wJVZDGMmXUzoPH00tS
         Dhv4V917SySiUf9jYXjjeEmUJ6XBLM0QN2QMnmJgsFmDMpW3fukzdeGdHNz3CtNRtPim
         2lHIlmL0yChpon/YHaWymC81GFApFeNHWivI6rUydPnNTV7gWMbds8kJ80fjWqGxhNDK
         ATDg==
X-Forwarded-Encrypted: i=1; AFNElJ8L102FrzzKoA7DsxoDaMf/IrCTojSPs3LI1iW66H+pbN8JdbqZqA2HP4nF6xygO5yN+OC4viEJnLlEVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWwRoO+Uo0L22yd/CJpaox9AAeBX0aZiodHtxQP/J+cYnHro0
	p4+Hz+3qksTdLMFAC3S3wuWnPY5ZZ01uCpic3Bj/auoRE+LUMLns01XgyPEqkKRzJMxQKVhsNEw
	5DChCQCqsh/fUfvIUMbW2oklteV/oNhACY5a0zsA=
X-Gm-Gg: Acq92OGJLW9SEi+4DBR+4M1f1oAspYcqfmE2xrm1aAcbLN+VbsSgZjwtIrO1nbSjIKu
	b3zHAOyGAWXawWz86R9KbhEvhECo5AOsxy/f8kn+m7WDiM11Md7vALicfBCCrx2G+p35ErQb5gA
	ltU7FZGsHQFr0BgSRZZ1pH6L8bfBoa1ZBhYQiGK9ufz2YGmjv6NduCQSaBgB1uRr/hY1PWpufq7
	UFTqTRaj0Bs958tbN1c74lpQHOLHtvO3JojP1pVjXaTMM4uRkztpsMO5dDJvl8BfgV7ebxm8+De
	Yi6+FZQIg4XHgluvOwaDUbakgvQWLC0HZWG9kN4GIcRN6gE=
X-Received: by 2002:a05:6512:3a8d:b0:5a2:9b28:d64a with SMTP id
 2adb3069b0e04-5aa75b3495amr52247e87.8.1780341992156; Mon, 01 Jun 2026
 12:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528191658.2506362-1-xuehaohu@google.com> <20260601175252.GD2487554@ziepe.ca>
In-Reply-To: <20260601175252.GD2487554@ziepe.ca>
From: David Hu <xuehaohu@google.com>
Date: Mon, 1 Jun 2026 15:26:19 -0400
X-Gm-Features: AVHnY4KmXOz7naPVQt3RnYf5-sps0yuGM1iGSV6Zi0v2ewCpGm4R4O7z_6CO-gk
Message-ID: <CAPd9Lg8Um=0LJWB-QCqLyFksX=dTsu3hwuVXK9_CGRWTVBJppQ@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: Fix silent overflow for phys vec to sgt
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, jmoroni@google.com, praan@google.com, 
	stable@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63317-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ziepe.ca:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C442D624AFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 1:52=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Thu, May 28, 2026 at 07:16:58PM +0000, David Hu wrote:
> > diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-bu=
f-mapping.c
> > index 794acff2546a..1aabc0ee70bb 100644
> > --- a/drivers/dma-buf/dma-buf-mapping.c
> > +++ b/drivers/dma-buf/dma-buf-mapping.c
> > @@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_sta=
te *state,
> >               nents =3D DIV_ROUND_UP(size, UINT_MAX);
> >       }
> >
> > +     if (WARN_ON_ONCE(nents > UINT_MAX))
> > +             return 0;
>
> The WARN seems a bit much, but if you have it then it should be
> arranged so the caller ultimately fails.
>
> But otherwise I think correcting the types is a good idea
>
> Jason
Hi Jason,

Thank you for the feedback. That makes complete sense. I will remove
WARN_ON_ONCE() to avoid dmesg noise, and instead add an explicit check
in dma_buf_phys_vec_to_sgt() to fail with -EINVAL if calc_sg_nents()
returns 0 (on overflow).

I will send out v5 with these changes shortly.

Regards,
David

