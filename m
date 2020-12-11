Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470452D74BE
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 12:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394432AbgLKLdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 06:33:54 -0500
Received: from mga17.intel.com ([192.55.52.151]:21261 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388328AbgLKLdq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 06:33:46 -0500
IronPort-SDR: KpayDkha/H0CygH+edvFkq/xg/XFQTYbZWCkW1VRgQYRW9fEz6x1Z/lfj8K0eVChmx1NxAczUg
 KbCIpN4lv45g==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="154227804"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="154227804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 03:31:58 -0800
IronPort-SDR: OTinhrWIfEDAXAoCFPTaFvDkOt8glbKfqAo9//WNoLh0JiztAjFjczonO0Q5Gu7lWsahUJ37HA
 wDn5M7UNYuTg==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="365375484"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 03:31:56 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0CBDF20473; Fri, 11 Dec 2020 13:31:54 +0200 (EET)
Date:   Fri, 11 Dec 2020 13:31:54 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH v4 2/2] media: i2c: Add imx334 camera sensor driver
Message-ID: <20201211113153.GA23771@paasikivi.fi.intel.com>
References: <20201211105633.708-1-martinax.krasteva@linux.intel.com>
 <20201211105633.708-3-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211105633.708-3-martinax.krasteva@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

On Fri, Dec 11, 2020 at 10:56:33AM +0000, Martina Krasteva wrote:
...
> +static int imx334_read_reg(struct imx334 *imx334, u16 reg, u32 len, u32 *val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
> +	struct i2c_msg msgs[2] = { 0 };
> +	u8 addr_buf[2] = { 0 };
> +	u8 data_buf[4] = { 0 };
> +	int ret;
> +
> +	if (WARN_ON(len > 4))
> +		return -EINVAL;
> +
> +	put_unaligned_be16(reg, addr_buf);
> +
> +	/* Write register address */
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = ARRAY_SIZE(addr_buf);
> +	msgs[0].buf = addr_buf;
> +
> +	/* Read data from register */
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = len;
> +	msgs[1].buf = &data_buf[4 - len];
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret != ARRAY_SIZE(msgs))
> +		return -EIO;
> +
> +	*val = get_unaligned_le32(data_buf + (4 - len));

Hmm. The device native endianness is big (on control interface) unless
something very unexpected happened in hardware development.

You also can't do this as this will overrun data_buf.

> +
> +	return 0;
> +}
> +
> +/**
> + * imx334_write_reg() - Write register
> + * @imx334: pointer to imx334 device
> + * @reg: register address
> + * @len: length of bytes. Max supported bytes is 4
> + * @val: register value
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_write_reg(struct imx334 *imx334, u16 reg, u32 len, u32 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
> +	u8 buf[6] = {0};
> +
> +	if (WARN_ON(len > 4))
> +		return -EINVAL;
> +
> +	put_unaligned_be16(reg, buf);
> +	put_unaligned_le32(val, buf + 2);

Similar comment on this one.

-- 
Kind regards,

Sakari Ailus
