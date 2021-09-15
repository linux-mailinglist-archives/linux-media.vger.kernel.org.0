Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930F640CD4E
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 21:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbhIOTlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 15:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhIOTlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 15:41:03 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254BFC061766
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 12:39:44 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so5143054otf.2
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IGGDgeo7WVVIlkSnWinltsDGGWd6kdeJ2zJ+aw6R/WI=;
        b=GUS2hAMgT2THzzdYiJDLOPPpMXHleJehii5HTQQ8sTxAHOW276rxND6LOK2QvQFA4u
         ZusSgHiBg4JbNncoByRn6RQIMW7b2PVv0+wOets/2UphEYO0SohUOndszuIkFXFb2oRk
         RDrFneIDQXgKYs2QmPxLhVGbi/W+xAtXFEH1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IGGDgeo7WVVIlkSnWinltsDGGWd6kdeJ2zJ+aw6R/WI=;
        b=TgT+MamSLWiQGBhwU+pkh7zxypj1GrIVb7I9VwKjugSVR41jYHPiTeMlnpATITnSB2
         RtfJ0kESW4IPJJFpR3sEIZalytZilvv/oNagZqGzSxDDn1ZYkniD1gg37HFK/zKecmCk
         /uKttH9vIlabM5FAK3XpB/DqBKn11ptlmI8W65PO8uiG9yE9VKjXE89wQFjBFf9e8jNy
         ne+0d1LBSCR4dH24kxS/BxWp89Y7micQxAhi0wXcpLk4YmdVOADlzWHJtvgKmo9s54cp
         0jg+y9/xbL8eOWWhXtWZtt6bwbciHHtfQlqu3zSOIdWtbIJ0/Va75wqXdAIBGIG8V20b
         59Wg==
X-Gm-Message-State: AOAM533SykcdA3mnbVl0xqmOMpqRwdtsE+EA/TLgz1At+NEujNd1DtGO
        ETo4AZ/8HJO+GDK941giJpPtClRmpFqbOAs5dHItGQ==
X-Google-Smtp-Source: ABdhPJwsc6oh2VNX6ThYRfgqXtiKBP0iz/QFxANVi8LRNsPwLNxkHfTkcMXQQuSYqUHwc8WaTZ7U+OC7MPE57NeeQlE=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr1440354otp.159.1631734783359;
 Wed, 15 Sep 2021 12:39:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Sep 2021 12:39:42 -0700
MIME-Version: 1.0
In-Reply-To: <8c1fdf2d0807f07ec57b232497b405f1@codeaurora.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
 <20200730095350.13925-3-stanimir.varbanov@linaro.org> <159718256557.1360974.458611240360821676@swboyd.mtv.corp.google.com>
 <8c1fdf2d0807f07ec57b232497b405f1@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Sep 2021 12:39:42 -0700
Message-ID: <CAE-0n53T-RoOvR=s9nHiXAriMgKvBfDqfBfoGKX5Ju5YF3Tcqw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] venus: Add a debugfs file for SSR trigger
To:     dikshita@codeaurora.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, jim.cromie@gmail.com,
        Joe Perches <joe@perches.com>, Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media-owner@vger.kernel.org,
        Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting dikshita@codeaurora.org (2021-09-15 02:13:09)
> Hi Stephen,
>
> Reviving the discussion on this change as we need to pull this in.
>
> As per your suggestion, I explored the fault injection framework to
> implement this functionality.
> But I don't think that meets our requirements.
>
> We need a way to trigger subsystem restart from the client-side, it's
> not derived from the driver.

Just to confirm, this is all for debugging purposes right?

>
> while fault injection framework enables the driver to trigger an
> injection
> when a specific event occurs for eg: page allocation failure or memory
> access failure.
>
> So, IMO, we will have to use custom debugfs only.

Can you use DECLARE_FAULT_ATTR()? Or you need it to be active instead of
passive, i.e. it shouldn't wait for should_fail() to return true, but
actively trigger something on the remoteproc?

>
> Please feel free to correct me in case my understanding of the framework
> is wrong.
>

I presume the fault injection framework could get a new feature that
lets the fault be injected immediately upon writing the debugfs file.
My goal is to consolidate this sort of logic into one place and then put
it behind some config option that distros can disable so the kernel
isn't bloated with debug features that end users will never care about.
