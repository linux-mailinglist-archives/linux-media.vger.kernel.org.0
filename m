Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678FE3B23D0
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 01:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFWXJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 19:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhFWXJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 19:09:13 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DDEC061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 16:06:55 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id E38132025E;
        Thu, 24 Jun 2021 02:06:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1624489606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SItRF4AQvZE4S9Y4n3JHJl8Oo2HpyCmycPOs/yrugrs=;
        b=anaqdPflwfAB39MH2ES/aWFjkeOFuTX43DP5OaB6qaA0wB22L2VKw3bs3BiYzzqwXdrhVo
        C+8dgXAZWWzKymPW3fi7RVqhvz+urVwQXSsWASNxRXyW+ujWnUFyP4pdwX4/JpeiCYA3gW
        qNq5zaj0a0VEYp7BezhNemi9EndefuE=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3A6ED634C87;
        Thu, 24 Jun 2021 02:06:32 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lwBxF-0000zc-CY; Thu, 24 Jun 2021 02:06:45 +0300
Date:   Thu, 24 Jun 2021 02:06:45 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Subject: Re: [PATCH -next] media: omap3isp: add missing unlock on error in
 isp_subdev_notifier_complete()
Message-ID: <20210623230645.GI3@valkosipuli.retiisi.eu>
References: <20210512092301.4124736-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512092301.4124736-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1624489606; a=rsa-sha256; cv=none;
        b=kZR9CAlYl3f+UigA8iYtIK9ylAoTbnQVLj7OISDf+lSAqNmxgy0wshDeZRObZPoy4R9VyO
        2K7+Camv032bOm7aGec5UHeXuferZE1hCKAiWPnErAOhrgprkOG5t4t9mUyeBkxerxCHLk
        mA+BTakhT2JciFSwGKl+T8ksfnlV2MQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1624489606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SItRF4AQvZE4S9Y4n3JHJl8Oo2HpyCmycPOs/yrugrs=;
        b=Li1xDqp/2H8nPQMIEkCG3V/by3l7u8rm4aw3aaNE2depkwaeEdZNZwDI4Zt+30ZcJuxkev
        LAPoKq8aEROuuRPGNnpSF/N0MtXBAz4uqvnuD/wKsXjgymF5tDIapQrD9wSwaKB/4AGIec
        nvTX4GlzI8zZC/bU09OS5CHoac1sW5w=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

On Wed, May 12, 2021 at 05:23:01PM +0800, Yang Yingliang wrote:
> Add the missing unlock before return from isp_subdev_notifier_complete()
> in the error handling case.
> 
> Fixes: ba689d933361 ("media: omap3isp: Acquire graph mutex for graph traversal")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks for the patch. This is already fixed by another patch, accidentally
left sitting in my tree... It'll be in the next pull request.

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20210407143733.1608806-1-weiyongjun1@huawei.com/>

-- 
Sakari Ailus
