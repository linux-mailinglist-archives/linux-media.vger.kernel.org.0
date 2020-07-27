Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7159722F154
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 16:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbgG0ObX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 10:31:23 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50865 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729944AbgG0OUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 10:20:49 -0400
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N7Qkv-1ks1bu0Bv3-017mrg; Mon, 27 Jul 2020 16:20:47 +0200
Received: by mail-qk1-f175.google.com with SMTP id 11so15376792qkn.2;
        Mon, 27 Jul 2020 07:20:46 -0700 (PDT)
X-Gm-Message-State: AOAM533y6Nxrz7bQxQrAS357lFSp6J8YyGfbQUyVTnIyHWCbjskNE+PF
        UpFnPSk5BzPvBBZSUtUxA9hYRks2o8yWXY6vbbg=
X-Google-Smtp-Source: ABdhPJw7HU4DkkeUrMcak+NpsOXmslOO3+jYmC/8AEojsfZg/P4wKNKY0WLTL5LRBq4hmj1FpqBJPo8pIawzXbM9u3M=
X-Received: by 2002:a37:b484:: with SMTP id d126mr23013501qkf.394.1595859645873;
 Mon, 27 Jul 2020 07:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com> <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
 <20200727141416.GA306745@PWN>
In-Reply-To: <20200727141416.GA306745@PWN>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 16:20:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3qBs8CsAeTqk7aKgdxsfR677sSwaEHR9+V1vn_4RKRbw@mail.gmail.com>
Message-ID: <CAK8P3a3qBs8CsAeTqk7aKgdxsfR677sSwaEHR9+V1vn_4RKRbw@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bRdVwWHVEUXivD/D7sCmgCA140AsJUA9jRlU58lESa77rrOpZWF
 HuK62xNqTxjP/doIpKwpIrQ0kjahTavnNHVMBnOQ3wkR5QdZJcHFfQdxir2UdOF4oC9YeGX
 PUU3QgYBCEVOTjncVokTnHtCf42RMJ2j0J/Kgt8BKmAzT/bO4oqbKwuQRZ69QUL+EcnBiYo
 BwDCC1xuB6FyvScbGhVjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gHAZ7reSrAM=:3DBYSZkIdy9kQzEPZ02bwO
 xEuWURKWvQduKdYtwGFqm3JZvZTZDUQheNMD7HkdWaZzmRLXYVS+phDRyYJbyijXrqzg5vBun
 ntBFbGT8Oh724pKf0uNFY6pay0OLgOt/hoM48XsdBU6QVF2lgY8EJEyhDQk9lvC+VG9OilsE+
 pSMIoZ/kVPXKdoRwJubXDFJ6R7qBLwsDvS9gOTEW7b13mKTyNCx5+1+iIfJz3GtCFLLhLIhbe
 EQBpX2ukO830QCcxTnECV/xAP09YKQzr3qM9b8n1q+qNzRx7oqC/azGJlPbcxGZUBeqI80rrK
 ft6kaQ5dNjMkO59S04LUpqFGABZ2iZqjkpppdgxSLGGMNx5RTvsPN3vG+tU48RSMv38qOwmEU
 7YL5cqVUFf1TMGpeNTYh9wzwPMSUWcAArcsbFr5H544FON1uBC6g9KF+qw5eP3TZ+KexouN0p
 vcAcHa4l5PsvhTgJeJIvVYrYNWWboY2uY0X9BAaAOcgzfOxWDqm7uQdbYAGBvRjwdFfqxZ5M3
 g7+UO+p872pj4EjwcjA0cjxos68DaapCqlU7QiciLaqYB31sVDkgDBga6vcmpdaHE6jVlPtP0
 EAG9NARpau4Jvi5w8A7FKOqEaSdLKxZ8/AnuiZZ0IWKn4mW0xfGAf8/4/SQvPvEe9iqVnEQWQ
 5nxKdpOJlxb/czjGyPLiXQHFjovnd86MzuCXXLnPgYkA/gQ/5sJ2KMhvDgeAgri/oUb/dlNmQ
 GJsrkR1tiD6bfHSePas9E0XGo+JDfeVfaVa1eo/9I5AyQLND7RSAeSzjBt5doPdrdKn21IXk+
 nUre7KiS8+/NhqMWFk0o96AeeRfYz4/DaZpxNb49bycFNK93cDgcXhqu6K99w5qVp6KzoWptc
 eHYAVt3D5anuz0sHCEwZM6XQbQQB33WN+0KtKkLojsoLAWTsPi6+mdRnyag3u8AkR7EK8k29A
 DV9oSh5V+zT04tM0WFF9Vh9rTl/J55r1TsQd4Vf5AG/drtr+lDDA3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 4:14 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> On Mon, Jul 27, 2020 at 04:05:38PM +0200, Arnd Bergmann wrote:
> > Peilin Ye, is this something you are interested in fixing for the other drivers
> > as well? I'd be happy to help review any further patches if you Cc me.
>
> Yes, I would like to! I will start from:
>
>         drivers/firewire/core-cdev.c:463
>         drivers/input/misc/uinput.c:743
>
> ...as you mentioned above.

Sounds good, thanks!

     Arnd
