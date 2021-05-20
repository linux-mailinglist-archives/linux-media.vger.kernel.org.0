Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC8F38BA7B
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 01:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbhETXnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 19:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234379AbhETXnj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 19:43:39 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB71C061574
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 16:42:17 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id q7so25655574lfr.6
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tzAp+k0waVU0bL+6vKqvbJ+ZgH9Yna1tNj9zBXIKElg=;
        b=dwzDabblq3j8h+ylRxiO6nJz4L0SyHhfwAi3SO/zkLe6upxgo6m2Pfv/wjsmprBZ21
         qbvVELHW/OfgRQiTBZkM8tATawiIGxkifAerC8NIXrJez06iUWfFMF0ybZvQeC3jUKpg
         gHQiiZpjK2VUwCZsLZX285HVJhKjoiYeMuQMYSqtVWzKuN3ubbHSqgruxihUeCTbjBnw
         kv7f4pW+n2dJeQxCjwwH8VLYdV6uM4YuxJMFoyi0s54Y+/Dei4fW3cUow/tT7B4XFxM4
         Nv7rvYzT94rL3YvabbQWJMZ9AINPu4CHI3jjiU3l/Zg8aURvBCBsJfVEYIkwdDWifWyf
         9g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzAp+k0waVU0bL+6vKqvbJ+ZgH9Yna1tNj9zBXIKElg=;
        b=coTwVcsdWTDNPuMoGBfO6ddQqNZ1woGq3S1vwzHsSHNck0plmsZu0wnh8HVFkN2v+y
         M/96Ae537eKp03aWaYdWp4SqjYaJ5MEuG6WKKx6FlxGBA9nCgB1CZLH3sjvq79GulGn4
         b3asNXubQIe5m6IXXjwkNsOFPAdLiC/2HVfY4+AEz1Ba0DtOs24ByjsXhA7L1MA3/d0w
         db8VEcmiYDkMwKNW99H7X6Kdgp/IqxT9Psylx5KbZX0bVAzY9oYpW49RLWhbatwDgYw+
         3QYibOUgaHYmrIqFDN4eDDUDMzNzPopXxS5tnEgcS/cXkzxsn98no7bQ87GK9FPqs9E3
         iY5w==
X-Gm-Message-State: AOAM532D0uGldFMwaJdMZiS9+g2aBJTrwMacuLJ+GZoHNGiQ73g03Itb
        6MYLtySBw5RNc+/eFgsnxD07xbHrSqVN6qlpDKs=
X-Google-Smtp-Source: ABdhPJymFMMfBvhRIvHenMWM9Q9D8HloRqkUuwGz5hpLYZR0qV/yaR6JjSJg9ScgpzEXFgTYPlVf7C/7faY1uLPNFf0=
X-Received: by 2002:a19:5e0d:: with SMTP id s13mr4157396lfb.229.1621554135562;
 Thu, 20 May 2021 16:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
 <CAJ+vNU09LC1i_-HzybPSy02DY5x-JNfMrO9wPMsb5BSK0ofEYg@mail.gmail.com> <CAOMZO5DJ0Y5CaeBLanQssqsb6fA5ma+B363g=d33BPb9+me3wQ@mail.gmail.com>
In-Reply-To: <CAOMZO5DJ0Y5CaeBLanQssqsb6fA5ma+B363g=d33BPb9+me3wQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 20 May 2021 20:42:03 -0300
Message-ID: <CAOMZO5BCDMnPT3m=usxWrhVmEw+a9X8uCnv-J5gv4JQC8UCYWA@mail.gmail.com>
Subject: Re: adv7280: Scrolling images on imx6
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Tue, Apr 27, 2021 at 12:51 PM Fabio Estevam <festevam@gmail.com> wrote:

> I didn't apply Matthew's patch and I am getting a good quality image though.
>
> What is the problem you notice when not applying this patch?

Now I see the problem when an NTSC camera is used.

I confirm that Matthew's patch fixes the issue.

Thanks
