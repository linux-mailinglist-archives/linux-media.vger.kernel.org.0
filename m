Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5282B5ABB
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 09:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgKQIHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 03:07:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgKQIHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 03:07:44 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8964EC0613CF
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 00:07:42 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id gv24so8392pjb.3
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 00:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S9D5H3vIABE8oHWCpKrGPYKWDfwKYsXG/qK+2jWj2+4=;
        b=pZ/YDANKoZFXSNiO3LiDQ6+JZZwtXqbOxUOpchkERbXOUhkpex7oloNapQKnmFbilW
         9/pe5DccaupnuJ+Za73YuvClrIk1RjV5qBdLlSqetfiAqyP+DKzINpkTApi6tVXfbUFI
         ufZVQMqkkFjT1y2VA0OE6fPZTnLaDjRA/SuH4qu0yBGO3/JNVukI7TaM3VTwQQdqfqES
         DVmBYXj8yYbDiHFgaSJCiP2ud6YDolR3THrWZQoxIhOzhZ4cv67DVWDVftQ81JqL+mGN
         u1kYdMX4FERJ3be9vD5Dt2TJpentvruNu72W/XbV2l/6Icj3E3+MFZH2Oo775O1sGnLe
         lfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S9D5H3vIABE8oHWCpKrGPYKWDfwKYsXG/qK+2jWj2+4=;
        b=F6ef2+Se8x1PKudNvKQxNwP53VDr6RIOEc5NDNSXGiChMX+4iKHjT0lMZJylnSA2bh
         DRKzf2qxFPKwXDb5f+XzYV3Oz0UdmEBiWgsjDT2iV5C9YZ0zvFa12nFQCY6nSmBe/b10
         xTy6JpWR5lUkKqsV551DIbkYLGw7jdaf8GKY7XiMM8vqgBL1U/GKz2YfYM7KJaywFVu4
         rjmgIGbIOVcPMeLTM3vOngL4MQtPrAJRqQG3V7ORWdSHKbUUfO/LxiLWDjCI4ldeO5fQ
         xgYEc26tWLtyQOXV/CNOvoVeL3gqvBkyEEX4qMcCqFJWyDXyPlT0+YmLBjwR7nJmB/zS
         BRrg==
X-Gm-Message-State: AOAM530rCpeUP4w7lRYHT7bSMBdD9ijwxCFEu/3D2unLicyg5uf/CHu9
        gk4LspDCHPIqihiAHZpUNac=
X-Google-Smtp-Source: ABdhPJyvqFEFg03TOcY+5BBNgFl47ucZKwJcc3F1fPHUDZ4U83YiuTxwNE5RLqlrXOyXv5XBXTH5pw==
X-Received: by 2002:a17:90b:a54:: with SMTP id gw20mr3613931pjb.178.1605600461205;
        Tue, 17 Nov 2020 00:07:41 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id j12sm20929313pfd.203.2020.11.17.00.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 00:07:40 -0800 (PST)
Date:   Tue, 17 Nov 2020 17:07:38 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org, tfiga@chromium.org,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH] media: i2c: Add ov9734 image sensor driver
Message-ID: <X7OEysbnAhTXEmUq@jagdpanzerIV.localdomain>
References: <1603940341-25224-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603940341-25224-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/10/29 10:59), Bingbu Cao wrote:
[..]

Looks good to me,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Several comments below.

> +static int ov9734_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov9734 *ov9734 = container_of(ctrl->handler,
> +					     struct ov9734, ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov9734->sd);
> +	s64 exposure_max;
> +	int ret = 0;
> +
> +	/* Propagate change of current control to all related controls */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max = ov9734->cur_mode->height + ctrl->val -
> +			OV9734_EXPOSURE_MAX_MARGIN;
> +		__v4l2_ctrl_modify_range(ov9734->exposure,
> +					 ov9734->exposure->minimum,
> +					 exposure_max, ov9734->exposure->step,
> +					 exposure_max);
> +	}

Should this be done after pm_runtime_get_if_in_use()?

> +	/* V4L2 controls values will be applied only when power is already up */
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;
> +

Here.

[..]

> +static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct ov9734 *ov9734 = to_ov9734(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	if (ov9734->streaming == enable)
> +		return 0;
> +
> +	mutex_lock(&ov9734->mutex);
> +	if (enable) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			mutex_unlock(&ov9734->mutex);
> +			return ret;
> +		}
> +
> +		ret = ov9734_start_streaming(ov9734);
> +		if (ret) {
> +			enable = 0;
> +			ov9734_stop_streaming(ov9734);
> +			pm_runtime_put(&client->dev);
> +		}
> +	} else {
> +		ov9734_stop_streaming(ov9734);
> +		pm_runtime_put(&client->dev);
> +	}

I assume that we will never see erroneous ->s_stream(0) calls or
 ->s_stream(0) after unsuccessful ->s_stream(1). Otherwise we will
do extra pm_runtime_put(), not matched by pm_runtime_get().

	-ss
