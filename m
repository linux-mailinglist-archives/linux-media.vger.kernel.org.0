Return-Path: <linux-media+bounces-65671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E6BjBhGgPWqV4wgAu9opvQ
	(envelope-from <linux-media+bounces-65671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 23:39:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C296C8C5A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 23:39:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CxywOZ5q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65671-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65671-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 044583041A79
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 21:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2E336D9FE;
	Thu, 25 Jun 2026 21:39:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA53382F9
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 21:39:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782423566; cv=pass; b=mhYwGttUZwyK8Sv5bNlmMvsv4c1/OTtXtJXG2/DcqaK7FX/z+F/QiIsQE6WcHpHKbMaFvfRsgECJs/AoyyIQOJIRRkyZM6nBLeJrg+5Jmpw0u3u8tgmh0Xtvw/nuRm2XGYFukhgTbgeoLl/ZZjgdZ/M0WrTPrwrgPPD0Ew1mezA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782423566; c=relaxed/simple;
	bh=tMqDBWXtwbewyFWJNomKo6QD7x8D6J/Vy+ET01zxPZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+PJYGrN0ziR25vuoccLxd57kYAGMQz+Y0FY1NUWmSQJIszscT+Di5xTbZf7pF7WMmJWiaor1UxuGhjATJ28ztalhaDbK0k6y8kf77PGaahTBA6YixQOiaxK29R+dHUCHuOXnHKX/rSBmeo3Pp4O1WC4Fsq0MUyYzwswe+w7FUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxywOZ5q; arc=pass smtp.client-ip=209.85.208.180
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39979c2cc8bso2903891fa.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 14:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782423563; cv=none;
        d=google.com; s=arc-20260327;
        b=PY7IeOZiKddPEGbRDsjJx3Bm7IJ/INSOwxL08PS/j+F04AtByvNAiU1FPigUdqXk37
         LrRbe/b+Gn6CDj+1RopxaacsaNM+nYiZHaMl/ECUdf5EM/7dxOT7P95zTgh/iqRI2wcx
         +UkjlXtC4g/0fz7mkIgEvUrhZuQXAqn71MnzYfXZts8BSs1JuPpKhRQcjReXtu5LU/nU
         NsUXhhsqE610InR+bpV26VeEMQPhDh9QKRYnh4gGGfICviulsXbUN9nk+l/lj1NJyOH7
         iO1vQDLW9AiSKBN7RzV5xxXjeLspc8HN1+5AO8sJYUA9w28ZIPDNWqzJn1lNocY76V6A
         WzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04byS6lcMJDd7Dx2CVgLOvUYuZD/Xwl2CsV8qs3hJw0=;
        fh=+RhY4TDYeFaN8QrqHsu2z7tFgasqzOYN0pM9nbfzu6c=;
        b=DVf3z6kMSI22eaHk97Q/m0DHmV1VxucbxmADeEB2rOjU5OB4k4VCmnMMlRFQ5n0mN4
         s4aaZnB2GYMgWy9S/FTrweKOZ3vaGy+KcgBZPz5LspiLnipUj+QeUwUGosfC1jrEXDTI
         CZO+plYX41fr5ozabOg1pDOxMKxp9WArLePfLT5pEXNxDzUuJCor0VfgyXjnUbdd3rSy
         BZ7dgPOG8ZxT4SgVo2SfRwos3lZSjqyAosNFXYaV0bH/h1T5NdlncG3KbeX70/4eWZu7
         tuNi665QIV+Dqa1in47k8tGC0ydSYzS63pFoeaYXi84a5YlYwSGmbfABpDXUChOH9m60
         0mtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782423563; x=1783028363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04byS6lcMJDd7Dx2CVgLOvUYuZD/Xwl2CsV8qs3hJw0=;
        b=CxywOZ5qM1OqrN9CN6LuNTFugl9QlNCvBOQ4mmmWBKurjvILWm79pCibSgZc8XJd2L
         ejhSbvHqEa/6qHvosXZ5bMsluFpMSJ5mYpJHfXNNpJ0+OGyr8TOKzRcmwXZ9COgpO5kh
         8XnC6RlcMS40lgmSTLPb+zmRuAx9EpQIjm54QxQr6mVnWlcON8ME662mRq+v0lJpjBVs
         Pl2iDXleV70QbO7BjtBLrHeqN74lB+/EHXzwvfwFxqAi16dbwoklg7UbscYnolmAcCyv
         9k2lE1Lbia7yuWzwoIc3Rx6Wgvs9P3DOgGib1hbnpGoQit0AlsQ9OTZLyI1VZe3xki4d
         X+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782423563; x=1783028363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04byS6lcMJDd7Dx2CVgLOvUYuZD/Xwl2CsV8qs3hJw0=;
        b=EcYz+BvAN4sNRNX50W2OBuvpSlNEMXvGxPloRIwWnbz7u4sDoadt21MiS2X+Ona8hH
         qSbrJqFTtoFJsYzKd2DslN0lZRO48ciGxzmtYCjjf4rgC/FuYex9vqIjG+r63l8uuHYa
         u7wdptz6LoDMbZsiCIySsYpofs3kMaYbuXcf5Xd/6shVUgSvZt/EgBbCPKebbIAI3sBP
         +bxkLA7vZ8EHiIoQZ/S/t+JublLSK2u12GBjTHk1GJla6ZYT6y4rCxxpgPgQ4AiYShDa
         b/21ceEu/1pB7PK6NuETG+/VAAZ21hx0+v9YifNVLQ14uD2BP9YQbjwxc3QuUtA7oxD3
         RuBg==
X-Gm-Message-State: AOJu0Yxi9P+GZnBiegZbc7lKJ3CuDxEkn7ui2cS5WCg0crXFmem/SQDm
	DUMOXjx7qoTsNwaQa/mYdy+cpiIJKcE9MR0+GNaX1R8Rbf80RsrfrSP1hp0gd6hG2WCzTNn35vT
	xviDfGpHqLiQCoQ7RoHnpRjwCtzHKVgU=
X-Gm-Gg: AfdE7cme26gaY9MT+5bxO6AS2/JXqO0hP+E6dxQoPTu6Jmco7l+DdZIx7SN3alORmLQ
	KSBaBHadk3U8Kwp2IDR+QsR0/bgF0k8wA6wlonwEu4mJmbWzqIV70GrpThdT9rSESBNWx+2FE++
	HWBCuHwfe3UVPWmsLSSitS3N5fp4VCtXpdmsIHk0Tiv3n+lpbB5iPchtCND8K0vcF+4W0nBzSGy
	j3x9dUMJU1mn5tH5IRnBDAOaOpHNfuOvKgjC1g73g1OdrdqQ8R80U/Wv0cLOtCGa1mpXik=
X-Received: by 2002:a2e:b8d2:0:b0:39a:c901:f211 with SMTP id
 38308e7fff4ca-39acb92368fmr13425431fa.13.1782423562533; Thu, 25 Jun 2026
 14:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB-99LvD2cCmPt91Kh-1Zj69=_xczV6oUA7soAfFXQBcZxA+pQ@mail.gmail.com>
 <CAO3ALPx9FK=ayO8WWt7zguTfaA=e5q2wxUPc1ojpPFqFvstxBA@mail.gmail.com>
 <CAB-99Lu1+OB0OyKQLh9Y89+BdLc23j6nJAn59VbS9qVwAb-4vw@mail.gmail.com>
 <CAO3ALPxbYGG5fxO1Dd989bjg=a4xRLBSDwtDL41Bd9ym7pt6KQ@mail.gmail.com> <CAB-99Lt=XkfAa6aOvug9101qWOaLsQN7a0ss7bZ1OmPvvTETsg@mail.gmail.com>
In-Reply-To: <CAB-99Lt=XkfAa6aOvug9101qWOaLsQN7a0ss7bZ1OmPvvTETsg@mail.gmail.com>
From: Michael Goffioul <michael.goffioul@gmail.com>
Date: Thu, 25 Jun 2026 17:39:11 -0400
X-Gm-Features: AVVi8Cc1kCqa3-whBX3Fyww3loLHDlxtjINwdeItD4D22emUmaeu4z1nu8knlrA
Message-ID: <CAB-99LvB7kigD5Z2StaDmBLwQJPmKytihN9APUzyz7J=WRw67Q@mail.gmail.com>
Subject: Re: Support for Mygica A681B (ATSC/QAM USB tuner)
To: Forest Crossman <cyrozap@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:cyrozap@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[michaelgoffioul@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65671-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelgoffioul@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7C296C8C5A

On Tue, Jun 23, 2026 at 10:30=E2=80=AFPM Michael Goffioul
<michael.goffioul@gmail.com> wrote:
>
> On Tue, Oct 14, 2025 at 1:42=E2=80=AFPM Forest Crossman <cyrozap@gmail.co=
m> wrote:
>>
>> On Tue, Oct 14, 2025 at 9:13=E2=80=AFAM Michael Goffioul
>> <michael.goffioul@gmail.com> wrote:
>> >
>> > On Fri, Oct 10, 2025 at 11:22=E2=80=AFAM Forest Crossman <cyrozap@gmai=
l.com> wrote:
>> >>
>> >> On Sun, Jun 22, 2025 at 8:46=E2=80=AFPM Michael Goffioul
>> >> <michael.goffioul@gmail.com> wrote:
>> >> >
>> >> > Hi,
>> >> >
>> >> > I have a Mygica A681B USB tuner and I'm wondering whether there's a=
ny
>> >> > hope to have it supported by the Linux kernel. I've attached the ls=
usb
>> >> > output for the device at the end of this email.
>> >> >
>> >> > So far, I've downloaded the Linux driver from Geniatech web site. T=
his
>> >> > is made for Ubuntu 20 and kernel 5.4. From what I can tell from the
>> >> > driver sources, the device 1f4d:692f seems to use a mxl692 frontend
>> >> > driver, but it uses a binary-only mxl692_fe.o module, without
>> >> > providing the source code for it. Kernel 6 includes its own mxl692
>> >> > driver, however it appears to use a different interface/API (and
>> >> > apparently also a firmware blob that does not look to be easy to
>> >> > find...).
>> >> >
>> >> > Any help or hint would be greatly appreciated.
>> >> >
>> >> > Michael.
>> >>
>> >> Hi, Michael,
>> >>
>> >> I've recently submitted some patches [1] to enable support for the
>> >> A681B and its more-compact USB-C sibling, the PT682C. The patches are
>> >> not yet ready for mainline (hence why I marked them "RFC"), but
>> >> they're good enough to get the hardware working and streaming TV from
>> >> over the air. If you're willing to patch your kernel, the patches
>> >> should get you up and running while you wait for support in mainline
>> >> or your distro's kernel.
>> >>
>> >> Also, while the cover letter for the patch series contains a link to =
a
>> >> script I wrote to download and extract the firmware image from the
>> >> Windows driver, I recently learned that the firmware can simply be
>> >> downloaded directly from here [2].
>> >>
>> >> I hope this helps!
>> >>
>> >> Forest
>> >>
>> >> [1]: https://lore.kernel.org/linux-media/20251001051534.925714-1-cyro=
zap@gmail.com/T/
>> >> [2]: https://github.com/LibreELEC/dvb-firmware/blob/90261ae2934329f6c=
a84dd6c72d10d0777bf4b0e/firmware/dvb-demod-mxl692.fw
>> >
>> >
>> > Hi Forest,
>> >
>> > Thanks for the info. I will give it a try when I get a chance.
>> >
>> > Do you know whether this would support Clear QAM too? While I had some
>> > success with ATSC with some reverse engineering, I was not able to get
>> > the device to work with QAM (with the device directly connected to a
>> > VeCOAX modulator).
>> >
>> > Thanks,
>> > Michael.
>> >
>>
>> Michael,
>>
>> No, I don't think QAM works yet. The message for the commit that added
>> the mxl692 driver to the kernel mentions that "Only ATSC is currently
>> advertised via DVB properties. QAM still has issues." And the patch
>> series cover letter[1] mentions "The ATSC portion works fully, the QAM
>> portion needs some TLC and is therefore not listed in the DVB
>> capabilities." Since no commits have been added since then to get QAM
>> demod working, I think it probably still doesn't work. Not that I've
>> tried, though--my first objective was to just get the driver for the
>> A681B and PT682C working, then maybe later if I could get a Clear QAM
>> source up and running (I have some SDRs that can do this, but I
>> haven't used them in years) I'd try getting QAM demod working.
>>
>> All the best,
>> Forest
>>
>> [1]: https://lore.kernel.org/all/20210126015416.5622-1-brad@nextdimensio=
n.cc/
>
>
> Forrest,
>
> I finally found the time to try your driver and I was able to use the MyG=
ica A681B device on my desktop with ATSC. Additionally, using the attached =
patch, I was also able to use Clear QAM (both 64-QAM and 256-QAM, using a D=
ekTec modulator as source). So, thanks for the driver.
>
> That being said, it didn't work well when using the device connected to a=
n Android device (which is my target platform). Although the streaming work=
ed, there were regular streaming errors (video pixelation and buffering eve=
nts) making the device unsuitable for normal usage. A Hauppauge WindTV dual=
-HD device, used in the exact same test conditions (just swapped with the M=
yGica one), worked flawlessly. I didn't observe the same issues  either, wh=
en using the MyGica device on my normal desktop. I'm not sure whether it mi=
ght be due to the limited resources of the Android box, but if you have any=
 suggestions, please let me know.
>
> Michael.

It turned out the problem was due to a combination of factors:
- high rate of IRQs generated for USB/xhci (~ 1250 IRQ/s)
- Android handles most IRQ on the first core (there's no irqbalance in AOSP=
)
- busy core due to video playback (among other tasks)
This introduced latency in IRQ handling and eventually packet loss.
The WinTV device was not affected, because the IRQ rate was 10x
smaller (~ 130 IRQ/s). So I changed the buffer size defined in dvbsky
driver for mxl692, from 4096 to 32768, and that solved the issue for
me.

Michael.

