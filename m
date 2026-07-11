Return-Path: <linux-media+bounces-67351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3fSjKZw2Umq3NAMAu9opvQ
	(envelope-from <linux-media+bounces-67351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 14:27:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A896741804
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 14:27:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=m01CCG6Q;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67351-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67351-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F8813010EDE
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 12:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC1D3C3BF4;
	Sat, 11 Jul 2026 12:27:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246053BB13A
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 12:27:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772825; cv=pass; b=fL9/5lMwlWhpNt7tQp7c2DL1GDDGMs26o2sEaLr2356Czza5K+B/cFp9QE2vy5GkAMOz+XseOl0tGC6Fae8l7W5AS8dQ1D/DNXdxjyLA9/NutgCRHG4jIMx6HitvGPmDzV1AOQN8PXBd0mHlHrivOIPvvrk8DslQK8hE7Y0byMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772825; c=relaxed/simple;
	bh=lKkBOFw65FVpqI9S/5kUTJVCqXb7nC0BIpdVR7JJA2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYJKGqBuSy9dtHUeuJpZBiYABLEYD4MLoazHfg90f6Um1EGfBRNHGniG6y8AW8H5qV+44iQQkx/Rrb1/Rwg0CMPtsRTKugN0PuMAqwlwZ+lxuKPCfmDzl3hAMUk0I0M9Gpqlc0Qz54221lHgQvEZX4k5Xt7m72WbkfqE9+lSyrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m01CCG6Q; arc=pass smtp.client-ip=209.85.167.175
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-48f0e5e6698so1035642b6e.1
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 05:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772823; cv=none;
        d=google.com; s=arc-20260327;
        b=HagGHGSrXjSCc+VQgIp4b5/5WC/HOY3I5hvtFqcktwgW0HzXcryYyTvbk/1G+WI8uh
         gE7o2VDp6lghaBte2FD7lUK5pE38APgw/QzcAbMuC9ZzQ06Y3/kVCG8li+IaLrraUw1D
         NjtjKtbgJf1Tgd9WP7mUYzvTQSkmhdaCQS5rLTtL0o7zO8CA9ebK3bwlLIxmr0nntwVS
         qj0JvitTQJzi1Tr6uSidyvQslyOwDwnVWL74FIDFZ8QoR3uDNiDf+etQ5pJvTlZlmgE4
         6EjtH+r+APhqIOXb/hnfoF9RFzfYj5JoqFyDXjR9lEC2x9PKQgKe+Ba6iUPl1hsbdsZ9
         ZuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        fh=bpID4yOPBfA7Mr++HCBYHGuYmJQfSZf3ton2QUyoDNU=;
        b=enJpvifOSaYcX7kL2pWfx5zb/tFlu74GUXXR9JZPEG1oMVRwXGLMdix0H58dAbF4lt
         5KY9jWQK3512F0bed/3kBt33GGt5OSZuLLdgBsdQSBYjxSUWnl8fnbfdHS3jWrogYjXT
         Lo48UbNNlMXtXOlLIgqFk5ez9W8tRGQu/fiZR6tVfsi73kAuXDwam4qpWdnhECMDAzZI
         Uog208a+YV/zG6k3tYMenRolGIND2+j7WPfig3oGnGU8pAMW/o5e9cc+VojLdDqmdRnz
         ULuTBD1Q/SF1Ghpsa8++FkSle4AFtKkArmT3zE0kyyG3i5ZczQXjrOziVfNgiqcmmC5T
         yoTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772823; x=1784377623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        b=m01CCG6QWz0qiSbTtKbFnZiVtWjTFCVng8Uan+nhtZpYvXg+6vSYd9fEddXTzCdExq
         EeWcO0EZCX/uIgDI8XSTzPwC0sdT8JqsQbWOogrrdvjm2COkK0vLUpQq23yWV1VABmHs
         vk3kxiJkUaSZPXcSqu9UIzyKjLAPbDrPsadCroby8rQBCbHZUHYnrbX1+fOG+xC3BAld
         j73xlv1J4lwVkBYVkHzfS/Shnm9Ec8FBNaanIKb97SqVskoskoXtLqzh22qQBOlRkoQv
         TBq29vv9rHh3BWrq7I0Qtmm7Eye9gGuitlpKiR1vOOO6Y4sD3Wxwk86WsT4YFzYlIJ1i
         thwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772823; x=1784377623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        b=k4rJnenz/Jc/+9kM2qfC/nWXlKxwvfZ7y3OWvDWsJOiMXLWGPvYdkv1WEWSLV67Mts
         Uwv+BlT3D/Nq19ezLEmYiGtQeMESfSZrR9hbpWfW1eqKeTPFd+ihGBTIMsNfWVuDoNVa
         5fWiFcKc2Id/MuudQdUlr/7kglDW70Vec/+HJEZC6jbrdN/Qoq5kqhX4vlGs/Rdmxw70
         trDfwuRYbVvYAXeHh0SV9yftiNktcJEw8yDvkmXCGjBYcUmnBlD2IFfHUET7GuliHkWu
         u7gru2Op9rvNvSklXLt5vf8KUt6ArCB1N8zBfZhmrs3Qzt5YEp9jwDfCR45H9DXQGsEK
         IeQA==
X-Gm-Message-State: AOJu0YzeeZ46oZdz85C/ugkiC8Bzz7oPIRT9Tb4X2I8kY+onkiur8I2Q
	m0TeQQ1jRiJZ1dwYYmZyRmE2JCj+w5JJD9jvyk+i2vdHok1IwfxBkr4FQFX0Mi4UUvOq9vmOPLv
	YrzCGGIWXDa5HmZiKloHluR8X05/JIpY=
X-Gm-Gg: AfdE7cmxYPd5xHOrL2Qvjqskyxq4XJ+cTm03ltlp2UhvtpiPsKBMF0Lha4dDaiLOgxx
	qmKxK1U623cXMG83k7m4/9ThpFYxMHJyHhkCIRySrY+OJ+NDq5vkLbsEe6SqWqyaaIyZluOL3dJ
	cLuTJIb/N5HrgT6S7he7ja1ZLUgZ23khdK0rUHZ+7uNpoQwEP9g37zebzQM/I81bGcvD4owNbOG
	Xb4O3iXmN4yr0cc8h+BkpTIms1LdSaJGco3wl86aFshV1+GIyhN+lysn7nKWS7DDkmtOktUkvYf
	8zseyBLZ2eg+ANzG12ZhH6LamJ7tdKJYAKcGJH2DwC0wwLOPwE4C+hA0FA==
X-Received: by 2002:a05:6808:4484:b0:4a3:5294:43d3 with SMTP id
 5614622812f47-4a42ac1c2e8mr1775095b6e.3.1783772823070; Sat, 11 Jul 2026
 05:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527124552.33815-1-arash.golgol@gmail.com> <ahfxskMC340jUtbQ@shepard>
In-Reply-To: <ahfxskMC340jUtbQ@shepard>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 11 Jul 2026 15:56:51 +0330
X-Gm-Features: AUfX_mxN86zZBxPKHCNMJW9RhtruJcbvwihBjdQU--ZAFLpMa1mHyqWXuxF1LQ0
Message-ID: <CAMxPZkgtu1_H=UQ6pRg0mtj=O4bq7gpEuTg-wmEtVAOP12qUJg@mail.gmail.com>
Subject: Re: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format entries
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67351-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,magewell.com,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:paulk@sys-base.io,m:linux-media@vger.kernel.org,m:yong.deng@magewell.com,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:laurent.pinchart@ideasonboard.com,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,paulk.fr:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A896741804

Hi,

On Thu, May 28, 2026 at 11:11=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> On Wed 27 May 26, 16:15, Arash Golgol wrote:
> > The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
> > MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
> > codes.
> >
> > Remove the duplicated entries from sun6i_csi_bridge_formats[].
>
> Looks good to me, thanks for taking care of this!
>
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

I'd like to gently follow up on this patch.

> All the best,
>
> Paul
>
> > ---
> >  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
> >  1 file changed, 12 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c =
b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > index d006d9dd0170..0bec0cd7620e 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > @@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_=
csi_bridge_formats[] =3D {
> >               .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
> >               .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
> >       },
> > -     {
> > -             .mbus_code              =3D MEDIA_BUS_FMT_UYVY8_2X8,
> > -             .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > -             .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> > -             .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> > -     },
> >       {
> >               .mbus_code              =3D MEDIA_BUS_FMT_VYUY8_2X8,
> >               .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > @@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_=
csi_bridge_formats[] =3D {
> >               .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
> >               .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
> >       },
> > -     {
> > -             .mbus_code              =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > -             .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > -             .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> > -             .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> > -     },
> >       {
> >               .mbus_code              =3D MEDIA_BUS_FMT_VYUY8_1X16,
> >               .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > --
> > 2.34.1
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

--=20
Regards,
Arash Golgol

