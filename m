Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F44211E6B9
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 16:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbfLMPib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 10:38:31 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:38505 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfLMPib (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 10:38:31 -0500
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MdvVu-1i70lf2PTi-00b1qA; Fri, 13 Dec 2019 16:38:29 +0100
Received: by mail-qt1-f172.google.com with SMTP id e12so2600021qto.2;
        Fri, 13 Dec 2019 07:38:29 -0800 (PST)
X-Gm-Message-State: APjAAAUVhP/5UXUxaWEfxul12GxhzJ0sA88FsR8jTr4Gh7XOuwGdRgdi
        NQks70v7l20tNHnCMcbEwGT7W3NNffKQKKuDv6I=
X-Google-Smtp-Source: APXvYqw99oGMzeSioZjqdskLBPgYHN7FjeXUu4HGv1laMzanNdwLYdX0anAAiC6bn6p3caU4v71uSXwskgpYo0rS1GI=
X-Received: by 2002:ac8:47d3:: with SMTP id d19mr12720676qtr.142.1576251508429;
 Fri, 13 Dec 2019 07:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20191126161824.337724-1-arnd@arndb.de> <20191126161824.337724-7-arnd@arndb.de>
 <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl> <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
 <81bb5da1-6b84-8473-4ada-c174f43bbae2@xs4all.nl>
In-Reply-To: <81bb5da1-6b84-8473-4ada-c174f43bbae2@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 13 Dec 2019 16:38:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1zvMFrs1cG+nQmTq3Tcv4OWdBkPNcsr6JsaM=Zkj8cFQ@mail.gmail.com>
Message-ID: <CAK8P3a1zvMFrs1cG+nQmTq3Tcv4OWdBkPNcsr6JsaM=Zkj8cFQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wRRagCp/9UR7bP6HmPcw1OLo5+z22fM6ujfQU4/EM+H3I0fmN6f
 zeza0Ofdr9yOfDUy2ttXCEZHA9Q9vBbpdgd6P+A38Qviex3VqffjuqZqQcGupr+jA4s5TT/
 BKi3htCAO84NPb4tJ+9D1SpvLeDnzKMvC0EY4QgZLwHDA7k9vO8tsG55xEMfzW8B+3/qlJ4
 Wuw50GON3Q6B/TjvnUp7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LpZlHmiYtzg=:w1Q5Pk0+AwPFPpJXJhgh5N
 c8dX4aSsajw89bIyTgaZ7sqqK7Gx5e11J+M4aADq+GqDMJjup6bn4kyWOWVYKpBfcQZX6Tn+N
 3GDhzS3czTGsrJBOIbJrr4VwZ4lxn2SBlZW00EuSo77TRIhP4DQ+TZtQTzMR9bUQyBYze40eL
 1UFw318vhwSgI5vdmT8hvuKU+ulB9OpmZp/8/WG7HCpAtbkciwjzSbGVjQdX6nhbXF/owaIag
 WwVHLmLdtJDjI84pOePdiyG5ElCjwIe5T76SLE15HiY294OAq/mwH8lzDaRCMQRD6LB5uJl+m
 KuRSJcL41QJ7BJlekCl5jza5ma8MsYTUS07pjagDLODeiJlFjM4yolN10LdKyf12I80qP2jJX
 zC11rUwWA92Goy5vpOGvOK0yTW425BbXDy5two+ZY7jhmIwOLnb4Q9uic9Ai5VENYP+iW1cKt
 RGQl8Nqs6oVxNXGZzwifJWUlXtYIZiH0VQ+MrqJkpvyD79vZSRtt4gffVtfsqpWT8jE9GtD28
 bnKIOB/uEy1aG8NdvrEncl1IOjNHUtQkY2E1i9ytgbI4ipNuSJy3TtRS/k6BYsNlLzdbzQ+ab
 Xuq8/PC84xL/GRCXg5domnr/8mAfWugCamxy7yvqV0K3QZV/FIBdmJtFbSJC3uMalaB+Tn11O
 5NSN4rWzRM+4UFRghrQb8TxW6lCDA8WfbgeE/HImemFbLbshnCZCXpe6wua9qaah93wgcCFJ8
 k8VSFGYhlULX2+bKIq5oKZp13dFjL5C/fVLOj0LmWbR5GyQWeKFd0La+aQ67e73eG0rur8LtM
 yGNyw4vka9xxpnAKWK1P73uLH6CKq4jcTORqD4OrIYe0RpNOp7x97gY48islLn+wYvefalzXv
 9rv9gkKy69Qt1Qh1D7zA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 13, 2019 at 4:33 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 12/13/19 4:08 PM, Arnd Bergmann wrote:
> > On Thu, Dec 12, 2019 at 4:43 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > I've heard good things about the prebuilt toolchains from http://musl.cc/.
> > These seems to come with a libstdc++, but I have not tried that myself.
>
> I'll see if I can give those a spin, but if I can't get it to work quickly,
> then I don't plan on spending much time on it.

Ok, sounds good. The way the series is structured, I tried to have the
time64 ioctls use the existing code, while adding new time32 ioctls
to ensure that we catch the bugs in the new time32 version through
testing, and have fewer bugs to start with in the time64 version.

     Arnd
