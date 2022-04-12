Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E18B4FCEFC
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 07:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346527AbiDLFdo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 01:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiDLFdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 01:33:43 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5B034B81
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 22:31:26 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id e22so15328640qvf.9
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 22:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HKPKauJ9wYgyDYofZbLBEn/Qd7t5fvEoaSfVOvhmeqA=;
        b=dBxwJBnTvqgxkRm//V+pVp11vnAmr6FFqtgtR8wOF43Ghbt/MYJfFM/lP1mFLRQ2Ae
         NCD/4HJ2WEuq/55JWWVzMDszzPwZ3DbFds7P7vkHZVNnbKdW46IW9RNQO8K3xYm2i48q
         +ZYNuOnOCXJBYTE+cLTsuk/VBJ8Z5ilz8rPeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HKPKauJ9wYgyDYofZbLBEn/Qd7t5fvEoaSfVOvhmeqA=;
        b=5RZevOzvMP/UZcX3ikNBDgDDwp2w5liThm/jJxtJVgjsTpwUDlDRWjI610nXedDJQ7
         Vhc/qE5cpGhYSpYvMW6zTdSZTO+lz4dz6XFuCP5SIFD6vSERczu87zEy4K7E1Yukf7g0
         CRH/wZmL6c+rZghuFLUSBQcxPz0H5oWr/Z9hjmC4hKhupdofLF5c6ygCpFcKVNCEjT2x
         UUHorj5oODmp+uXf6avjlOiAhlFagdq3dNzz8uCMzVzNTNIeYZ/1a8J8FxFPNLmZbAO8
         c1cbYz7Y5Hocj1QnuJJ7l5kIbxCsjuMMv3n6wY3XfNw0c+Rz3f/e2XBzwjL7yw7yc/tZ
         gwSA==
X-Gm-Message-State: AOAM532qErkKs9ALIkcybsnjnkDno3ozl+dsAICE1UXUrChqJhuRs85E
        7XgbAb95evOBEEkSU/bAZMf1Z+hq2o0KBe5t
X-Google-Smtp-Source: ABdhPJxrS0xj5ii044bhb1YoqFrNcBB6nf/ltlB6pithpJ7WyVpHsr3MEBRneRrR18vt+cRwxqreBQ==
X-Received: by 2002:ad4:5742:0:b0:441:57c3:2090 with SMTP id q2-20020ad45742000000b0044157c32090mr2258527qvx.93.1649741485331;
        Mon, 11 Apr 2022 22:31:25 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id d140-20020a376892000000b0069bdd40d852sm7633528qkc.75.2022.04.11.22.31.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 22:31:22 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id q19so224110ybd.6
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 22:31:22 -0700 (PDT)
X-Received: by 2002:a25:2e4f:0:b0:641:3aac:bef0 with SMTP id
 b15-20020a252e4f000000b006413aacbef0mr7964073ybn.493.1649741481759; Mon, 11
 Apr 2022 22:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220302220304.1327896-1-djrscally@gmail.com> <664edc45-d624-4cdd-57b4-e38f48493e29@gmail.com>
 <YjpJ6vFs1nZSsKN0@paasikivi.fi.intel.com>
In-Reply-To: <YjpJ6vFs1nZSsKN0@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 12 Apr 2022 14:31:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AhwFT6QPzBHOXn_32BGU2iprO9rwyGRTsS=psgojRAAQ@mail.gmail.com>
Message-ID: <CAAFQd5AhwFT6QPzBHOXn_32BGU2iprO9rwyGRTsS=psgojRAAQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Introduce ancillary links
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        hdegoede@redhat.com, kieran.bingham@ideasonboard.com,
        hpa@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Mar 23, 2022 at 7:13 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Daniel,
>
> On Tue, Mar 22, 2022 at 10:08:07PM +0000, Daniel Scally wrote:
> > Hello everyone
> >
> >
> > Any more comments on this series?
>
> I hope people are happy with them. They've been out for review for quite
> some time.
>
> The patches are in my tree waiting for having rc1 in master.

Thanks for picking this series. Do you think you could add your tree
to linux-next, so we could easily test changes that you pick?

Best regards,
Tomasz

>
> --
> Kind regards,
>
> Sakari Ailus
