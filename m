Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924FB2A0108
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 10:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgJ3JRq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 05:17:46 -0400
Received: from mga11.intel.com ([192.55.52.93]:46824 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbgJ3JRp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 05:17:45 -0400
IronPort-SDR: rNr9pPVO4fdyMYGV2odKEToeKjjkRi85MkDljANnssPdrlkJdXuK6+Udcfu67iC2PbEpvtGWsZ
 7785V4iMXNNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165085212"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
   d="scan'208";a="165085212"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 02:17:43 -0700
IronPort-SDR: w1IbwbktkrkgHUUjogQKipmETVnYkQgC1XD48IhM6Dy/nQ7FmnuoJJIAz/3IXbD//Qowa+xUcT
 qd4Pn+F5AuEA==
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
   d="scan'208";a="361791463"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 02:17:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9A48120736; Fri, 30 Oct 2020 11:17:36 +0200 (EET)
Date:   Fri, 30 Oct 2020 11:17:36 +0200
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
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 01/25] media: i2c: imx214: simplify getting state
 container
Message-ID: <20201030091736.GP26150@paasikivi.fi.intel.com>
References: <20201029164239.84240-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029164239.84240-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Thu, Oct 29, 2020 at 05:42:15PM +0100, Krzysztof Kozlowski wrote:
> The pointer to 'struct v4l2_subdev' is stored in drvdata via
> v4l2_i2c_subdev_init() so there is no point of a dance like:
> 
>     struct i2c_client *client = to_i2c_client(struct device *dev)
>     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> 
> This allows to remove local variable 'client' and few pointer
> dereferences.  White at it, use 'dev' directly instead of 'imx214->dev'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I've applied the original set to my tree here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>

The status of the patches is generally indicated in Patchwork:

<URL:https://patchwork.linuxtv.org/project/linux-media/list/>

"Under review" effectively, but perhaps confusingly, is also used to tell
that the patch is in someone else's tree and on its way to Mauro's. IOW, it
is not necessary to resend them.

-- 
Regards,

Sakari Ailus
