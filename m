Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17332C3F18
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 12:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgKYL3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 06:29:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727327AbgKYL3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 06:29:15 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53DFC0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 03:28:59 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id l11so2678984lfg.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 03:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2nOPkD46qA6zqYvfk5N1mr7k9F+AjAsV4itAgMMq35k=;
        b=UYz/jCqr2QvHnOp8GVH62QzciFhLIGNOUqAxPEPAMeNaYMIl9PjcgIpzya9CXKYaE/
         SQBBiQY5ovG8meLwtPVBh5u8PxOUXuIYTupgxrMdcqk9YSvndHs8R+iKqEa2HGcMnYP2
         CsXXhHkNkhMMx9d/wjgKRbFoGCu0pDX2G7cCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2nOPkD46qA6zqYvfk5N1mr7k9F+AjAsV4itAgMMq35k=;
        b=EIMZWxp/9W5NPMEr3fQwIE7OyIVRHwmZiDi9Tq9rjd1oYsvxNDImwOV8oiMWv7K7vh
         NF9iT0bszt/FtpcDQOM81NbQHQvTwh4cbkPOaW7kJ/DGgTkEFh96zmQVEEHbKrAHLohW
         KQZ1RdBDVjyihtw8XFHVB1TrvGOHIxN6OwiktjKtc/Wg1VDw+XtMxotVjbn7U0z3Xy/o
         CtiEjcSd+8EGcSjqkqOS/fFjfWdhsm95kP72D+7KnYBEE7CrTEC7MSz5tK1GFE6pC3Tr
         q5ddi5clO4HyH42QCjSZzBl8ZNq48flZu+aHRB3V7qCvU87G2ebL4Cow95kYEf6XS6wR
         /84Q==
X-Gm-Message-State: AOAM533+pIJrrmavNq4Qf62FM0lQL0nm1eFzHxI0DW2lAzYyVkrYZA8Y
        ilEkZrHse97h5Q3ZxQejUB5o8YIFZiUyIIW0
X-Google-Smtp-Source: ABdhPJwJgu8TUeT5KsDLKM7xwSmtCv/Mr+JlX7nL5A5bOk+Mq26dl9AeLQvYL38SnCvoW3OZWEbBqg==
X-Received: by 2002:a19:107:: with SMTP id 7mr1188176lfb.141.1606303737770;
        Wed, 25 Nov 2020 03:28:57 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id x84sm224216lfa.165.2020.11.25.03.28.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 03:28:56 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id y10so1898243ljc.7
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 03:28:56 -0800 (PST)
X-Received: by 2002:a2e:b4c6:: with SMTP id r6mr1243590ljm.248.1606303735968;
 Wed, 25 Nov 2020 03:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20201013124428.783025-1-acourbot@chromium.org>
 <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com> <20201124083925.GC3940@paasikivi.fi.intel.com>
In-Reply-To: <20201124083925.GC3940@paasikivi.fi.intel.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 25 Nov 2020 20:28:45 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVZshFO3kiHXeP4FAgJ7am_SjZfcHrbF8h4SXUz+MimVw@mail.gmail.com>
Message-ID: <CAPBb6MVZshFO3kiHXeP4FAgJ7am_SjZfcHrbF8h4SXUz+MimVw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] media: mtk-vcodec: fix builds when remoteproc is disabled
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 24, 2020 at 5:39 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Tue, Nov 24, 2020 at 08:56:00AM +0900, Alexandre Courbot wrote:
> > Gentle ping about this - we are already well into the 5.10 cycle so we
> > don't have much time left if we want to merge this build breakage
> > fix...
>
> Thanks for the ping.
>
> For the set:
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Ah, just saw these patches included in Mauro's latest pull request.
Seems all is good, thanks! :)
