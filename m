Return-Path: <linux-media+bounces-39619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A1BB23353
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 20:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E73493AB7F9
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 18:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A932FD1C2;
	Tue, 12 Aug 2025 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2A/Py0u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DA21EF38C;
	Tue, 12 Aug 2025 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755022988; cv=none; b=R9aB7eUyYQC02yFwG9dptyOlNRspdKZpM6cEMfKZ335zunnJiQ798VgTloK1s+8L2J+cjrvaWrFyW4td19XMrDYhuHxMYO5NthNo7Eb6O1lkNrgswrgPJebHN3nJRA68j/ceR4qsOtY7nACv0Mkt4MmNAJ7eyUmq3LT9qfgH5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755022988; c=relaxed/simple;
	bh=+3/e5cIrN3ZIg7Q/XkiiWzgfGgeF/Y6e5OkSlLU191A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZolcy/iZG6dDqFhyKU2dQ7/weCT9AYQR63TeexWWahd9ACdN+oOBbq3/IF6DMx47cCQFdTo5eHPm8YfyoC4hKK7DOv3i9eeeSdrTd1dfjpLImopqs9AFKNAwbpRfjbQYLaI74NYkeJLXqLSYlYqRFQAiOBdlBmZCFH/ESJmMFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2A/Py0u; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74264d1832eso7243005b3a.0;
        Tue, 12 Aug 2025 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755022986; x=1755627786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+fE4qi+RcEuypAjW0Bd5U93e0N2So4i7NT1OnYWUSk=;
        b=R2A/Py0uCPL8xZ3PcKpiSj1/D1HVk8sS1+t0lgKPzTa4Yi8qq75ZVjvdIFmAbeVMzL
         CqWI/shBoX/jKO+Fhc585NY/tLPW0QhuUew6KWdpMD0iF5Hzu2sURfQ6ACK/Frc2m0tY
         JTwNJqExFDbKKklOHRn7jkXAPzUOI/Kn5dmtPiZk98gMt1211sXnQ38Ih/aSpb5n50uP
         CVcojmP5cAno/KVuzOpf4xE+zw7skgq0sRwuXDB1nwi9pHW7ncmYUUq6zAkpIM6bW93R
         4mx/+KkY1/GAYt9g2mESAVvhlOtrJu+dOpWIHpIJem4b7C9gW6Kd7uZoKG0AIyLbfiyI
         XZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755022986; x=1755627786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+fE4qi+RcEuypAjW0Bd5U93e0N2So4i7NT1OnYWUSk=;
        b=G18gp8Nlgq43qqPHR0jkrKJQ5tyyl7biEtOcaaDo8lBpzk58axhtjRgS2+O5dFxxo6
         giiBpA+n0Ev6VJjDSg5Qziqh9IVjOIHc0pou6YmrIZY03431draVSxmaaRQag5ItCfIT
         wGFk+GiCSE8+gz6qyGpY9XJ75M+LzeqkKXI+d7lkSWqaU5+wVFI450fwjoqANM4/1IC2
         nmFmwCPkw14a+R6P+NgEL9Mu4Moaq/GwJg+7kVJotISWZ6zbUvjVtXlr4iX2lIt8DvpP
         A0zDlH2yB+dBbQATr5uUosOK5JzteEGJM19QgwkT5fvRN67oB+e3/DGjvFhKhUfpGM67
         vk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsJcsNQjURum3noaRE1F4nZRQwpNy33QYPF8zanJSfmEJdbvRzWHfQ2myn4U4z6T2KHZfRCeVOH/K9KwM=@vger.kernel.org, AJvYcCVbgWXafOFBYLFZkikZj2L70tnL7sBvG64s9RnpQ6PIcdGBJgIxv6ZsZsa5fdrvv4A8+GXQ54VCjMzL04Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqeoU+xi9L5usayzk+bpYlVQPBdic9esgxV+diesok5zW8Jpwi
	XajddRJDBoGsqy+/QF51yBWqBCbDKoyga9trn6U61jvUqBtX7t32zsEpeTsc0t9kJBfhW3Qc9HE
	F8XNI2LPrwMNvLMAGrP0COIloAnuFk2Q=
X-Gm-Gg: ASbGnct2DxPWc5sQOvlO078JUwyluzCYGgJIn00ntrGTOodPGxboNd/+wI8HeRIy8wZ
	fQyoqhULVeaGw5GUKAkubDVCAyuT7UBs6VRp2o5iLkfUlWn/ZMq5WiscWteIsuR4ptbIrmwhZtN
	p9xpexQ1LgXNPtTyNdyye0xOc0+EJXgKbHVPPDRshVM7vVSY/Z5vfLt0zyDMHe+cLxFjYDqvb6K
	NITYnA=
X-Google-Smtp-Source: AGHT+IF1A81h6PBEtWt1slLi737ERxn8vSMYRw2gKSj0MQoOmspT2W2SwpWW3xVupvi6KHU+18JPG2LtGK88eiUCFBY=
X-Received: by 2002:a17:902:f612:b0:240:10dc:b795 with SMTP id
 d9443c01a7336-2430d08b468mr3464675ad.1.1755022986134; Tue, 12 Aug 2025
 11:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175308758352.3134829.9472501038683860006@localhost>
 <175326599663.2811177.16620980968274114885@localhost> <m3h5z2vw12.fsf@t19.piap.pl>
 <175344176070.2811177.10693943493658922992@localhost> <m3qzxyug1s.fsf@t19.piap.pl>
 <m3cy9futcj.fsf@t19.piap.pl> <m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl>
 <m3a545t789.fsf@t19.piap.pl> <20250812103243.GK30054@pendragon.ideasonboard.com>
 <175501095338.74722.11604545949710100799@localhost>
In-Reply-To: <175501095338.74722.11604545949710100799@localhost>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 12 Aug 2025 13:22:54 -0500
X-Gm-Features: Ac12FXwjCPlZoDfcVHADfdJKsSiklxExi-nNGmkRvmvpKutlc9OII1WL40p-4DM
Message-ID: <CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:07=E2=80=AFAM Stefan Klug
<stefan.klug@ideasonboard.com> wrote:
>
> Hi Krzysztof, hi Laurent,
>
> Quoting Laurent Pinchart (2025-08-12 12:32:43)
> > Hi Krzysztof,
> >
> > On Tue, Aug 12, 2025 at 07:54:46AM +0200, Krzysztof Ha=C5=82asa wrote:
> > > Hi Stefan et al,
> > >
> > > BTW I've added Lucas Stach and Shawn Guo to "Cc" list.
> > >
> > > The problem is the CPU core power supply voltage :-)
> >
> > Ah, the dreadful overdrive mode.
> >
> > > - while the reference manual specifies the max ISP and MEDIA clocks a=
t
> > >   500 MHz, the datasheets show this requires the "overdrive" mode =3D
> > >   increased CPU power supply voltage. In "normal" mode the ISPs are
> > >   limited to 400 MHz (there are other limits, too).
> > >
> > > - I've tried lowering the clock rate after booting the systems (with
> > >   a CCM register write), but it didn't fix the problem. I guess some
> > >   reset logic is affected here, and the (lower) clock rate must be se=
t
> > >   right from the start, in the DT.
> >
> > That's interesting. I wouldn't have expected that.
> >
> > > - anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
> > >   the ISP2 MI corruption. I'm currently investigating PMIC settings
> > >   (both my Compulab and SolidRun modules use PCA9450C PMICs), so perh=
aps
> > >   I'll be able to use the higher 500 MHz clocks. It doesn't matter mu=
ch,
> > >   though.

I was reading through the data sheet (not the reference manual), and
it lists a few limitations for the clocks:

For single Camera, MIPI CSI 1 can support up to 400/500 MHz pixel
clock in the Nominal/Overdrive mode.
For single Camera, MIPI CSI 2 can support up to 277 MHz pixel clock.
For dual Camera, both MIPI CSI can support up to 266 MHz pixel clock.

If you're running dual cameras, it sounds like you're capped at 266
MHz regardless of whether or not you're in overdrive or nominal.



> > >
> > > - the question is if we should lower the clocks in the main imx8mp.dt=
si
> > >   DT file, or the overdrive mode should stay there, and the changes
> > >   should be made to the individual board files, or maybe the U-Boot
> > >   configs (PMIC output voltages) should be changed etc.
> >
> > I think it would make sense to lower the default clock frequencies, and
> > provide an overlay to enable overdrive mode.
> >
> > It's also interesting that the issue only affected the second ISP, as
> > the first one should also be limited to 400 MHz in normal mode.
>
> I support that. As a side note, there is already imx8mp-nominal.dtsi
> which is only used by one board. That dtsi also uses the
> fsl,operating-mode property which enables additional clock checks. So I
> ask myself if the default imx8mp.dtsi should specify overdrive mode, or
> if we should add a imx8mp-overdrive.dtsi (then we should possibly rename
> them to imx8mp-mode-xxx.dtsi so that they sit side by side) to make it
> easier to create overlays for both cases.

My understanding is that the imx8mp.dtsi is pre-configured for
overdrive mode, so if you need to run the ISP in nominal, the clock
updates should go into imx8mp-nominial.dtsi.

adam
>
> Best regards,
> Stefan
>
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>

