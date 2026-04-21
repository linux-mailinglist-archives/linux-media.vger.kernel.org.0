Return-Path: <linux-media+bounces-59242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG9aAQvZ52kBBwIAu9opvQ
	(envelope-from <linux-media+bounces-59242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:07:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A143F3F0
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 743A930EF71F
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC6C3DD526;
	Tue, 21 Apr 2026 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsCuniVt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4B364023;
	Tue, 21 Apr 2026 19:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801579; cv=none; b=Tx+vb3V5nNDYWcHowqovgZdXFSrwGVGDHmt2xqv4kXplrNmjhkUZiMQwkq2vW+NIIuoUu9BNf/ybWE2If1l97SKKU95TL/n8emz7zm6WJWewINpvZRdhqEWOB4U4Wu7dTXuiMj1A62xGR4Bk1JOhprhmRRW09FVRfQBHi0bH0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801579; c=relaxed/simple;
	bh=RPmjpLGSCuEb2lhegb48dLNjvGXXc0hnC8stpqzMyf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsDP5kSYYMs+T6uE6iBMnqFMOotQIxcGUfW1MiDBTx4t2A0e/hMHRNF4gtSmApn6mOklUg9MqNeLQvZSVjChZFpqFMnIOaI4sHz2wghY7KZ66f0pH2jzU+Edzgv+YzeZwKv+TYE9+gMTr2AWx0ooU8jK5N0AfmpVxbg++qtUC6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsCuniVt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776801578; x=1808337578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RPmjpLGSCuEb2lhegb48dLNjvGXXc0hnC8stpqzMyf0=;
  b=jsCuniVt583XTmMWlyzGa4n8rtv5S1DQ0tCl2iKy4gu7Wh5EZL33ntPK
   UNEq+wAs35JMkAAMZujaoa32tTUuKEeNcNBq/gu/brlDAv083c831H3E7
   T+h+gsAXar5vOHE9xwwOLHn9oyvpBvGkmri9e/jtYnAxzqxwHz7iQAFdl
   2F/1rQck905SlcAfLk7r2gnjNVmpzg4n173o9mmRl5bgLfebK5KITjOGr
   SjxFRKxHw8Rgrr8W6Vcluq/ToH0Ph3AYXpCVkeHsQXiAzVAo5Db9KqqFO
   SqkzNEBLe4CT2WpNrqTdUuMdyuu9Rl3XE+0Pg+xu1ak6WoO83QsxF1KfM
   A==;
X-CSE-ConnectionGUID: ynNNhmPcTGmoUN+HcNvehw==
X-CSE-MsgGUID: zLXJuLgBQl6M8uFbRMbjGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77625206"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77625206"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 12:59:37 -0700
X-CSE-ConnectionGUID: BWmp1dLpTZeTRcGv4UzMcw==
X-CSE-MsgGUID: 9Xn2PdsFS3mteYDZiBO03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227522447"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.164])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 12:59:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A88361201FC;
	Tue, 21 Apr 2026 22:59:33 +0300 (EEST)
Date: Tue, 21 Apr 2026 22:59:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
Message-ID: <aefXJebe2F4Z193F@kekkonen.localdomain>
References: <20260419093412.40796-1-clamor95@gmail.com>
 <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain>
 <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59242-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D2A143F3F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Svyatoslav,

On Tue, Apr 21, 2026 at 08:32:16PM +0300, Svyatoslav Ryhel wrote:
> вт, 21 квіт. 2026 р. о 19:44 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > Hi Shyvatoslav,
> >
> > On Sun, Apr 19, 2026 at 12:34:12PM +0300, Svyatoslav Ryhel wrote:
> > > @@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_flash *flash)
> > >       return rval;
> > >  }
> > >
> > > +static void lm3560_power_off(struct lm3560_flash *flash)
> > > +{
> > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > > +     regulator_disable(flash->vin_supply);
> > > +}
> > > +
> > > +static int lm3560_power_on(struct lm3560_flash *flash)
> > > +{
> > > +     int rval;
> > > +
> > > +     rval = regulator_enable(flash->vin_supply);
> > > +     if (rval < 0) {
> > > +             dev_err(flash->dev, "failed to enable vin power supply\n");
> > > +             return rval;
> > > +     }
> > > +
> > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > > +
> > > +     rval = lm3560_init_device(flash);
> > > +     if (rval < 0) {
> > > +             lm3560_power_off(flash);
> > > +             return rval;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int __maybe_unused lm3560_pm_runtime_resume(struct device *dev)
> > > +{
> > > +     struct lm3560_flash *flash = dev_get_drvdata(dev);
> > > +
> > > +     return lm3560_power_on(flash);
> > > +}
> > > +
> > > +static int __maybe_unused lm3560_pm_runtime_suspend(struct device *dev)
> >
> > Could you change lm3560_power_o{n,ff}() take struct device pointer as the
> > argument?
> >
> 
> What benefit it will bring? Unless you propose to use on/off functions
> in pm directly, I don't see any benefit in this change.

You get rid of two redundant wrappers.

> 
> > > +{
> > > +     struct lm3560_flash *flash = dev_get_drvdata(dev);
> > > +
> > > +     lm3560_power_off(flash);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > > +{
> > > +     unsigned int i;
> > > +
> > > +     for (i = LM3560_LED0; i < LM3560_LED_MAX; i++) {
> >
> > You could define i here.
> >
> 
> You mean:
>  for (unsigned int i = LM3560_LED0; i < LM3560_LED_MAX; i++)?
> 
> If yes, I would like to keep it as is, it looks cleaner to me, and
> this part was transferred from remove as is.

Works for me.

-- 
Regards,

Sakari Ailus

