Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74F0011E633
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 16:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfLMPIc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 10:08:32 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:35433 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727534AbfLMPIb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 10:08:31 -0500
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mi2Fj-1i1myS0lv7-00e57m; Fri, 13 Dec 2019 16:08:29 +0100
Received: by mail-qv1-f50.google.com with SMTP id o18so953554qvf.1;
        Fri, 13 Dec 2019 07:08:28 -0800 (PST)
X-Gm-Message-State: APjAAAXOxvg1WYd+/T/9EpmusdILm9OpW5nLt9b4oO/byJHB/Udd9bUu
        vvUFfwxfwojJBJGgRN6gpzyRXUiiqql25+iS2L8=
X-Google-Smtp-Source: APXvYqyXNQ4x18Xb3pDJJ3eG6ztUFPxVU+V+W0//wYliZN89MGgdHAFuqSBKrKU1TKieIVaUDZVh8vYjxfA8MJTr7YE=
X-Received: by 2002:a0c:aca2:: with SMTP id m31mr14072871qvc.222.1576249707957;
 Fri, 13 Dec 2019 07:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20191126161824.337724-1-arnd@arndb.de> <20191126161824.337724-7-arnd@arndb.de>
 <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl>
In-Reply-To: <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 13 Dec 2019 16:08:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
Message-ID: <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bcTVUHr5D9sBj8v+27Fb5K1qnoKmWUl3vCPuMnw3eva4GA3xlW3
 xPztPSIh2UASPIwXxPAqWlWgptqoJk+idTDkFQsk12ksIJafKMZnpT/jq2/HX2JLoa+TtRO
 JT2ydFg2UEJaFlpTqPWLLpYkl/F/3eafQLGA0skX5TRLSsGsrqHXcI/2hPT19dclY1Upo8S
 VENI0ffJQ15gBSbHWQZAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mLdzpUq+mH8=:CBEaYGGaySZCGcc3a0GMC3
 9nMTSieRNUFonNXkPyT62XTTfz6sQ3XjjLcZQxOR30FE3XwWLLZabv8P4ODHXcGhxI5GkoYW5
 CKVUjb1WUQWvxlnT8p805Sg2WdxWWPxpjbDLstCdgeshRZFwI630jJGFQD/a55gtvWWriP4ha
 xt+kNoFN4OfNeHZQHdoyURzTgllYGQ/k7GSU0vQ9/u4eL+j/wXELAEjTAXHbO+2gT7XqvDXdY
 ayjW25pY+dp6jB0Z2+6T5cjTq5glJomBvpmt+wqTMDcQ4gEhb2i4OabU8Ffy2a6kW0B12Cpvm
 AEmO3Cqii6DnEV2YbYa87ud4NxrTi8sORQd12n2bicIRyEOlDPzGk4yXZWvdkUGVnRzoJmBug
 z0vzlKVqcixhTAgIP8PbJG9fCloNKqWBJF+76r2H1rNPFu5kLO7JuB7vTOu4gIDl7Xhxst5Fa
 gmZG1ROGW7FCGRN9fyd+iktB1lEbtIDsqpbd63U4dLBF+3oQdpmGUFJ9DGgM/SzeOMGdHEXT+
 X56+pUzMnFlBXSAlepCmb8MSeAS4BP0gPultIXFJqwjw+K5Be6c3sJ34Rkv+gHpiBZdTYq+kY
 GsRluB60Ey1pgCQfZ/Tu5EeLY2+EW888FXpKEZpSmltWfZ67nJqq5r0B+7Q2sw2k59681pPMt
 uWNNRzyTcqdYu3CyQPnusgCnrmm1Pjx5GpBdKooMI+EXmYJE9XCS3xvTv+KkeuSM+V+O3sr7J
 0uUrW+tR52ArSxlS+0h8FBRWRmyEzKnJptba7viTLkGFxLOxBOph9L9x/z1s4OqfrjUPK9gCl
 tOGv86SqyKDBcYux2L/wuiYV67UEWgEzn+f4JI0YHabCiiW6MxdNRkmAAPvYauwyAY/x2nG6S
 7Li3GWLkfg/kgpKXy8xw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 12, 2019 at 4:43 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/26/19 5:18 PM, Arnd Bergmann wrote:
> >
> >       switch (cmd) {
> > +#ifdef COMPAT_32BIT_TIME
>
> COMPAT_32BIT_TIME -> CONFIG_COMPAT_32BIT_TIME

Fixed.

> > +             *vb = (struct v4l2_buffer) {
> > +                     .index          = vb32.index,
> > +                     .type           = vb32.type,
> > +                     .bytesused      = vb32.bytesused,
> > +                     .flags          = vb32.flags,
> > +                     .field          = vb32.field,
> > +                     .timestamp.tv_sec       = vb32.timestamp.tv_sec,
> > +                     .timestamp.tv_usec      = vb32.timestamp.tv_usec,
> > +                     .timecode       = vb32.timecode,
>
> You forgot to copy sequence.
>
> > +                     .memory         = vb32.memory,
> > +                     .m.userptr      = vb32.m.usercopy,
>
> usercopy -> userptr

Fixed.

> > +                     .length         = vb32.length,
> > +                     .request_fd     = vb32.request_fd,
> > +             };
> > +
> > +             if (cmd == VIDIOC_QUERYBUF_TIME32)
> > +                     memset(&vb->length, 0, sizeof(*vb) -
> > +                            offsetof(struct v4l2_buffer, length));
>
> It's from the field AFTER vb->length that this needs to be zeroed. It's best to
> use the CLEAR_AFTER_FIELD macro here.

I'm a bit lost about this one: the fields that are not explicitly
uninitialized here are already set to zero by the assignment
above. Should this simply be a

                if (cmd == VIDIOC_QUERYBUF_TIME32)
                       vb->request_fd = 0;

then? I don't remember where that memset() originally came
from or why request_fd has to be cleared here.

> > @@ -3100,6 +3141,30 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
> >                       return -EFAULT;
> >               break;
> >       }
> > +     case VIDIOC_QUERYBUF_TIME32:
> > +     case VIDIOC_QBUF_TIME32:
> > +     case VIDIOC_DQBUF_TIME32:
> > +     case VIDIOC_PREPARE_BUF_TIME32: {
> > +             struct v4l2_buffer *vb = parg;
> > +             struct v4l2_buffer_time32 vb32 = {
> > +                     .index          = vb->index,
> > +                     .type           = vb->type,
> > +                     .bytesused      = vb->bytesused,
> > +                     .flags          = vb->flags,
> > +                     .field          = vb->field,
> > +                     .timestamp.tv_sec       = vb->timestamp.tv_sec,
> > +                     .timestamp.tv_usec      = vb->timestamp.tv_usec,
> > +                     .timecode       = vb->timecode,
>
> You forgot to copy sequence.

Fixed.

> With these changes this patch series passed both the 64 and 32 bit compliance
> tests (in fact, all the issues mentioned above were found with these compliance
> tests).

Yay compliance tests!

> I am unable to test with musl since v4l2-ctl and v4l2-compliance are C++ programs,
> and there doesn't appear to be an easy way to compile a C++ program with musl.
>
> If you happen to have a test environment where you can compile C++ with musl,
> then let me know and I can give instructions on how to run the compliance tests.
>
> If you can't test that, then I can merge this regardless, and hope for the best
> once the Y2038 fixes end up in glibc. But ideally I'd like to have this tested.

I've heard good things about the prebuilt toolchains from http://musl.cc/.
These seems to come with a libstdc++, but I have not tried that myself.

I've folded the change below into this patch in my y2038-v4l2-v6 branch
but have not been able to update the copy on git.kernel.org yet because of
server-side issues today.

          Arnd

8<-----
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
b/drivers/media/v4l2-core/v4l2-ioctl.c
index c416870a3166..667225712343 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3055,7 +3055,7 @@ static int video_get_user(void __user *arg, void
*parg, unsigned int cmd,
        }

        switch (cmd) {
-#ifdef COMPAT_32BIT_TIME
+#ifdef CONFIG_COMPAT_32BIT_TIME
        case VIDIOC_QUERYBUF_TIME32:
        case VIDIOC_QBUF_TIME32:
        case VIDIOC_DQBUF_TIME32:
@@ -3075,15 +3075,15 @@ static int video_get_user(void __user *arg,
void *parg, unsigned int cmd,
                        .timestamp.tv_sec       = vb32.timestamp.tv_sec,
                        .timestamp.tv_usec      = vb32.timestamp.tv_usec,
                        .timecode       = vb32.timecode,
+                       .sequence       = vb32.sequence,
                        .memory         = vb32.memory,
-                       .m.userptr      = vb32.m.usercopy,
+                       .m.userptr      = vb32.m.userptr,
                        .length         = vb32.length,
                        .request_fd     = vb32.request_fd,
                };

                if (cmd == VIDIOC_QUERYBUF_TIME32)
-                       memset(&vb->length, 0, sizeof(*vb) -
-                              offsetof(struct v4l2_buffer, length));
+                       vb->request_fd = 0;

                break;
        }
@@ -3155,6 +3155,7 @@ static int video_put_user(void __user *arg, void
*parg, unsigned int cmd)
                        .timestamp.tv_sec       = vb->timestamp.tv_sec,
                        .timestamp.tv_usec      = vb->timestamp.tv_usec,
                        .timecode       = vb->timecode,
+                       .sequence       = vb->sequence,
                        .memory         = vb->memory,
                        .m.userptr      = vb->m.userptr,
                        .length         = vb->length,
