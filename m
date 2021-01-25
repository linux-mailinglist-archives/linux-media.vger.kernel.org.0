Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC90930253C
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 14:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbhAYM6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 07:58:46 -0500
Received: from mga01.intel.com ([192.55.52.88]:48930 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728525AbhAYM51 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 07:57:27 -0500
IronPort-SDR: 8li3SAwJPEfxqAhcnE+ce34FLdMQJvAnDM6DvEkt6vq54n+fkE109winiNwOvPCML1COSIO8aA
 Rc37XdbdfhRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="198497064"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="198497064"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 04:55:37 -0800
IronPort-SDR: svVHfBhgmUWL4cKBAoj2Za2nenSWfbhNtOYuZ2O3SGclcR6YdV/lRuUc5ZjraTD/X6IghgD3gC
 LqxlravHGnhA==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="573658862"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 04:55:34 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0ACDA2080B; Mon, 25 Jan 2021 14:55:03 +0200 (EET)
Date:   Mon, 25 Jan 2021 14:55:02 +0200
From:   'Sakari Ailus' <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH v4 2/2] media: i2c: Add imx334 camera sensor driver
Message-ID: <20210125125502.GJ27155@paasikivi.fi.intel.com>
References: <20201211105633.708-1-martinax.krasteva@linux.intel.com>
 <20201211105633.708-3-martinax.krasteva@linux.intel.com>
 <20201211113153.GA23771@paasikivi.fi.intel.com>
 <011701d6cfb3$eaa5ac30$bff10490$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <011701d6cfb3$eaa5ac30$bff10490$@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

On Fri, Dec 11, 2020 at 11:51:05AM -0000, Martina Krasteva wrote:
> Hi Sakari,
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Friday, December 11, 2020 11:32 AM
> > To: Martina Krasteva <martinax.krasteva@linux.intel.com>
> > Cc: linux-media@vger.kernel.org; mchehab@kernel.org; robh+dt@kernel.org;
> > devicetree@vger.kernel.org; daniele.alessandrelli@linux.intel.com;
> > paul.j.murphy@linux.intel.com; gjorgjix.rosikopulos@linux.intel.com
> > Subject: Re: [PATCH v4 2/2] media: i2c: Add imx334 camera sensor driver
> > 
> > Hi Martina,
> > 
> > On Fri, Dec 11, 2020 at 10:56:33AM +0000, Martina Krasteva wrote:
> > ...
> > > +static int imx334_read_reg(struct imx334 *imx334, u16 reg, u32 len,
> > > +u32 *val) {
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
> > > +	struct i2c_msg msgs[2] = { 0 };
> > > +	u8 addr_buf[2] = { 0 };
> > > +	u8 data_buf[4] = { 0 };
> > > +	int ret;
> > > +
> > > +	if (WARN_ON(len > 4))
> > > +		return -EINVAL;
> > > +
> > > +	put_unaligned_be16(reg, addr_buf);
> > > +
> > > +	/* Write register address */
> > > +	msgs[0].addr = client->addr;
> > > +	msgs[0].flags = 0;
> > > +	msgs[0].len = ARRAY_SIZE(addr_buf);
> > > +	msgs[0].buf = addr_buf;
> > > +
> > > +	/* Read data from register */
> > > +	msgs[1].addr = client->addr;
> > > +	msgs[1].flags = I2C_M_RD;
> > > +	msgs[1].len = len;
> > > +	msgs[1].buf = &data_buf[4 - len];
> > > +
> > > +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > > +	if (ret != ARRAY_SIZE(msgs))
> > > +		return -EIO;
> > > +
> > > +	*val = get_unaligned_le32(data_buf + (4 - len));
> > 
> > Hmm. The device native endianness is big (on control interface) unless
> > something very unexpected happened in hardware development.
> > 
> > You also can't do this as this will overrun data_buf.
> 
> Imx334 uses little endian so I have to convert the values. 

Ack. That's very unusual, and probably the first raw camera sensor
implemented that way.

Could you fix the data_buf overrun?

-- 
Sakari Ailus
