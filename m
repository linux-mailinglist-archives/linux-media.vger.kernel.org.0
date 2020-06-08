Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE1A1F11A2
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 05:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgFHDL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 23:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgFHDL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 23:11:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22ACC08C5C3;
        Sun,  7 Jun 2020 20:11:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E89E2C9;
        Mon,  8 Jun 2020 05:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591585913;
        bh=o3gXWP2/3hk/aMnwZ9n2UL8s6c1rZAqBPrr54YZAGh0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cyC+6XTL60swUYZA4YrYqawpNeex+1EmJFY99syleO6FgNjMqyQOtmDiDP7KbcWQP
         cgviici9KeGVjP0c2KwLIhUn2OoJxrNNa7sZLo8OhkK1WrPwZvA52KT+1Ss1eQUXR9
         pR4Hn/35uFKUFwnH5CQzGpDVv8CXJRiVosmhYAxI=
Date:   Mon, 8 Jun 2020 06:11:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dinghao.liu@zju.edu.cn
Cc:     kjlu@umn.edu,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: vsp1: Fix runtime PM imbalance in vsp1_probe
Message-ID: <20200608031134.GO22208@pendragon.ideasonboard.com>
References: <20200523115426.19285-1-dinghao.liu@zju.edu.cn>
 <20200608015456.GJ22208@pendragon.ideasonboard.com>
 <20200608015753.GK22208@pendragon.ideasonboard.com>
 <7b79863f.f636d.17291e1ff94.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b79863f.f636d.17291e1ff94.Coremail.dinghao.liu@zju.edu.cn>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dianghao,

On Mon, Jun 08, 2020 at 11:03:26AM +0800, dinghao.liu@zju.edu.cn wrote:
> Hi Laurent,
> 
> > > I wonder how many bugs we have today, and how many bugs will keep
> > > appearing in the future, due to this historical design mistake :-( 
> 
> Good question. It's hard to say if this is a design mistake (some use
> of this API does not check its return value and expects it always to
> increment the usage counter). But it does make developers misuse it easier.
> 
> > > This change looks good to me, but we also need a similar change in the
> > > vsp1_device_get() function if I'm not mistaken. Could you combine both
> > > in the same patch ?
> 
> Thank you for your advice! I think you are right and I will fix this in the
> next version of patch. 
> 
> > And actually, after fixing vsp1_device_get(), we should replace the
> > pm_runtime_get_sync() call here with vsp1_device_get(), and the
> > pm_runtime_put_sync() below with vsp1_device_put(), so there would be no
> > need to call pm_runtime_put_sync() manually in the error path here.
> 
> The parameter type of vsp1_device_get() and vsp1_device_put() is "struct 
> vsp1_device". If we want to use these two wrappers, we need to adjust their 
> parameter type to "struct platform_device" or "struct device", which may 
> lead to errors in other callers. Maybe we should leave it as it is.

The vsp1_probe() function has a struct vsp1_device whose dev field is
populated by the time it needs to call pm_runtime_get_sync() and
pm_runtime_get_put(), so I think you can use vsp1_device_get() and
vsp1_device_put() as drop-in replacements without changing the
parameters to these two functions.

-- 
Regards,

Laurent Pinchart
