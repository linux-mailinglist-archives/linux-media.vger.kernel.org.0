Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F9236C7C0
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 16:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236530AbhD0O33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 10:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236395AbhD0O3Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 10:29:24 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF6FC061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 07:28:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x20so63740258lfu.6
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8fG+2xZlgNgMmhb6Bz+Rc3w2zpgITx2fV6jIBof/QUk=;
        b=YV7ICsJG5w/3HO652U6BmvN+BFnOcGLaCCvKz8stSsV+EYcgQWZNwNzmVXbmYvl12p
         5sx1ulelW8b3szDxLGLpXFwNRItdcC1wKlo8kkfyTpORseOifsZO/QStx7GdJCJQCbMh
         mE4bmoRvXQ+gPR08VGgZO4i0I6hRYjrefE6Hv4bRbr+KRlmJ/Q1DSra1Tb7o6nSi3Izq
         gUjUTyYQEL4jLvJ3j1gSLTRwxSdeMra6jY2Dkt+At7gstzO6MIWBygbpC+8iOzXHSIWu
         pUWyaBibWaAmXIRnK4vtCYfMNQ6h7TBwRsqeWOcU2S73q+O6yWvSD1mvJ69SBWJwq7wW
         RvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8fG+2xZlgNgMmhb6Bz+Rc3w2zpgITx2fV6jIBof/QUk=;
        b=VADwkPUr6WvE5ZNmQSLLfHfXkPwL9YQMknbiS/5fy4QUCOOuY3lKgtXqd8tjWxFFKq
         NcGkzmFnjLVt+l++y3NtB+ovFoWXU9WtPTkguRP84t4sKpHoE0RPpW+t+emjBXq0hJXA
         IYFw3mTNuE4EKBUHq/JUNf/B99n3FlUYJU74i2RiqMxa8XHwX9tJGGJxmmbAk4mZSrQX
         mSRf+sp719uDmL9MLe7yo0WrNEf3EpaG1/wPlr7/7x+J3gppcR22dKKS/DaiUhdQcE//
         deU3RgcWVak95p4DbntdsVvYGktU+FOMDP+RQJeFSC0ID1S+Mcu08kY4YWtYT/kEPIeT
         SBNQ==
X-Gm-Message-State: AOAM531+xBPntE1yH9DdrHJ8AKsV5aLd0dhGw3gOyeqQjIKpxRESaQqo
        HXekbi5JqCq+CTyXhtbyx7thsK3MNXJtKbXo3sQ=
X-Google-Smtp-Source: ABdhPJyWjnDBhcFyBPjvWHE66Mc86cKOgz0RkJ1OJZ2F/C7qYIunUGawdYlT9u1I84CXvFcao83XuG5lrwDKbfKQzsY=
X-Received: by 2002:a19:50d:: with SMTP id 13mr16413093lff.443.1619533719449;
 Tue, 27 Apr 2021 07:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
 <CAOMZO5BEre9=se1yAxr7QTmfV_N=GMKZeanr+jYfRNrSO551hg@mail.gmail.com>
 <4ea17a0c-b442-1ca2-1ae3-7a305d53273f@kontron.de> <CAOMZO5Bztrpm4aB9=DmR=3PNfZUoM_niT_+nVE-ZOQm5aUEWBA@mail.gmail.com>
 <303d14cc-1ae0-8d82-77ba-66156a61d777@kontron.de>
In-Reply-To: <303d14cc-1ae0-8d82-77ba-66156a61d777@kontron.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 27 Apr 2021 11:28:27 -0300
Message-ID: <CAOMZO5BiYAMvVawZRAR9tbdf9XxicfdoX=V8HpYQNq5U4YZvfg@mail.gmail.com>
Subject: Re: adv7280: Scrolling images on imx6
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Tue, Apr 27, 2021 at 11:15 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:

> You're welcome!
>
> Just a question: What issue do you see without Steve's patch?

Without Steve's patch, I see the captured image slowly scrolling
vertically, like an old tube TV.

Once I apply it, the image becomes stable. The board I am currently
using is based on an imx6dl and the ADV7180 is connected to the
parallel CSI bus.

> I'm asking because with my setup with the imx7 CSI driver I'm getting a
> stable image, but it has a vertical and horizontal offset that seems to
> vary each time I enable the camera. I was wondering if this is maybe
> caused by the missing frame skipping.

Yes, maybe the imx7 CSI driver needs this initial frame skipping mechanism too.

> But still I'm not really sure if we can compare this as I needed another
> patch for the adv7180 driver to get it working with the i.MX8MM in the
> first place:
> https://git.kontron-electronics.de/linux/linux/-/commit/0d90331a44d0f718b7327a94fc72612ddcb4ac0f.

Thanks for sharing your git tree.

In the next days, I will work on a different imx6dl board, with the
adv7180 connected to the MIPI CSI2.

I see your tree contains some adv7180-m related patches. I will give
it a try and report.

Thanks,

Fabio Estevam
