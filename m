Return-Path: <linux-media+bounces-33462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCD6AC4F98
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 15:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 571C717EF97
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CE9274668;
	Tue, 27 May 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="0zUaUtqo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47AD2741AB
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352123; cv=none; b=Aym+s5sqQ1j/CNrH4D3o3dxESDjBPr4bk9T3vMj38wcg60K6unBkdMkQqy8bqGYWoLmnw5QNjTl/BSKLewJZP2TN6c+eaIN10Q1NlZ2Im0wDtBCaEJKvKj6zCzhGD68g2cEEbeWdTJcD/SBI7hp9zeMfBRC7cquxAAOwmP1rQTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352123; c=relaxed/simple;
	bh=VyWGs92VxZHmYWq/MBjeYIKfJS3oITyIiMO5I+wjqS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XlR4opPnmYIvf2AHVnGegQHPCDx+cdjv+cp6U11/dsHKI0lIdzHLHzwWapxupRVQrywMvg27hkiezkazvWe0bUEyHUNTmPuY7k/jyyNy2nBeJsFfdR2YvA2TON4E4VpZRK86t7m9vWfFN7+pQQZtq7hsJglnB8hBzDhYl1mQBBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=0zUaUtqo; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5e39d1db2so183823385a.3
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748352120; x=1748956920; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VyWGs92VxZHmYWq/MBjeYIKfJS3oITyIiMO5I+wjqS4=;
        b=0zUaUtqop5RzqVPB8/4UsJPZFJastdqhSXlSQMVoQLBR+RuECoVeTEn8t89DMSYbuC
         qRPd2APug4sGJbzeSosJXs/QNIdBDIdmP9sRRasfzgVd7+e0SXiGzXCL0v006MjoOLX9
         0Vro09AbATX26oJi+aW0SfJHiZPzCzzAa8WUCoHgIaCXm8r/RXYUYmpVGs1gxjQqMDly
         9PT2Tj8XuL11YIEeYX7DcA9HKdGNEXC9jsffJiSHi8bgKoTKpoeWDqHhwDLRpLFb4R+t
         0WRIzzscMTxAuUM2vIxZkalDR25rMgRkGx6A5ABGKDyuPP6udzlj9faZWlv3nphWUwbE
         CVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352120; x=1748956920;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyWGs92VxZHmYWq/MBjeYIKfJS3oITyIiMO5I+wjqS4=;
        b=EO1kccCOtWkfROLB+gerz+NiXlB5bhZTmRcFbzqFPd/JEh/wCH2VpwLH4nkhZH5DLS
         obzfcQDC4WSrZXhs6aG1lTGOVv3fsANChVBDsjGNRWqPHPticr1a5Fg9VYGRdYmmN45x
         5PTviX7iynxmrU8J+CmY7CpZ3dCwT5MK8qjDZv+kcnxEbjmDuNPze+PQPHhVfBmGfaZQ
         OsEG5/h3PlkUcdPFnQnMtABKzryw1IojwTl6UP7dLJ1XrZx2M/98s6Pj66Um9KCu1g0I
         VpJ/lPpuf5vlJSroBozPMLj5vp8KWt+lW5uwmA9zd5BU0yYz1qDwk9RCQ3Jgj04wgmRE
         V3BA==
X-Forwarded-Encrypted: i=1; AJvYcCXtkF6sHPxCpxDgGJp7pO+YYL3rvvetLuS99pDPPS1b7CC+cCRB5WhWE2vxlyBbckT9aqu5gCqLOh7XBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN4K1YM3ghYz9db3uiU+7mpV8z+PukVbtqJPD2zGjph3Ky5kc7
	Z1sK91lqzsFrwgRiGG4DFTXOCFO4pamRc2cx9j4aefpTKqV0J1zNfyEX00MdMPY2Sbw=
X-Gm-Gg: ASbGnctMfSd3s70Sa6hD8CJY0P/OX8wasBd8EP3cX9gu5WQSjlHmwslsFj/EMeSMq5i
	XtYGD7gOnYbcOuIG2IJWI1MaUnT8IZXSO0oiXHO69gfvU3x4cjr25Szw/4eyD524k32XXT6b38q
	ktOPPa3i3McS5qM3eiGQ+d1u74I3Oi+LQgqS8hmsnaFMBv9yYxPVtZZWx2Q95m+sGxauSrLsWQr
	lsySuKT58VvDBlr/x7JZZVUPIunwSFbfqaQdP9jvuVNjZF1JWSKlh8J4Wr8lLFG1bKTZ6BtV2Em
	KWTkESpB1mIbalQs6qQ1xrXZIdagH/RyMSd4gLixyKVxGd64X/go+KpX
X-Google-Smtp-Source: AGHT+IGqjEuOc/rQc0o4CTVNkvRn1LeoDd94pgaJaN+RFhGpz7B5jdeGPrzKG2P1R07nsKaMUvmdnQ==
X-Received: by 2002:a05:620a:c4a:b0:7c5:e226:9da2 with SMTP id af79cd13be357-7ceecbf9338mr2045791485a.47.1748352120422;
        Tue, 27 May 2025 06:22:00 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467dd34csm1725927585a.47.2025.05.27.06.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:21:59 -0700 (PDT)
Message-ID: <30acbaadc08869687c22e6a70052571c99556979.camel@ndufresne.ca>
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>, Krzysztof Kozlowski
	 <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Tretter	 <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Michal Simek
 <michal.simek@amd.com>, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Junhao Xie <bigfoot@classfun.cn>, Rafa??
 Mi??ecki	 <rafal@milecki.pl>, Kever Yang <kever.yang@rock-chips.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Christophe JAILLET	 <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke	 <sebastian.fricke@collabora.com>, Gaosheng Cui
 <cuigaosheng1@huawei.com>,  Uwe Kleine-K??nig
 <u.kleine-koenig@baylibre.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Wolfram Sang	 <wsa+renesas@sang-engineering.com>, Ricardo Ribalda
 <ribalda@chromium.org>, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 27 May 2025 09:21:58 -0400
In-Reply-To: <uys462vhrhzeapzkve7z5k3xg6bjvpdne4xw44voqn6uhjdkmc@owrdgvraiqyb>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
	 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
	 <3e6be40a-2644-416a-bd32-f6256f1501ff@kernel.org>
	 <7863d15a-fa20-4db5-89b5-77a026d3f937@kernel.org>
	 <a72z6exgol5cbur2cy7wjwyroi4zddtki5ab3zdkfuwpskpavr@r26wahldhd3r>
	 <b5bb919e-6273-48ed-b5d8-29177dbbfb76@kernel.org>
	 <flwocneutp64bxxwfkfqvm6dq7klc2nu33ybr3ap6qeovopfq7@7qognvdf4zew>
	 <04e1f361-b3cf-4fdb-a008-42eb489f6c4d@kernel.org>
	 <uys462vhrhzeapzkve7z5k3xg6bjvpdne4xw44voqn6uhjdkmc@owrdgvraiqyb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Yassine,

Le lundi 26 mai 2025 =C3=A0 12:58 +0000, Yassine Ouaissa a =C3=A9crit=C2=A0=
:
> On 26.05.2025 14:46, Krzysztof Kozlowski wrote:
> > On 26/05/2025 14:27, Yassine Ouaissa wrote:
> > > On 26.05.2025 12:57, Krzysztof Kozlowski wrote:
> > > > On 26/05/2025 09:25, Yassine Ouaissa wrote:
> > > > > On 23.05.2025 19:13, Krzysztof Kozlowski wrote:
> > > > > > On 23/05/2025 19:11, Krzysztof Kozlowski wrote:
> > > > > > > On 23/05/2025 15:41, Yassine Ouaissa wrote:
> > > > > > > > Add compatible for video decoder on allegrodvt Gen 3 IP.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.=
com>
> > > > > > > Please do not send the same patches over and over again. You =
got review
> > > > > > > which you need to address.
> > > > > > >=20
> > > > > > > Once address you send NEXT version with proper CHANGELOG for =
each patch
> > > > > > > or top of cover letter. See submitting patches... or just use=
 b4. This
> > > > > > > should be actually requirement for this work.
> > > > > > >=20
> > > > > > > Anyway, I see all of previous review ignored so let's be expl=
icit:
> > > > > > >=20
> > > > > > > NAK
> > > > > > >=20
> > > > > Hi Krzysztof,
> > > > >=20
> > > > > Make sure that i'm not ignoring anyone reviews, i sent a new set =
of
> > > > > patches to start cleanly, and i have sent you an email about this=
.
> > > >=20
> > > > It is still v1 - the same? - while you already sent three patchsets=
 before.
> > >=20
> > > As i mentioned, this patch is sent to start cleanly, so it still v1.
> > > And the previous patchsets should be ignored.
> > This is not how the process works and it is not making reviewers life
> > easier. It makes it impossible for us to compare (try yourself with `b4
> > diff`) and forces to re-review everything every time.
>=20
> I know that i made a mistake by not respecting the "submitting patches".
> this is why, i prefer to start from a good base ( clean patches ).
> =C2=A0From this patchsets, You & I can use the b4 or other tools to get t=
he diffs.

For future submissions, once there is a base, don't try and "fix" things, j=
ust do
add V2, V3 on future submissions, even if its completely rewritten. Just sa=
y so in
your cover letter change log. If everyone was to reset to V1 all the time o=
ur work
as reviewer and maintainers would be completely un-manageable. Please under=
stand
and take our explanations for the future. There is no need for you to argue=
 on this,
this is not just personal preference. Same driver, second submission mean v=
2. That is
even true if you take over someone else series.

regards,
Nicolas

>=20
> >=20
> > Best regards,
> > Krzysztof
>=20
> Best regards,
> Yassine OUAISSA

