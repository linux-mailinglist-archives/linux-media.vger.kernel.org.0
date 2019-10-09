Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 768D9D131F
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 17:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbfJIPk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 11:40:56 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36437 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbfJIPk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 11:40:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so3130945wmc.1
        for <linux-media@vger.kernel.org>; Wed, 09 Oct 2019 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k1ysaNPyjVIpkPTRGVpJMmoS8rEDds5bU2aYG3OnQVs=;
        b=0G+VBRRypPK9qozAM53WMt6f4AFkUi9syqT5bqnClYaKIEOKSJq5/zrg7ZXpm/DMJp
         18qL9vuvnZIVVp81LG8e6KCc580HH2e4axaJHQ34Jq1fCeeKUE7uQ8mt35Dl2QajEu6x
         /lo9m6SCvJsqhFy5fHyW4jdldc0+NiiWcr/TqKyd4QSOE+fnXGBIAy1IB4PE5M0B9pM/
         mlfAvwFwV8ybLKPcXRrkYPOYSq9GhiN7jRXtiTnHdlfb1hYyHcNQshXGUP4JYn9rQUrj
         ek1wNYRZTItbELCRXKpKXAAiIvygP3xX5pXb19pR4ZGsJ/baupbdrvOGrPDYX2dVBipw
         3lPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k1ysaNPyjVIpkPTRGVpJMmoS8rEDds5bU2aYG3OnQVs=;
        b=S8D4cprsctoSh7d9nn5flD3rxT+/TpeK61X+cE6mQxXJnbb6OX1Pd6wAtCMmq77P+l
         qFT3DcWk5LhKxF/Ybgbl6FBxW5kaqT/FlQp8qwIovyOs9xHcp9QBTAt+x2xHpMqFJjL+
         Bq5PBYgrIWqAqbjHlB9Y/O9VxRn9KkimERX7UqQLySfVeEvjHHhk8RA3Xd9ydy9Qj56c
         9O7U2X7OqxTJ+zvvv2tI6ViY9tuurseS9Mts60s2MHMT/5uRvXfVRhUwrW+vDdbcLd5O
         35nDvqkHOFL/+pK+tfvQG45ITmzrIhca89ywa7AlY5RdhDgzr7Av+o6JaT/czzgEeNhn
         gVpA==
X-Gm-Message-State: APjAAAVu9WJGZRLsZdlOmrsCaKkdMLQKkLN5Qk+fm/1/C9u6MdX35m35
        fqlwTK/dWLZddugEFRjPNDK0ofOyuw3SY8+mrIeMhQ==
X-Google-Smtp-Source: APXvYqwZ0+ODessWTIdl1eISyy+bXbZm6bOCAdGxrKIHlfPk8N4oN9csWw2sjfD5IsnExOc94QGLclelXHRd86tGtqI=
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr3102207wme.45.1570635653470;
 Wed, 09 Oct 2019 08:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com> <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com> <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
 <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
 <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
 <CAOMZO5ATZw80cz6WsNUxWfgsqqX-R6A6SKz7tFQa=Tdy2ynWJA@mail.gmail.com>
 <CAJ+vNU1X6kCeA=CVcGqEU4DCH8ZO_EwdARpyuXdGVMH_Uu7+7w@mail.gmail.com> <CAOMZO5Ct_-wjJnb9ktp7KDcAbhajjuRxWEDYfR-13x-9ZJut6w@mail.gmail.com>
In-Reply-To: <CAOMZO5Ct_-wjJnb9ktp7KDcAbhajjuRxWEDYfR-13x-9ZJut6w@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 9 Oct 2019 08:40:42 -0700
Message-ID: <CAJ+vNU3FUvB_a1TxxjvtKbC9xg6-VbD+3PE6-5uEwgOwXn6WvQ@mail.gmail.com>
Subject: Re: ADV7180 Capture with i.MX53
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 8, 2019 at 4:48 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> On Tue, Oct 8, 2019 at 6:01 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> > Ok that's strange indeed. I did recently test 5.3 on a Gateworks IMX6
> > board with ADV7180 and the one patch to drop the first few frames and
> > its stable. What does your testing show on an IMX6 and do you know
>
> I will give it a try on a imx6q-sabreauto board for comparison.
>
> > when it may have broken for IMX53?
>
> i.MX53 capture is relatively new and this is my first time trying to
> get it to work with mainline.
>
> I assume I should do something similar to your
> https://raw.githubusercontent.com/Gateworks/media-ctl-setup/master/media-ctl-setup
> script, more especifically the mode 3 setup where you have:
>

I struggled with coming up with a way to easily document all the
variations with our boards as we have several different boards that
have an adv7180 using different CSI ports and then you also have to
deal with the differences between IMX6SDL and IMX6Q. The script was
the best solution I could come up with but if you read through it its
pretty complicated.

> case "$SENS" in
> adv7180)
> fmt "'$SENSOR':0 [fmt:UYVY2X8/$res field:alternate]"
> fmt "'ipu${IPU}_csi${CSI}_mux':$((p+1)) [fmt:UYVY2X8/$res]"
> # rec709 config at CSI pad 0
> fmt "'ipu${IPU}_csi${CSI}':0 [fmt:$fmt field:$field colorspace:rec709
> ycbcr:709]"
> # CSI src pad output is frame height
> h=$((h*2))
> res=${w}x${h}
> fmt "'ipu${IPU}_csi${CSI}':1 [fmt:AYUV32/$res]"
> fmt "'ipu${IPU}_vdic':2 [fmt:AYUV32/$res field:none]"
> fmt "'ipu${IPU}_ic_prp':2 [fmt:AYUV32/$res field:none]"
> fmt "'$EP':1 [fmt:AYUV32/$res]"
> ;;
>
> Why do you multiple h by 2?

The input the the CSI is a field of 240 lines but the vdic will
combine these and have 480 lines. I don't recall exactly why but for
this to propagate properly you need to set the 480 lines on the csi
output.

>
> > I do have a discussion going on here about NEWAVMODE and BT.656-3 vs
> > BT.656-4. I wonder if its something to do with that as that issue
> > causes rolling video on IMX6 with ADV7280:
> > https://patchwork.kernel.org/patch/11117579/
>
> Tested this patch, but it did not help.

That patch won't affect adv7180 but I wonder if the issues you are
having have to do with something like this. The adv7180_init function
will set BT.656-4 mode and adjust V bit end position for NTSC... I
don't know if that's consistent with the IMX53 CSI needs? There are
lots of little tweaks that can be made to the EAV/SAV codes and its
not clear to me how to deal with compat issues like i have run into
with the adv7280 config not being compatible with the IMX6 CSI needs.

Tim
