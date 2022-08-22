Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC63159C00F
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 15:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234890AbiHVNE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 09:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbiHVNEX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 09:04:23 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5290A1CB07
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:04:21 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id c9so6597033qkk.6
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=KcX7ckfFUtiHcdet+AiR0QWuHM0/dQTQxELMoB4uI60=;
        b=ldpifsCCYszxEAXgTQzDv/bafpAXpVyCus6EOAM3oHgm08MzDl3luHViyiQLo7pWvF
         ATHLKHsR1x5OXPmrPVgUsffO8RBLCBuWM5INcwHkYOSuGOz/ww7EwUaARIHSBQSl0h6t
         h+OHQRdry2zV39FijQ3ZZVIBnNUTNoEvGp20zhUf4DS6qvxR64Jaf3Q1BaYAOSEpeIAd
         jF4f0Uwk7nZD2juaKG/wSW6m6G2bNPSXCozka00P+pe8aOxOxUIDlmhqUbbdkpy8d7BH
         itdq6MszS58lEcVzRW51UYPexY87MtDBR37mzR9B3GsVWs/cIy77OS1dHSJhZq/APFtH
         Dlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KcX7ckfFUtiHcdet+AiR0QWuHM0/dQTQxELMoB4uI60=;
        b=xuRW9RWOaAT5ZeznCnqBREh8Ug1OB6sygPSMmH4X6bK4VgsWEAKzZFo1icjf2c3D7F
         ZzCirdtAOooZRvkC2dwH2IbKzfVW84z0oUMM/dCqk8MJVtkzRegePsw8RAGR7DuGBQQq
         h/hcvYuynVVOraIFGQO/CNsbvHmuE56tVtZaROE8mVl6iB6pmrqGBhDZ5LtKE0sdjjSL
         SHHKxAG8fTyiE5iWg5eV/zF7nwSaqehPbJV29AH9257nVDMBjaoJtWkOVbjqe/ztTs6F
         b53vzZE52aj3PMfmvv6cICNS1x9DvuYhswxhmq53Eoj2cm7WnNLn9OWZH3cYu//jQ2tF
         Gthg==
X-Gm-Message-State: ACgBeo3/wR5liFQVlVsMmoIWqKIGDUimEVGUqkJ3A/DAGxHvLXQlwByI
        z/AuB6F6uTwlnvmYTDAmkLSW4Qdk+iZfSJ0WLJSJXsQyFXGzzQ==
X-Google-Smtp-Source: AA6agR4BFlpKGK3V236Sps73C2mTbHhDlJRXSY5jzzm7xgc/39BA0fExqDO8cw1NBDs6YPu+NFflGX2qP0y9a/o4fOE=
X-Received: by 2002:ae9:e311:0:b0:6ba:e711:fb27 with SMTP id
 v17-20020ae9e311000000b006bae711fb27mr12367682qkf.320.1661173460190; Mon, 22
 Aug 2022 06:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com> <20220821215027.461344-13-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-13-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Aug 2022 16:03:44 +0300
Message-ID: <CAHp75VdJETEOf_t_F0f591zOj3U_ALuadE4LHzF-8sXPPgUnEQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] media: atomisp: Ensure that USERPTR pointers are
 page aligned
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The atomisp code needs USERPTR pointers to be page aligned,
> otherwise bad things (scribbling over other parts of the
> process' RAM) happen.
>
> Add a check to ensure this and exit VIDIOC_QBUF calls with
> unaligned pointers with -EINVAL.

...

>         if (buf->memory == V4L2_MEMORY_USERPTR) {
> +               if (buf->m.userptr & ~PAGE_MASK) {

offset_in_page() ?

Further we may utilize helpers from pfn.h in the driver.

> +                       dev_err(isp->dev, "Error userptr is not page aligned.\n");
> +                       ret = -EINVAL;
> +                       goto error;
> +               }

-- 
With Best Regards,
Andy Shevchenko
