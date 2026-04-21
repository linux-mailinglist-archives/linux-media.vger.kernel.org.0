Return-Path: <linux-media+bounces-59243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCpnNx3Z52kBBwIAu9opvQ
	(envelope-from <linux-media+bounces-59243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:07:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEAD43F424
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4913B3075F02
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561843DD523;
	Tue, 21 Apr 2026 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcGIgDKn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AC73DD516;
	Tue, 21 Apr 2026 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801943; cv=none; b=KAyOAvJY4hcELdt4gQ34V5vsNYGQRCko3V8Hyl3WUMgGReqoH1KWOQv6VzofO8L7v63UljV119ZB3kVqOxh9XpZexoNspnc+OIOt59tmzKib9422PXeNMK9DuVXxzIygPWV+loywosOmze/EookPLPkCW6T90mYZ/Ob+q2dNxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801943; c=relaxed/simple;
	bh=a+PKflhvwXgyxw7sNE7y++DrWIq20QXiBZQ5d7tnocQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kilVd8v59t5Yo1Nec7IF7b0uDjs5eqhPug9yHUlmJv9I4oQtQObU5e38DJA59ZfxJqFnX+pd8COxJvxeV0mXX4S9aIagROCG9lb5cYZ0SQyHd2oLk6IOT/OpUDbVj4usKhLZh5dJRQ2zpeysQ/ZFfqKJ0ujCMLIrQAaLJFCRfEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcGIgDKn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776801943; x=1808337943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+PKflhvwXgyxw7sNE7y++DrWIq20QXiBZQ5d7tnocQ=;
  b=RcGIgDKnps7bYsljTRO77AI93LCU1MCVyJJsRK+HjWaXEKNr2ME27q02
   uhRTv9J/8iNHqGJVjL0Kbpe4Ws49+PPmG8bYR68x43iqbnFwg+xwlegsr
   kVxuMQ+uxHWlYVhS5Xt8AxvoBheydJnPgYIBKNtOL4ZUtbL9fZUkTyadm
   jk+MS3QZnDT+xiW+32hgPtN6gRdQIZYdr/0kSDWXCEF4zDAn/6rvmChM0
   /HHqslcacRf6oS3vB/fH6wW4FCh8/tQFmExyuCDIAPCJAhfO+j9ZVwS/0
   ydaaaT/owhAhgiEEaQl4vjqT+P2L/cHZqJHHdrlKdcc2J+gjjTAQpj+bh
   A==;
X-CSE-ConnectionGUID: IwcXGyO4Rze8KuVFyBBMgQ==
X-CSE-MsgGUID: V3iDrJ99S0qm7NWFdn/0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77867863"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77867863"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 13:05:42 -0700
X-CSE-ConnectionGUID: PyCWgZ9ISPqnaEII/7WqkA==
X-CSE-MsgGUID: BpgasLn7QA2J3eiDM2cd9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="233910969"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.164])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 13:05:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 315291201FC;
	Tue, 21 Apr 2026 23:05:39 +0300 (EEST)
Date: Tue, 21 Apr 2026 23:05:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <aefYk9tbUOzNNdOk@kekkonen.localdomain>
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
 <aec9Pzr_ZUD0zBcK@kekkonen.localdomain>
 <07115433-dcfb-40a9-952a-5f841ee93947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07115433-dcfb-40a9-952a-5f841ee93947@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59243-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 5FEAD43F424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Kate,

On Tue, Apr 21, 2026 at 11:47:12AM +0200, Hans de Goede wrote:
> Hi Sakari, Kate,
> 
> On 21-Apr-26 11:02, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Apr 17, 2026 at 12:16:11PM +0200, Hans de Goede wrote:
> 
> ...
> 
> >>> +
> >>> +		cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> >>> +				flip_bit, val, &ret);
> >>> +
> >>> +		return ret;
> >>> +	}
> >>> +
> >>> +	/* vflip */
> >>> +	cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> >>> +			flip_bit, val, &ret);
> >>> +	if (ret)
> >>> +		return ret;
> >>
> >> Hmm, I wonder if the problem here is you doing 2 subsequent
> >> cci_update_bits(). If the flip control registered is double-buffered
> >> and the new value is latched as the actual value on the start
> >> of the next frame; and this is combined with reading back
> >> reading the active value, not the last written value then
> >> the first time you do this the setting of the hflip bit will
> >> be overwritten by the second cci_update_bits.
> >>
> >> I think it would be better to do something similar to what
> >> imx219.c and replace these 2 cci_update_bits() calls with:
> >>
> >>         cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
> >>                   imx471->hflip->val | imx471->vflip->val << 1, &ret);
> >>
> >> I believe this should work here too.
> >>
> >>
> >>> +
> >>> +	cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
> >>> +		  value ? 0xe0 : 0xeb, &ret);
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>> +	cci_update_bits(sensor->regmap, IMX471_REG_H_WIN_OFFSET, 1,
> >>> +			value ? 0x01 : 0x00, &ret);
> >>
> >> No need for cci_update_bits() here, the register is always
> >> initialized to 0xc8 so this can just use hardcoded values
> >> like the V_WIN_OFFSET path:
> >>
> >> 	cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
> >> 		  value ? 0xc9 : 0xc8, &ret);
> >>
> >>> +	return ret;
> >>
> >> Updating both offsets here is wrong when hflip != vflip, you
> >> should only update V_WIN_OFFSET when changing vflip and
> >> H_WIN_OFFSET when changing hflip.
> > 
> > The cropping configuration should reflect the values on the sensor's pixel
> > array and should not be affected by flipping. At least the crop window
> > needs to be adjusted accordingly by the driver. Is there a need to change
> > flipping while streaming?
> 
> Ah, that is a very valid question, no I don't think we do need to
> set them while streaming.
> 
> Kate if you cannot get the start_x / start_y coordinate changes
> when changing flipping to work to get a stable bayer output
> pattern, then another way to fix this is to only allow changing
> the flip controls while not streaming and return -EBUSY otherwise.
> 
> This can then be combined with reporting a flip-ctrl dependend
> bayer-order so that userspace sees the right bayer-order after
> flipping is applied as long as userspace reads the subdev format
> after setting the controls (which libcamera does I believe).

It's indeed currently a bit annoying to implement this. The common raw
sensor model will make this easier as the driver just indicates the native
pattern to userspace. I don't have an estimate currently when that set
would be in so the wait could be very long. Libcamera will need changes,
too.

> 
> For an example of an imx driver which reports a different
> bayer order depending in flipping see: imx214.c and
> the imx214_get_format_code() helper, a call to which should
> be used to replace any hardcoded mbus-formats in the driver.

-- 
Regards,

Sakari Ailus

