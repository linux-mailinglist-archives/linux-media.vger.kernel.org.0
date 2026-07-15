Return-Path: <linux-media+bounces-67682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aprmF2iKV2pMWgAAu9opvQ
	(envelope-from <linux-media+bounces-67682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 15:26:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622E75EA71
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 15:25:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="OhOEi/yz";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67682-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67682-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03808300A671
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC69343F4A7;
	Wed, 15 Jul 2026 13:20:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D73423E86
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 13:20:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121615; cv=pass; b=Rd+43njgpV9kDEm0wawFSEguxDqKzGb4O23UyocPR3y9pSPc5hEsjQzhnQXI1wAUkdR10X/MpUdvbHP08IBq/T6RsvB9WxXuBtPfKUGC3sLywGYq0ob1YTHDTGe+Alj8ilC02VlawZxFKtSsbRPc0BZpKh8yzoou+1kUsLrzFU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121615; c=relaxed/simple;
	bh=SlSFSIWLWH2oc8UzFRnHM3yL5Po5PvliK6hlvsEAwBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ov1DeW6PqIrjrHuUwJGShl53+7i5iZJFeTOqYpBUSFy1D3Z+zexjE3C80+UwR7TceH768i/yMD8/74zOcoxunXiYsSzecQoWi8CFCq/vmwnTeoTvpqcnhO1xt0wyXR2PqmW4fsDKSjhlcrHcnb21tp3ke1fzUB4KOlnPCmZCiYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhOEi/yz; arc=pass smtp.client-ip=209.85.128.181
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81eb46f76a1so5076747b3.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 06:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784121607; cv=none;
        d=google.com; s=arc-20260327;
        b=QZxyCaOwEm2gqflRkWZmCMlCIYicTBicaUnDp6JD9Dd6DY0+kFYV/ur3QCcCG84Yen
         Qz+2Riiq0gY4Z8v6zy6JfrBCnbPROchHMTgnmvmvvmNqWMJnVQoLNLCl8RyUpjjtPxVr
         F1O5e2vpySVvknH3qsjslrl+AkNn2gammEdmX8EjvExoOmfHGc2PVzh6DoRtOjDMf6c1
         Fo965h3YwlMSm4Wgk+7zpCIVpwSQiBWMV6yz5zsimhR2/jKT8GFFKco5K6bZtPRdCJ9x
         VrSdBna4rsdYeVX7gKZk8N6gUbyr8SeeixH+sET3rVd2E0lCJLq3jE+L3Rt7WySeAWtZ
         2tlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        fh=sjS0Fg2qrWUGp4IUuZWSPYCzLhFdxFE4YB3cbTR14uY=;
        b=U61yQpQLjREu3f1ZcAxJNeDq7x1iHKpiKpALI3ZCq/82DIjG8Vw7hrb+ud4YlCAZAm
         3hFILK8lVCZaHw8Wx+M73KUwYUehVl8+DPeFQs9f/p51XBHuWx/gHH8bAIHdI8F+s5Zg
         qe7NTlKrnXkxsyvFcej+Jh1V2UIMcKNMI/ukyDmvbeyutafSNBhAi5VaJyj6SCqlQj2t
         K/fqxrZjOxRh2Jt8juSxUQ4mAZ8sxBZd67nJE0WiOMG6dkAxjcvUAYfhPTAmCAG8CDSn
         +4Oa7k/f8EwuCHsmnqBajfTmNwOn9UDrpqYlgLX93tabODyalKa8pP2cXzUXvUXpEPqo
         sMSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784121607; x=1784726407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        b=OhOEi/yz+pSaw8QNY17aDkg7tcItW9V0JJA+61TrUTHyffW2ZlODHHXJGDf4lNY4Z4
         jhoIkQgoazUpdI6a7byyBNucs1MpgUXwsSzVKqLPlz6tLRMKGb01oyxhNWNZAQB4h1sj
         t7CinGzkDknimPNunxVt4SHBJYUOH9QQCbDp7RZVrN3vLHGryukTe/jA7TMC2k8darGq
         j5n+YELNCF6fL64CSmGTKHcreb2C9cjWZsl4w3YPWUvlxuSk/v6pki12V6jpThr1miPM
         Am00ele5ESc94dS0jXPlXnxJkkN+buKvR8Bz9a/Fv0RI1vU0W1r5Ezu3NqV4zDwRs2BJ
         mDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121607; x=1784726407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXY1t7E/1tBkZvLdCQEWkFucsdeDnwjuKZvuP0c9BUk=;
        b=iO24QBGakS/pV0cKOHF/sKa88m8nJPTkMV1Z0A4A2N/irf4MYdS2I7k7PyfeeAS9tP
         9m8Imvg3VBJZVbxa76tT83QZltYF3aaJ/1c+9FtTcDoZLMl5N0/86imC9bWrHtWDC6Dp
         Yi+2H3VFUn742d99aEXqB8aFUsYGfeWp7LqIFEBtah7zeLHt4kJht7OwNK3qkRSG6TzS
         NEsCYTw7dHY52yqh0NH2nhl7zbXy+QnJasSrwkiy+0Enha+zqOSHiVrHaA1J1NIMzrZs
         XEQAF4SXvH47seT4FZsxGxYs+ArAtqEELhn07oulUQtfiLFgJ7Q7qLD1UGrhQK/0Hecv
         lNYw==
X-Forwarded-Encrypted: i=1; AHgh+RoCmQ5VbZsvNAQG7UNAVEbk7a59f0ci1HEUDgXBR9T8pipmVTlxmqmT7qIyS+3Og1oHNo+LSFstHAn+XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS/YNVQfHXyycnOrJiT2ZbDpXLAsHTaVI+83ENdMXFKDOjY++Q
	OzJP0mvWD7GBMB1mc/0v/1YLp+DIYndkNXqekB9crlbQonUL2TeupxOml0fyUbzkH6n7w4AQVCt
	4XGp1/7xmtb+ZnLS8TVPH8bk6j7wLAmsgOU69rXo=
X-Gm-Gg: AfdE7cmYTB0bt7cAxSi8omOvncEzMoJB4nOyM3QUX6YydJIDMoQ6ujQ5Ifw1nM5xARv
	CBwPYWnPl4hGeogNbOy3mwG2XoF7RNdGqz5CiHC05H9Z63w5BNeY2umPVgIA2rbrDpD9VFr1v8W
	2UgASV0B23xnLeRHh9JRHlBVW35U96BAfAcLoRsB/n70o9IxWluV2L3Zj5CKl9BAkHNRe13VKOE
	8mr/H2zOHvjyg1vXzyKeqiXR6p82v/oI7SGxxqnGGRpP+iqz3IrkxrEOre8IA5a6LHepFq3XkT4
	gO3JQrVdvnb5Hrt/Cy6DolD/RQdGfLu3o6oee419rA==
X-Received: by 2002:a05:690e:408a:b0:668:f57:890d with SMTP id
 956f58d0204a3-6680f579a70mr2837584d50.6.1784121607296; Wed, 15 Jul 2026
 06:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org> <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
 <aleBPE5YHlC7pLpi@venus>
In-Reply-To: <aleBPE5YHlC7pLpi@venus>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 15:19:54 +0200
X-Gm-Features: AUfX_mwfTO8e_VPJdfOPse4or6ggrePK7Jx-SNC6g2Ok5lGwy5jpc5Cegi2PMVo
Message-ID: <CAEWPSH4AYfSR_DBcLFr6a=SJxnAAcjoK612v+g-TpP046qTBmg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67682-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sebastian.reichel@collabora.com,m:sashiko-reviews@lists.linux.dev,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:dmitry.osipenko@collabora.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,mail.gmail.com:mid,collabora.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5622E75EA71
X-Rspamd-Action: no action

Hello Sebastian,

> It should be 1 from the start as the DT binding is supposed to
> describe the hardware and be stable.

Thanks -- keeping const: 1 then.

> But in the next version you should look into updating the commit
> descriptions to be less about the kernel driver and more about
> the hardware.

Will do. I'll use your wording as the base for the v2 commit
message, document that argument 0 is the I2S and 1 the S/PDIF
interface in the property description, and move the consumer
reference (sound-dai =3D <&hdmi_receiver 0>) into the example
section.

For completeness: the driver part of the series currently wires
up only the I2S interface (DAI 0); the binding now describes both
interfaces as per the hardware.

Thanks for the review!

Igor

On Wed, Jul 15, 2026 at 3:00=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hello Igor,
>
> On Wed, Jul 15, 2026 at 08:55:37AM +0200, Royal Net wrote:
> > > Should the constraint be set to 0 to follow standard device tree
> > > norms?
> >
> > Fair point. The current RFC wires up a single I2S DAI, and for a
> > single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
> > exactly that for its one DAI on the TX side.
> >
> > The reason I picked 1 is that the controller also has an S/PDIF
> > audio output path (the vendor driver exposes both I2S and S/PDIF
> > DAIs through hdmi-codec), so a DAI index becomes meaningful if that
> > second path is wired up later.
> >
> > Unless the DT maintainers prefer keeping 1 from the start to avoid
> > changing the cell count if/when the S/PDIF DAI is added, I'll switch
> > to const: 0 in the next revision -- please let me know which you'd
> > prefer.
>
> It should be 1 from the start as the DT binding is supposed to
> describe the hardware and be stable. But in the next version you
> should look into updating the commit descriptions to be less about
> the kernel driver and more about the hardware. Maybe something like
>
> > The HDMI RX controller has two digital audio interfaces, one for
> > I2S and one for S/PDIF. Allow referencing connections from audio
> > codecs to these interfaces by documenting the missing #sound-dai-cells
> > property.
>
> Apart from that it makes sense to document that argument 0 means
> I2S and argument 1 means S/PDIF interface in the property description.
>
> Last but not least drop "A value of 1 lets a sound card reference
> the audio DAI as <&hdmirx 0>.". Instead you can add this to the
> example section at the end of the file.
>
> Greetings,
>
> -- Sebastian
>
> >
> > Igor
> >
> > On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Medium] Incorrect cell count constraint for single-DAI provider.
> > > --
> > >
> > > --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: a=
dd #sound-dai-cells ---
> > > commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> > > Author: Igor Paunovic <royalnet026@gmail.com>
> > > dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
> > >
> > > This commit adds the #sound-dai-cells property to the HDMI RX control=
ler
> > > bindings, enabling a generic audio codec to capture incoming embedded=
 audio.
> > >
> > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-r=
x.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > index b7f6c87d0e06a..83c10d9997c8e 100644
> > > > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > @@ -78,6 +78,13 @@ properties:
> > > >        The phandle of the syscon node for the Video Output GRF regi=
ster
> > > >        to enable EDID transfer through SDAIN and SCLIN.
> > > >
> > > > +  "#sound-dai-cells":
> > > > +    const: 1
> > > > +    description:
> > > > +      The HDMI RX controller registers a generic HDMI audio codec =
so the
> > > > +      audio embedded in the incoming stream can be captured. A val=
ue of 1
> > > > +      lets a sound card reference the audio DAI as <&hdmirx 0>.
> > >
> > > [Severity: Medium]
> > > Is this cell count constraint correct for a single-DAI provider?
> > >
> > > Looking at properties:#sound-dai-cells, the hardware exposes only a s=
ingle
> > > generic audio DAI. Requiring a cell count of 1 forces device tree nod=
es to
> > > use a non-standard syntax like <&hdmirx 0> instead of just <&hdmirx> =
for a
> > > single resource.
> > >
> > > Should the constraint be set to 0 to follow standard device tree norm=
s?
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026071505193=
9.64652-1-royalnet026@gmail.com?part=3D1

