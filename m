Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A651EB3D5
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 05:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgFBDjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 23:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgFBDjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 23:39:16 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68496C05BD43
        for <linux-media@vger.kernel.org>; Mon,  1 Jun 2020 20:39:16 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id w188so566879vkf.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 20:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GaKVPZjnskLVh/I9ZFHkt/w3pB68YbJ4hPZDHawFfFY=;
        b=CyOIVpemf/a8X3u+ZWhu079uRuuL/MlcGqATSyGf6PE/uqpIfkt3jfue+NumdY3CzY
         VlheATY4E0/luCNTVUaTLHkv+fb0WvAC6rQNRPTEHJnG3k7VUCpoGuiPhgjOdRn6pT1K
         mc7P4kpWhslyGOtJe4k5C4Xp433L2dpelI69Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GaKVPZjnskLVh/I9ZFHkt/w3pB68YbJ4hPZDHawFfFY=;
        b=epi6HSYY9CkCJgkhr+zZ1tt8JjNczI4Bw+QLSqTVOaDusy6MxMVhk8SMS55HGcm5PD
         pSlJyFs8jXCdCIJOqQMAVtF9c/g+a137q+HCgjXQxHdBXdOWABNp2I2CDqlk++4OXn5R
         coCoEbTV7/HFNErbArorKD97ExhwZ7uJgBy7bcmWYE2cYO0qj+ArX7BvoR2IOejtoDMR
         kPrSNOUelyjPa2zec2JebWEcKvK6WBe+BQmaUzTN8Onor2hrsaU8ekzcLK32UUrVeJoV
         H+OVGnPBe3zwHJ5qMTRYPR3OphcGT8eR1ynx1jO6GQqEarbg2wEmK02VUr3FHo2BNyFy
         zT2Q==
X-Gm-Message-State: AOAM532ELugWBPIsP8/EYzUmAzeyReWoRL0T9CcWMz4fqS90J6e6efCI
        lvhpsXsPVhv8dODuNt02bOZAJNAFbSU=
X-Google-Smtp-Source: ABdhPJzvyrVcHb8bpZOKy3NDk7YFwc4vLiLl3YpO5qtZr91wgVBBkpBkZ5Eccc3BUXD5tjKhSaKKGQ==
X-Received: by 2002:a05:6122:34:: with SMTP id q20mr2798299vkd.66.1591069155135;
        Mon, 01 Jun 2020 20:39:15 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 126sm246801vku.7.2020.06.01.20.39.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 20:39:14 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id r11so1233658vsj.5
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 20:39:14 -0700 (PDT)
X-Received: by 2002:a05:6102:116e:: with SMTP id k14mr934270vsg.198.1591069153683;
 Mon, 01 Jun 2020 20:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200601150314.RFC.1.I1e40623bbe8fa43ff1415fc273cba66503b9b048@changeid>
In-Reply-To: <20200601150314.RFC.1.I1e40623bbe8fa43ff1415fc273cba66503b9b048@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Jun 2020 20:39:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHGm8EhsLOw_XTNRy6b-AKXgpwwGKE4kAm0-x4XT0ovg@mail.gmail.com>
Message-ID: <CAD=FV=VHGm8EhsLOw_XTNRy6b-AKXgpwwGKE4kAm0-x4XT0ovg@mail.gmail.com>
Subject: Re: [RFC PATCH] media: venus: Fix NULL pointer dereference in core selection
To:     amasule@codeaurora.org, stanimir.varbanov@linaro.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Jun 1, 2020 at 3:03 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The newly-introduced function min_loaded_core() iterates over all of
> the venus instances an tries to figure out how much load each instance
> is putting on each core.  Not all instances, however, might be fully
> initialized.  Specifically the "codec_freq_data" is initialized as
> part of vdec_queue_setup(), but an instance may already be in the list
> of all instances before that time.
>
> Let's band-aid this by checking to see if codec_freq_data is NULL
> before dereferencing.
>
> NOTE: without this fix I was running into a crash.  Specifically there
> were two venus instances.  One was doing start_streaming.  The other
> was midway through queue_setup but hadn't yet gotten to initting
> "codec_freq_data".
>
> Fixes: eff82f79c562 ("media: venus: introduce core selection")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I'm not massively happy about this commit but it's the best I could
> come up with without being much more of an expert in the venus codec.
> If someone has a better patch then please just consider this one to be
> a bug report and feel free to submit a better fix!  :-)
>
> In general I wonder a little bit about whether it's safe to be peeking
> at all the instances without grabbing the "inst->lock" on each one.  I
> guess it is since we do it both here and in load_scale_v4() but I
> don't know why.
>
> One thought I had was that we could fully avoid accessing the other
> instances, at least in min_loaded_core(), by just keeping track of
> "core1_load" and "core2_load" in "struct venus_core".  Whenever we add
> a new instance we could add to the relevant variables and whenever we
> release an instance we could remove.  Such a change seems cleaner but
> would require someone to test to make sure we didn't miss any case
> (AKA we always properly added/removed our load from the globals).
>
>  drivers/media/platform/qcom/venus/pm_helpers.c | 2 ++
>  1 file changed, 2 insertions(+)

This fixes the same crash as the patch:

https://lore.kernel.org/r/1588314480-22409-1-git-send-email-mansur@codeaurora.org
