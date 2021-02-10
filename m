Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4457316EB9
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 19:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbhBJSce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 13:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234195AbhBJSaZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 13:30:25 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BE9C06178B;
        Wed, 10 Feb 2021 10:29:42 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id w36so4325677lfu.4;
        Wed, 10 Feb 2021 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WD7reh8H3L0ENa8aBkz3DGqf37HyyKAGvekPvSYaYbU=;
        b=u+MLD8XmKOAeWJqs7q1x5ZD6KU7FG9Es2xIJPgp4zpuGvmpLbI46TLqxzIKQQ4vCoz
         k47z8ahAVHzBgDagTk6NekcHRsqdQOj/yxncEdUyZZ9bfOtt606mBVbriBPpk5oQRvJ+
         uCyihZZLjgMQKOaKOI53lv3mzh54SSWj2G5gHAgJvVZONHNQUmg1dFDkNNpZVFoh2AIl
         JEPCpF0rnhcM/CVf4VwtD4lqp4nXsCWHsN90K7tbjn2FbWpPh1syv0Sdm8+QUz/hkLLE
         yd2j1fXRByuumTNxwv2MBHLsebqLQh8ARp5t3r1seIq3D978TDgVI5znLD8Go6VpFubj
         SBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WD7reh8H3L0ENa8aBkz3DGqf37HyyKAGvekPvSYaYbU=;
        b=Qm3vzqPWktNsbfxYSUSi8WcquOTb1nD9kTyp6f0inncZSuL/IToTPIJgo3wiOzJvvK
         ELh8ZhVybOBJvGUz36pNvc76UGDzzbJ5BRuz+OuBSSfgbKwTIJ0vGk18G1v/x1eNdqOq
         EXrYej1hVRcRTihwXpPAWeAi6FlbuFQhb4NCCOzlJ4mSxFFfnOMD2BzmbS7R6YNqp06W
         lV2i5f2obu86x4psv4VcUgy1VDTQDNUTtWPCIpzKQZV3M905OINoxq0rXvcC23/NRmzB
         PJCrPJKp3H49x/IwDVGwWy4iLqx4WQPtnb0rTh9CpR6jg/b+TxNPi+JM9gdh2RzfqpFn
         F9yA==
X-Gm-Message-State: AOAM530gV8Qb+b+N7kjmKwQfWq6q7OMQciMC+TKZpgjrIjApUiXhvMou
        Wx8Oe/3HiBgzvmts2mMF/4FJdi49zfIojrFnJ6edfzYiCHuaDg==
X-Google-Smtp-Source: ABdhPJx7rhGWhwI5sDaxWsJELgVakM7N0i9Sxsa3sNM73cxT4SZbNjmwgAiQkMatL5Gtj+erB1Bzws36GZniH4UGAbA=
X-Received: by 2002:a05:6512:a90:: with SMTP id m16mr2214728lfu.577.1612981780538;
 Wed, 10 Feb 2021 10:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20210203163348.30686-1-TheSven73@gmail.com> <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
In-Reply-To: <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Wed, 10 Feb 2021 13:29:29 -0500
Message-ID: <CAGngYiWt9Q4jWksiniC6vqUw29L3mOFuQpw7Dz_BK9Ye9FbQ1Q@mail.gmail.com>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp only
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found it!

The i.MX6QuadPlus has two pairs of PREs, which use the extended
section of the iRAM. The Classic does not have any PREs or extended
iRAM:

pre1: pre@21c8000 {
   compatible = "fsl,imx6qp-pre";
    <snip>
    fsl,iram = <&ocram2>;
};

pre3: pre@21ca000 {
    compatible = "fsl,imx6qp-pre";
    <snip>
    fsl,iram = <&ocram3>;
};

The CODA (VPU) driver uses the common section of iRAM:

vpu: vpu@2040000 {
    compatible = "cnm,coda960";
    <snip>
    iram = <&ocram>;
};

The VPU or the PREs are overrunning their assigned iRAM area. How do I
know? Because if I change the PRE iRAM order, the problem disappears!

PRE1: ocram2 change to ocram3
PRE2: ocram2 change to ocram3
PRE3: ocram3 change to ocram2
PRE4: ocram3 change to ocram2

Sven
