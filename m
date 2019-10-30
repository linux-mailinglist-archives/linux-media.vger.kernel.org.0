Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C72E9C04
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 14:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfJ3NE6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 09:04:58 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:3291 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726137AbfJ3NE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 09:04:57 -0400
X-UUID: 33b8555d6c9740a6bd5a33764c0e7d02-20191030
X-UUID: 33b8555d6c9740a6bd5a33764c0e7d02-20191030
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 598822592; Wed, 30 Oct 2019 21:04:12 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 30 Oct
 2019 21:04:10 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 30 Oct 2019 21:04:10 +0800
Message-ID: <1572440653.21623.272.camel@mhfsdcap03>
Subject: Re: [V2, 2/2] media: i2c: Add more sensor modes for ov8856 camera
 sensor
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>, <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Wed, 30 Oct 2019 21:04:13 +0800
In-Reply-To: <20190910174450.GJ2680@smile.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
         <20190910130446.26413-3-dongchun.zhu@mediatek.com>
         <20190910174450.GJ2680@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 08B9E0922440633DA2F8946554680B04AE3552E803565E0B3BD94F55769995D82000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, 2019-09-10 at 20:44 +0300, Andy Shevchenko wrote:
> On Tue, Sep 10, 2019 at 09:04:46PM +0800, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > 
> > This patch mainly adds two more sensor modes for OV8856 CMOS image sensor.
> > That is, the resolution of 1632*1224 and 3264*2448, corresponding to the bayer order of BGGR.
> > The sensor revision also differs in some OTP register.
> 
> > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(ov8856->xvclk);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to enable xvclk\n");
> > +		return ret;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> > +
> > +	ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to enable regulators\n");
> > +		goto disable_clk;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);
> > +
> 
> > +	usleep_range(1400, 1500);
> 
> This should be commented why this is needed and from where the requirement
> comes from. Also, not, that 100us, which is only ~7%, is small margin.
> Recommended one is ~20%.
> 

Thanks for reminder.
This would be refined in next release.

> > +
> > +	return 0;
> > +
> > +disable_clk:
> > +	clk_disable_unprepare(ov8856->xvclk);
> > +
> > +	return ret;
> > +}
> 
> > +	ov8856->is_1B_revision = (val == OV8856_1B_MODULE) ? 1 : 0;
> 
> !! will give same result without using ternary operator.
> 

Fixed in next release.

> > +	ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> > +	if (IS_ERR(ov8856->xvclk)) {
> > +		dev_err(&client->dev, "failed to get xvclk\n");
> > +		return -EINVAL;
> > +	}
> 
> Previously it was optional.
> How did it work before and why it's not optional?
> 

Previous vision for this driver is for ACPI, not ARM.

> > +	ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
> > +					       GPIOD_OUT_LOW);
> > +	if (IS_ERR(ov8856->n_shutdn_gpio)) {
> > +		dev_err(&client->dev, "failed to get reset-gpios\n");
> > +		return -EINVAL;
> > +	}
> 
> Ditto.
> 
> > +static const struct of_device_id ov8856_of_match[] = {
> > +	{ .compatible = "ovti,ov8856" },
> 
> > +	{},
> 
> No comma needed for terminator line.
> 

Fixed in next release.

> > +};
> 


