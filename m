Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F222B454541
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 11:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbhKQLBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 06:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbhKQLBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 06:01:31 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38141C061746
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 02:58:33 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id t13so4886063uad.9
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 02:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GL2vVTwkDGaxnJKnzTpSFsHa3YcDS/lACsSvbC/mwqI=;
        b=7yAOmEZtKssLDy+Mi1v2A8a/1edO5rzt+1q7QWK/blFKaXK8ebDMcY7nc+YOTG8Kjd
         ZiCyRY3v5vfuTHYoj5MVj6n6cTVNYKXbwF3zZW3xHkWSl5sOjIwMkBKLHjm+rXuKokps
         buf1CnkCaSMhGEjqACdor1ActX5fzLq7ADgXGorAAqqAK9yUJ0rWjiF7t7Ze5CY9Zs1M
         BW/fHP84yKPphZ8yQPiQhDQPHK3ITuznYGa/j2WKeH/BZX95BJI/1/4IVHS6tvl5/dc/
         7f0LvQNZKCxT9FZSexm3uxQ8dn8ZkCks7bJKZRDetCQdaQR+Y2hEmQ5tc9QQyxD7+CgA
         AX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GL2vVTwkDGaxnJKnzTpSFsHa3YcDS/lACsSvbC/mwqI=;
        b=ZYNRJPQfOtZ1JK8U+8eScOcfGE3oowOSRuUPURH1q5Yj3AkXe3iB7vml1m97zy+IYj
         96isDeO2PmO1TnJRaOaXW33ODIMJStFBIIM4jHaDZQa+WF0vxr1WebBlzM4KHWtYdGcG
         XcLmFlg6MknC3Ddwq/qS2O5ro4RWWTO65Da92XEGrt65DVJphJrB3tYXdnVHGX2w+Bbf
         /2TRkccaWC+e7w6XvlGKjXmDTAaAEEXeffhTzR8r3lPmzsCi4RTD12FdpGRry/o62c32
         oze3fXiLbS0QeNEFGR9yKxMuuOa0tCIwtmqup+VKFAbzF8LRhklTJejfIChN/+fo4V7a
         jb2g==
X-Gm-Message-State: AOAM5321x5F3IqoBYlstcQ2cepKazlM4Q4stK0h5+0imRePQb4pZ98/I
        m5J6L5vL+Jgod3ZeRWOBaxr/4u18PFOmYA==
X-Google-Smtp-Source: ABdhPJx0rFYEn6Y1Kc0Vuh2EfsmgisCwK03nysfYsSX7F1YoD/nOk5rKQZ75zS/TNfM4/Zj8NiZlHw==
X-Received: by 2002:a05:6102:dc7:: with SMTP id e7mr66274552vst.21.1637146712303;
        Wed, 17 Nov 2021 02:58:32 -0800 (PST)
Received: from eze-laptop ([186.122.18.126])
        by smtp.gmail.com with ESMTPSA id r20sm11672009vkq.15.2021.11.17.02.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 02:58:31 -0800 (PST)
Date:   Wed, 17 Nov 2021 07:58:23 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     James Cowgill <james.cowgill@blaize.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: hantro: Avoid global variable for jpeg
 quantization tables
Message-ID: <YZTgT3Gt8GVQqJtm@eze-laptop>
References: <20211111220108.1873947-1-james.cowgill@blaize.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111220108.1873947-1-james.cowgill@blaize.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James,

Thanks for the patch.

On Thu, Nov 11, 2021 at 10:01:08PM +0000, James Cowgill wrote:
> On a system with multiple encoders present, it's possible for two
> encoders to write to the global luma and chroma quantization tables at
> the same time if they both submit a JPEG frame to be encoded. Avoid
> this race by moving the tables into the `jpeg_ctx` structure which is
> stored on the stack.
> 
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
