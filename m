Return-Path: <linux-media+bounces-59199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L2lCUw+52no5QEAu9opvQ
	(envelope-from <linux-media+bounces-59199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:07:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A4B438A25
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 920E2302AB51
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 09:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256663A4F57;
	Tue, 21 Apr 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzpcVDNE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBD3A3834;
	Tue, 21 Apr 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762183; cv=none; b=M1HGM2Or0hFkX0tUg5H4x/7OBaJ/mSglA+YdcRPT8vE86I1DULHKNorY53yZ/T4UE3fDEjjFJSRagu+BlAD+szEFPEeanXZcwV2u/84YU8gbYnIK7hJjnKqMKM7MXwFCwxtaFrbe7NmS9px/siK0nKbdgKYVA/Bv1ppXdNtqyy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762183; c=relaxed/simple;
	bh=nUlhQ/hV1N+Lz94b5NSzp3RrArhMUFjEeidaDmUiTi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWvhck1A8uotxSKAt0amtUxRtvMYSGFFqtMe9Azb8YR+4ar9NCH2N2lNXTnTLV/b1as571p8mIXnozKycCpQb1dj1GkvapGm0FULjI1WTU5BN0gb+fUdXyKexZg+H14c4SMznf97bv5h0WnZFyKjm3g4ZOz+ht75kacWJgK2Rpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzpcVDNE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776762181; x=1808298181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nUlhQ/hV1N+Lz94b5NSzp3RrArhMUFjEeidaDmUiTi8=;
  b=lzpcVDNEh28EylOoXL4JYt7oqwHSjcgSAnv07d8p33AbeI83wtglun3n
   gyJ74aZjCOoAZd6Wae0gR/kOVN7kSrOclDIn1iqhSYHYxteFmXXseMIEE
   6T49N/myOcF4d/u03A3sZZQZhIud7IV2mx3Zm4aXWuCpbX7RxjMFr4zCV
   wcnz7O3XyUHl1P4BBuhrQ8rpan+P4N93/OrQGmUkOX4JmC3+PE4EWjbQz
   E7QFzGD2QL6KJwYqhiZbZeYNwui+o2FagRO06JTbn7MHTeJF74YKv8u3M
   yvFVIVJaSNcFAVmLkEAEmbM8TasSHyvpXpt0LVYJDt+Yx007jvShi6dHs
   w==;
X-CSE-ConnectionGUID: IuEDwoEaRV+DA4TKh4pFdg==
X-CSE-MsgGUID: F5zSRdFVS1iI6kTxI+GuSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95248537"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="95248537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:03:00 -0700
X-CSE-ConnectionGUID: IkNRJD3NSRaNWD3+XNfSUA==
X-CSE-MsgGUID: WGdTrggqQUCNOZi1mSM3RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="235997538"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.56])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:02:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DB501120D05;
	Tue, 21 Apr 2026 12:02:55 +0300 (EEST)
Date: Tue, 21 Apr 2026 12:02:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <aec9Pzr_ZUD0zBcK@kekkonen.localdomain>
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59199-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kekkonen.localdomain:mid,xs4all.nl:url]
X-Rspamd-Queue-Id: 23A4B438A25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Fri, Apr 17, 2026 at 12:16:11PM +0200, Hans de Goede wrote:
> Hi Kate,
> 
> On 17-Apr-26 10:32, Kate Hsuan wrote:
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c
> > 
> > This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a part
> > of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 laptops.
> > 
> > Link: https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/imx471.c
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> <snip>
> 
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > new file mode 100644
> > index 000000000000..32a105a60731
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -0,0 +1,1047 @@
> 
> <snip>
> 
> > +static int imx471_update_flip(struct imx471_data *sensor, u32 value,
> > +			      u8 flip_bit)
> > +{
> > +	int ret;
> > +	u64 val = value ? flip_bit : 0;
> > +
> > +	if (sensor->streaming)
> > +		return -EBUSY;
> 
> I see no reason why this could not be updated while streaming,
> since the h/y offsets get adjusted the bayer pattern stays
> the same so changing while streaming should be fine.
> 
> > +
> > +	/* hflip */
> > +	/*
> > +	 * Some manufacturers mount the sensor upside-down (rotation == 180).
> > +	 * V4L2 sets both h/vflip to 1 for 180-degree rotation, but only the
> > +	 * vflip should actually be applied. Skip the initial hflip write to
> > +	 * preserve correct orientation.
> > +	 */
> 
> I was answering your off-list email about this, but now I see that you've
> added this workaround here. I believe that this workaround is wrong, so
> let me move answer things here instead of off-list:
> 
> > I filled in the DMI information in the table and I found v4l2 sets up
> > both hflip=1 and vflip=1 when the rotation is 180.
> 
> Yes that is correct, note this is actually done by libcamera, in response
> to the rotation property reporting 180 degrees rotation after adding the
> laptop to the DMI table.
> 
> > In my case, I only
> > need to set vflip then I can get a correct image.
> 
> First of all are you sure that you only need to set vflip? A camera is not
> a mirror! If you say raise your right hand in front of the camera then on
> the screen you should be seen raising the hand which is on the left for
> "the you" looking at the screen because if you were to look at you from
> the pov of the camera your right hand is on the left.
> 
> The easiest way to check this is to have something with some written text
> on it. In a mirror you cannot (easily) read e.g. the text printed on
> a T-shirt but with a camera you should be able to read this without
> problems.
> 
> Also make sure you use qcam to test because qcam does not mirror/hflip.
> Some apps hflip the image for you (esp. things like google meet) because
> people are so used to seeing themselves in a mirror that they adjust
> the view for you. Note e.g. google meet only mirrors your own preview
> it sends out an unmirrored image to the people on the call (IIRC).
> 
> If after this long mansplaining (sorry) writeup about the difference
> between a mirror and a camera you still think you only need vflip,
> then that means that either the hflip ot the vflip control of
> the sensor is inverted and the driver needs to invert it.
> 
> Are we sure the camera module is upside down? Maybe vflip is the one
> which we need to invert and the module is not upside-down at all ?
> 
> Hmm, looking at other imx sensor drivers, unlike ov sensors where
> sometimes hflip is inverted it seems the 2 flip controls are sofar

Generally this is historical or a driver bug. The flip controls should
reflect sensor's configuration these days. The ROTATION control tells the
mounting orientation. See
<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html>.

> always straight forward on imx. Although some drivers only implement
> vflip and have no hflip at all.
> 
> As you mention in the cover letter this is a cleaned up version of:
> https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c/imx471.c
> 
> Note that we've seen issues with mirroring / flipping from various
> other drivers originating from Intel, they have not always got this
> correct, especially when it comes to mirroring by default (when
> the hflip control's value is 0) but also with vflipping by default
> when the driver was developed on a laptop which had the module
> upside-down, see e.g. :
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/media/i2c/ov02c10.c
> 
> where we needed to do quite a few flipping related fixes.
> 
> > +	if (flip_bit == IMX471_HFLIP_BIT) {
> > +		if (sensor->rotation == 180 && !sensor->hflip_initialized) {
> > +			sensor->hflip_initialized = true;
> > +			return 0;
> > +		}
> 
> This looks like you skip writing the hflip on the first start stream,
> but what about subsequent streams ?
> 
> Also see my next comment below, I think this skipping only once
> does point us in the right direction.
> 
> > +
> > +		cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> > +				flip_bit, val, &ret);
> > +
> > +		return ret;
> > +	}
> > +
> > +	/* vflip */
> > +	cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> > +			flip_bit, val, &ret);
> > +	if (ret)
> > +		return ret;
> 
> Hmm, I wonder if the problem here is you doing 2 subsequent
> cci_update_bits(). If the flip control registered is double-buffered
> and the new value is latched as the actual value on the start
> of the next frame; and this is combined with reading back
> reading the active value, not the last written value then
> the first time you do this the setting of the hflip bit will
> be overwritten by the second cci_update_bits.
> 
> I think it would be better to do something similar to what
> imx219.c and replace these 2 cci_update_bits() calls with:
> 
>         cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
>                   imx471->hflip->val | imx471->vflip->val << 1, &ret);
> 
> I believe this should work here too.
> 
> 
> > +
> > +	cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
> > +		  value ? 0xe0 : 0xeb, &ret);
> > +	if (ret)
> > +		return ret;
> > +
> > +	cci_update_bits(sensor->regmap, IMX471_REG_H_WIN_OFFSET, 1,
> > +			value ? 0x01 : 0x00, &ret);
> 
> No need for cci_update_bits() here, the register is always
> initialized to 0xc8 so this can just use hardcoded values
> like the V_WIN_OFFSET path:
> 
> 	cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
> 		  value ? 0xc9 : 0xc8, &ret);
> 
> > +	return ret;
> 
> Updating both offsets here is wrong when hflip != vflip, you
> should only update V_WIN_OFFSET when changing vflip and
> H_WIN_OFFSET when changing hflip.

The cropping configuration should reflect the values on the sensor's pixel
array and should not be affected by flipping. At least the crop window
needs to be adjusted accordingly by the driver. Is there a need to change
flipping while streaming?

> 
> I suggest dropping this function and instead in set_ctrl()
> do this:
> 
> 	case V4L2_CID_HFLIP:
> 		cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
> 			  imx471->hflip->val | imx471->vflip->val << 1, &ret);
> 		cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
> 			  value ? 0xc9 : 0xc8, &ret);
> 		break;
>         case V4L2_CID_VFLIP:
> 		cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
> 			  imx471->hflip->val | imx471->vflip->val << 1, &ret);
> 		cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
> 			  value ? 0xe0 : 0xeb, &ret);
> 		break;

-- 
Regards,

Sakari Ailus

