Return-Path: <linux-media+bounces-63824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rv42G9qQIWoIJAEAu9opvQ
	(envelope-from <linux-media+bounces-63824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:51:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26574641120
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DGPMgeEo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63824-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63824-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C65BA3105B81
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC16848096D;
	Thu,  4 Jun 2026 14:41:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F6F47F2EF;
	Thu,  4 Jun 2026 14:41:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584092; cv=none; b=raa3Ns4+jDVtwCcIHDSWaTHUXQzQIxgWS6CIEfj/t4IHmGpxBHNYEJZD0nG1SVPwYqRnHvhlROLhHLrYlb2a30oRiS0rWJgbRVK/s1+p89tD9zlw/jmTKy3XbK/5IWr1rH6XxT7uwiJ3cZck+S0Uz8/f/7NoMW1AJgksT23qJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584092; c=relaxed/simple;
	bh=f/aXHOec7Fjcos7o3+A+y8v+N+9N2ix6sZj9maqXNzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y25XmFJ4n8L7JxwPkhK+nVEeCpBSfZvB/UhD81UcfcrVYpTJGQ2w3Wyr5Z1D7N8FLCTRcnCtw4HaDSVwVymQAIuUgnq1VD0eTQ7WklhHuF/OCDlQWyOxG6/1IIdZzdrcduRF+yGEu5YpjbpizXiAlltqfrXCyJ7ciNzoh5vSL2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGPMgeEo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB031F00893;
	Thu,  4 Jun 2026 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780584090;
	bh=G1LRRSGvnTn7hc3Xb40pGpMrp8iky4bWn+rYEzQz8MU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DGPMgeEoCrqYXuuVTbYSbYcsRO3AiG/2FFJHpRXk26iapmry5XAL1HAIMVwTpVf09
	 m6pyvh+eIVASwkzhfYb1XB3gIfTqSuQkqsp3h2C/etYltwCIG2ASHtqvozsb6lb6LV
	 a56lcWw2BMD5KUdMxuZEEAYi8qpEW03KYlnkildlF7KAVd/o4bO+g5kSCxMZumPfxM
	 udlOkDji874ATX0eupvydA19fCLB3xhSyTo9BI16DoehP7SK3PNDl71kOscO8TZE2g
	 K6EQDiYBENoTMcCE6ytJYsXvpxL8gISdPZxgS+oWVuqEzDmqaMI+yoClvG/550R3ae
	 PCO19ENt0I5ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 16/22] media: i2c: maxim-serdes: add MAX96717 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-16-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-16-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:41:30 +0000
Message-Id: <20260604144130.8AB031F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid];
	TAGGED_FROM(0.00)[bounces-63824-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+dumitru.ceclan.analog.com@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dumitru.ceclan.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26574641120

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] GPIO input direction fails to enable the input receiver buffer (`R=
X_EN`).
- [Medium] Incorrect mapping of GPIO offsets to slew rate control registers.
- [Medium] Hardcoded pin multiplexing unconditionally overrides device tree=
 pinmux settings.
- [Low] Unsigned arithmetic underflow in clock rate difference calculation =
causes incorrect clock rate selection.
--

commit 4178fabfcdc008cf3c6660e1fd752427f037448c
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX96717 driver

Add a new MAX96717 driver that also supports MAX9295A, MAX96717F and
MAX96793. Integrate it with the common serializer framework.

> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2=
c/maxim-serdes/max96717.c
> new file mode 100644
> index 0000000000000..6cc4060e10f34
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96717.c
[ ... ]
> +static int max96717_get_pin_config_reg(unsigned int offset, u32 param,
> +				       unsigned int *reg, unsigned int *mask,
> +				       unsigned int *val)
> +{
[ ... ]
> +	switch (param) {
> +	case PIN_CONFIG_SLEW_RATE:
> +		if (offset < 3) {
> +			*reg =3D MAX96717_PIO_SLEW_0;
> +			if (offset =3D=3D 0)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO00_SLEW;
> +			else if (offset =3D=3D 1)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO01_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO02_SLEW;
> +		} else if (offset < 5) {
> +			*reg =3D MAX96717_PIO_SLEW_1;
> +			if (offset =3D=3D 3)
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO05_SLEW;

[Severity: Medium]
Is the mapping of GPIO offsets to register masks correct here?

It looks like the pinctrl subsystem passes the physical GPIO pin number
as the offset, but the switch logic appears to mix up a contiguous
index array with the actual GPIO numbers. For example, passing offset 3
configures the mask for PIO05 instead of PIO03. Could this cause valid
pins like offset 5 to fail entirely by erroneously hitting the offset < 7
branch later in the code?

[ ... ]
> +static int max96717_conf_pin_config_set_one(struct max96717_priv *priv,
> +					    unsigned int offset,
> +					    unsigned long config)
> +{
[ ... ]
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		arg =3D arg >=3D MAX96717_BIAS_PULL_STRENGTH_1000000_OHM;
> +		config =3D pinconf_to_config_packed(MAX96717_PINCTRL_PULL_STRENGTH_HIG=
H, arg);
> +		return max96717_conf_pin_config_set_one(priv, offset, config);
> +	case PIN_CONFIG_LEVEL:
> +		config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 1);
> +		return max96717_conf_pin_config_set_one(priv, offset, config);
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		config =3D pinconf_to_config_packed(MAX96717_PINCTRL_RX_EN, 0);
> +		return max96717_conf_pin_config_set_one(priv, offset, config);
> +	case MAX96717_PINCTRL_TX_ID:

[Severity: High]
Does configuring a pin as an input properly re-enable the receiver buffer?

When a pin is configured as an output, this logic explicitly sets RX_EN
to 0. If that pin is later switched back to an input via
PIN_CONFIG_INPUT_ENABLE, there doesn't seem to be matching logic to
restore MAX96717_PINCTRL_RX_EN to 1. Will the pin's input buffer remain
disabled and always read as 0?

[ ... ]
> +static unsigned int max96717_clk_find_best_index(struct max96717_priv *p=
riv,
> +						 unsigned long rate)
> +{
> +	unsigned int i, idx =3D 0;
> +	unsigned long diff_new, diff_old =3D U32_MAX;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
> +		diff_new =3D abs(rate - max96717_predef_freqs[i].freq);

[Severity: Low]
Can this calculation underflow and fail to compile?

Because both rate and predef_freqs[i].freq are unsigned long, the
subtraction will underflow rather than become negative. Additionally,
the kernel's abs() macro strictly checks for signed types and evaluates
to a void expression when passed an unsigned type. Would using abs_diff()
work better here?

[ ... ]
> +static int max96717_register_clkout(struct max96717_priv *priv)
> +{
> +	struct device *dev =3D &priv->client->dev;
> +	struct clk_init_data init =3D { .ops =3D &max96717_clk_ops };
> +	int ret;
> +
> +	ret =3D max96717_mux_set_rclkout(priv, MAX96717_RCLK_MFP);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this unconditionally overwrite device tree pinmux configurations?

During initialization, the pinctrl core applies device tree hogs (for
example, routing rclkout to MFP2) via pinctrl_enable() in
max96717_gpiochip_probe(). Calling max96717_mux_set_rclkout() here
immediately afterward appears to silently override the DT settings,
forcefully routing rclkout to MFP4 instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D16

