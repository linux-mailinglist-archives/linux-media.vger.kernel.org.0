Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210FF205270
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 14:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732565AbgFWM0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 08:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732478AbgFWM0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 08:26:00 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344D5C061573;
        Tue, 23 Jun 2020 05:26:00 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id C5559634C87;
        Tue, 23 Jun 2020 15:25:36 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jnhzc-00016j-NF; Tue, 23 Jun 2020 15:25:36 +0300
Date:   Tue, 23 Jun 2020 15:25:36 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, manivannan.sadhasivam@linaro.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v5 06/10] media: i2c: imx290: Add support for test
 pattern generation
Message-ID: <20200623122536.GE870@valkosipuli.retiisi.org.uk>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org>
 <20200612135355.30286-7-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612135355.30286-7-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Fri, Jun 12, 2020 at 04:53:51PM +0300, Andrey Konovalov wrote:
...
> @@ -448,6 +466,22 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_GAIN:
>  		ret = imx290_set_gain(imx290, ctrl->val);
>  		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		if (ctrl->val) {
> +			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x00);
> +			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
> +			msleep(10);
> +			imx290_write_reg(imx290, IMX290_PGCTRL,
> +					 (u8)(IMX290_PGCTRL_REGEN |
> +					 IMX290_PGCTRL_THRU |
> +					 IMX290_PGCTRL_MODE(ctrl->val)));
> +		} else {
> +			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
> +			msleep(10);
> +			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
> +			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
> +		}
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;

I've merged the patches in my tree. Could you still replace msleep() with
less than 20 ms with usleep_range() usage as a follow-up patch on top of
these, please?

-- 
Kind regards,

Sakari Ailus
