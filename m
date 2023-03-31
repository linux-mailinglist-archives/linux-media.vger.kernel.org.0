Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948B06D216E
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 15:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbjCaNYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 09:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjCaNYJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 09:24:09 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB7C1A453
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 06:24:07 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bi9so28818446lfb.12
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680269046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VjpLOI3kSsLp1gVZchxWXjr+GzjeRq4bQKOT/rGECHc=;
        b=k6VpTCz8m7yY9UO+Z8Kq37FoucGH9SmTn+GG5Ty/VFU7GPo6RZjgea5kxGA/4Q8J5G
         TaQMUYiuHX/H5Y8eL2z8E0xAjMfhuGWFoFstMPctnys9jeJbymbYF5Fp/NL5KFQBVPsF
         UmMs90pAJekpX0iWuTXatUFs8v42Q5R8AxfEqJY+lpy7S3TSpKj6/7nDO6ArxnpNDxEg
         nzrIKoCsRuunhSH9eYZ1yPkE/Evv4Jw2GP95Q3pkoYHpvDahSIQ8hdj/n8+Ua7NTydRx
         gUMaJywRILFGmeFCnEbsx4lwmA3mWn0De4JCZx7XaSgpsZZdXf9KBfkuL8SKNAeVf2l5
         xT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680269046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjpLOI3kSsLp1gVZchxWXjr+GzjeRq4bQKOT/rGECHc=;
        b=cPMETo/uNAortpC1Cm37bwsSVOte3dt1xSlNdaceFPyZi0v9qNuMeR+0aJK3JDnYHB
         jd47iGz/0xxyZcpTllwh9yVCwwVk7W51DeHTEh386yPzwSoiU99Ja+KGJJHT+9k1z8+K
         DFx9C3HY74Vo4xs9VSF6/BbsuEXZbe1eV4G+O/8aECSBOpVROQuDOLzDTwx672yc/YvR
         JV+nufgVi7t7f7StnWEdI+winIchg+4UowkmMor4MvFWa7FVGmjN0B9RQ5SilhkX+ox1
         0rt64rg4xHwJ9L+SPvZNEfPgGxeTisOcrvITlYlp+y91nO8rEY7sGqpAv4gNHvfx/5S8
         CFHw==
X-Gm-Message-State: AAQBX9cN1JOQlYgwuEB8Z0vdPzoRjpAALySe0Ln44yNpUy9bgLVAsjS2
        2c3D9QoQCoo9IGd55oqF9M0aWrrbMLwbKQsx8v80Yw==
X-Google-Smtp-Source: AKy350Z6c33duEF6XeCh63NhZZ25Lzx4R6jqMducoYlMxRAYohiTLSDqQXavR/EpUfiN/KVTf+qCKQ==
X-Received: by 2002:a05:6512:49c:b0:4dc:84c2:96f1 with SMTP id v28-20020a056512049c00b004dc84c296f1mr6691209lfq.22.1680269046047;
        Fri, 31 Mar 2023 06:24:06 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id t24-20020ac24c18000000b004db3e03e201sm379574lfq.6.2023.03.31.06.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 06:24:05 -0700 (PDT)
Date:   Fri, 31 Mar 2023 15:24:04 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Add support for 3-lane C-PHY
Message-ID: <ZCbe9D+LxbWveekE@oden.dyn.berto.se>
References: <20230211144614.3816247-1-niklas.soderlund+renesas@ragnatech.se>
 <ZCbQTjL+Gy+Poeu/@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCbQTjL+Gy+Poeu/@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hej Sakari,

Tack för din feedback.

On 2023-03-31 15:21:34 +0300, Sakari Ailus wrote:

...

> > @@ -332,8 +341,9 @@ static int max96712_parse_dt(struct 
> > max96712_priv *priv)
> >  {
> >  	struct fwnode_handle *ep;
> >  	struct v4l2_fwnode_endpoint v4l2_ep = {
> > -		.bus_type = V4L2_MBUS_CSI2_DPHY
> > +		.bus_type = V4L2_MBUS_UNKNOWN,
> 
> The bindings don't require setting bus-type. Please change the bindings as
> well. And assume D-PHY in the driver if bus-type isn't set.

Thanks for spotting this, I will send out an update to update the 
binding to require setting bus-type.

About updating the driver to assume D-PHY if bus-type is not set. I 
wonder if we can avoid that and keep the driver change as is? The only 
in-tree user of this binding is in r8a779a0-falcon-csi-dsi.dtsi, and I 
intend to send out a patch to set the bus-type for that together with 
the updated bindings.

I have tested this driver change on the Falcon board and if bus-type is 
not explicitly set in the DTS it is reported as D-PHY and everything 
works as expected. So if I

- Send out a patch to update the bindings to require bus-type being set.
- Send out patch to update the only in-tree use of the driver to set 
  bus-type.

Can't we avoid issues in the future by not assuming no bus-type is D-PHY 
in the driver while still being backward compatible with the old DTS?

-- 
Kind Regards,
Niklas Söderlund
