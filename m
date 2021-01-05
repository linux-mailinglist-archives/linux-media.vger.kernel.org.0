Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4E92EAD6D
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 15:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbhAEOhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 09:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbhAEOhi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 09:37:38 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0880CC061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 06:36:58 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a12so36370454wrv.8
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 06:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zxKeTAl8qUFEUHg6Ng706rcbIk3kGgaHgP9OULRgcic=;
        b=CbVhc5Sm19k/+KZfCBtXivGlgYvbM4aFULIyihzmxU1Ih55loVrVP2uH9p24METGtr
         lSQrrmnSISnKnMqklbHJectVgK9UM8JdId9pKQdLtWtI2+ah9FGIze3yXOf8GIRO4FG3
         fsjQm/WRf4bhBtqmCk2EMsCl47oolDABb55C5kivs1lkGkELf3CmSpCO+hQj9bw+ypYp
         iCzSacaxrKQOi4RsZa2v5yKEQ2bFDgEATZJdwKMyaAC3PkAoe+1RK9g0Zeb3dFl5J0R2
         8afVeVHMZnJ0/tSDD1InWryFCb4TwwlnpRxnldL5ol2tMd7f0tNr6GiCqElsq3B+7UBL
         Nq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zxKeTAl8qUFEUHg6Ng706rcbIk3kGgaHgP9OULRgcic=;
        b=W8n/bjpPfqBXiPBE32nVEqZsouui6cAjx2ms23uX9StUXKuqjLoPyhHhUSIftds/th
         OzIKg3L2BHoAao0eSgsaJi9Vtlljsrp+poLUOjYkmONlGXb/q3otCJHkugMVBAbZjrqv
         446lSf7/kJzPDATN/cjRBnv3XaIp7xJQls0txQfJz7dzdF0tuyS3EDUNSDg1YbkK2Mp5
         rAexIQ9cszi/8359neRw5bJKAtgxZtZrLEAWVGKwFvafyVoCOeQHEP3GlGonE4NoHGok
         ZG7y3WZAUH6GGBBbHEk3rquR7w8osdSMbRLDjbU3cWOp0ilBMlly/AksEmpuEuypUm9D
         JZWg==
X-Gm-Message-State: AOAM5304gfbJqiSTIwyqJCZ4juZ6blCHZjLGl31iy46hI4IvzfwXSL/d
        JDV3Tc48YJezpHZ34WEGZSc=
X-Google-Smtp-Source: ABdhPJxdkZf5ZgdqQytYCG2n1eeobXPMfaK9wv7Fh1++06rj+KQqjBemyuSADmoMlH9qD7gARTPdfw==
X-Received: by 2002:a5d:4712:: with SMTP id y18mr85638685wrq.229.1609857416863;
        Tue, 05 Jan 2021 06:36:56 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id b127sm4932154wmc.45.2021.01.05.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:36:56 -0800 (PST)
Date:   Tue, 5 Jan 2021 14:36:54 +0000
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
Message-ID: <20210105143654.yrrfimpo2hej4bvp@arch-thunder.localdomain>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
 <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
 <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com>
 <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
 <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5BkbB7KHP3pz1SLgD1Vth-BcZAEuxsaSQJ83Y6O=DDPdg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Tue, Jan 05, 2021 at 10:45:59AM -0300, Fabio Estevam wrote:
> On Tue, Jan 5, 2021 at 10:19 AM Fabio Estevam <festevam@gmail.com>
> wrote:
> 
> > I switched to the same 5.4 you used just to make sure we are in
> > the same codebase.
> 
> Just tested against next-20210105 and the original warning happens
> and csi is no longer probed.
> 
> I am using the same dtb that worked on 5.4.84.
> 
> It looks like we have a regression.

Since we do not have many changes in there can you bisect?

maybe?
86e02d07871c2 media: imx5/6/7: csi: Mark a bound video mux as a CSI mux

------
Cheers,
     Rui



