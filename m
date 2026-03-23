Return-Path: <linux-media+bounces-56672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHiDDn4CwWlUPgQAu9opvQ
	(envelope-from <linux-media+bounces-56672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:06:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B52EEA94
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 866F4303E2F1
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CD73845DC;
	Mon, 23 Mar 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnUPiCaR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9E3603E8;
	Mon, 23 Mar 2026 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256345; cv=none; b=g4RTm/1pHi17Yoop5oJ1D4u9iRr866bxCYrUCSijl9tb5LlegtX2zGyE7GrB/2/tGS4AUk9Ll/xHSriEvX2diZ8QQ0tpxVGd+qGDZKOTIdaf5rWbaqJaWfkrcroHgwuLQlrDdIX+i75+hUUAudJhF5RvVA2hYF3sJh797NUGqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256345; c=relaxed/simple;
	bh=K9Tqs4/BP99++CClB8gBF9kCLQQ4w2a6XLs1q3yjIMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+BQH2oUDsrADwmBpG5IzXubeQqPPlpolxnu1w1SVAurjn/0JldBd/oFLXC7oUbxQjDPTL0Dnur7USi8Xu7rgZe6qjoI2q/eSwDvg3Z04I5j3r7Q9TtWbslyW/ilt3EBJ5TfSKJLA9x2hzMeYXtcA9jFYfPdtwtGJtG2OfUfURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnUPiCaR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774256344; x=1805792344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K9Tqs4/BP99++CClB8gBF9kCLQQ4w2a6XLs1q3yjIMY=;
  b=QnUPiCaRMn1eOZLVXSoQeg7kR50NCmxDcG8/z7cD09emDaI303Dge8hL
   FFQZzhhB/IEWw+E/OQIqVkD9WPwjlepetjHQ8DglImY/O9QCXQNbEW1t2
   yqWxJgdTlzxOairUpCebr+9yACD7jdJbhWqB47PcKtUsYcrr7WPy1ioqj
   MZVDB+9fzTssjca/F/5FiLiIfxIB7OSqMS7t8bwOdSd5ZkOA+ZOdTHyYb
   1K1OWNZweoZ4RSm9fHN6Y8UrTl3/RxpVk6O/nyObHmmud1F86LIkX9Clt
   sueyDzfNpBrch9HFX67blXBRAO1J1iFNxQWALsHKPWkEBkRkOlsvM8jXH
   A==;
X-CSE-ConnectionGUID: or/VlsI/SxSIj4h5n1v7PQ==
X-CSE-MsgGUID: I90cMg21RjeidWE2rVVfZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85560606"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="85560606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:59:03 -0700
X-CSE-ConnectionGUID: KSV3cX5TQxGaJLU5OZM97w==
X-CSE-MsgGUID: b0J4TiR9Tnqg2vdJeAp/+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="246993702"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:59:00 -0700
Date: Mon, 23 Mar 2026 10:58:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chethan C <mail.chethanc@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: av7110: fix coding style
Message-ID: <acEA0iSrMBudd1sC@ashevche-desk.local>
References: <20260321074614.541740-1-mail.chethanc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321074614.541740-1-mail.chethanc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56672-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,suse.com,gmail.com,ideasonboard.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 8A4B52EEA94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 01:16:01PM +0530, Chethan C wrote:
> Fixed Indentation, Alignment issues reported by checkpatch.pl.
> 
> Renamed enum av7110_rec_play_state, av7110_type_rec_play_format,
> av7110_encoder_command from camel case to upper case underscore
> style to comply kernel style guidelines.

Some changes are questionable, some need improvement, see a bit below.

...

> +	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_MONITOR_TYPE,
>  			    1, (u16)av7110->display_ar);

Also check if you need a casting.

>  	if (ret < 0)
>  		pr_err("unable to set aspect ratio\n");

...

> -	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 2, wss_cfg_4_3);
> +	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2, 2, wss_cfg_4_3);

The media subsystem is strict about 80 character limit. Yes, the original is
also long, but this makes it worse. Same for other similar cases.

>  	if (ret < 0)
>  		pr_err("unable to configure 4:3 wss\n");

...

> -		ret = av7110_fw_cmd(av7110, COMTYPE_REC_PLAY, __Record, 2, AudioPES, 0);
> +		ret = av7110_fw_cmd(av7110,
> +				    COMTYPE_REC_PLAY,
> +				    AV7110_REC_PLAY_RECORD,
> +				    2,
> +				    AV7110_AUDIO_PES, 0);

Here and in some other places out of a sudden the style is changed to "one
parameter per line", why?

...

>  enum av7110_type_rec_play_format {
> -	RP_None,
> -	AudioPES,
> -	AudioMp2,
> -	AudioPCM,
> -	VideoPES,
> -	AV_PES
> +	AV7110_RP_NONE,
> +	AV7110_AUDIO_PES,
> +	AV7110_AUDIO_MP2,
> +	AV7110_AUDIO_PCM,
> +	AV7110_VIDEO_PES,
> +	AV7110_AV_PES

While there is no comma in the original, this is not a terminator entry, so
while at it, add trailing comma.

>  };

...

>  enum av7110_pid_command {
> -	MultiPID,
> -	VideoPID,
> -	AudioPID,
> -	InitFilt,
> -	FiltError,
> -	NewVersion,
> -	CacheError,
> -	AddPIDFilter,
> -	DelPIDFilter,
> -	Scan,
> -	SetDescr,
> -	SetIR,
> -	FlushTSQueue
> +	AV7110_MULTI_PID,
> +	AV7110_VIDEO_PID,
> +	AV7110_AUDIO_PID,
> +	AV7110_INIT_FILT,
> +	AV7110_FILT_ERROR,
> +	AV7110_NEW_VERSION,
> +	AV7110_CACHE_ERROR,
> +	AV7110_ADD_PID_FILTER,
> +	AV7110_DEL_PID_FILTER,
> +	AV7110_SCAN,
> +	AV7110_SET_DESCR,
> +	AV7110_SET_IR,
> +	AV7110_FLUSH_TS_QUEUE
>  };

Ditto.

...

>  enum av7110_encoder_command {
> -	SetVidMode,
> -	SetTestMode,
> -	LoadVidCode,
> -	SetMonitorType,
> -	SetPanScanType,
> -	SetFreezeMode,
> -	SetWSSConfig
> +	AV7110_SET_VID_MODE,
> +	AV7110_SET_TEST_MODE,
> +	AV7110_LOAD_VID_CODE,
> +	AV7110_SET_MONITOR_TYPE,
> +	AV7110_SET_PANSCAN_TYPE,
> +	AV7110_SET_FREEZE_MODE,
> +	AV7110_SET_WSS_CONFIG
>  };


Ditto.

>  enum av7110_rec_play_state {
> -	__Record,
> -	__Stop,
> -	__Play,
> -	__Pause,
> -	__Slow,
> -	__FF_IP,
> -	__Scan_I,
> -	__Continue
> +	AV7110_REC_PLAY_RECORD,
> +	AV7110_REC_PLAY_STOP,
> +	AV7110_REC_PLAY_PLAY,
> +	AV7110_REC_PLAY_PAUSE,
> +	AV7110_REC_PLAY_SLOW,
> +	AV7110_REC_PLAY_FF_IP,
> +	AV7110_REC_PLAY_SCAN_I,
> +	AV7110_REC_PLAY_CONTINUE
>  };

Ditto.

-- 
With Best Regards,
Andy Shevchenko



