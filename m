Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8243F45EAD6
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 10:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376306AbhKZJ7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 04:59:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47974 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376427AbhKZJ5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 04:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637920449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HwjMv8YV0GzB+Vs3i2Fz9hjEKXjgt9WRmdtmGsNMNAw=;
        b=f3gHxfRKsxahkbzmBpQ+j2jwWtbz/p4Oh8FMZIHFksZOjnhWLMRSVU8slOj7m9RScYVhHz
        v2QiEtTXMsvKZDMSB2TMqe8w6cBYbWwCu9Kxb6hm5YwX+Dv6lG2eC9bn3xahr3MHpZqtur
        OlyykUeseso5MhbqfcrjsXTGG8FPbjU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-yS4WyN17MVexTY2HWYsh2g-1; Fri, 26 Nov 2021 04:54:08 -0500
X-MC-Unique: yS4WyN17MVexTY2HWYsh2g-1
Received: by mail-lf1-f71.google.com with SMTP id k32-20020a0565123da000b0041643c6a467so3969312lfv.5
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 01:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HwjMv8YV0GzB+Vs3i2Fz9hjEKXjgt9WRmdtmGsNMNAw=;
        b=kq6w1KTr/7tdxa5b0hy0Zhf1XbTu1qrYokJXB5mcmKWnfF0iKSkgMHQFn2iSVApPa/
         lt61qgFtWZ2jjKwf8NVdGCEdePpNq1p220/FX+Qad49dfWoQQWy/uHFVPLy/PeSZVGTi
         jjJDLYFEmqxZciHfVhie+KkKHqy4FmSYzRC3YI8XG0/j/KcGnxBYpnCjLXRftG8B+Wje
         R2U0cfEqly351g8+rXF7shKu7WzsoK0d1oAqXLto+BbAhD8V/YqzY9iovqKJOJQiKxdf
         IQCPfKWhKFW7MtumYsFDGPSgS56fyp//mLm0kXf21/yX7QADuQDjXUsCCR0M2XIKx04r
         WW8A==
X-Gm-Message-State: AOAM531KgBad9/23Jho6xYKdm+JTaEW1g1tsw9PFDfwAO3Q9qgMeoQlw
        ekj7dN6Xl82OBeS5plH60Qa1c8DrIL/irA5Wzyhqy8nyxX/Ych9TeA2lr+QzRWnp0zAVs6gExVn
        JY7eGyBIrAU6D5wvy13xizc++CuXjguuklWc1ljI=
X-Received: by 2002:a05:6512:3f28:: with SMTP id y40mr29634167lfa.499.1637920446441;
        Fri, 26 Nov 2021 01:54:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGyMB0cDvOVskixqLCj3hHREs0wCSPgX21cU80TPGLg5ymcVXNnofPkZ54nFfehVWeqR/vj1GdqgwICxdBFVg=
X-Received: by 2002:a05:6512:3f28:: with SMTP id y40mr29634137lfa.499.1637920446166;
 Fri, 26 Nov 2021 01:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20211126001603.41148-1-djrscally@gmail.com> <YaBNlpcr+i6s5rng@pendragon.ideasonboard.com>
 <de31fd62-b6f9-e042-9d26-6c3feb3faaa4@gmail.com> <f6982c60-3bf1-aa6c-2705-4d7315d77039@redhat.com>
 <6e46686f-6447-26d1-3a4f-4787c9a15867@gmail.com>
In-Reply-To: <6e46686f-6447-26d1-3a4f-4787c9a15867@gmail.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Fri, 26 Nov 2021 17:53:55 +0800
Message-ID: <CAEth8oFkrHWG+_FRkQgaLVtQgLXo791pvZxUAfmaefL498kVkA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce ancillary links
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Han-Lin Chen <hanlinchen@chromium.org>, tfiga@chromium.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 26, 2021 at 5:46 PM Daniel Scally <djrscally@gmail.com> wrote:
>
> Hi Hans
>
> On 26/11/2021 09:41, Hans de Goede wrote:
> > Hi Daniel,
> >
> > On 11/26/21 08:58, Daniel Scally wrote:
> >> On 26/11/2021 02:59, Laurent Pinchart wrote:
> >>> On Fri, Nov 26, 2021 at 12:16:01AM +0000, Daniel Scally wrote:
> >>>> Hello all
> >>>>
> >>>> This series is not yet ready to merge, but I wanted to share it as I know some
> >>>> other folks are working in similar areas at the moment (and I am including the
> >>>> libcamera devel list for the same reason)
> >>> Seems you forgot to CC libcamera-devel :-) Let's fix that on v2.
> >>
> >> Argh! Sorry, will do
> > First of all, thank you very much for this RFC series as well
> > as for the matching libcamera series.
>
>
> My pleasure
>
> > For v2 of the series can you please also add Kate Hsuan to the
> > Cc (I've added there to the To of this email). Kate is a colleague
> > of me working on adding auto-focus support for IPU3 based setups
> > to libcamera.
>
>
> Oops again; I had intended to do that as well...sorry Kate! I'll be more
> careful with the CC list next time

It's OK. Thank you :)

>
> >
> > Regards,
> >
> > Hans
> >
>


-- 
BR,
Kate

