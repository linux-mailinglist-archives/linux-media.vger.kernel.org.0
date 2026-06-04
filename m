Return-Path: <linux-media+bounces-63822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QGbJODyRIWopJAEAu9opvQ
	(envelope-from <linux-media+bounces-63822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:52:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A1864116E
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:52:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UNwXYX42;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63822-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63822-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1051D304C7C2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A7F47F2F4;
	Thu,  4 Jun 2026 14:40:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3463B3B27F9;
	Thu,  4 Jun 2026 14:40:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584009; cv=none; b=Ar8URW+8H2xAPMBCMIez7FW/kRyR00KRvTPyNmb0NFii/XWqf1npA2XbeTCZ8yqo/G+N/3D8LEGiYk3gaqlrolqE/PE5TMo2s7IsBVX8vOzGZ9876X+1OEQlDgctIXglYKQsS8Os4/u9T04jppp+XnxTuRZVg+MQepd+CRFPu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584009; c=relaxed/simple;
	bh=CJFJ6penCucd/jGjppKuWojc5tbvGvTR3dG5FuwKvdU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7K87mji0i5C+rrpzTEpu4e8IGjhWYvnjTruAp1xMaDT7YuNIl9sCyKkg1sBId2dMQvILYybxRyv+tJbYGh67LIWitgk4FuXrfku2h28xYoQRyD6GE2JKs3amjf4BkD+DIL3qAcVjVysiiNcTz6VT+2HGgAhoppC4V/a+omSulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNwXYX42; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6121F00893;
	Thu,  4 Jun 2026 14:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780584007;
	bh=xGqmFYbdZAHVWZeBeb0i49r9flNLb7Ay5Xu5Jx0vVjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UNwXYX42B7xsNlLeqBzg5TdR94tNpxLW0YCNdMvDxFBzS/mZkK7UcSGdj8yuqU1QU
	 zWESw+hmmYlU7TYrg98LKdwbfQW/QU+/Nbt255ng4IzNLMXBvSkdURwhfTdL61Y86V
	 Sg5pwhY4aEy8jQEwyxZzKDDQfK9dsouvTffU55KVCUngw7cSX0oGcLqeHO/lEbXvKE
	 MRKJi+3HZHMWkzFO1aKc6bdTFUdpCchrWlUJ3xXeQeKGHyHe1OSzMsV4tKlwYFP1iQ
	 AMUb6w0jS2Zr3USnKKFUJuVLcWBxbY5Y1gBlN5MPudXRMxf3OiSSDmk+lc643pYzWz
	 KiMtcE6ECrMfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 18/22] media: i2c: maxim-serdes: add MAX9296A driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-18-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-18-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:40:06 +0000
Message-Id: <20260604144007.3A6121F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-63822-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+dumitru.ceclan.analog.com@kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40A1864116E

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unconditional hardware link reset during `select_links` breaks con=
current streaming.

Pre-existing issues:
- [High] Race condition and potential use-after-free in I2C bus notifier un=
registration.
- [High] Missing restoration of I2C `select_links` mask permanently isolate=
s other active links.
--

commit bf07e545a3c441399f342386db38d37ea5e3b979
Author: Cosmin Tanislav <demonsingur@gmail.com>

    media: i2c: maxim-serdes: add MAX9296A driver

This commit introduces the MAX9296A driver for Quad GMSL2 Deserializers.
It adds support for multiple Maxim deserializer chips and integrates them
with the common Deserializer framework.

> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2=
c/maxim-serdes/max9296a.c
> new file mode 100644
> index 0000000000000..3dcdb63dbb9ee
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c

[ ... ]

> +static int max9296a_select_links(struct max_des *des, unsigned int mask)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	int ret;
> +
> +	if (des->info->num_links =3D=3D 1)
> +		return 0;
> +
> +	if (!mask) {
> +		dev_err(priv->dev, "Disable all links unsupported\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_GMSL1_EN,
> +				 MAX9296A_GMSL1_EN_LINK_EN,
> +				 FIELD_PREP(MAX9296A_GMSL1_EN_LINK_EN, mask));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_CTRL0,
> +				 MAX9296A_CTRL0_AUTO_LINK |
> +				 MAX9296A_CTRL0_LINK_CFG |
> +				 MAX9296A_CTRL0_RESET_ONESHOT,
> +				 FIELD_PREP(MAX9296A_CTRL0_LINK_CFG, mask) |
> +				 FIELD_PREP(MAX9296A_CTRL0_RESET_ONESHOT, 1));
> +	if (ret)
> +		return ret;
> +
> +	if (priv->info->has_per_link_reset) {
> +		ret =3D max9296a_reset_link(priv, 1);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does this regression unconditionally reset the hardware links regardless of=
 the
mask?

Link 0 is reset via MAX9296A_CTRL0_RESET_ONESHOT, and Link 1 is reset via
max9296a_reset_link(priv, 1).

Since select_links() can be called dynamically to isolate I2C communications
(such as when a new camera is probed via the ATR), does this reset break
concurrent multi-camera operation by dropping other active streams?

[ ... ]


While reviewing how this driver interacts with the common framework, I noti=
ced
a couple of pre-existing issues in drivers/media/i2c/maxim-serdes/max_des.c
that might need your attention.

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition and
use-after-free when unregistering the I2C bus notifier.

drivers/media/i2c/maxim-serdes/max_des.c:max_des_i2c_mux_deinit() {
    ...
	i2c_mux_del_adapters(priv->mux);
	bus_unregister_notifier(&i2c_bus_type, &priv->i2c_nb);
}

The child I2C adapters are deleted and their memory freed before the I2C bus
notifier is unregistered. Could an unrelated I2C device binding during this
window trigger max_des_i2c_mux_bus_notifier_call()?

Since the notifier compares the newly bound client->adapter against the fre=
ed
des->links[i].adapter pointers, if memory is reallocated and addresses matc=
h,
could the driver perform I2C operations on an unrelated bus, potentially
corrupting hardware state or crashing?


[Severity: High]
This is another pre-existing issue, but could the lack of state restoration
here permanently isolate other active links?

drivers/media/i2c/maxim-serdes/max_des.c:max_des_init_link_ser_xlate() {
    ...
	ret =3D des->ops->select_links(des, BIT(link->index));
	if (ret)
		return ret;

	ret =3D max_ser_wait_for_multiple(adapter, addrs, ARRAY_SIZE(addrs),
					&current_addr);
    ...
}

During I2C ATR attachment, this restricts I2C communication to a specific l=
ink
to modify serializer addresses, but the function returns without restoring =
the
select_links mask to include all enabled links.

Because hardware address translation (ATR) relies on the deserializer
forwarding commands to all active links concurrently, does this leave the
other links permanently disconnected from I2C control and break access to
previously probed cameras?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D18

