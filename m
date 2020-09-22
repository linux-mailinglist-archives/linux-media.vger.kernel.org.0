Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900A7273EA7
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 11:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgIVJhh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 05:37:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:50465 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgIVJhe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 05:37:34 -0400
IronPort-SDR: VfG8n6HJ4q+Y+FaPEYxgXr2SNci9TTgiHOZZ3VFeKbouMoiw4CrI+orrRaXsCRZ1N+I0beYRx2
 MgFe68Dvv6rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="222162737"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="222162737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 02:37:33 -0700
IronPort-SDR: 5dTH0aMWWDlqA83WBT5OraY8R0WaqZsG4Ki9+grMis2bnidcLtPQFbBjaTC4m4EFVkw6gpzGH+
 KQuTRWxr6ycw==
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="346878098"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 02:37:28 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 51C9B207DA; Tue, 22 Sep 2020 12:37:26 +0300 (EEST)
Date:   Tue, 22 Sep 2020 12:37:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/25] media: i2c: imx355: silence unused acpi_device_id
 warning
Message-ID: <20200922093726.GN26842@paasikivi.fi.intel.com>
References: <20200921162342.7348-1-krzk@kernel.org>
 <20200921162342.7348-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200921162342.7348-7-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

Thanks for the patchset!

I believe the I²C client has been dug up first as we've been dealing with
I²C devices all the time, and it's been a pattern. I don't see that as a
reason to reject the patches either though, it definitely cleans up the
drivers.

On Mon, Sep 21, 2020 at 06:23:24PM +0200, Krzysztof Kozlowski wrote:
> If driver is built without ACPI, the struct acpi_device_id won't be
> used:
> 
>   drivers/media/i2c/imx355.c:1836:36: warning:
>     'imx355_acpi_ids' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/media/i2c/imx355.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 51245e71b411..8db287251f49 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -1833,7 +1833,7 @@ static const struct dev_pm_ops imx355_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(imx355_suspend, imx355_resume)
>  };
>  
> -static const struct acpi_device_id imx355_acpi_ids[] = {
> +static const struct acpi_device_id imx355_acpi_ids[]__maybe_unused = {

A space before __ perhaps?

Albeit this seems to be all, I can address that while applying if that's
ok.

>  	{ "SONY355A" },
>  	{ /* sentinel */ }
>  };

-- 
Kind regards,

Sakari Ailus
