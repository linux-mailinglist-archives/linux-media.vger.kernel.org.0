Return-Path: <linux-media+bounces-51443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPJIC2QodGmA2gAAu9opvQ
	(envelope-from <linux-media+bounces-51443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 03:03:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B07C2A9
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 03:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40A443032F5B
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 02:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD580202F7C;
	Sat, 24 Jan 2026 02:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrishewitt.net header.i=@chrishewitt.net header.b="bZdE+Yby"
X-Original-To: linux-media@vger.kernel.org
Received: from v5239.v57ae4e16.euw1.send.eu.mailgun.net (v5239.v57ae4e16.euw1.send.eu.mailgun.net [161.38.204.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085B37260F
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 02:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.38.204.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769220165; cv=none; b=PRQYMWORBgco1vG4/KbXW05EXusR61nZTF54R2kkzdjZ5mswdvdi5vrrAKz3x9phQaiiCl0mMufK997HIJWG3F0c1Wr9ASCukVFSSdqH3oh2xbmWwINrlK/tbLRBLjKDqfgtDIelrGEoRbjVpelITYZWHf80Ke2tu/m+HbSofS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769220165; c=relaxed/simple;
	bh=01hxuTuFi4WyDbJY33X+dOfUOeClxBmmhF7RBg2hq3c=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=gsMy4HqrfAqUrSq1oYmOHPm1FTxWww/NMYrf43LaWbJMAvlh53y3ZITcKZCMe69J+ZOPFD1Jn+I7njN8Tz2hIlQDoUPRKCOnmQ6JrfycELAgHLgMnTnstIC1plLsOG9g40AWMfLFoOePOZvZKYx6lGV1NeldfykHinVoYX3htr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrishewitt.net; spf=pass smtp.mailfrom=chrishewitt.net; dkim=pass (2048-bit key) header.d=chrishewitt.net header.i=@chrishewitt.net header.b=bZdE+Yby; arc=none smtp.client-ip=161.38.204.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrishewitt.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrishewitt.net
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=chrishewitt.net; q=dns/txt; s=email; t=1769220161; x=1769227361;
 h=To: To: In-Reply-To: Cc: References: Message-Id: Date: Subject: Subject: Mime-Version: From: From: Content-Transfer-Encoding: Content-Type: Sender: Sender;
 bh=C/sLMdSxKDy5jzfC+B5Ue7dx469IMFbWeKWgWoqx5Rk=;
 b=bZdE+Yby8Hc+hA+f8FlpFEEielY4CUvVL46cqnshldG+dQe3P+EWt4KDUiRp8PhjzeXl+uUEsDiUV6TIVC13bxXAph0r8SiezSKPkcC6NLB1b9ZRF6pT29eqXbyMQfTMSdXw6k5avJSr5+c12pT8tOaFiB5pwgp3onVBp9jI2kONZHemulRyLOO8J7hANR6hnbK3+2/6nvqS1GQml3OSdT0f02rPFfcQRQcyzZrPKdRo8LivqbCJz3phPuJEyyZe1q/f4dOGPs8zzcXoLQBPvXGS4YTjXWJeWeEWtgo3hJsCoslcNwNzEYjD345OVkREsDLmjoDJ1xtKFIEP+tvJQA==
X-Mailgun-Sid: WyJjNGNkNCIsImxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZyIsImIyZjgzIl0=
Received: from mail.hewittfamily.org.uk (unknown [87.200.95.144]) by
 39fa7189536808ae44ced20d88dfe192192816f1ec72d36bb399772e9a022ef2 with SMTP id
 69742840ad50961babcd07ea (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sat, 24 Jan 2026 02:02:40 GMT
X-Mailgun-Sending-Ip: 161.38.204.239
Sender: mail@chrishewitt.net
Received: from smtpclient.apple (unknown [176.204.198.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hewittfamily.org.uk (Postfix) with ESMTPSA id 4dydNZ60V3zHhZgL;
	Sat, 24 Jan 2026 06:02:38 +0400 (+04)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Hewitt <mail@chrishewitt.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] media: rkvdec: Improve handling missing short/long term RPS
Date: Sat, 24 Jan 2026 06:02:28 +0400
Message-Id: <E4181905-7C51-45CA-8F12-87717218C648@chrishewitt.net>
References: <20260123192244.1441637-1-detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20260123192244.1441637-1-detlev.casanova@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Synology-Spam-Status: score=-2.601, required 5, autolearn=ham, FREEMAIL_ENVRCPT 0, FROM_HAS_DN 0, FROM_EQ_ENVFROM 0, MIME_GOOD -0.1, MV_CASE 0.5, MID_RHS_MATCH_FROM 0, NO_RECEIVED -0.001, RCVD_COUNT_ZERO 0, MISSING_XM_UA 0, __THREADED 0, FREEMAIL_CC 0, BAYES_HAM -3, TO_MATCH_ENVRCPT_ALL 0, URIBL_BLOCKED 0, __HDRS_LCASE_KNOWN 0, ARC_NA 0, TO_DN_SOME 0, RCPT_COUNT_TWELVE 0, MIME_TRACE 0, __NOT_SPOOFED 0
X-Synology-Spam-Flag: no
X-Synology-Virus-Status: no
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chrishewitt.net,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chrishewitt.net:s=email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,vanguardiasur.com.ar,kernel.org,sntech.de,lists.infradead.org,collabora.com,gmail.com,kwiboo.se];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51443-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chrishewitt.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@chrishewitt.net,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,chrishewitt.net:mid,chrishewitt.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C3B07C2A9
X-Rspamd-Action: no action


> On Jan 23, 2026, at 11:22=E2=80=AFpm, Detlev Casanova <detlev.casanova@col=
labora.com> wrote:
>=20
> =EF=BB=BFThe values of ext_sps_st_rps and ext_sps_lt_rps in struct rkvdec_=
hevc_run
> are not initialized when the respective controls are not set by userspace.=

>=20
> When this is the case, set them to NULL so the rkvdec_hevc_run_preamble
> function that parses controls does not access garbage data which leads to
> a panic on unaccessible memory.
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 vari=
ant")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Suggested-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

This solves the sps/rps warnings and occasional kernel splats I=E2=80=99ve b=
een seeing with some HEVC media. Thanks!

Tested-by: Christian Hewitt <christianshewitt@gmail.com>

> ---
> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b=
/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index 28267ee30190..3119f3bc9f98 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -500,11 +500,15 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx=
,
>        ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
>                      V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
>        run->ext_sps_st_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> +    } else {
> +        run->ext_sps_st_rps =3D NULL;
>    }
>    if (ctx->has_sps_lt_rps) {
>        ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
>                      V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
>        run->ext_sps_lt_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> +    } else {
> +        run->ext_sps_lt_rps =3D NULL;
>    }
>=20
>    rkvdec_run_preamble(ctx, &run->base);
> --
> 2.52.0
>=20


