Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D9F2EB385
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 20:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbhAETdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 14:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729239AbhAETdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 14:33:37 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B63C061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 11:32:52 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id c5so318592wrp.6
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 11:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rhQwg92cYbZMf4kN5FZY8clXse3CH57PY5yAttFGnNI=;
        b=J7VrUnp8gYFTNw1Av/RDPgx2rJje9D8lp5op/b/DB8zunl8TmtXqjlA7MIfCYRc/d5
         qA/cyGQFlkRA5EDhwMN/ZhaRg126wXt1rnF6vVPQrrS4bxTUoHagG7cbcL6iY79QP5wx
         oJ1krJ4/pebHYyvX4gvt1lHDQaZYaJQZrHyf6hwmqXrY19kv+Kak2+aDp9O3cFL7Ysps
         8rdZx9+FfFvJry9++gFnX8uoW1ZE2cTnotJhSWtM9sc9mxCP4Clh3InbUh9x9pksWzcD
         DXXZXZfRr28+yAnY2dNra6SrWZ35TeIMiRwimcx3l93aDragpfhaK7NLhcKt14zDB8RJ
         23Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rhQwg92cYbZMf4kN5FZY8clXse3CH57PY5yAttFGnNI=;
        b=q1JznhdJeYR973WzE3WqrYIUM1D22Xt80kdoVZNUH0M7E3yuv7R8RYht1Nq9tSXBCd
         zs//1jOkQ/+ARo6eIxXeqqEqYAUAcILicXSl+rSKh87RIw5B0zQACyytllzXYE4zPf0P
         47B9fQQFO+N4y05SCCjnwF5b7A7vZjidu0voZSvof9MIKiQ+cSw0oxwvL8g07M5p5mxg
         6XV6p3iMZyhcf7yYKucX6HCxRGiUbRLRcZ85l22sPg1lHGL6TLpkMMFWXVfIBv+D1+VH
         Rwljb0GnK1jpaYGqPLlFv/bcO8ia7BT7VYfPudamOsu51zD9IhWnsJdJvEi1pUbI7lHG
         PmHA==
X-Gm-Message-State: AOAM5331aAWFAJ5jwyN/7ITS45mTZcl/TT2TjKjIUVPTOeqliwZ1xL4H
        fsCE7svIpuwuDXxrXJyrEw0=
X-Google-Smtp-Source: ABdhPJyQ0vojQrjRqUVq1Qd1t0Iu7Uwu4OXKO+27Q8tmFbB/sXUEX1jLapwCtZ+pyQguakIGf1SRkA==
X-Received: by 2002:a5d:4712:: with SMTP id y18mr1013323wrq.229.1609875171172;
        Tue, 05 Jan 2021 11:32:51 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c10sm100344wrb.92.2021.01.05.11.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 11:32:50 -0800 (PST)
Date:   Tue, 5 Jan 2021 19:32:48 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <20210105193248.hegbxct4kiurdnzq@arch-thunder.localdomain>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
 <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
 <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com>
 <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
 <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
 <CAOMZO5D1Lk6evyRZ08erQ3DaVgSHubGjGbK8dcKao=NS+m-PUA@mail.gmail.com>
 <20210105150129.fresebmib75htyl5@arch-thunder.localdomain>
 <CAOMZO5D+GGM_QPc0=nWEYe=XV1EBgUS7ff+t+0aER-fg+a4PKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5D+GGM_QPc0=nWEYe=XV1EBgUS7ff+t+0aER-fg+a4PKA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Tue, Jan 05, 2021 at 01:05:52PM -0300, Fabio Estevam wrote:
> Hi Rui,
> 
> On Tue, Jan 5, 2021 at 12:01 PM Rui Miguel Silva <rmfrfs@gmail.com>
> wrote:
> 
> > can you see if the following patch make it work again?
> 
> Yes, with your patch and mine I can capture the same way as with the
> 5.4 kernel :-)

Great that it worked.

> 
> The pink color issue is still present but it is orthogonal to this
> problem.
> 
> Could you please submit your patch formally to the list? Please
> include my attached patch as 1/2 and yours as 2/2.

yes, I will create a series with the correct fix tags also.

> 
> Also, please add the following tag to your patch:
> 
> Tested-by: Fabio Estevam <festevam@gmail.com>

will do, thanks and sorry about your issue, I really thought that all
imx, including imx5,6 and 7 had a mux. I need to get my hand in a
imx6ull full documentation.

------
Cheers,
     Rui
