Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDEEB523F24
	for <lists+linux-media@lfdr.de>; Wed, 11 May 2022 23:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238958AbiEKVAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 May 2022 17:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbiEKVAD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 May 2022 17:00:03 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A0820793F
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 13:59:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t25so5654943lfg.7
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 13:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BqHLZzawbTn76uaq+ISB2yWuZQE/o/ebikUdVA1w+M4=;
        b=OLShQdzqjanBWkmh2ZeFhJ7dDWoSzEL5WmTj3sJBHupk43/m/i16tTYbdRXKN6xs/6
         WWGG24NyY9HQRO6nhcPt/Xyy38oxTfjKOT/v3rmRC3A6NGtOudp0OmY4MVGhDV5a0ZRx
         bSBHUlpwI9OieGJMEyIBH48ir5G09+D6bmrBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BqHLZzawbTn76uaq+ISB2yWuZQE/o/ebikUdVA1w+M4=;
        b=jSjaotki0RZ23mVEn/HcAoHO7s4KHipCGK48jAodKFsN7aw6w9U76wc4np/O/iElqi
         drjSV0KDigrvfSIS+RYrY5APZ0HHRPcn5iU3ygUVNa7CeQIoebm0SleZNZOfpjM90pE3
         kXE8ocVFqFoVEOkmO5Tqdm1JYlWoDow1mtWjb28M88G9+p9vxz1gwGqwuzgZJDT8o6Lg
         GjbhWpijdmCrf4lOh4fB+Ev7rBAkSY9paJocn5/HNG3kNPm1awGgVm9IA2vZVR28H+9t
         yW5DA+YFx8f8DXF0ycCctDlXSiT1GKFXXaVdOkTe5+2zHX9UYCq69TWPTuI3d9Nf9hO+
         DGVA==
X-Gm-Message-State: AOAM533/dkHZS3J2fGtjaJpNL1uLxf4SQBw936ll+btrQQQ+pKqgT5/X
        /frsH7tTuUnA2N2Y3zrGe3BSkD5gzd28yTMpGO9MTj8GW6z0pQ==
X-Google-Smtp-Source: ABdhPJx9Oc1knr/CQsSRREjm6cAJWH0rQQLdS7MWosQ+FcBiXyCERU6yFgnH7mT0P78U+jOVDNvRL6+YlxKe2UGwTz8=
X-Received: by 2002:a19:655c:0:b0:472:6195:8e90 with SMTP id
 c28-20020a19655c000000b0047261958e90mr21460202lfj.343.1652302798193; Wed, 11
 May 2022 13:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220322160101.620748-1-daniel.almeida@collabora.com>
 <CAC-pXoOQ5kD4bT95j+pwi7+Hb5s5H=0LFhAsk7K2sM9LkbAW1w@mail.gmail.com> <fa87fd58-dc73-24b0-0425-e466062c1d6d@collabora.com>
In-Reply-To: <fa87fd58-dc73-24b0-0425-e466062c1d6d@collabora.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Wed, 11 May 2022 13:59:47 -0700
Message-ID: <CAC-pXoP77VZT1Ftu3Amws9-Y9i11r9M0LxSEwqkezm_3i=HE8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2] media: Add AV1 uAPI
To:     Daniel Almeida <daniel.almeida@collabora.com>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

I think the below definition is expected to cause a build error.

+struct v4l2_av1_loop_restoration {
+       u8 flags;

s/u8/__u8/ is needed.

At least, this change was needed to fix this build error on Chromium
build environment.

Steve

On Tue, May 10, 2022 at 9:30 AM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Steve,
>
> > Hi Daniel,
> >
> > Found a minor typo.
> >
> >> See enum_v4l2_av1_frame_restoration_type.
> > Assume you meant v4l2_av1_frame_restoration_type instead here.
>
>
> Thanks for the heads up, this will be fixed in v3.
>
> -- Daniel
>
