Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C18BD8583
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 03:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390495AbfJPBcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 21:32:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45705 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfJPBcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 21:32:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id q64so22166464ljb.12
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 18:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2pkL4VSui/Vfz/QE4G03gSBDJiVwBAmSiXy58hC/sc=;
        b=HoSCBPabpX3V1Uvxd584nEdYSmtbmXBwq/H/Ny13M4zk8CAeIVrQ19pjmkBWp90sny
         pBFgagqLPEROyxFKBkabzRR75BVXBMN24kL1V5Ia7q65ZZB7bEzJZbhiq9RFpSgC1T7G
         7lrHNVXPbf3fPVeKzrSC53DUpQAVzu/lcq8otCNoL6iClAtvXSAbJJUsvc38nItfqYIQ
         4QIGdsI7dezonGAnzpiNPa1NUsrV2JLznJU/r3SSR0xh4i3dBK09Hds19WkPmTOhngqh
         idp9Xd9rcO7qLsmCbPFYWXS4uw+g42le3sWpip8PGN5e9auKDbm/yfFXcTQHzZs/PsDP
         Mf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2pkL4VSui/Vfz/QE4G03gSBDJiVwBAmSiXy58hC/sc=;
        b=bUTIhMPbSjGEJY6khBH3HC7fVK+sphYEBhB2tqf6O9bPny0uemNG8h/PJkaYdsmmR9
         YVh6UvR05B6FaFpO0ckqOCdfpsoM6XSwDm52Wve5Ww0CJYWx71Tbi3WSyUEmFeHKAzXb
         s3C0HTMicx1hNGU2z+Tkfki0P1mUIEVBJAC9hj1efPBWxY9cuFlRGkoIPvXI0E9sqYdB
         Vm9JMVNtAXyiYanNVVT7EvIqhj2667yVupZo2lCPS85G65SO0RtuveBAvcYFV92MaZqi
         pWvuL9G/ENNNn1kj7oMCGS+19fSQFkmgz4rz2FJ4ZhyaywSWinO3/n43GHCzRQ0tf5dG
         +YcA==
X-Gm-Message-State: APjAAAX8oNvJ8UxJ2qYyTa17Nh8b7ZYLkfX3VvZ4ULv7pNSPmDG7kTP1
        BqaEAJe+51ot+VKCMOgxgnyiwFnxJsCk7zgH0+M=
X-Google-Smtp-Source: APXvYqzliqbd7ChNoscnIMIHXlfgJ49WUfgPSmr5RrMqs0wvBBdj64O9S5kEQBNWyjtn3UopOjWqGxDpMlAklBw7V48=
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr24122293ljk.17.1571189530797;
 Tue, 15 Oct 2019 18:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
 <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
 <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
 <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
 <CAOMZO5AMbAHmoYFLQbZbzBjMkmTsPkPctU-OqArPk3_PvtznjA@mail.gmail.com>
 <2acc57d6-da43-866b-fc01-e5e59af413ac@gmail.com> <CAOMZO5B5+_3FxUfgzMJzDH-myfXEQgxT8vfa-0L8cYFK8uhsuQ@mail.gmail.com>
 <e41aa4d6-b84f-33ab-0738-e4f14d582172@gmail.com>
In-Reply-To: <e41aa4d6-b84f-33ab-0738-e4f14d582172@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Oct 2019 22:32:07 -0300
Message-ID: <CAOMZO5BVfvZD0gj6m+TsrjiFLfTZZ21Gj==Oj2ZXbKSMu_BXUg@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Tue, Oct 15, 2019 at 10:18 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> Here's a quick example that uses the end-of-frame method to measure fi's
> (all other FIM controls are left at the default values):

Excellent! That was what I was looking for. Will test it soon.

> v4l2-ctl -d0 --wait-for-event=0x08000001
>
> I plan to post an update to the imx.rst doc with these FIM usage examples.

Great, that will be helpful!

> I updated the i.MX GPT input capture driver patch and re-tested on my
> modified SabreAuto (CSI0_VSYNC signal routed to SD1_DAT0 pad), and
> re-posted, you are cc'ed. Hopefully this will actually get looked at
> this time.

Will help reviewing/testing it.

Thanks!
