Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0780DD0469
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 01:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfJHXs6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 19:48:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38679 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfJHXs5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 19:48:57 -0400
Received: by mail-lj1-f196.google.com with SMTP id b20so580729ljj.5
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 16:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wj4G4ac68DgKFhjk9+gplT8NdGIjnbX8ZXXpv5GWueI=;
        b=QGkxsX7xpchBwAVgkh/ddogg6KkJ8LWVg1GxyegvtQaXBt7Awl6ulq0vNvE27MJ4W8
         hISxhn1m3rMg5Pfg8todPSGeQhwbnjjRf0A6zRs/xb+kmbrFGnE0rvu2m4HD8/2Hn2z8
         ePaVz0/J19bMSQg6VzYFsYEG76OkWKh83Q25Xvfega2Oegz17FsQ+N3u4vy1aY+Zh09h
         0fz1sDMEl9FW1n9ZGyIkCrEB8kPgR8ftC0U5I1vY7MHAzcN6OO3E+sGKZEY3x+s50uLy
         GJFCWk8WWANcmcU9JOkNtn5mu6WO6pQ2DZYnDASJ6ymk1/aonL6C/28CVTN/CW6JGIza
         sQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wj4G4ac68DgKFhjk9+gplT8NdGIjnbX8ZXXpv5GWueI=;
        b=aGLzqBeFixFRl3LhGjO/iXMvWiIh47Un/181ezB1sMbaeQ5BZhqD2ZYBm+mF10TYMJ
         C/KGQ+6cgf1OoU3sJKQog9n7Nef25xHKlNlElyDXHu542mhRmtHb/c2fKSXMrEutKXaz
         Q982LAQHsq77dO0OV2xauhw/wyg/OuPNYi/W/9J7ctinbJi101/P72/gY7ocT7RL9Le3
         45pxSS5YVcFNv4EJ+F4B2KMtptfYE+4MTA+/CDcC0Odbn1pZigq1tBzfdxx8ZTEje2/G
         8fAEAnmMNxd836RncCuC8LPzGT1CabQy8/jKbcFQiBOSCXcL8vS0Rd63ACvHdBRSi0M/
         qrSA==
X-Gm-Message-State: APjAAAW3HFpZpCBspt/NITEJAMiHEZeLDAbi8+RRmzNyVLKaUjH40LAk
        SYY3bjrYvS8Fw4/UPrp/92MRdMdShBJydTzLUKE=
X-Google-Smtp-Source: APXvYqzXiepvz4YuooCm5t3nS5vWPSD7ovePYMtB9ppzs2JK2AeeH1Av2qmjVw6/CfHF7v3TWzNdzvjd1u694Wabs3w=
X-Received: by 2002:a2e:86cd:: with SMTP id n13mr430525ljj.239.1570578535658;
 Tue, 08 Oct 2019 16:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com> <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com> <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
 <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
 <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
 <CAOMZO5ATZw80cz6WsNUxWfgsqqX-R6A6SKz7tFQa=Tdy2ynWJA@mail.gmail.com> <CAJ+vNU1X6kCeA=CVcGqEU4DCH8ZO_EwdARpyuXdGVMH_Uu7+7w@mail.gmail.com>
In-Reply-To: <CAJ+vNU1X6kCeA=CVcGqEU4DCH8ZO_EwdARpyuXdGVMH_Uu7+7w@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Oct 2019 20:48:45 -0300
Message-ID: <CAOMZO5Ct_-wjJnb9ktp7KDcAbhajjuRxWEDYfR-13x-9ZJut6w@mail.gmail.com>
Subject: Re: ADV7180 Capture with i.MX53
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Tue, Oct 8, 2019 at 6:01 PM Tim Harvey <tharvey@gateworks.com> wrote:

> Ok that's strange indeed. I did recently test 5.3 on a Gateworks IMX6
> board with ADV7180 and the one patch to drop the first few frames and
> its stable. What does your testing show on an IMX6 and do you know

I will give it a try on a imx6q-sabreauto board for comparison.

> when it may have broken for IMX53?

i.MX53 capture is relatively new and this is my first time trying to
get it to work with mainline.

I assume I should do something similar to your
https://raw.githubusercontent.com/Gateworks/media-ctl-setup/master/media-ctl-setup
script, more especifically the mode 3 setup where you have:

case "$SENS" in
adv7180)
fmt "'$SENSOR':0 [fmt:UYVY2X8/$res field:alternate]"
fmt "'ipu${IPU}_csi${CSI}_mux':$((p+1)) [fmt:UYVY2X8/$res]"
# rec709 config at CSI pad 0
fmt "'ipu${IPU}_csi${CSI}':0 [fmt:$fmt field:$field colorspace:rec709
ycbcr:709]"
# CSI src pad output is frame height
h=$((h*2))
res=${w}x${h}
fmt "'ipu${IPU}_csi${CSI}':1 [fmt:AYUV32/$res]"
fmt "'ipu${IPU}_vdic':2 [fmt:AYUV32/$res field:none]"
fmt "'ipu${IPU}_ic_prp':2 [fmt:AYUV32/$res field:none]"
fmt "'$EP':1 [fmt:AYUV32/$res]"
;;

Why do you multiple h by 2?

> I do have a discussion going on here about NEWAVMODE and BT.656-3 vs
> BT.656-4. I wonder if its something to do with that as that issue
> causes rolling video on IMX6 with ADV7280:
> https://patchwork.kernel.org/patch/11117579/

Tested this patch, but it did not help.

Thanks
