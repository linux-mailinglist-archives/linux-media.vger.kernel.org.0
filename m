Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D875BFA4C
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 11:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiIUJLp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 05:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiIUJLk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 05:11:40 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1B68C450
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:11:37 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id q21so7646610edc.9
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hlC2p+E/yc6bwCFB5rHdNjGD3v4BzbiXxKD6+IxrA4w=;
        b=Jx0F84042gQuC89Ameu9TN2kZwDhxx/lJ5KA/eLm1Uwq9Z8TCHSQYr/2G+Ebtvl4Yb
         Qix3GWI32LGeKyNNC76h5+V3GISpuVL31z20P7lb1J1QduuILrRJTBxhYPbxNmzKgKoY
         YoNDA7tVKJZVcm16TziNbtw1sibOjFtmVrWew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hlC2p+E/yc6bwCFB5rHdNjGD3v4BzbiXxKD6+IxrA4w=;
        b=B2qUZvE5H/t7glYR2mdcT6koCkf3wJ5njLKINcrM7CEEcappaVY2W/1xL2TTZLuH4I
         k2/YXKqFXhnBTr+YNFe9yaTp9ceE1MVnLi0t63I8B2pxBnaWj1vt0R7QetatHJfBnF9J
         /GOjoRLlKDbRmGnWKe7hhM1rRI01eX6Lq9+GHRtYxbWke2zbYtngi/cHDh1xl3fmUHFR
         SclGp14L6GWTqJ88uFPw7JiAazA4PF2obIhd2srPjAayGEWob6q5zW0eDceUbcAFtcDV
         C7MkJatzO3R6Angvk+OR2EK8CCY2PI9eMOKG/iow/sIDMZHnwzzro0FCCVCLTWpoWkK2
         269w==
X-Gm-Message-State: ACrzQf01y+ybiTJKECLKN+MiojGcrLdiZ8nEHc+amXCQ4Bg5DW4mdnIE
        npKulo5BKtk65KokiI9fBYm0T35S42t01M3u
X-Google-Smtp-Source: AMsMyM7XjLNyA8NBVNJwRXaKgz2HuJqvtq9DKLRv3DC9517n5VgqKppjD8z+JehV9LlYSpkpri/UmA==
X-Received: by 2002:aa7:d392:0:b0:44e:67f2:c79c with SMTP id x18-20020aa7d392000000b0044e67f2c79cmr23316912edq.278.1663751495183;
        Wed, 21 Sep 2022 02:11:35 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id d12-20020a50fb0c000000b0044eb4227bf6sm1408496edq.63.2022.09.21.02.11.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:11:34 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id e17so7674253edc.5
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:11:34 -0700 (PDT)
X-Received: by 2002:a05:6402:3547:b0:451:3be6:d55b with SMTP id
 f7-20020a056402354700b004513be6d55bmr23668147edd.57.1663751494159; Wed, 21
 Sep 2022 02:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220920-standard-menues-v2-0-a35af3243c2f@chromium.org>
 <20220920-standard-menues-v2-1-a35af3243c2f@chromium.org> <YypjfCLkmHRrsD66@pendragon.ideasonboard.com>
In-Reply-To: <YypjfCLkmHRrsD66@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Sep 2022 11:11:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCsk7nOTjW2j08LM4++221TXTrZHpMuJwtBF8rHp_x+MZg@mail.gmail.com>
Message-ID: <CANiDSCsk7nOTjW2j08LM4++221TXTrZHpMuJwtBF8rHp_x+MZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 21 Sept 2022 at 03:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.

Thank you for the review. I think I have addressed all your comments.

I have tested it on real hardware at
https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/log/?h=ribalda-next

And this set conflicts with the v4l2-compliance one. So I have rebased
this set on top of the other one.

Thanks!
