Return-Path: <linux-media+bounces-59049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANYoJJ+D4mlp6wAAu9opvQ
	(envelope-from <linux-media+bounces-59049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 21:01:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0281641E1E5
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 21:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E06E0309693B
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB13B3B27EF;
	Fri, 17 Apr 2026 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+d9jtPP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F308314A77;
	Fri, 17 Apr 2026 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776452360; cv=none; b=BvVjYo4cLobvxGdSbCB9EPOy2eoZVk5GX4+iNI34FW4AStuOumvmkJ2JK6vmVrDm979mjRFk1K/9J9eh98g3rcfD+kNpBAc8Ve3JOl66JoLaI/CDRbXtv4ow7dXuMgsa3hTV7XfxWdp277sn/Jn9i+VQJCbHOfZCgv8UtBl7Mhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776452360; c=relaxed/simple;
	bh=2074EW6GEZHM59oaOhx12i7LUTaHw1hT4VfwIe2T0Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxkS68o2E0NeTYRndxRJ3jtXDC7bI5CpSmQL/KoKe/Iq77rv4jH45MexWD10Jg8szSYoDAXsGzwol+bv9s2mtdb2Zs4vvfNduweE4hOPsQbKX+skSqi+shNS2ZGhDCqvyQ2tQFF2EXzrIym644r7+x+VpW1TRM3IgFjKpIaWOxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+d9jtPP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA654C19425;
	Fri, 17 Apr 2026 18:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776452360;
	bh=2074EW6GEZHM59oaOhx12i7LUTaHw1hT4VfwIe2T0Kk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u+d9jtPPqUr/1ABVpvio0zU4yNke0f/1nMRMi8KnAaEEy4hHc+jK5fvyUxjB1d6zv
	 c8EPLjsp0JOqTpaUcF/aRklO3LQX+dl9Hl17p+lhgT8YC+XWgtV5HGhooiHqJR9ToW
	 BbsxgJ56MF36COlZZ9mAp/0lKl5I0KO97HH+Ly/GwYdh+rs/pdqqL/MG/K+I1CDyG1
	 X1SlMTm7kI3JmZlRXOgGkJBE6JTcVtxqIvd2FMk674YvsjtTMij76Gw9/V+Bc9HHRO
	 x01yohD5Ic422FSVNjG6yWDP+d9wazX5jnfDOgTsy+RKI8WJRGlY+iuomQIr55eFTD
	 RaUkfrhnW3n9A==
Message-ID: <a5c8f70c-f6c4-4904-9411-22d99b15dd37@kernel.org>
Date: Fri, 17 Apr 2026 20:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: ov8858: add ACPI device ID INT3477 and vsio
 power supply
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: lee@kernel.org, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, djrscally@gmail.com,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
 nicholas@rothemail.net
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
 <20260417163252.15603-6-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260417163252.15603-6-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59049-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0281641E1E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 17-Apr-26 18:32, Thierry Chatard wrote:
> The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
> Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
> INT3477 to the ACPI match table so the driver binds when instantiated by
> ipu_bridge.
> 
> On the Dell Latitude 5285 the OV8858 is powered through a TPS68470 PMIC.
> The TPS68470 VSIO regulator controls the S_I2C_CTL register (0x43) which
> enables I2C passthrough to the sensor. The board data for this machine
> maps VSIO to the supply name "vsio" for INT3477. Add "vsio" to
> ov8858_supply_names[] so the driver requests this regulator at probe time.
> 
> The existing supply array had a duplicate "dvdd" entry; replace it with
> the new "vsio" entry and reorder to: avdd, dvdd, dovdd, vsio.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  drivers/media/i2c/ov8858.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index 3f45f7fab..5bfea237b 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -79,8 +79,9 @@
>  
>  static const char * const ov8858_supply_names[] = {
>  	"avdd",		/* Analog power */
> -	"dovdd",	/* Digital I/O power */
>  	"dvdd",		/* Digital core power */
> +	"dovdd",	/* Digital I/O power */
> +	"vsio",		/* Secondary I2C / S_I2C_CTL enable */
>  };

As discussed in my review of patch 3/5 I don't think we need/want this.
Any I2C pass-through stuff on the way to the sensor should be transparent
to the sensor-driver itself.

>  struct regval {
> @@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ov8858_of_match);
>  
> +static const struct acpi_device_id ov8858_acpi_ids[] = {
> +	{ "INT3477" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
> +
>  static struct i2c_driver ov8858_i2c_driver = {
>  	.driver = {
>  		.name = "ov8858",
>  		.pm = &ov8858_pm_ops,
>  		.of_match_table = ov8858_of_match,
> +		.acpi_match_table = ACPI_PTR(ov8858_acpi_ids),

No need for ACPI_PTR() as you declare ov8858_acpi_ids[]
unconditionally.

>  	},
>  	.probe		= ov8858_probe,
>  	.remove		= ov8858_remove,


Regards,

Hans


