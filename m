Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2850646055
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 18:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiLGRhK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 12:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiLGRhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 12:37:09 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA22D5B862;
        Wed,  7 Dec 2022 09:37:08 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id r7so4091422qtx.6;
        Wed, 07 Dec 2022 09:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cg8cGOHAKOtjytB8xOJeq7xlPUtvQQYO8d/5pO+QvYc=;
        b=Kf9poqOwVlprDsizq7bxhTnRHM7cVuVArAVXvtaU7Eh5fsPxYpH4uCmYIgr+BjZkFL
         7QJoiiuEb5+WRmu7pPRKvgVYi1IL48HacQzrkw2cRoZOzfFcL5XhsJMtfNx+KeDF4NvD
         mD1mbol15Ca/8dKF0ecBGigMdP1pgpi2/U5Z46lN3PiX0d9rCpYTdHCmoErSuTJBVFuh
         I0TxhwNRFDUbL+pzetYD72s6zZfitaTAufJU+pOV0hDEVrQmNxKf6xlk1cIFji3dweX2
         P6E+OXShyJyqRwjmArFaSHvub3J74Q8ZLLr/X6UlnR4cpeKQFBwteuQvnIX/MlKhHWl+
         4xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cg8cGOHAKOtjytB8xOJeq7xlPUtvQQYO8d/5pO+QvYc=;
        b=fC1P1LF0u1FnSy2EYHBVtqpfzNZJB5SlTZqdTDQNqMMf2DzTWT+LFDIiE38GxACh4i
         3wkAJISYH5UGf7ig47Nu4gTp4rTy3zUXahvRXtELagOFoHWDHTKLr6TbTa/DOVfuhQxL
         Xhff8L3W1ldvxj/rLbbVZ0TLnnIAOtiXVR8LBoKW+t3h0UNxTn/PSpyUZvGBlFoKZuay
         dHXEcAupwR39zEwYVskkNF8rMBzEpTgQinA7zVBubUQDMZ1Ypbq9CjUvZEPPaFhm7CyB
         jfdx0PWLAenEbcPGInyGniJWKULHvzzwlum/T031W9HLIdB9EX3zkW7u7G4I3pNL2WJq
         oDpQ==
X-Gm-Message-State: ANoB5pn9rJxSPxGR8z9um5nzhxy54nOScEwTp6xtTMEkMayzzo+3PW4j
        NlKanoEFUA7abHkvCF/Ml+zeKFUxsuvIA5Ix87w=
X-Google-Smtp-Source: AA0mqf6fF+VLph3MXoRZ7qyibMFagfJ7YVDFE3WLnS3CP+ChFLzMO/tcPs5SPDZbSnafeZbA/2FS66FRzGRAodiG/x4=
X-Received: by 2002:ac8:5501:0:b0:3a5:cb82:109b with SMTP id
 j1-20020ac85501000000b003a5cb82109bmr85265636qtq.61.1670434627749; Wed, 07
 Dec 2022 09:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20221129231149.697154-1-hdegoede@redhat.com> <145bc531-9f3f-4f80-26e1-25bd281ea791@redhat.com>
In-Reply-To: <145bc531-9f3f-4f80-26e1-25bd281ea791@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Dec 2022 19:36:31 +0200
Message-ID: <CAHp75Vcbg8TuWvnDmped=JPGz810ahS0dUrG2eTg3VCrW4MLnw@mail.gmail.com>
Subject: Re: [PATCH 0/6] ov5693/int3472: Privacy LED handling changes + IPU6 compatibility
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 7, 2022 at 7:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/30/22 00:11, Hans de Goede wrote:

...

> Andy this also means that I will not be using your new str_high_low()
> helper function. The code which could use this will likely stay
> around, but given that I need to do a rewrite and then get ne
> reviews, it would IMHO be better to just get your series starting with:
>
> [PATCH v1 1/3] lib/string_helpers: Add missing header files to MAINTAINERS database
>
> upstream independently and then later my code can be moved over
> to the helper (or if the helper lands first maybe use it from
> day one), either way it seems best to decouple the merging
> of these 2 series from each other.

Sure, no problem and thank you for the information!

-- 
With Best Regards,
Andy Shevchenko
