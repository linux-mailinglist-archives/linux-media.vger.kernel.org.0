Return-Path: <linux-media+bounces-64559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /8NKO6V9Kmo5rAMAu9opvQ
	(envelope-from <linux-media+bounces-64559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:19:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EEC67056E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:19:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=P5BO8pcr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64559-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64559-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA8B931EE226
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77C63BC668;
	Thu, 11 Jun 2026 09:13:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F93A257C;
	Thu, 11 Jun 2026 09:13:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169212; cv=none; b=VSg9jqbA8GrcekPHcz1hC9I6oibVUZmxNrc+BnGNGY7Q0ItC95Boa2qA8c9CxtSha6mqibcbtoMVvSZ53MpJxYn3evn53hVhR8cJksOYbTnAry/jgrGGXaj43yD+rc6yKkG8jL6OQh5lOtfpIcGtzBsaejKrhW6Bm+WOKSN5+tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169212; c=relaxed/simple;
	bh=gKOCqxKCuRbslboKZqBeDKoCrIbSkktbxTTZx61IGbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATpdWZhMX6JGrNrRg9rzu7gIn8u6v0IKy5WHO/mtSmhxsnFZFXW+3ODNtOUvcObiklrbea9v8dua0kEt+PZuEgeOPIWzayon6Kb1177HJFLlDgapk4/qEgBH6qxfs+byJRZHnrWJEgtwRw4ZMidU/TLdq0gR2yHvYI/FQ7tdp8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5BO8pcr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3A51F0089C;
	Thu, 11 Jun 2026 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169210;
	bh=BxXOFmqgKP//yNlaJchWiTOa6h3bEte8EY9Rwi4U/mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P5BO8pcrwDPMEAjCp8GZuk8zUXnYlfcEZrOUg1x7lzyuj1V0m2o6uiNnh0bGMTGlY
	 ci0eDgeIPen4OiD7Ttm2DAW/Zn7E0E3F1wHEP1up/v+MH7m0TsifLukne+1QnWJkuC
	 qG54ld7AXhJvtoWR1Yxmzp0SQ1vzJ9LIvBnKB6dHGtvjX53DU6D8Fbn3YylUS15J57
	 GkAB4JKboMbSx/Y0a+xe9eoo+sirescKZLM4xeQ04zZHfamsEI/tFFoQi1gyFhTUVd
	 wCwOXKb7YDPJrVI3CmisAKluhmyZ4sNiB8M1OJHihaF7Hs39fL3j8+BTH3rh/Fr50s
	 0DjVZ4N5RSdQw==
Date: Thu, 11 Jun 2026 11:13:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ramshouriesh <rshouriesh@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Aleksandrs Vinarskis <alex@vinarskis.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 3/9] media: i2c: hm1092: add Himax HM1092 mono NIR sensor
 driver
Message-ID: <20260611-sloppy-happy-pony-1efc8d@quoll>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
 <20260610-a14-himax-hm1092-v1-3-0c9907da47ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260610-a14-himax-hm1092-v1-3-0c9907da47ed@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rshouriesh@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64559-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40EEC67056E

On Wed, Jun 10, 2026 at 04:39:28PM +0530, Ramshouriesh wrote:
> +module_i2c_driver(hm1092_i2c_driver);
> +
> +MODULE_DESCRIPTION("Himax HM1092 sensor driver draft");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/i2c/hm1092_regs.h b/drivers/media/i2c/hm1092_r=
egs.h
> new file mode 100644
> index 000000000000..4df2d5b49d81
> --- /dev/null
> +++ b/drivers/media/i2c/hm1092_regs.h
> @@ -0,0 +1,223 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* HM1092 register tables extracted from Qualcomm Chromatix sensor modul=
e.
> + * Source: com.qti.sensormodule.hm1092.bin
> + * Generator: hm1092-re/gen_hm1092_regs.py
> + * DO NOT HAND EDIT =E2=80=94 regenerate from the bin.
> + */
> +
> +struct hm1092_reg {
> +	u16 address;
> +	u8 val;
> +};
> +
> +static const struct hm1092_reg hm1092_init_regs[] =3D {

You must NOT define data in headers. This is not how C is written - you
invite data duplication without any gains/benefits.

Best regards,
Krzysztof


