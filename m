Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB25366FA5
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 18:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241179AbhDUQBu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 12:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239773AbhDUQBu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 12:01:50 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79CCC06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 09:01:16 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id z2so6280710qkb.9
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ShwaEW+yrtaoLCnFsBpA3IcDCZUaXzrtHkNM5wvt/bM=;
        b=vk1fEyVHckPrF7kxqZ40+05Z9QCwqmV7FeGrgzf2gLIH+JPSlaIWZcDPDDUMExgQdZ
         dUIb8uCU4HFiRexoAFGZ5asRH8FbEnuBbbEl40CvacQRoAuhPBXdI5oflqZottH8TeDb
         h6dK0dqTv262PeD+J2oaYfrCXXdUoGqi9IxQCi9DCzQ3LZ7mxTWL3V648EmsSbzZGeTk
         GCfFA07MgtO4lcrqff6iMILGGoDTLPPyldo0hwwO7j1ygKWjQbGtmKy19sitXAfCrx5m
         vcCPhcpza6+VPNQYZ5Ze8OGXyCkwJSaTKV3BILnyrBEQmkg/T6bzsGqGrTboGtFclzax
         fXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ShwaEW+yrtaoLCnFsBpA3IcDCZUaXzrtHkNM5wvt/bM=;
        b=Fl8WYrVUvQLqUP6r0DXT7ERXG4+kKhv2DWF9FiB0lxc3PYWk5LhGBdGfq7R7idI3OX
         QT+yEbCwOjwg2NKUbaKE6fzvb/XFdVWYuxA3d1gjZyue2UjLl74jHQLodaNx6rf2qWQJ
         NhSQc/yp/bnw33v4P6QJ8+w/2jAO6OGfR+jWwnHFXSpLYi5ha4JEmkxH1km5Eu7CBcvX
         JveKTGkFZsnFOe7BpXef9KfvRhWfAk2kGBMJsKXpRxMtumaQ6MrG0Q2FTNfuaFwzKVUL
         mKMJCOVSX9NOU6q9UG1H5cNu7uoiMzrM89OHa9pMhcE/n9xSsJPHM8pSFD+IqlMhV5kO
         Se4g==
X-Gm-Message-State: AOAM531CRoctHaGJmSuwBPXC5eA8JrOKK1Fx/TJIm2/NOzF9BWlLbpAJ
        fS5bDWyO/EUFv1OXCyXPi3cSSg==
X-Google-Smtp-Source: ABdhPJxqupvF93NKnxO4ZdJy3Hks75lq2WaT3y0DOyBFb4WlebacaPtCcvtD1Wd5hGmscJ7PZl0FLQ==
X-Received: by 2002:a05:620a:440a:: with SMTP id v10mr23056216qkp.357.1619020875990;
        Wed, 21 Apr 2021 09:01:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id b17sm2034221qto.88.2021.04.21.09.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 09:01:15 -0700 (PDT)
Message-ID: <794c04c33cc3d2f61744b0f16689ae6bfdb39c19.camel@ndufresne.ca>
Subject: Re: [PATCH 5/8] v4l2-info: remove a strange sizeof usage
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rosen Penev <rosenp@gmail.com>
Cc:     linux-media@vger.kernel.org
Date:   Wed, 21 Apr 2021 12:01:14 -0400
In-Reply-To: <9e4086d7-7ea6-7120-4f2d-1609dcdba93e@xs4all.nl>
References: <20210421072035.4188497-1-rosenp@gmail.com>
         <20210421072035.4188497-5-rosenp@gmail.com>
         <525235dc-e205-0154-ebde-1df11daf48ca@xs4all.nl>
         <497715F9-E425-45ED-AFD1-CDCEAA2690AA@gmail.com>
         <9e4086d7-7ea6-7120-4f2d-1609dcdba93e@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 21 avril 2021 à 11:33 +0200, Hans Verkuil a écrit :
> On 21/04/2021 11:19, Rosen Penev wrote:
> > 
> > > On Apr 21, 2021, at 01:23, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > > 
> > > > On 21/04/2021 09:20, Rosen Penev wrote:
> > > > The array has a nullptr and 0 member for some reason. Remove and convert
> > > > loop to a for range one.
> > > > 
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > > utils/common/v4l2-info.cpp | 33 +++++++++++++++------------------
> > > > 1 file changed, 15 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
> > > > index cb3cb91f7..0359cf137 100644
> > > > --- a/utils/common/v4l2-info.cpp
> > > > +++ b/utils/common/v4l2-info.cpp
> > > > @@ -3,6 +3,8 @@
> > > >  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> > > >  */
> > > > 
> > > > +#include <array>
> > > > +
> > > > #include <v4l2-info.h>
> > > > 
> > > > static std::string num2s(unsigned num, bool is_hex = true)
> > > > @@ -411,21 +413,20 @@ std::string mbus2s(unsigned flags, bool is_hsv)
> > > >    return flags2s(flags, mbus_ycbcr_def);
> > > > }
> > > > 
> > > > -static const flag_def selection_targets_def[] = {
> > > > -    { V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
> > > > -    { V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
> > > > -    { V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
> > > > -    { V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
> > > > -    { V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
> > > > -    { V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
> > > > -    { V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
> > > > -    { V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
> > > > -    { 0, nullptr }
> > > 
> > > The idea of having this sentinel is that this makes it easy to add new
> > > entries without having to update the array size.
> > Not following this. I assume it’s some C feature.
> 
> Standard programming techique:
> 
> https://en.wikipedia.org/wiki/Sentinel_value#:~:text=In%20computer%20programming%2C%20a%20sentinel,a%20loop%20or%20recursive%20algorithm.
> 
> > > 
> > > > +static constexpr std::array<flag_def, 8> selection_targets_def{
> > > 
> > > Something you need to do here, adding a new flag means updating the size.
> > I assume this is a small issue. It’s an immediate compile error anyway.
> 
> Not if the size is larger that the number of initializers. That would leave
> zeroed elements at the end.
> 
> > > 
> > > New flags are added regularly, so keeping that robust is a good idea IMHO.
> > > 
> > > If it were possible to write:
> > > 
> > > static constexpr std::array<flag_def> selection_targets_def{
> > > 
> > > i.e. without an explicit size, then this would make sense, but C++
> > > doesn't allow this. And std::vector allocates the data on the heap,
> > > which is less efficient as well.
> > But this is possible. With C++17 :). That would necessitate a minimum of GCC6 though.
> 
> How is that done in C++17? I didn't find anything about that.

I believe this is similar to this code:

https://git.linuxtv.org/libcamera.git/tree/src/gstreamer/gstlibcamera-utils.cpp#n15

But there I only used the fact that you can iterate it like any other
collection. This is a recent feature I got told (I'm quite a C++ newby, and I
like static arrays without passing and updating a size).

> 
> Regards,
> 
> 	Hans
> 
> > > 
> > > Let's just keep using normal arrays in this case, they do the job
> > > just fine. Just because you have a hammer, it doesn't mean everything
> > > is now a nail :-)
> > > 
> > > Regards,
> > > 
> > >    Hans
> > > 
> > > > +    flag_def{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
> > > > +    flag_def{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
> > > > +    flag_def{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
> > > > +    flag_def{ V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
> > > > +    flag_def{ V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
> > > > +    flag_def{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
> > > > +    flag_def{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
> > > > +    flag_def{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
> > > > };
> > > > 
> > > > bool valid_seltarget_at_idx(unsigned i)
> > > > {
> > > > -    return i < sizeof(selection_targets_def) / sizeof(selection_targets_def[0]) - 1;
> > > > +    return i < selection_targets_def.size();
> > > > }
> > > > 
> > > > unsigned seltarget_at_idx(unsigned i)
> > > > @@ -437,13 +438,9 @@ unsigned seltarget_at_idx(unsigned i)
> > > > 
> > > > std::string seltarget2s(__u32 target)
> > > > {
> > > > -    int i = 0;
> > > > -
> > > > -    while (selection_targets_def[i].str != nullptr) {
> > > > -        if (selection_targets_def[i].flag == target)
> > > > -            return selection_targets_def[i].str;
> > > > -        i++;
> > > > -    }
> > > > +    for (const auto &def : selection_targets_def)
> > > > +        if (def.flag == target)
> > > > +            return def.str;
> > > >    return std::string("Unknown (") + num2s(target) + ")";
> > > > }
> > > > 
> > > > 
> > > 
> 


