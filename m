Return-Path: <linux-media+bounces-19886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC639A4153
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 16:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B83A41F24E3B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 14:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101C34C69;
	Fri, 18 Oct 2024 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiG4tHAu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C211D9686;
	Fri, 18 Oct 2024 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729262279; cv=none; b=cj4rXaWT1Yqf7bvPU2gKocP+im59syCFl/ry29H/6qmXagdW8VSQ0BtWQKj4KikzXym0tgFrKcMCQMr2O++nycyflwc3wCKvt8eVpoPLKjWVAKR8TGdP6Nz6jQ+kVlnDXWCRpik/npKVqWgVfuqX9DMzdgQ3m7UV18SFLNRjdlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729262279; c=relaxed/simple;
	bh=/yyE0BGb/moBwgooACTr9VFti4FrIkhryK2klPZDuCI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WS7X2LINWNBAAOyWVKQJouQ++gvQzjuN7+F4Lv3gMPo7Qihi+/H+18Rfds20Wc928wOojejpZimoogaMA5w+VP5nYQax3MK4PlgMA9R+zzhf0LXHu+uoUlZngmYfeLGk5SSMP6rB6HUCfIPlScep3EqVH1T9kUCE8huth3w9q9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiG4tHAu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFECFC4CEC3;
	Fri, 18 Oct 2024 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729262278;
	bh=/yyE0BGb/moBwgooACTr9VFti4FrIkhryK2klPZDuCI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=qiG4tHAuQBSyL/RgfKO+s2rjYAJhTmXb/qUKTsrukKbgNEOp3HY8HLukgvMNIEZRo
	 lbGk5Bj350yc2nL+nng3xf/tx8lOXN0tz/VZK76BOaFQsl4WpCsWs5hY9LjP2iCHz9
	 gslkj1QMZ8AoD/7O5CDkMdcHUUtYL267kzAsh1alz9fcKZimWYDmmgAIfoKxVlRWE+
	 m41fPDH/6/ojcEVB+RqCCF2u7nF54tgjDBU9dlEVDZ3SKySxscDH04kRmoBpPaB7E2
	 zkRFuM3ay9kYdr7pabvETjsYbe0PgSR1FpFMzXIBykSZ8sva/0TJIPe8x7EiJ/0mjH
	 oFeIfan81aBHA==
Date: Fri, 18 Oct 2024 07:37:52 -0700
From: Kees Cook <kees@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>, Kevin Hao <haokexin@gmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_04/13=5D_media=3A_dvb=5Ffrontend?=
 =?US-ASCII?Q?=3A_don=27t_play_tricks_with_underflow_values?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ab51f981844c700d4e66b366c8d2abde7c5947bf.camel@redhat.com>
References: <cover.1729230718.git.mchehab+huawei@kernel.org> <8d6193ed8d53ce94d595cb431627bbc7783c0e4c.1729230718.git.mchehab+huawei@kernel.org> <ab51f981844c700d4e66b366c8d2abde7c5947bf.camel@redhat.com>
Message-ID: <4D0C7D12-C645-4766-B7B1-0B34B2129579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 18, 2024 4:44:20 AM PDT, Philipp Stanner <pstanner@redhat=2Ecom=
> wrote:
>On Fri, 2024-10-18 at 07:53 +0200, Mauro Carvalho Chehab wrote:
>> fepriv->auto_sub_step is unsigned=2E Setting it to -1 is just a
>> trick to avoid calling continue, as reported by Coverity=2E
>>=20
>> It relies to have this code just afterwards:
>>=20
>> 	if (!ready) fepriv->auto_sub_step++;
>>=20
>> Simplify the code by simply setting it to zero and use
>> continue to return to the while loop=2E
>>=20
>> Fixes: 1da177e4c3f4 ("Linux-2=2E6=2E12-rc2")
>
>Oh wow, back to the big-bang-commit ^^'
>
>So is this a bug or not? It seems to me that the uint underflows to
>UINT_MAX, and then wrapps around to 0 again through the ++=2E=2E
>
>I take the liberty of ++CCing Kees, since I heard him talk a lot about
>overflowing on Plumbers=2E
>
>If it's not a bug, I would not use "Fixes"=2E If it is a bug, it should
>be backported to stable, agreed?
>
>Plus, is there a report-link somewhere by Coverty that could be linked
>with "Closes: "?

Yeah, this is "avoid currently harmless overflow" fix=2E It is just avoidi=
ng depending on the wrapping behavior, which is an improvement but not real=
ly a "bug fix"; more a code style that will keep future work of making the =
kernel wrapping-safe=2E

>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel=2Eorg>
>
>Anyways, this in my eyes does what it's intended to do:
>
>Reviewed-by: Philipp Stanner <pstanner@redhat=2Ecom>
>
>> ---
>> =C2=A0drivers/media/dvb-core/dvb_frontend=2Ec | 4 ++--
>> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/media/dvb-core/dvb_frontend=2Ec
>> b/drivers/media/dvb-core/dvb_frontend=2Ec
>> index d48f48fda87c=2E=2Ec9283100332a 100644
>> --- a/drivers/media/dvb-core/dvb_frontend=2Ec
>> +++ b/drivers/media/dvb-core/dvb_frontend=2Ec
>> @@ -443,8 +443,8 @@ static int dvb_frontend_swzigzag_autotune(struct
>> dvb_frontend *fe, int check_wra
>> =C2=A0
>> =C2=A0		default:
>> =C2=A0			fepriv->auto_step++;
>> -			fepriv->auto_sub_step =3D -1; /* it'll be
>> incremented to 0 in a moment */
>> -			break;
>> +			fepriv->auto_sub_step =3D 0;
>> +			continue;
>> =C2=A0		}
>> =C2=A0
>> =C2=A0		if (!ready) fepriv->auto_sub_step++;
>

But this change seems incomplete=2E The above line is no longer needed=2E

And I actually think this could be refractored to avoid needing "ready" at=
 all?

-Kees

--=20
Kees Cook

