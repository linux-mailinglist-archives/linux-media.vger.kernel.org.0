Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010886369CB
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 20:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239593AbiKWTTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 14:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237382AbiKWTTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 14:19:36 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCF138B0
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 11:19:35 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id f18so5901939uam.13
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwMzuEDw937D1BNWUA0+s7FH/Sv/GWnLAgn8jMy5G/0=;
        b=g/nn420R1OojaK+ZrP5yWqCPRWhqBR3yJ1bGeZnSy5rk1jJk4NsK6VjXpTG+jsegam
         dBm2h9744Pvni4Tx3Vg54pqwd9DZjb1z22H0MRPKB+9jQeP56FN28EFvVyFJz2E5LBJ9
         oImZsEE9BVhSfGNwgLNk2FshAC5d0BF1yGL9i7WxmEAZHKb39SwzeGlFMlYz+KbBSU/1
         OBcH6y45lXdKxud/yud4DKrczBhWp7gVspfwxvN5+bANrEhxzl32kMonJcRnomPu/vRA
         fHY4Ktf8hzgF8/QRtPHetAsVza0ZL9CslbOCwPxxHRp9lsOejr9Lr8cvglm0ml7YP14v
         LTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwMzuEDw937D1BNWUA0+s7FH/Sv/GWnLAgn8jMy5G/0=;
        b=4h7/ttoTWY0VJP+hp+ngMQp4hWhEkbNksQi0lV+sg07VMRu4GbAG8iLXoHlg51y3g8
         S7eTkEEQ6E7R1DHuXJqhjnoanpWeJTLUR8X9zyUWd1ao+V6lx8gS5uzOXENYZj4DAMhv
         pNLVO22vM3AKFPPiD4s9zk9B5e5GdF9UB8Ks/yJz813018tkXY1Oq1b25OIZBPqk2Iia
         PqzxQHT4Lo4PKDH+OBHssIwOnPWlMh2e9tkoYxuO6v/VBAz2hH4KHl2EPv1aqphNXgDh
         FtkUCos+StOVZUW/8w7oA+vy0ONh8+mj2hLJM06Xn9zWpghcIV6+q4EJg2rgyjJgB/M1
         Y5yQ==
X-Gm-Message-State: ANoB5pklnNy3pQK3GWKtprV6KKvxqaYgahzfCCyMc7nJiyZZzeXQKgxG
        G6HLl7UKkyZf5FFfy2vciah2yLm+K83DeK2yl7Waqk8zQA==
X-Google-Smtp-Source: AA0mqf7ymL6DaildKXguHmgnNFyFiHrXAqeOVxwz1oN82oZWA+QVsylDv6FEwr3OYMAtZxhB6iEMFSrnXPfn7MTN3I8=
X-Received: by 2002:ab0:4986:0:b0:414:4bb5:3e54 with SMTP id
 e6-20020ab04986000000b004144bb53e54mr6742748uad.121.1669231174806; Wed, 23
 Nov 2022 11:19:34 -0800 (PST)
MIME-Version: 1.0
References: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <TYCP286MB2323894F9939C27291FD998CCA0A9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <56393e84-485b-42ba-5fce-d4a0d0017653@amd.com>
In-Reply-To: <56393e84-485b-42ba-5fce-d4a0d0017653@amd.com>
From:   John Stultz <jstultz@google.com>
Date:   Wed, 23 Nov 2022 11:19:24 -0800
Message-ID: <CANDhNCrKaa580Hb-w5GcGxo-h5xr9_GSq86JUSfR+meVLqiY1g@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: fix racing conflict of dma_heap_add()
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Dawei Li <set_pte_at@outlook.com>, sumit.semwal@linaro.org,
        benjamin.gaignard@collabora.com, labbott@redhat.com,
        Brian.Starkey@arm.com, afd@ti.com, sspatil@android.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 21, 2022 at 10:24 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi Dawei,
>
> from the technical description, coding style etc.. it looks clean to me,
> but I'm the completely wrong person to ask for a background check.
>
> I have a high level understanding of how dma-heaps work, but not a
> single line of this code is from me.
>
> Feel free to add my Acked-by, but Laura, John and others do you have any
> opinion?

No objection from me.
Thanks Dawei for submitting this improvement!

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
