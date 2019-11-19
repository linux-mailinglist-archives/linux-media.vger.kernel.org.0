Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1B5C102534
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 14:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKSNM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 08:12:29 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38607 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfKSNM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 08:12:29 -0500
Received: by mail-ed1-f68.google.com with SMTP id s10so16994321edi.5
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2019 05:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VEavlwL1+rDzs+L+hM6nx0dnrMPSn2yWoKd3exKBnKI=;
        b=b6eiXfq4vDKE47zZ4PvxoN61Q1BY37X7wcxDr/SiVmRRP0VtNsmCMMkrX3qi2LrRtu
         P92lSpOaIxSROrtWuDJJ0XrRgaTiZBAJJ6z6l46VSE06O0MjhbBzsnYdD72zjhau3pF3
         WCNJR5qHibROyv1OB4bctwVa86YYWorAOoycA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VEavlwL1+rDzs+L+hM6nx0dnrMPSn2yWoKd3exKBnKI=;
        b=e8u7V3LvOXhVK4Bm9NKQ6q45WY5RPemBVDq8O5Zh2rVIbctLcHxrEfev0DU+U75Ld3
         XhBh8AslWVLR7aM1Yti7rA06YzAl7lqof7pSz4qSYwNnB7HZ4mw9xiO83xKK+updO9XD
         IU9H1DykbJThGgKZRzYA4+g6Eb/q2qIzP0xAfkHeoGM9MQ9iTc6S3NjGocgmJ8DupaB0
         3PwvFLkwmkMC8wvLDviS8Uu/iWsnwKyM1rEK2GB6Cf2riLB/shuJBViMf/NPBRZ7Tp7N
         7jAy+BCOpvPIYx7OqCyqu2TsaALhwMf73Cc+iUFenoQd7o1xLdLVNh/fVdp+nxVeAM4G
         1LNQ==
X-Gm-Message-State: APjAAAUPeIsHlUWeSPNp1aeexCnf0g8HtV4U+EUCAGGARVvkUiAvBGnD
        GOV478LlnE9QM1Bf8046eD9dP9t25MhN3g==
X-Google-Smtp-Source: APXvYqy8FFFTydSh0VA7TSVnDPKonyStnWFj3cddIMHl1xgYTAsilsAgVVVAtnBLMP1FMkVDeJcKnQ==
X-Received: by 2002:a17:906:f0c9:: with SMTP id dk9mr35295511ejb.56.1574169147100;
        Tue, 19 Nov 2019 05:12:27 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id i14sm1260398edk.65.2019.11.19.05.12.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2019 05:12:27 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id t1so23769134wrv.4
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2019 05:12:26 -0800 (PST)
X-Received: by 2002:adf:e505:: with SMTP id j5mr33584239wrm.46.1574168650324;
 Tue, 19 Nov 2019 05:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20191114051242.14651-1-helen.koike@collabora.com>
 <20191114051242.14651-3-helen.koike@collabora.com> <09d4f683-d03d-46c9-e9d2-b8cceb72446e@xs4all.nl>
 <9cb116f6-64f4-1510-b128-8657d6d4889b@collabora.com> <CAFLEztRQfYE_Mssiq4KxK-QyJEe+KT4eTsvnLZQK5T=uVADUqA@mail.gmail.com>
 <4135d35cd581b31d08b547852ac43e959957abf5.camel@collabora.com>
In-Reply-To: <4135d35cd581b31d08b547852ac43e959957abf5.camel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 19 Nov 2019 22:03:59 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BPwSnY51vJboCB6Hr2Yz4jMqt4VWLNNLTpiwenGo_Wew@mail.gmail.com>
Message-ID: <CAAFQd5BPwSnY51vJboCB6Hr2Yz4jMqt4VWLNNLTpiwenGo_Wew@mail.gmail.com>
Subject: Re: [PATCH v11 02/11] media: staging: rkisp1: add document for rkisp1
 meta buffer format
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Jacob Chen <jacobchen110@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Eddie Cai <eddie.cai.linux@gmail.com>, kernel@collabora.com,
        Heiko Stuebner <heiko@sntech.de>,
        Jacob Chen <jacob-chen@rock-chips.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        =?UTF-8?B?6ZKf5Lul5bSH?= <zyc@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 19, 2019 at 9:56 PM Ezequiel Garcia <ezequiel@collabora.com> wr=
ote:
>
> Hello Jacob,
>
> Thanks for the insight.
>
> On Tue, 2019-11-19 at 18:16 +0800, Jacob Chen wrote:
> > Hi Helen ,
> >
> > Helen Koike <helen.koike@collabora.com> =E4=BA=8E2019=E5=B9=B411=E6=9C=
=8814=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:59=E5=86=99=E9=81=93=
=EF=BC=9A
> > >
> > >
> > > On 11/14/19 6:21 AM, Hans Verkuil wrote:
> > > > On 11/14/19 6:12 AM, Helen Koike wrote:
> > > > > From: Jacob Chen <jacob2.chen@rock-chips.com>
> > > > >
> > > > > This commit add document for rkisp1 meta buffer format
> > > > >
> > > > > Signed-off-by: Jacob Chen <jacob-chen@rock-chips.com>
> > > > > [refactored for upstream]
> > > > > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > > >
> > > > checkpatch gives me:
> > > >
> > > > WARNING: Missing Signed-off-by: line by nominal patch author 'Jacob=
 Chen <jacob2.chen@rock-chips.com>'
> > > >
> > > > Looking at this series I see duplicate Signed-off-by entries for Ja=
cob Chen and a total
> > > > of three different email addresses:
> > > >
> > > > jacob2.chen@rock-chips.com
> > > > jacob-chen@rock-chips.com
> > > > cc@rock-chips.com
> > >
> > > And I see a name in the Maintainers file as Jacob Chen <jacob-chen@io=
twrt.com>.
> > > I was wondering if I could replace the email by jacob-chen@iotwrt.com=
, or if I should
> > > keep the original ones.
> > >
> > > Helen
> > >
> >
> > "jacob2.chen@rock-chips.com"/"jacob-chen@rock-chips.com" is me and
> > "cc@rock-chips.com" is another one.
> > ' jacob-chen@rock-chips.com' is invalid now,  so you could replace the
> > email by 'jacob-chen@iotwrt.com'.
> >
>
> Authorship and SOB can't be changed freely, the original must be retained=
,
> because this gives proper credit to the company that sponsored the work.
>
> I.e. if your mail used to be jacob2.chen at rock-chips.com, then I think
> we can use that. And if cc at rock-chips.com is a different engineer,
> also named Jacob Chen, perhaps we can mention that somewhere to reduce th=
e
> confusion.

Some patches have been developed by Jacob <jacob2.chen at
rock-chips.com>, some by Jacob <cc at rock-chips.com> and some by
both.

Some patches have been also re-posted by Jacob after leaving Rockchip
AFAIR, from the <jacob-chen at iotwrt.com> address. Those should have
<jacob2.chen at rock-chips.com> as From: and include sign-offs from
both <jacob2.chen at rock-chips.com> and <jacob-chen at iotwrt.com>.

So the conclusion is that the original sign-offs should be retained
+/- typos fixed.

For typos, was <jacob-chen at rock-chips.com> a typo of <jacob2.chen
at rock-chips.com> or a typo of <jacob-chen at iotwrt.com>?

Best regards,
Tomasz
