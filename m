Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 525C91A001D
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 23:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbgDFV0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 17:26:31 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:38638 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFV0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 17:26:31 -0400
Received: by mail-lj1-f179.google.com with SMTP id v16so1359428ljg.5
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZQVMe+qDAVZ4ZbUfkeEBQyqSlivCQHTrBDHhj5slEiI=;
        b=R/IMYZSfYI9ztNbiK5FE7PF4EhwaVo2nB0Rpk6Ib+dI6gsDvt/S6iupO8RQyVKCbU/
         Fu3shWMFCHDMJjV+YdWmHMUkHt15+NHmce2HEoFK1bw68zdpwS+CjmQQcmbEPU1LG3GA
         TJ7DFQJ4SBhP8RKE4YdhQ67BDNm1gkbrP/Kr8Jr0JSOqFTFrPqJzXdeuSVSP0tsC/JEW
         Cc+8vEt57DgyLAY4RBYmyQRffFX1lM5XibiWgiMtGFwkG9CwWpMS0qBDXDoTZ0WWhE9i
         GB6HWczZQh2e4Cd+oL4maMO2Z92oFuaiBEVEgjOdT6gXrkMljLQ8xJWJ/TGO5a+64f6y
         RoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZQVMe+qDAVZ4ZbUfkeEBQyqSlivCQHTrBDHhj5slEiI=;
        b=hfpOfGyvizZVKPUrAZbABs1a0pQL4zumcRUljPjNLHCm1NDuqdgb62E8Y0BH9H4WEu
         glRPsPGHPXQ8wqrz0BC2C/TA+h5eqidjNcb4ocVOEuXAe+mRw5ciL24GRIEqh8qZro92
         JZbRpYsKMvEOaI3W/UOFu1hroDAwao7rVxsvCQw9LMWsz7TJbQJFUQ88ws0PbH6uD6fN
         M0Wn8CcYLvur0hea7/E6W6LibI7YdFf6yhJIH+S6O03LVzeBeBzeCNlE/gKs8O1xICmH
         WEAO0x01SoYeFO1HXTs26tJdEBXex8zpLX4A3NpoaKSuQAFIqYxWga00hzg8bejtNx+D
         Urxw==
X-Gm-Message-State: AGi0Pua7PhIubJ+mPVre8vVjgXD/wAW+XhWRFUdBBB23aAuzjqReHuNB
        CVCZLVpgOK/SR7nt02ifXYwX6tgRzZ94GkiKtB4=
X-Google-Smtp-Source: APiQypIs/fg4UyrKbQNz1s3mathWH3/1esifYXjUFkGU1FGYiOBt+7Bz5AbweIHH3Yr6j8fLqlIEwBBeTslQzL3y4ZA=
X-Received: by 2002:a2e:9105:: with SMTP id m5mr779545ljg.37.1586208386638;
 Mon, 06 Apr 2020 14:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
 <77add588-5756-8684-3e8f-0f46cbb2442b@gmail.com> <CAOMZO5C32M-JzCtfd7_=HtyfMqyqYd6adUEj1XRB6SYGoq0a0Q@mail.gmail.com>
 <CAOMZO5Ask2GF7fA=K6_RYF7138YEhsg4ERqvyS5SRt6jkh8QvQ@mail.gmail.com>
 <65b57718-a60e-66bf-61ba-348457fc524f@gmail.com> <CAOMZO5C95_G_Zeff2NRJZ4fxH29VfJP7B74H3h+bMp05WGF2Rg@mail.gmail.com>
In-Reply-To: <CAOMZO5C95_G_Zeff2NRJZ4fxH29VfJP7B74H3h+bMp05WGF2Rg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 6 Apr 2020 18:26:49 -0300
Message-ID: <CAOMZO5Bw=wowJntuWYA-h9s2nFvPRbkQVWadM4GcUdxWH2rWNw@mail.gmail.com>
Subject: Re: imx6: Cannot register mem2mem
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 6, 2020 at 4:39 PM Fabio Estevam <festevam@gmail.com> wrote:

> Nicolas,
>
> I am using Gstreamer 1.16.2 on i.MX6 and cannot get the
> v4l2video8convert to show up.
>
> The mem2mem appears at /dev/video8 and it corresponds to i.MX6
> ipu_ic_pp csc/scaler.
>
> Any suggestions?

It seems that it shows up with v4l2convert instead of v4l2video8convert
and it works fine:

gst-launch-1.0 videotestsrc ! video/x-raw,width=320,height=240 !
v4l2convert ! video/x-raw,width=640,height=480 ! kmssink

So we are all fine then :-)

Thanks
