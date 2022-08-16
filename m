Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4181C5957FF
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 12:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbiHPKUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 06:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbiHPKUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 06:20:19 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9CFD8
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 01:18:07 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id f192so8730179pfa.9
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yiBicl/xtck+sUvDa6HbwVr3KCpBiQ3kP9sWsGd0v+M=;
        b=uT3jiYPYFRn7lq9viYTDzroDVdXL8pYjwBzK6ZhdPWJ3ales5ct7XINz7ercxdfD7Y
         rvax/AK/RPxyH9Qyvj6cKGyu5Z9eSVcZeTL3ghWM02DMNeRTu1dNZ7beU/wveqK5kb+b
         cgTDsiraqeHQID8d9ZRhhEi710zRj0h9tNoJIy/ZIZdDiEU/5Tq3uSnDDCMR184RYyCg
         LVWxI+KwzGdKQ6ji/qPZRP+nel4pcCCfqXweiR63F69BqC+Nt+6QIM31Ab1sSdW2FTPk
         LjcGqOsRMi5qhAbnOjRjnE/4ICeEvzLIfRc/1JoVKPEsJ2GoYjX+SmVkYwcf+ocJax8W
         K0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yiBicl/xtck+sUvDa6HbwVr3KCpBiQ3kP9sWsGd0v+M=;
        b=yvf5DnomuBXwAaYPY5WEmsUb6g3RLToM+q2CNj8t0EHybnpQYLAozArYnm4bVj5Yzp
         4eGQj4JqTXYJx0I5EWrZbSVXxapt0tJ125N1k63wVA+ZT86R3peSnPIg3RhbpugYzlhq
         T25n72TlUNvgIwQpwvSKgqZSJyDHVvPxw2DQdB0sT/ck8080mSm1VhB5KuadHiZgtcrU
         dA184rQTjx1ywhsZlqJLITeh+LIgy5djPVU11YWRAL5xEWPd7Xk9kuGnJWVmi6XOLBwj
         Eq4QVqR3hLapqFo2dwo7+vRvXuzXlw956mUdPKNNz4Zovq5NFPXo9j7ImVprV0SRTy/K
         0/wQ==
X-Gm-Message-State: ACgBeo0k5NsMLH5nA+k0c2a/1+KWIIy0bW8jiFV2py2vrxM8qH30+sCJ
        AV4xdYjs17KorJUaGCYvf9ZxAPUpWjrCLCPWfrU53g==
X-Google-Smtp-Source: AA6agR7a2co2/3EHjLJWWfyl0Y9FC9Qup8Vvr947CQmLmaKAXgb15xFZYz1xNiLfRaHjV9zeEjmoSBme+mzy7PUZf/A=
X-Received: by 2002:a63:e217:0:b0:41a:69b1:a68e with SMTP id
 q23-20020a63e217000000b0041a69b1a68emr16488504pgh.428.1660637887011; Tue, 16
 Aug 2022 01:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
In-Reply-To: <20220812143055.12938-1-olivier.masse@nxp.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Tue, 16 Aug 2022 10:17:56 +0200
Message-ID: <CAHUa44EgA1btRyj2ByooyLr9Q+8AmW=9EfjtQFxyr7DuCXASvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
To:     Olivier Masse <olivier.masse@nxp.com>
Cc:     etienne.carriere@linaro.org, sumit.garg@linaro.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        op-tee@lists.trustedfirmware.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, clement.faure@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Olivier,

On Fri, Aug 12, 2022 at 4:31 PM Olivier Masse <olivier.masse@nxp.com> wrote:
>
> Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> shared memory from a dmabuf file descriptor.
> This new ioctl will allow the Linux Kernel to register a buffer
> to be used by the Secure Data Path OPTEE OS feature.
>
> Please find more information here:
> https://static.linaro.org/connect/san19/presentations/san19-107.pdf
>
> Patch tested on Hikey 6220.

What's new in this V2?

Thanks,
Jens

>
> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>
>  drivers/tee/tee_core.c   | 38 +++++++++++++++
>  drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
>  include/linux/tee_drv.h  | 11 +++++
>  include/uapi/linux/tee.h | 29 ++++++++++++
>  4 files changed, 175 insertions(+), 2 deletions(-)
>
> --
> 2.25.0
>
