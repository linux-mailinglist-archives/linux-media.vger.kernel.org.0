Return-Path: <linux-media+bounces-65490-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7pu6LFVBO2roUggAu9opvQ
	(envelope-from <linux-media+bounces-65490-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 04:30:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF256BAEF4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 04:30:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Yck48E+W;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65490-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65490-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC3B30342B2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7732DC76F;
	Wed, 24 Jun 2026 02:30:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A761FF1C7
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 02:30:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782268230; cv=pass; b=tt6PlfmmbdbOUQuerMVMdPdiNAodfVLYDtgEeNRExeOt+5B38hmGfoDKfe4zbnmTj7b4kRzTZMmM9t5qWLIVtaVM5Oc8aw2UhYVAooLZimOQXo4FT2gbE+F+2+z33NAsObrRPRXKrjtN+gWvaJKfewu+CzS+oAmnOd29MKfujus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782268230; c=relaxed/simple;
	bh=3aLup+DxksKgbEwW39dUgM29EE+dsMdQ6edZ4FCPW8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRSlNfK1h5BWaEy52d1oCkGBMHil0mNqLHGCf7Vy/yYALTB/KcsRHLViIWFgOfJEQMFCLB5voLPUhjKbUtBzqJZakBkhb2JhRjP9iRlwsVonfQa8Au1pw43tBdWaFF3o9/kTv/pAIo6ufEZJYwQP7epm+j/be5fFn9CMySJiKAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yck48E+W; arc=pass smtp.client-ip=209.85.208.181
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-399389dae7fso5121321fa.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 19:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782268226; cv=none;
        d=google.com; s=arc-20260327;
        b=Dt62ouyqW19Rvu1UQqBvCDHDPD5XaQVIM7QsPDTMCpPpOVdVj7J4/FhyLpSgdyReDM
         ftHqUGtZ51g1znb3yr0sjU4IvmKcWSbJe3h1EbUAk9GgULk7s6eMy1midRT0rEAffftw
         NJNvCE/01wV0Pp9ebm1cWZtB38SaKdPo8UzzdAOoexKsz4o7E9+fpw3xXOybh7jsWeNU
         XSvEy5pMOfcBw5INf35bFrOLZGv9hp7LetSj4Nm44pzxlLXj3aep/kiGsy9CgS0rwUVL
         KzGzo4RyovMwWaE3VVHpZV6Knc4dOScYQ3xMT0oKpyOwa7KUgOTVM3yA/hKc1RtiTREV
         p/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3aLup+DxksKgbEwW39dUgM29EE+dsMdQ6edZ4FCPW8Y=;
        fh=+RhY4TDYeFaN8QrqHsu2z7tFgasqzOYN0pM9nbfzu6c=;
        b=YipfnHBXSXmydhunGrJWvChbYmBHy+p2ywyGkOTymWBk4X7cQSgvX0vSnb9Pj+MeR9
         R7FMcWKW4BtaisQfkYGHyxs/7WuSP4zEewfUJ6kvkRzllFdLFdh8LUhMLUMWzQM8XudM
         rS0/bIu6jBtFQa3VbIQnZn5mt/BpQk2oB1qgV+efF8hT1Cdm7wzQsRwz6RWx5mD+lKiN
         L+4ZSrfsMPxT6xX2fKiyrTVcqFJxg8xLTUQdP+phKAm2HlJOQn2IOCHwVkRChxGn8oD2
         jEQoqtmZdB6GNeftKR71EvjGxVWB2nhk/Asr1xxcmpHIL28jd+qQ8Fh0dISzKCH3FRBT
         ZxHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782268226; x=1782873026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3aLup+DxksKgbEwW39dUgM29EE+dsMdQ6edZ4FCPW8Y=;
        b=Yck48E+WicYDk7bI4N5doEJF0vApAbyMS0JkB1wEvp1rdZJyTeYv39GQCG9M9YoF5E
         fNBvybSXEmfX/s5G+exGNV+Vw313O0ud+vkqqXZEZbFPhzTJLu8buYWFN73vfVeCkt57
         1cJslRu4O0Xvs8EPM0EIQdM8jwG5AekRhPoO1Bcsug0K7gYr5P7aq/GXzMj+42fa6ZLi
         jHv+Eeo+EUgOVJwu0P6Nd8Us51Ci0p2z/b9aRI6AgfVoLbbPCOKO47opCrQUve82ihSx
         q9cOoCf0ede90+By4AdbZrLLOjOV1XvsHFxoYE4BCeA8YYQM6rLkxVkIhHuhqaxjyOD4
         6Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782268226; x=1782873026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aLup+DxksKgbEwW39dUgM29EE+dsMdQ6edZ4FCPW8Y=;
        b=DObL0Cj0f9cSgEfAcRhVmnWif2CSALU6CL1BfzbhjQx9wRf7ycYL7rEQZYCYTx7A/x
         +T2B2TZ844e7lof4/fexh12verIKwSI8JKAjgh85NyPnc25RPX+5FjouaH3i1+BAdCDX
         Br/16Wj9NGx6yAsWIw1tzrl9EVmmtbmRvTF13rxh8C/WKpThPkniWHmuw7ZBVF/UBeJI
         atMnIKgrIPusynEJFSY7ehvX8CWJ8qlNcaGP2ienvflXyVNIfphEbzJfCNEbATM91kTH
         VQXbJz4SqjlXbQJXXJ9O1MYXAE79ZDDbWlRMFu3lm4BBdEV8SMSVMWSrISA1aXdKWZ+S
         +4tA==
X-Gm-Message-State: AOJu0YwxOOh68WMlUxgcKTBBh3wENDeyCBCBCwTZ0muJkO8WTXETcHON
	p2N4JffjqhpD6aj8861fWid3C6aX7tru8KU4wEzb2igdZY8xvLr7D74ejmezOccAulgq31RjVI8
	8VnZ0d8W/TFpUGN2S7Q3qCxL5xvQA9/UhuA==
X-Gm-Gg: AfdE7cnCJODsNqgYidzoycWc7jBKwgjYPv2dxNJ2HiRqaJ/OjiLFC7y8Je1G841xuCG
	Uk120BmGlv86ositLG43xluQfj4Qr6K4RyR30jH6Y4J8MUMvzFZmIdkn88VkJcTqDVjLaW3ITK9
	1lLPNgPMqK1md7hOJoZtCbSbTdhQQuVMdi31heIA1xD46JYE4DYLmRIuyE6e4FumYTjbhkRS3tO
	MwYWGOFmT3hbTy048JNu09Bsaof8ILegjAa++mDhdIgUuJBsWdWwtJq82Y77Ou5v+aejzk=
X-Received: by 2002:a2e:6a01:0:b0:399:6db5:3939 with SMTP id
 38308e7fff4ca-399c53c2fbdmr11191361fa.2.1782268225859; Tue, 23 Jun 2026
 19:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB-99LvD2cCmPt91Kh-1Zj69=_xczV6oUA7soAfFXQBcZxA+pQ@mail.gmail.com>
 <CAO3ALPx9FK=ayO8WWt7zguTfaA=e5q2wxUPc1ojpPFqFvstxBA@mail.gmail.com>
 <CAB-99Lu1+OB0OyKQLh9Y89+BdLc23j6nJAn59VbS9qVwAb-4vw@mail.gmail.com> <CAO3ALPxbYGG5fxO1Dd989bjg=a4xRLBSDwtDL41Bd9ym7pt6KQ@mail.gmail.com>
In-Reply-To: <CAO3ALPxbYGG5fxO1Dd989bjg=a4xRLBSDwtDL41Bd9ym7pt6KQ@mail.gmail.com>
From: Michael Goffioul <michael.goffioul@gmail.com>
Date: Tue, 23 Jun 2026 22:30:13 -0400
X-Gm-Features: AVVi8CeC1OX_UIxXI31fCdy0fjMhDjS5RL_vDrp6iOtYlQk9eF1XOr7_5pFayEE
Message-ID: <CAB-99Lt=XkfAa6aOvug9101qWOaLsQN7a0ss7bZ1OmPvvTETsg@mail.gmail.com>
Subject: Re: Support for Mygica A681B (ATSC/QAM USB tuner)
To: Forest Crossman <cyrozap@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000007f453e0654f6a81e"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:cyrozap@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[michaelgoffioul@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelgoffioul@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-65490-lists,linux-media=lfdr.de];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AF256BAEF4

--0000000000007f453e0654f6a81e
Content-Type: multipart/alternative; boundary="0000000000007f453c0654f6a81c"

--0000000000007f453c0654f6a81c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 1:42=E2=80=AFPM Forest Crossman <cyrozap@gmail.com>=
 wrote:

> On Tue, Oct 14, 2025 at 9:13=E2=80=AFAM Michael Goffioul
> <michael.goffioul@gmail.com> wrote:
> >
> > On Fri, Oct 10, 2025 at 11:22=E2=80=AFAM Forest Crossman <cyrozap@gmail=
.com>
> wrote:
> >>
> >> On Sun, Jun 22, 2025 at 8:46=E2=80=AFPM Michael Goffioul
> >> <michael.goffioul@gmail.com> wrote:
> >> >
> >> > Hi,
> >> >
> >> > I have a Mygica A681B USB tuner and I'm wondering whether there's an=
y
> >> > hope to have it supported by the Linux kernel. I've attached the lsu=
sb
> >> > output for the device at the end of this email.
> >> >
> >> > So far, I've downloaded the Linux driver from Geniatech web site. Th=
is
> >> > is made for Ubuntu 20 and kernel 5.4. From what I can tell from the
> >> > driver sources, the device 1f4d:692f seems to use a mxl692 frontend
> >> > driver, but it uses a binary-only mxl692_fe.o module, without
> >> > providing the source code for it. Kernel 6 includes its own mxl692
> >> > driver, however it appears to use a different interface/API (and
> >> > apparently also a firmware blob that does not look to be easy to
> >> > find...).
> >> >
> >> > Any help or hint would be greatly appreciated.
> >> >
> >> > Michael.
> >>
> >> Hi, Michael,
> >>
> >> I've recently submitted some patches [1] to enable support for the
> >> A681B and its more-compact USB-C sibling, the PT682C. The patches are
> >> not yet ready for mainline (hence why I marked them "RFC"), but
> >> they're good enough to get the hardware working and streaming TV from
> >> over the air. If you're willing to patch your kernel, the patches
> >> should get you up and running while you wait for support in mainline
> >> or your distro's kernel.
> >>
> >> Also, while the cover letter for the patch series contains a link to a
> >> script I wrote to download and extract the firmware image from the
> >> Windows driver, I recently learned that the firmware can simply be
> >> downloaded directly from here [2].
> >>
> >> I hope this helps!
> >>
> >> Forest
> >>
> >> [1]:
> https://lore.kernel.org/linux-media/20251001051534.925714-1-cyrozap@gmail=
.com/T/
> >> [2]:
> https://github.com/LibreELEC/dvb-firmware/blob/90261ae2934329f6ca84dd6c72=
d10d0777bf4b0e/firmware/dvb-demod-mxl692.fw
> >
> >
> > Hi Forest,
> >
> > Thanks for the info. I will give it a try when I get a chance.
> >
> > Do you know whether this would support Clear QAM too? While I had some
> > success with ATSC with some reverse engineering, I was not able to get
> > the device to work with QAM (with the device directly connected to a
> > VeCOAX modulator).
> >
> > Thanks,
> > Michael.
> >
>
> Michael,
>
> No, I don't think QAM works yet. The message for the commit that added
> the mxl692 driver to the kernel mentions that "Only ATSC is currently
> advertised via DVB properties. QAM still has issues." And the patch
> series cover letter[1] mentions "The ATSC portion works fully, the QAM
> portion needs some TLC and is therefore not listed in the DVB
> capabilities." Since no commits have been added since then to get QAM
> demod working, I think it probably still doesn't work. Not that I've
> tried, though--my first objective was to just get the driver for the
> A681B and PT682C working, then maybe later if I could get a Clear QAM
> source up and running (I have some SDRs that can do this, but I
> haven't used them in years) I'd try getting QAM demod working.
>
> All the best,
> Forest
>
> [1]:
> https://lore.kernel.org/all/20210126015416.5622-1-brad@nextdimension.cc/


Forrest,

I finally found the time to try your driver and I was able to use the
MyGica A681B device on my desktop with ATSC. Additionally, using the
attached patch, I was also able to use Clear QAM (both 64-QAM and 256-QAM,
using a DekTec modulator as source). So, thanks for the driver.

That being said, it didn't work well when using the device connected to an
Android device (which is my target platform). Although the streaming
worked, there were regular streaming errors (video pixelation and buffering
events) making the device unsuitable for normal usage. A Hauppauge WindTV
dual-HD device, used in the exact same test conditions (just swapped with
the MyGica one), worked flawlessly. I didn't observe the same issues
either, when using the MyGica device on my normal desktop. I'm not sure
whether it might be due to the limited resources of the Android box, but if
you have any suggestions, please let me know.

Michael.

--0000000000007f453c0654f6a81c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"background-color:transpare=
nt">On Tue, Oct 14, 2025 at 1:42=E2=80=AFPM Forest Crossman &lt;<a href=3D"=
mailto:cyrozap@gmail.com">cyrozap@gmail.com</a>&gt; wrote:</span></div><div=
 class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Tue, Oct 14, 2025 at 9:13=E2=80=AFAM Michael Goffiou=
l<br>
&lt;<a href=3D"mailto:michael.goffioul@gmail.com" target=3D"_blank">michael=
.goffioul@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Oct 10, 2025 at 11:22=E2=80=AFAM Forest Crossman &lt;<a href=
=3D"mailto:cyrozap@gmail.com" target=3D"_blank">cyrozap@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Jun 22, 2025 at 8:46=E2=80=AFPM Michael Goffioul<br>
&gt;&gt; &lt;<a href=3D"mailto:michael.goffioul@gmail.com" target=3D"_blank=
">michael.goffioul@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I have a Mygica A681B USB tuner and I&#39;m wondering whether=
 there&#39;s any<br>
&gt;&gt; &gt; hope to have it supported by the Linux kernel. I&#39;ve attac=
hed the lsusb<br>
&gt;&gt; &gt; output for the device at the end of this email.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; So far, I&#39;ve downloaded the Linux driver from Geniatech w=
eb site. This<br>
&gt;&gt; &gt; is made for Ubuntu 20 and kernel 5.4. From what I can tell fr=
om the<br>
&gt;&gt; &gt; driver sources, the device 1f4d:692f seems to use a mxl692 fr=
ontend<br>
&gt;&gt; &gt; driver, but it uses a binary-only mxl692_fe.o module, without=
<br>
&gt;&gt; &gt; providing the source code for it. Kernel 6 includes its own m=
xl692<br>
&gt;&gt; &gt; driver, however it appears to use a different interface/API (=
and<br>
&gt;&gt; &gt; apparently also a firmware blob that does not look to be easy=
 to<br>
&gt;&gt; &gt; find...).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Any help or hint would be greatly appreciated.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Michael.<br>
&gt;&gt;<br>
&gt;&gt; Hi, Michael,<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve recently submitted some patches [1] to enable support for=
 the<br>
&gt;&gt; A681B and its more-compact USB-C sibling, the PT682C. The patches =
are<br>
&gt;&gt; not yet ready for mainline (hence why I marked them &quot;RFC&quot=
;), but<br>
&gt;&gt; they&#39;re good enough to get the hardware working and streaming =
TV from<br>
&gt;&gt; over the air. If you&#39;re willing to patch your kernel, the patc=
hes<br>
&gt;&gt; should get you up and running while you wait for support in mainli=
ne<br>
&gt;&gt; or your distro&#39;s kernel.<br>
&gt;&gt;<br>
&gt;&gt; Also, while the cover letter for the patch series contains a link =
to a<br>
&gt;&gt; script I wrote to download and extract the firmware image from the=
<br>
&gt;&gt; Windows driver, I recently learned that the firmware can simply be=
<br>
&gt;&gt; downloaded directly from here [2].<br>
&gt;&gt;<br>
&gt;&gt; I hope this helps!<br>
&gt;&gt;<br>
&gt;&gt; Forest<br>
&gt;&gt;<br>
&gt;&gt; [1]: <a href=3D"https://lore.kernel.org/linux-media/20251001051534=
.925714-1-cyrozap@gmail.com/T/" rel=3D"noreferrer" target=3D"_blank">https:=
//lore.kernel.org/linux-media/20251001051534.925714-1-cyrozap@gmail.com/T/<=
/a><br>
&gt;&gt; [2]: <a href=3D"https://github.com/LibreELEC/dvb-firmware/blob/902=
61ae2934329f6ca84dd6c72d10d0777bf4b0e/firmware/dvb-demod-mxl692.fw" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/LibreELEC/dvb-firmware/blo=
b/90261ae2934329f6ca84dd6c72d10d0777bf4b0e/firmware/dvb-demod-mxl692.fw</a>=
<br>
&gt;<br>
&gt;<br>
&gt; Hi Forest,<br>
&gt;<br>
&gt; Thanks for the info. I will give it a try when I get a chance.<br>
&gt;<br>
&gt; Do you know whether this would support Clear QAM too? While I had some=
<br>
&gt; success with ATSC with some reverse engineering, I was not able to get=
<br>
&gt; the device to work with QAM (with the device directly connected to a<b=
r>
&gt; VeCOAX modulator).<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Michael.<br>
&gt;<br>
<br>
Michael,<br>
<br>
No, I don&#39;t think QAM works yet. The message for the commit that added<=
br>
the mxl692 driver to the kernel mentions that &quot;Only ATSC is currently<=
br>
advertised via DVB properties. QAM still has issues.&quot; And the patch<br=
>
series cover letter[1] mentions &quot;The ATSC portion works fully, the QAM=
<br>
portion needs some TLC and is therefore not listed in the DVB<br>
capabilities.&quot; Since no commits have been added since then to get QAM<=
br>
demod working, I think it probably still doesn&#39;t work. Not that I&#39;v=
e<br>
tried, though--my first objective was to just get the driver for the<br>
A681B and PT682C working, then maybe later if I could get a Clear QAM<br>
source up and running (I have some SDRs that can do this, but I<br>
haven&#39;t used them in years) I&#39;d try getting QAM demod working.<br>
<br>
All the best,<br>
Forest<br>
<br>
[1]: <a href=3D"https://lore.kernel.org/all/20210126015416.5622-1-brad@next=
dimension.cc/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/all/20210126015416.5622-1-brad@nextdimension.cc/</a></blockquote><div><br>=
</div><div>Forrest,</div><div><br></div><div>I finally found the time to tr=
y your driver and I was able to use the MyGica A681B device on my desktop w=
ith ATSC. Additionally, using the attached patch, I was also able to use Cl=
ear QAM (both 64-QAM and 256-QAM, using a DekTec modulator as source). So, =
thanks for the driver.</div><div><br></div><div>That being said, it didn&#3=
9;t work well when using the device connected to an Android device (which i=
s my target platform). Although the streaming worked, there were regular st=
reaming errors (video pixelation=C2=A0and buffering events) making the devi=
ce unsuitable for normal usage. A Hauppauge WindTV dual-HD device, used in =
the exact same test conditions (just swapped with the MyGica one), worked f=
lawlessly. I didn&#39;t observe the same issues=C2=A0 either, when using th=
e MyGica device on my normal desktop. I&#39;m not sure whether it might be =
due to the limited resources of the Android box, but if you have any sugges=
tions, please let me know.</div><div><br></div><div>Michael.</div><div><br>=
</div></div></div>

--0000000000007f453c0654f6a81c--
--0000000000007f453e0654f6a81e
Content-Type: text/x-patch; charset="US-ASCII"; name="mygica-qam.diff"
Content-Disposition: attachment; filename="mygica-qam.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mqrg5laq0>
X-Attachment-Id: f_mqrg5laq0

LS0tIC4uL2JhY2t1cC9kcml2ZXJzL21lZGlhL2R2Yi1mcm9udGVuZHMvbXhsNjkyLmMJMjAyNi0w
Ni0yMyAxMTozMToyMi4xNDc3NjUwMDYgLTA0MDAKKysrIGRyaXZlcnMvbWVkaWEvZHZiLWZyb250
ZW5kcy9teGw2OTIuYwkyMDI2LTA2LTIzIDIyOjE0OjA2LjM0OTc0MjM5NiAtMDQwMApAQCAtMTAy
MSwxMiArMTAyMSwyMSBAQAogCQkJZ290byBlcnI7CiAKIAkJcWFtX3BhcmFtcy5hbm5leF90eXBl
ID0gcWFtX2FubmV4OwotCQlxYW1fcGFyYW1zLnFhbV90eXBlID0gTVhMX0VBR0xFX1FBTV9ERU1P
RF9BVVRPOwogCQlxYW1fcGFyYW1zLmlxX2ZsaXAgPSBNWExfRUFHTEVfREVNT0RfSVFfQVVUTzsK
LQkJaWYgKHAtPm1vZHVsYXRpb24gPT0gUUFNXzY0KQotCQkJcWFtX3BhcmFtcy5zeW1ib2xfcmF0
ZV9oeiA9IDUwNTcwMDA7Ci0JCWVsc2UKLQkJCXFhbV9wYXJhbXMuc3ltYm9sX3JhdGVfaHogPSA1
MzYxMDAwOworCQlzd2l0Y2ggKHAtPm1vZHVsYXRpb24pIHsKKwkJCWNhc2UgUUFNXzY0OgorCQkJ
CXFhbV9wYXJhbXMucWFtX3R5cGUgPSBNWExfRUFHTEVfUUFNX0RFTU9EX1FBTTY0OworCQkJCXFh
bV9wYXJhbXMuc3ltYm9sX3JhdGVfaHogPSA1MDU3MDAwOworCQkJCWJyZWFrOworCQkJY2FzZSBR
QU1fMjU2OgorCQkJCXFhbV9wYXJhbXMucWFtX3R5cGUgPSBNWExfRUFHTEVfUUFNX0RFTU9EX1FB
TTI1NjsKKwkJCQlxYW1fcGFyYW1zLnN5bWJvbF9yYXRlX2h6ID0gNTM2MTAwMDsKKwkJCQlicmVh
azsKKwkJCWRlZmF1bHQ6CisJCQkJcWFtX3BhcmFtcy5xYW1fdHlwZSA9IE1YTF9FQUdMRV9RQU1f
REVNT0RfQVVUTzsKKwkJCQlxYW1fcGFyYW1zLnN5bWJvbF9yYXRlX2h6ID0gNTM2MTAwMDsKKwkJ
CQlicmVhazsKKwkJfQogCiAJCXFhbV9wYXJhbXMuc3ltYm9sX3JhdGVfMjU2cWFtX2h6ID0gNTM2
MTAwMDsKIApAQCAtMTI4NCwxMyArMTI5MywxMyBAQAogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGR2Yl9mcm9udGVuZF9vcHMgbXhsNjkyX29wcyA9IHsKLQkuZGVsc3lzID0geyBTWVNfQVRTQyB9
LAorCS5kZWxzeXMgPSB7IFNZU19BVFNDLCBTWVNfRFZCQ19BTk5FWF9CIH0sCiAJLmluZm8gPSB7
Ci0JCS5uYW1lID0gIk1heExpbmVhciBNeEw2OTIgVlNCIHR1bmVyLWRlbW9kdWxhdG9yIiwKKwkJ
Lm5hbWUgPSAiTWF4TGluZWFyIE14TDY5MiBWU0IvUUFNIHR1bmVyLWRlbW9kdWxhdG9yIiwKIAkJ
LmZyZXF1ZW5jeV9taW5faHogICAgICA9IDU0MDAwMDAwLAogCQkuZnJlcXVlbmN5X21heF9oeiAg
ICAgID0gODU4MDAwMDAwLAogCQkuZnJlcXVlbmN5X3N0ZXBzaXplX2h6ID0gNjI1MDAsCi0JCS5j
YXBzID0gRkVfQ0FOXzhWU0IKKwkJLmNhcHMgPSBGRV9DQU5fOFZTQiB8IEZFX0NBTl9RQU1fQVVU
TyB8IEZFX0NBTl9RQU1fNjQgfCBGRV9DQU5fUUFNXzI1NgogCX0sCiAKIAkuaW5pdCAgICAgICAg
ID0gbXhsNjkyX2luaXQsCg==
--0000000000007f453e0654f6a81e--

