Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C68B356C56
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 14:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245617AbhDGMku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 08:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhDGMkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 08:40:41 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C4DC061756
        for <linux-media@vger.kernel.org>; Wed,  7 Apr 2021 05:40:30 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 184so20474079ljf.9
        for <linux-media@vger.kernel.org>; Wed, 07 Apr 2021 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rd7e/jtpUxeuvKLkUMh6oQaE/fxz3yxbf4FPN9GQVu0=;
        b=BeD/ep2sjkHkAv7TXhX0cjv6dz3gLjd9VnK0S/V2CPMGl5sV9puUK4Ep8Gpw8sTCEU
         /ARRpCdbedfeRLoGv/QdaJHh+6PrRDsb/4iW0ntgidN4KGjwxukPublL8/2Yl53EBgZi
         qe6wya/Rm9Cijs+jmuEUnC2TXbwMfr+UjJr+/NBqEBr5vzKPRqdGc8hOt4SYurSKwwgx
         89bLjoEMwVBa9rxbH41odx7Vh3MkTmD/9+MkL1svLrkeOcVYtJNJQ/3yX9MfeSeFwrRA
         hXw/briRKXVSB5mc8UXSM9C9AHnxHO3ZndoNe3sU8MFsglz+X7p4sVOX9vSUjd2Odc2C
         E3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rd7e/jtpUxeuvKLkUMh6oQaE/fxz3yxbf4FPN9GQVu0=;
        b=S7rQx4Wl9eRVFYMyQkiHrww/+JVdDZTIibzO9D7WAyyGcvxXDYLksZm4EYfUsEzVtl
         gBEQVXGbYrtQIv8hQfoZjk52MImTjQLMW0nA9E/uVrHmL3uF0lRLNRdxn6/D8nbf4aXR
         13pmmRPonxgFF2FHsiOezyIcjJireVv6wXTmleyUiLLbZNMgQbrRzaQgXO0mlIqnVBYH
         Sqi82/Te4iiOyuYCtIeaPOiUAKz202V1MqAnI2hJlfdyGE8jZoEDKjQg6lCajc6iZybE
         6ZhAAzoyGGW0PKlM0oXviVq6B0naGdQBfGVCC63yvnld7yW2dAqXes1ryqdTcRVr8ARF
         0few==
X-Gm-Message-State: AOAM532AM1ZO+9N5o01bj+hklmNYCha3oJqxm9Dwm0t6zVdGsbDIIfRZ
        mkjT+QAB1ThdImdvpugf6ss=
X-Google-Smtp-Source: ABdhPJzidBV+ZOPfmgXq8lG43JGpp3hqDnC4jedoK2nrpg2u65sNTtEoDMoNt1vYZ2NDQZKHKKEfWQ==
X-Received: by 2002:a2e:998d:: with SMTP id w13mr1963138lji.424.1617799229452;
        Wed, 07 Apr 2021 05:40:29 -0700 (PDT)
Received: from gmail.com (h-155-4-128-43.NA.cust.bahnhof.se. [155.4.128.43])
        by smtp.gmail.com with ESMTPSA id z21sm2439068ljh.104.2021.04.07.05.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 05:40:29 -0700 (PDT)
Date:   Wed, 7 Apr 2021 14:40:26 +0200
From:   Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To:     Simon Ser <contact@emersion.fr>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: Call for an EDID parsing library
Message-ID: <YG2oOtvsHmOfBYMb@gmail.com>
References: <20210407114404.13b41822@eldfell>
 <DJjftAG6WNev87c34XyXFLCHe49rJBCYdqENxfO3uHXUFJXmPerOg5LuQKAbd3D_pdO34vkWgfy9uggujNI12VE-ttglyarF5wAogYC8m3E=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJjftAG6WNev87c34XyXFLCHe49rJBCYdqENxfO3uHXUFJXmPerOg5LuQKAbd3D_pdO34vkWgfy9uggujNI12VE-ttglyarF5wAogYC8m3E=@emersion.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 07, 2021 at 10:59:18AM +0000, Simon Ser wrote:
> FWIW, with my Sway/wlroots hat on I think this is a great idea and I'd
> definitely be interested in using such as library. A C API with no
> dependencies is pretty important from my point-of-view.
> 
> I'd prefer if C++ was not used at all (and could almost be baited into
> doing the work if that were the case), but it seems that ship has
> sailed already.

The same for Mutter / GNOME, not having to maintain a EDID parser would
be great. Though personally I don't care if it's implemented in C++, C
or whatever, as long as there is a C API to use.


Jonas

> 
> Simon
> _______________________________________________
> wayland-devel mailing list
> wayland-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/wayland-devel
