Return-Path: <linux-media+bounces-52276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBZqAoyOhWnrDQQAu9opvQ
	(envelope-from <linux-media+bounces-52276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 07:47:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55253FABE9
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 07:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26BA53036D75
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 06:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CEB2DB7AE;
	Fri,  6 Feb 2026 06:46:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73253D544;
	Fri,  6 Feb 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770360411; cv=none; b=MHpGyVQGh/hkyYm6eZyM7c2lZFLmPXXebNvG0SL7lEsyX7DeofJvTTauSIjbT8pdKI1cHcHcz9Mo5uZ7bqW1Ycy5oIY8U3hEDswWIFtV6ndOq80hUWi9l2PSOkBx1i9eGMBnkmZcp+5KN3OrdPB/JYktd6e0+XTJXOXYX1XFxtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770360411; c=relaxed/simple;
	bh=oPwd4qbXaILTf59MwbMd9tAuRyBO4FFbSoOgYTA6TKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rt/ESVIzRrxN2kXuGM0xcVcs6GwxfKo0O/qRqV2C/kKl87qfMp9xuQtC/DpYm1AXwAjHF/50SNSuoHpzW6NNQgs7uTvXB4jAaFVt9ARFLgmfWn7eglVYd1/E4mLOZv7jRM/pDNEyIvBofiPonFReYDp2Eipea/7pZ3RTDbToZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id A78BCC3E4DE6;
	Fri,  6 Feb 2026 07:39:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl A78BCC3E4DE6
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: <sakari.ailus@linux.intel.com>,  <mchehab@kernel.org>,
  <linux-media@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: ar0521: Check return value of
 devm_gpiod_get_optional() in ar0521_probe()
In-Reply-To: <20260130041815.2988011-1-nichen@iscas.ac.cn> (Chen Ni's message
	of "Fri, 30 Jan 2026 12:18:15 +0800")
References: <20260130041815.2988011-1-nichen@iscas.ac.cn>
Sender: khalasa@piap.pl
Date: Fri, 06 Feb 2026 07:39:00 +0100
Message-ID: <m35x8aidff.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[piap.pl : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52276-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khalasa@piap.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.964];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,piap.pl:email,t19.piap.pl:mid]
X-Rspamd-Queue-Id: 55253FABE9
X-Rspamd-Action: no action

Hi Chen,

Chen Ni <nichen@iscas.ac.cn> writes:

> The devm_gpiod_get_optional() function may return an error pointer
> (ERR_PTR) in case of a genuine failure during GPIO acquisition, not just
> NULL which indicates the legitimate absence of an optional GPIO.

Well, it seems only right. Though I would prefer all-caps "GPIO" in
kernel messages. Either way,

Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -1094,6 +1094,9 @@ static int ar0521_probe(struct i2c_client *client)
>         /* Request optional reset pin (usually active low) and assert it =
*/
>         sensor->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
>                                                      GPIOD_OUT_HIGH);
> +       if (IS_ERR(sensor->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
> +                                    "failed to get reset gpio\n");
>
>         v4l2_i2c_subdev_init(&sensor->sd, client, &ar0521_subdev_ops);
>

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

