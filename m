Return-Path: <linux-media+bounces-59667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CqBKYNR72kLAQEAu9opvQ
	(envelope-from <linux-media+bounces-59667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:07:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE70472451
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA3AC3038AF1
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A7B3B6C0A;
	Mon, 27 Apr 2026 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYvKczl0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B93101B2;
	Mon, 27 Apr 2026 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291612; cv=none; b=bAzcYswmQ8D6SiunmVDEQrKqiHm5GHmMiWodWNrwizoGbTol8YeAuKqALTb4svEBL/O4w+aBq5EAaXr+XCDT8OrpbsWU9MnuhqZH/RF0dfJrdck2jh55xWvyy0pUF8s+U4A/W1w8f93KPMwR9BX5wte0dYDNE0WDvGnxsStRoJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291612; c=relaxed/simple;
	bh=17eue7FzxHADuZ6rQbFkX3JTRQYgxWu8poIecN8itNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/YzVbN+xf4CpnquD8Eq/s3nH9HdbsdHl9Cy8Q/DZIoNhfvQryEkkaWq46wTW+PHYyXyU/ByIV8tp/6zI1VIuEa+p9JonaEMxFLcFUhxiIA6NzZ/8kkmhWAwZOqraka2JmadOb9P78o0drE2awKLOq8EOp5oHsK+ZpxdB1ROH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYvKczl0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2196C19425;
	Mon, 27 Apr 2026 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777291611;
	bh=17eue7FzxHADuZ6rQbFkX3JTRQYgxWu8poIecN8itNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UYvKczl0vANW5KOsM5tA27/xZ/f59JLN5MgIsIVjODhzIblEg9/2OJy5T819yYVif
	 hvBvl5rr0Z+vAoqwNCuK/0iuEj4J7kM718ibpqb3kJInoODVSD5ZCwMANB7C6MNEUg
	 0uFswaNRRZh0jpSd3DqMUmIcSh+5k2fvGwie9I0t/4FNH7e/V7NjahpUMDsbfvrvdl
	 xS3dq+hd5IyClo+SBDX5q2eCbTsWQftZu82gZdLiyFAHQka1keSs+hMIUsG9JqB3/w
	 ANohMWBrAJBeANBIKauskNcjmImI8mJ790lVAjqWJSZG33cGMdq8IQRpJBmyb1Ztoo
	 iqzkdfMG+hYQQ==
Message-ID: <10e98067-e71f-4585-a49b-8239af208ceb@kernel.org>
Date: Mon, 27 Apr 2026 14:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] media: ov8858: add ACPI device ID INT3477
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: lee@kernel.org, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, djrscally@gmail.com,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
 nicholas@rothemail.net
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
 <20260425163145.8474-6-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260425163145.8474-6-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0EE70472451
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59667-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Thierry,

Thank you for your work on this.

On 25-Apr-26 18:31, Thierry Chatard wrote:
> The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
> Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
> INT3477 to the ACPI match table so the driver binds when instantiated by
> ipu_bridge.
> 
> The supply names are reordered to dvdd before dovdd so that core power is
> stable before the I2C passthrough opens (on this platform dovdd maps to
> the VSIO/S_I2C_CTL regulator, which gates I2C access to the sensor).

Is this really necessary? Did you test without this change ?

Also note that this is not really how things work, the bulk
regulator API parallelizes the enabling of all the regulators,
so there is no guarantee the regulators will get enabled in
a specific order.

Regards,

Hans

  

> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  drivers/media/i2c/ov8858.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index 3f45f7fab..a1fa0be52 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -79,8 +79,8 @@
>  
>  static const char * const ov8858_supply_names[] = {
>  	"avdd",		/* Analog power */
> -	"dovdd",	/* Digital I/O power */
>  	"dvdd",		/* Digital core power */
> +	"dovdd",	/* Digital I/O power */
>  };
>  
>  struct regval {
> @@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
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
> +		.acpi_match_table = ov8858_acpi_ids,
>  	},
>  	.probe		= ov8858_probe,
>  	.remove		= ov8858_remove,


