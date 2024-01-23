Return-Path: <linux-media+bounces-4075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC99C838BB0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 11:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38D7C283652
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 10:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8DB5A784;
	Tue, 23 Jan 2024 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qe5ALZRC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E114058126
	for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706005539; cv=none; b=ady3OnRdRvWeFW6/tQow66qp7rB4RiHH35ixQZi5Wc8FA3rYM0W7DxFLAFum6VJlORu/wZpAncqrFqS82c+4XDkWjQNxvCaa8vh+VN4i4QNPBNYJ+Nm9tbyCP1VXQHg57BX5JMV6pz8vAjxsfGk+5WmyNidUaXpXPs5I38h7fcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706005539; c=relaxed/simple;
	bh=+y9Nrn1J8LL9RDmBZcgYzvqjhqg+M9BhSjwF9+GWfYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQlC6M4zIYQI87nE3/jWUEO2sqiIza7bQQEmQLYhx85VmzDtrxlovMwXlEJLEnTJgjCTCzQDYj6abISC4N7HHq1KUMnWZXcwLjVax2ljUSluupvhyG2sRd8tJxuTneGpcro3gFLxYgH8DvsXlqWlaGyGnBNoldZGhECl++BE8tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qe5ALZRC; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706005537; x=1737541537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+y9Nrn1J8LL9RDmBZcgYzvqjhqg+M9BhSjwF9+GWfYI=;
  b=Qe5ALZRCnAowRnjStQrAlq9Wztz+jMBtcuSiZKDkMPugvHVz4oEZaI/Z
   V6t61W6BH6ONEVMQb7PhiyqhH+A67IQRJVa6dLZN4JamRYskEQOmbvFbH
   E+oKjJkMZGvb4ozsvk//C50Gzml5K43mzFxgV+ok/PBeaz5LiMSFCxLbn
   sZ3j02svs0qes5lrqVDOjJ/eruPHkVIP+eZmsNxxaEKy85OlkVNxIqRLP
   ZWEZ+HEpGCJdFoi0rmFg5tJHJa0uojha2ZbnNzfSxKqEvxrvhnRMEGROw
   lVZveeXua8YFoTn8shx78Fflvh1xu5Ptz6rZ8uIqXAupQudGcBvZ2JGJI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401133188"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="401133188"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 02:25:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735522978"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="735522978"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 02:25:33 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71A4B11FC49;
	Tue, 23 Jan 2024 12:16:19 +0200 (EET)
Date: Tue, 23 Jan 2024 10:16:19 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: "Chen, Jason Z" <jason.z.chen@intel.com>, bingbu.cao@linux.intel.com,
	linux-media@vger.kernel.org, andy.yeh@intel.com,
	qingwu.zhang@intel.com, senozhatsky@chromium.org
Subject: Re: [PATCH v3] media: ov08x40: Reduce start streaming time
Message-ID: <Za-R8xeuD5cHCA0K@kekkonen.localdomain>
References: <20240123093648.285711-1-jason.z.chen@intel.com>
 <CAAFQd5D6y8nKg8axJxZj+yhMD8ZNC=q6w_e2=7qcQo1HFWSFTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5D6y8nKg8axJxZj+yhMD8ZNC=q6w_e2=7qcQo1HFWSFTw@mail.gmail.com>

Hi Tomasz,

On Tue, Jan 23, 2024 at 07:03:49PM +0900, Tomasz Figa wrote:
> On Tue, Jan 23, 2024 at 6:37 PM Chen, Jason Z <jason.z.chen@intel.com> wrote:
> >
> > From: Jason Chen <jason.z.chen@intel.com>
> >
> > Because video duration involves calculating the streaming time, and i2c
> > communication incurs too many XTALK register settings every 4 bytes with
> > i2c START and STOP.
> >
> > So we have opted switch to the i2c burst method.
> > This method involves writing the XTALK registers in the order of
> > the register block.
> >
> > The start streaming time can be reduced from around 400ms to 150ms
> >
> > Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> > ---
> >  drivers/media/i2c/ov08x40.c | 1207 ++---------------------------------
> >  1 file changed, 55 insertions(+), 1152 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> > index ddcb4b6848b..7b09f405fc5 100644
> > --- a/drivers/media/i2c/ov08x40.c
> > +++ b/drivers/media/i2c/ov08x40.c
> [snip]
> > +static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
> > +                                  u16 last_reg,  u8 val)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
> > +       struct i2c_msg msgs;
> > +       __be16 reg_addr_be = cpu_to_be16(first_reg);
> > +       size_t i, num_regs;
> > +       int ret;
> > +
> > +       num_regs = last_reg - first_reg + 1;
> > +       msgs.addr = client->addr;
> > +       msgs.flags = 0;
> > +       msgs.len = 2 + num_regs;
> > +       msgs.buf = kmalloc(msgs.len, GFP_KERNEL);
> > +       if (!msgs.buf)
> > +               return -ENOMEM;
> > +
> > +       /* Set the register address to the first two bytes of the buffer */
> > +       memcpy(msgs.buf, &reg_addr_be, 2);
> 
> nit: Wouldn't the code be much simpler to follow if rewritten as below?
> 
> msgs.buf[0] = first_reg >> 8;
> msgs.buf[1] = first_reg & 0xff;

Or... just put_unaligned_be16()?

> 
> > +       for (i = 0; i < num_regs; ++i)
> > +               msgs.buf[2 + i] = val;
> > +
> > +       ret = i2c_transfer(client->adapter, &msgs, 1);
> > +
> > +       kfree(msgs.buf);
> > +
> > +       if (ret != 1) {
> > +               dev_err(&client->dev, "Failed %d regs transferred: %d\n", ret);
> > +               return -EIO;
> > +       }
> > +
> > +       dev_dbg(&client->dev, "I2C burst transfer succeeded\n");
> > +
> > +       return 0;
> > +}
> > +
> >  /* Write registers up to 4 at a time */
> >  static int ov08x40_write_reg(struct ov08x40 *ov08x,
> >                              u16 reg, u32 len, u32 __val)
> > @@ -2936,6 +1826,19 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
> >                 return ret;
> >         }
> >
> > +       /* Use i2c burst to write register on full size registers */
> > +       if (ov08x->cur_mode->exposure_shift == 1) {
> > +               ret = ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_FIRST_A,
> > +                                             OV08X40_REG_XTALK_LAST_A, 0x75);
> > +               ret = ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_FIRST_B,
> > +                                             OV08X40_REG_XTALK_LAST_B, 0x75);
> > +       }
> 
> Hmm, if we only need to set these if exposure_shift is 1, don't we
> need to somehow "unset" them if the mode exposure_shift != 1?

I recall the driver powers the sensor off every time streaming is stopped
(without pm_runtime_put_sync(), so it's not reliable)... that would be nice
to address as well, but outside the scope of this patch.

-- 
Regards,

Sakari Ailus

