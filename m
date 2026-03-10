Return-Path: <linux-media+bounces-55048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJMHB3zRr2kfcgIAu9opvQ
	(envelope-from <linux-media+bounces-55048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:08:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE5246F8F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF1173052724
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93653ED12B;
	Tue, 10 Mar 2026 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/7zoWAE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C41C3E8C50;
	Tue, 10 Mar 2026 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130017; cv=none; b=Iaiwb0aamYTqeLjGgKczXG7crtZe+Flcx+Zt3tZXIGJQjtoMuj6mhAr5h0qKmEXhqvnhpiLM0UmwLamHScwh39g/9VNq7Bh1JOz3TkyEW+18ZKe9tDX9I5KgAtvn22/OsCcsyLU3uKmKOhmFJVFjH2JKtZj4huTeiKD0JoaFIo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130017; c=relaxed/simple;
	bh=YwXa8TtD5U0uSMGnaDkzYNgQcftFkfs1WV/j0tlfVrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKuV/1HB0CQ94P1E0KUKxnR3Mb7divWo6qs7XaE6J2H9VYViRZK9ZLifB+uu2JHI/wmWcvFt+ew+o0jyH6rh4V7r1obGXjvc8IOHSq0Sf8OtqP7V8jleyFlmWjCviMc/LCIwxyjK9b/GsvAWdYL1rBZcoRaVjVuDHP6wTZcHF0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/7zoWAE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773130015; x=1804666015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YwXa8TtD5U0uSMGnaDkzYNgQcftFkfs1WV/j0tlfVrg=;
  b=e/7zoWAEPjBRSjByf7H1jBoEis9u6wQiIpUnBVlinnxvxkpj2Hn5aBUm
   5eIbYu6G6aVMAiiFqBMAtnnSw9TAB/XD7mnbJRRJ//ySODkhg7F2vYWbf
   5aPnTg65KewSw+ntPSKcU7TPs244qEi3QkNN1onTHiN9KqK10SK3w0qyf
   OkQl78WG4ftPX1hTZ0xTuGRkVzfxDO4axh1zvJd/YWkFfC/VqKcGYMXVd
   34St7MvRYB3ilsUuMoD0VjbKRNrs+vyrY3yWWg7v9/N7dZecKWV4WZqt/
   +XQIigs3sDTkxbq4iyKZIF8rRX8EF2J5ftb9Dj8ehBCjcQDp/2t7sf56v
   g==;
X-CSE-ConnectionGUID: tk1WRDIvQA6ryAW4wOdBLA==
X-CSE-MsgGUID: 6Qp2U0C0RNq87AwEwXMQ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85524951"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="85524951"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:06:55 -0700
X-CSE-ConnectionGUID: F9DhsSnqS4yaywDWOGVhjw==
X-CSE-MsgGUID: 0MrgnK8WQI2BxxnxyvtG2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="216843777"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:06:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 119111206B6;
	Tue, 10 Mar 2026 10:07:23 +0200 (EET)
Date: Tue, 10 Mar 2026 10:07:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
Message-ID: <aa_RO3idjnNp1DLV@kekkonen.localdomain>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217002738.133534-5-mailingradian@gmail.com>
X-Rspamd-Queue-Id: B5DE5246F8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-55048-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kekkonen.localdomain:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Hi Richard,

On Mon, Feb 16, 2026 at 07:27:35PM -0500, Richard Acayan wrote:
> The IMX355 sensor driver currently supports having 4 data lanes. There
> can't be more or less, so check if the firmware specifies 4 lanes.
> 
> Existing ACPI hardware descriptions may not have the data lanes defined
> so this check also accepts a placeholder of 0 lanes.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/media/i2c/imx355.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 9ca87488c933..0d6aabea7d59 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -66,6 +66,9 @@
>  #define IMX355_EXT_CLK			19200000
>  #define IMX355_LINK_FREQ_INDEX		0
>  
> +/* number of data lanes */
> +#define IMX355_DATA_LANES		4
> +
>  struct imx355_reg {
>  	u16 address;
>  	u8 val;
> @@ -1705,6 +1708,10 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>  	if (!cfg)
>  		goto out_err;
>  
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 0

The number of lanes should be available from system firmware, so no need
for this check.

> +	 && bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)

Indentation.

> +		goto out_err;
> +
>  	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
>  				       bus_cfg.nr_of_link_frequencies,
>  				       link_freq_menu_items,

-- 
Regards,

Sakari Ailus

