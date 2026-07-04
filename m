Return-Path: <linux-media+bounces-66587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oDFZO2Y5SWquzQAAu9opvQ
	(envelope-from <linux-media+bounces-66587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 18:48:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF949708008
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 18:48:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Iy5+KmK5;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66587-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66587-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D190300869F
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 16:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0A9373BEC;
	Sat,  4 Jul 2026 16:48:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714027707
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 16:48:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783183698; cv=pass; b=OvZRU50R976y0KXeETu3MQtqcXfI+C09gK0fIVtzpYFQM0Ps3a1xuU065yOMHpTCuxJgKx2jpa6Iw0+bYiPKxRuGJBiapKfKF3v+iNXC5x4gWVYllf6YSbFPVbQJYBWhQvxj6mpRgPMx+w1RGmbufDgmCAK2xVSLfm0/g7pE3TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783183698; c=relaxed/simple;
	bh=6u4HdF/D8Oe74jbT858It60RPJgVighEcTUvgQ1cukk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKRNWCWS5kyDlHVSuUdgGQ3qzW92+y7KDbYzoKYbBxaxZvMFEz/8cjWGUQ2FV2U9xN/9rKViPRPoarSpIAvJre7BZddGaPulzqQlRFwd8YlU31b+EkRBPqFTKN9Wctn3iz3Q4WtacWdsaP8QaXmNWz+fUYe4+sTSBCfGe8JtRgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iy5+KmK5; arc=pass smtp.client-ip=209.85.218.45
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1276b8c7e2so146234266b.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 09:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783183695; cv=none;
        d=google.com; s=arc-20260327;
        b=nnpYYOOX5w1WYepi0Y9tMmEY14WrdBQ+MSWD7x3tptpfIDLMzyeu3TT9iEQjwc/fYg
         /542fQqgOGItj4irXybD3e6AjRVBSCDbdY49P6zkman18OTfKAT+E+961jMp6G1malsQ
         W3Cw+3jdhQAfiR18je1opHfy44OLS7v0y3Ho+W75EQJbvnf/PAFdwHBPzIZWSs8C+KtE
         /3anCAk+9xy7b44Yb78KtgAc7fI1ynQOYBSBq83LDCueBzmGidphhVJhs0sNnVgNajEi
         NYWHRIke/kojR20BkTJQcsucRvuHjq8PCjzmF/kGhSQ8I2xET4aGlumZuD8zmKU0EuIb
         3JGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LtFcRccVXWV3jIWFIefXiUO2EXyRDVKEhdr6p8e27VY=;
        fh=qoFYOdf42JZVUhDNNpuosusoyiv/KTGZY3lstid8VT8=;
        b=YZEFzJ9rLOHMBn7nufLWseQ15iHADe87/tJ+iCgRH6xfKRKGNSE49RuaZz/H/eZOyw
         WVpyeNjY/H3ZA78Ct+ABcsAfTZUVBXjvk6tzMbl4CiESwBMYX+yYDiB9j5aTjOV0FZDo
         1S61ukR0hYQ6R4nGZUHWMvfDdWqJ0XC5F9rfg4r3M6+IAzx7Fs2m8gftlWfMIO83012S
         W8abnWR9HjCSbiOd7qpcrRxnPT8cb+Y+SP9ZFUbXWr7YBd9BGF7Z/1G+yka2RhshshyD
         Y90xQ+ZxgCQPMTyuDV5IwUTEbW8h7om3P/bVVZwLkkFAiXGbUmbNDp1qjimV5soKz3wX
         XDNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783183695; x=1783788495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtFcRccVXWV3jIWFIefXiUO2EXyRDVKEhdr6p8e27VY=;
        b=Iy5+KmK5K8fWKd7nZUXcxcdn1YcSHeEB7Jzm2ZeMTGuwkBS0WZju9YYk1qxokMaRcv
         Ihk6dT8OvR1qhw07OQBkJRePvPSWoT66hmw52Xt2Av0O9KP2zGSMxy/vhAVusJt9vzfJ
         VjYSdBqlZjmX3PdtOLQ4VIpOMvoJqzni4Jwjk9SxmYPg8/cHQl0njRFs4NXh4uhTM7eb
         l1kg4I++R2w1SaS0PLw9vmm4kPDP1OkllX2ntZqus/yDxJIbLfbrkZwVzupHIb2JBAwV
         nhVIIJUIhp2GAY2Hj6O8Pev4CPiedLHWRmTUI/f1bnhvWFJSbgT8xtYux9t57hBDZoig
         PlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783183695; x=1783788495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtFcRccVXWV3jIWFIefXiUO2EXyRDVKEhdr6p8e27VY=;
        b=EwS3ad0eErLzt41Ju+cG4M3it6qyFR9v4JKQIH5UqZvUksztu30MZV4EJe4k2R1q9y
         q1C4qmLNLotGasyL0ImpQDDf7mxHdZBiZt3xSrJM/PoxqiXvor5P8lDQUdlPi818MzUp
         L+SZEgKDu+yrtkQ4JASAf1dL2ICFwNiOgMzRRb8S7uvnAEHBS5umOC2w/DCa+CgUFx7K
         Tbw0Aax3HIdeaLL3IhlrPN+Ln63Rbq5MYEC+wzFCr0Kmq/5BGQcrJC4hY44aaNVhEXeY
         56EXOsukQfcmXzGDAH471e1nJ5NdoFxPXBT4fl2id32WMncoFwxtX5xlUoX8Yi9bX13Z
         XYQg==
X-Forwarded-Encrypted: i=1; AFNElJ9TvIccijUAHs0xCEoqLkivISx5lCcTchtp/Dy4fqTunq14M1XTnUpzTS5yEF/A1hqAHy85KbAjNkBmTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OKezG17biyK7e5wbNTWaCtL0vH4BVY8W4oyPpsqLIUeeVq0D
	A5fmI4Xra3wHEAPth9utFoNyjL0DfDtPQgA/02/wD5PJGsGCiYOdDdZuv1OLlpmPjHAjWQ/St5Z
	0Gb+UwMllvBtE8SUBBf/hRbZksg5iva0=
X-Gm-Gg: AfdE7cl+cCHZMOa/DVB9epOb54lszUeMOnKDne8elQkgf5+6II1HBBAq66uk6unTLA2
	JD8r4DNH62zMvTMM2AQLT35nRabMQjlEn0p++E2HvW2XXB6Ds1PhUkhzPce3FkGpG7SbP44lK+J
	nU+9o2w2TBkvAPLsJlL3liWw9iPiCKgGK1OGBy6eeRTe3PFFWU3ERMAUIi5sESOOt4chJaQRRWU
	w5yBeZDqGMyvan2sT63T5sTmzznZPF2dwiLrpIpCtS5pMKA2rWx+HmX30BMgdcEyjLA5BMtfVWj
	QGiyMbCbTvN1o2YnAlWeqmHTV4RlwcNGvWO+5yTvhrASRatMswXxnFxwcbhGeecnR9G8gEFAy8b
	mjkr0nWOSLpxi8GvqEUhs0IAos9YiVVvOWlc5fsoQ5PmK7fhMqJVvk0IXtA==
X-Received: by 2002:a17:907:1b08:b0:c0f:cbe8:7832 with SMTP id
 a640c23a62f3a-c12e6c773a6mr112448366b.48.1783183694777; Sat, 04 Jul 2026
 09:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704140055.88080-1-miraly.dev@gmail.com>
In-Reply-To: <20260704140055.88080-1-miraly.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 4 Jul 2026 19:47:38 +0300
X-Gm-Features: AVVi8CckRQ48RpwOmD0TBUNdiWh54ywDxlO-NJIYdI6QAynFVo8e2ykyMTUBNRk
Message-ID: <CAHp75Vd7-nLUnM=76Lr+G+sBxw2aPEBAwBJXqkM-JNRYHqx56g@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: clean up atomisp_v4l2.c style warnings
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-66587-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miraly.dev@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:miralydev@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF949708008

On Sat, Jul 4, 2026 at 5:01=E2=80=AFPM Ruziev Miraly <miraly.dev@gmail.com>=
 wrote:
>
> Fix checkpatch.pl warnings in atomisp_v4l2.c regarding unnecessary
> ftrace-like logging and redundant else statements after return.
>
> Remove dev_dbg() calls that only log function entry, as ftrace should
> be preferred for this purpose. Also, remove the unnecessary else block
> following a return statement to flatten the code structure.

...

> @@ -468,22 +464,18 @@ static int atomisp_mrfld_pre_power_down(struct atom=
isp_device *isp)
>                         __func__, irq);

^^^

>                 spin_unlock_irqrestore(&isp->lock, flags);
>                 return -EAGAIN;
> -       } else {
> -               pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -               irq &=3D BIT(INTR_IIR);
> -               pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> -
> -               pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -               if (!(irq & BIT(INTR_IIR))) {
> -                       atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0=
x0);
> -                       goto done;
> -               }

> -               dev_err(isp->dev,
> -                       "%s: error in iunit interrupt. status reg=3D0x%x\=
n",
> -                       __func__, irq);

You removed this one and the above branch seems to have the similar
one. Be consistent.

> -               spin_unlock_irqrestore(&isp->lock, flags);
> -               return -EAGAIN;
>         }
> +       pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> +       irq &=3D BIT(INTR_IIR);
> +       pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> +
> +       pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> +       if (!(irq & BIT(INTR_IIR))) {
> +               atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
> +               goto done;
> +       }
> +       spin_unlock_irqrestore(&isp->lock, flags);
> +       return -EAGAIN;

--=20
With Best Regards,
Andy Shevchenko

