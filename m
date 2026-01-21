Return-Path: <linux-media+bounces-51278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGDMKqn1cGmgbAAAu9opvQ
	(envelope-from <linux-media+bounces-51278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 16:50:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B7459771
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 16:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 15E8B728A31
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0812B4A2E36;
	Wed, 21 Jan 2026 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P54WYVbs"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C64A2E26;
	Wed, 21 Jan 2026 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006818; cv=none; b=Qewi7/0c8Kv+cg/VKwg+17gbnlf7qEjU76XlpFyveoX/z7yeIKKYnu7PAtr5ufZYbOebXNOfip4majyMpKAsGIRPZwsv3KXGBKgfUEMy7maxUxaqKMk8LqL0jirvN7jJBrZh/f57vwn/EwpA+//toFYiWrt4S1g+llY+Oj++Q+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006818; c=relaxed/simple;
	bh=afNV+4Kntzl2OJS5+YQHRny1CbURCs2XIYTp9jU1WYU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cmcdKBivvRarx7zlp5EnPC4AfP/JqdhxVf5ZdzXpUZsDAWMVUksezMUwGMbeJ4uuNtmJf/Cbd87zZ8MNaGm82pXslsnuAuoVvJIX0ekXpRAyJvOHPLMqFRhM3se+InyzZHkDIQMrM7Sp3t7vgpVzvrtmzkupGj8rkCU+AxL4lKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P54WYVbs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769006813;
	bh=afNV+4Kntzl2OJS5+YQHRny1CbURCs2XIYTp9jU1WYU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=P54WYVbsl17MXk2LcSxoBkOPZ+v81dklD6Yc/blcHFG8sQyIqIvF+MMRH6T4kaMDv
	 Pxjo1NMW89sPRxGJFPkURFW1nWxsppd5963XazMJ726o6P/Iivoe7ec6ArmAQtamaO
	 RlZyD7+bGDIGYPQHWw4oE32TfcDBZMg5TZYmlI0l9dEdtr06159ivtRWbsW9e4awTp
	 4JrJvUoVQc2xrpYWyHOtVJluq9aPIwQkJerYHttPM1RBiv/vy2S6OAhougTe9RdHIV
	 /r+5JJPd01uc3aTkRStbsetRpip9w6jVKRc4NTRpPW+rxSOZezyf7nN1TPm/6K4DEV
	 0I9Nquhwzkj7A==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E1FD417E12E5;
	Wed, 21 Jan 2026 15:46:50 +0100 (CET)
Message-ID: <69fda4f0136285e4d2f86e7e93d5bdd812c1d47a.camel@collabora.com>
Subject: Re: [PATCH v9 15/17] media: rkvdec: Add H264 support for the
 VDPU383 variant
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: kernel test robot <lkp@intel.com>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, linux-media@vger.kernel.org, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Daniel
 Almeida <daniel.almeida@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 Ricardo Ribalda	 <ribalda@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Yunke Cao	 <yunkec@google.com>, Hans de Goede <hansg@kernel.org>, Laurent
 Pinchart	 <laurent.pinchart@ideasonboard.com>, Pavan Bobba
 <opensource206@gmail.com>,  Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>, Diederik de Haas	
 <didi.debian@cknow.org>
Date: Wed, 21 Jan 2026 09:46:48 -0500
In-Reply-To: <202601211924.rqKS2Ihm-lkp@intel.com>
References: <20260120222018.404741-16-detlev.casanova@collabora.com>
	 <202601211924.rqKS2Ihm-lkp@intel.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HUBaFbLuQRAvVZ40o0vh"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,vger.kernel.org,vanguardiasur.com.ar,sntech.de,collabora.com,lwn.net,chromium.org,xs4all.nl,google.com,ideasonboard.com,gmail.com,linux.intel.com,blaize.com,lists.infradead.org,kwiboo.se,cknow.org];
	TAGGED_FROM(0.00)[bounces-51278-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	DMARC_POLICY_ALLOW(0.00)[collabora.com,none];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,01.org:url,intel.com:email]
X-Rspamd-Queue-Id: 53B7459771
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-HUBaFbLuQRAvVZ40o0vh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 21 janvier 2026 =C3=A0 22:27 +0800, kernel test robot a =C3=A9c=
rit=C2=A0:
> Hi Detlev,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on rockchip/for-next]
> [also build test WARNING on linuxtv-media-pending/master media-tree/maste=
r linus/master v6.19-rc6 next-20260120]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0 https://github.com/intel-lab-lkp/linux/commits/Det=
lev-Casanova/media-uapi-HEVC-Add-v4l2_ctrl_hevc_ext_sps_-ls-t_rps-controls/=
20260121-071026
> base:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/mmind/l=
inux-rockchip.git=C2=A0for-next
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20260120222018.40=
4741-16-detlev.casanova%40collabora.com
> patch subject: [PATCH v9 15/17] media: rkvdec: Add H264 support for the V=
DPU383 variant
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/2=
0260121/202601211924.rqKS2Ihm-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project=C2=
=A0cd708029e0b2869e80abe31ddb175f7c35361f90)

Modification has been done to reduce the stack utilization on clang, though=
 we
believe we are hitting limitations/bugs on older clang. We went ahead with =
these
patch by updating our CI to clang 21, which allocate a lot less stack with =
KASAN
enabled and this code. Our general advise is to use a newer clang, or GCC f=
or
testing with KASAN.

The stack utilization is caused by the combination of loop unrolling, agres=
sive
inlining, and write operations to bitfield (which requires the compiler to
generate more code for memory checks, since the writes are not aligned).

cheers,
Nicolas

> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260121/202601211924.rqKS2Ihm-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601211924.rqKS2Ihm-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> > > drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c:485:12: =
warning: stack frame size (2064) exceeds limit (2048) in 'rkvdec_h264_run' =
[-Wframe-larger-than]
> =C2=A0=C2=A0=C2=A0=C2=A0 485 | static int rkvdec_h264_run(struct rkvdec_c=
tx *ctx)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0=C2=A0 1 warning generated.
>=20
>=20
> vim +/rkvdec_h264_run +485 drivers/media/platform/rockchip/rkvdec/rkvdec-=
vdpu383-h264.c
>=20
> =C2=A0=C2=A0 484=09
> =C2=A0> 485	static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> =C2=A0=C2=A0 486	{
> =C2=A0=C2=A0 487		struct v4l2_h264_reflist_builder reflist_builder;
> =C2=A0=C2=A0 488		struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0=C2=A0 489		struct rkvdec_h264_ctx *h264_ctx =3D ctx->priv;
> =C2=A0=C2=A0 490		struct rkvdec_h264_run run;
> =C2=A0=C2=A0 491		struct rkvdec_h264_priv_tbl *tbl =3D h264_ctx->priv_tbl=
.cpu;
> =C2=A0=C2=A0 492		u32 timeout_threshold;
> =C2=A0=C2=A0 493=09
> =C2=A0=C2=A0 494		rkvdec_h264_run_preamble(ctx, &run);
> =C2=A0=C2=A0 495=09
> =C2=A0=C2=A0 496		/* Build the P/B{0,1} ref lists. */
> =C2=A0=C2=A0 497		v4l2_h264_init_reflist_builder(&reflist_builder, run.de=
code_params,
> =C2=A0=C2=A0 498					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 run.sps, run.de=
code_params->dpb);
> =C2=A0=C2=A0 499		v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->=
reflists.p);
> =C2=A0=C2=A0 500		v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx-=
>reflists.b0,
> =C2=A0=C2=A0 501					=C2=A0=C2=A0=C2=A0 h264_ctx->reflists.b1);
> =C2=A0=C2=A0 502=09
> =C2=A0=C2=A0 503		assemble_hw_scaling_list(&run, &tbl->scaling_list);
> =C2=A0=C2=A0 504		assemble_hw_pps(ctx, &run);
> =C2=A0=C2=A0 505		lookup_ref_buf_idx(ctx, &run);
> =C2=A0=C2=A0 506		assemble_hw_rps(&reflist_builder, &run, &h264_ctx->refl=
ists, &tbl->rps);
> =C2=A0=C2=A0 507=09
> =C2=A0=C2=A0 508		config_registers(ctx, &run);
> =C2=A0=C2=A0 509=09
> =C2=A0=C2=A0 510		rkvdec_run_postamble(ctx, &run.base);
> =C2=A0=C2=A0 511=09
> =C2=A0=C2=A0 512		timeout_threshold =3D h264_ctx->regs.common.reg013_core=
_timeout_threshold;
> =C2=A0=C2=A0 513		rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
> =C2=A0=C2=A0 514=09
> =C2=A0=C2=A0 515		/* Start decoding! */
> =C2=A0=C2=A0 516		writel(timeout_threshold, rkvdec->link + VDPU383_LINK_T=
IMEOUT_THRESHOLD);
> =C2=A0=C2=A0 517		writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> =C2=A0=C2=A0 518		writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_D=
EC_ENABLE);
> =C2=A0=C2=A0 519=09
> =C2=A0=C2=A0 520		return 0;
> =C2=A0=C2=A0 521	}
> =C2=A0=C2=A0 522=09

--=-HUBaFbLuQRAvVZ40o0vh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXDm2AAKCRDZQZRRKWBy
9Fd5AQCFNfQJ7V7hO/CwnP/tTYqJgQUUANlbrcmEIqz2R5L3KAEAlUwzVwSgEeKi
Ne3geJutlRoJdxx1o7GBsOPJDjWQTwU=
=cGBC
-----END PGP SIGNATURE-----

--=-HUBaFbLuQRAvVZ40o0vh--

