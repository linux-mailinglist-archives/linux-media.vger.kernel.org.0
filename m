Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12FC32E290
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 18:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfE2QxN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 12:53:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39768 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfE2QxN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 12:53:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id a10so3178630ljf.6
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDIPDLr9Ng0NhpqFSJS8PtCUL0xQurDFel9JgLUuwmw=;
        b=DEw5PWRnrmAFRgwpU1/rXMPhpfrXeqPWSRbXTRaqidViDDG6lcw4S0A+p1mmSyzWw5
         ayNKIzZHHeo9vspg+h7ID8ShX+VHWf+ZaCc/fhZ95KpdqPFIdgM4E1pywEHE4mYelVlf
         RRapeaH+mFRf/vhir/A9hoFDPoca8XygY3uLAp77aCBP93S4QhLipS/GH907HTxPw5jV
         zGmnv7+xgn9617BYv0S6qXentfe3dpUgVC3Usfln7ev9qvWFq9nK3S20S/WXSNSzTvKQ
         k0BpJx6JBkF8r7J/Qe2CgSMrVL6VEDfq9TeCtbdQ04G7v2xA84oEKl44sjsVY1USyPKp
         ViCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDIPDLr9Ng0NhpqFSJS8PtCUL0xQurDFel9JgLUuwmw=;
        b=TkY6Ixax3gIJpB2tI8TVjEt9gbkW3bTkRqeWWd8l3/CS+fr/Yea4866dKxKoUL1XWS
         +UFQndSPeow/PP33NjdWWI1Ve3/ZSMdqkdsnZ9X2tm7+8j+CMKVfP/4wvoGJh8Imk0p4
         y3yrOv8uf+r79I7mPSPeNnqDh8Xh6UkSAIu2p9etgB/60oXUp1IdjQBtx/oi2g322nr8
         3GimuwsfNp1KpXjIXMVKIPKMjR2jAsqSU9onxeckv22gUa4+sroPZ7D+cPxj9BdAhOrD
         P+R2cC8AMKftRWlu3XqBDpR1xNpJGD7sDTPGYlKS4LZsC7WfAVoFLwaXSaf2070NQ3eV
         KzlQ==
X-Gm-Message-State: APjAAAXEghAE5YSVPjHs52Gdm+9rC9Q1W/BWhXeEKAfivZ4X69JyOzlr
        elqOvXiWBSqLxHlvq0doxyciZSsLTx5CMfxOJsw=
X-Google-Smtp-Source: APXvYqzays2+d1NLoGbSnk77dgOaGBz/ii50kj1DWseY01eFmeCDh5DDpyI+WZVhBqzoBnZnqnHukTR5B5sX/Vw1gpM=
X-Received: by 2002:a2e:9185:: with SMTP id f5mr39210850ljg.51.1559148791038;
 Wed, 29 May 2019 09:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de> <20190529154431.11177-1-TheSven73@gmail.com>
In-Reply-To: <20190529154431.11177-1-TheSven73@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 29 May 2019 13:53:00 -0300
Message-ID: <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sven,

On Wed, May 29, 2019 at 12:45 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> Thank you all (and especially Philipp) for this amazing work !
>
> One of the main uses for the VPU scaler is to convert from video file
> resolution to display resolution. E.g. the source video is 1080p, but the
> display videomode is only 720p.
>
> Unfortunately when I connect CODA/h264 decode to the VPU scaler, performance
> drops to about half. But on the non-mainline Freescale kernel, even with
> the rescale, I still get 30fps.
>
> Mainline kernel + v8 imx rescaler patch:
> A) 1080p30 source video -> CODA h264 decode -> drm 1080p: near full speed (28fps)
> B) 1080p30 source video -> CODA h264 decode -> VPU scaler 1080p->720p ->
>         drm 720p: only half speed (15fps)

Does this patch from Philipp fix the problem?
https://git.pengutronix.de/cgit/pza/linux/commit/?h=imx-drm/fixes&id=137caa702f2308f7ef03876e164b0d0f3300712a
