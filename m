Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFBB14854D
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 13:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732642AbgAXMlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 07:41:18 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35863 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730413AbgAXMlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 07:41:18 -0500
Received: by mail-pg1-f195.google.com with SMTP id k3so988904pgc.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jan 2020 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=znYwEP8BlT5JhAqIxI23u4NVyVYxwHFg1esi8lZ0b3I=;
        b=fdaKR2SLA5vNu+qBklTanXoToNYa6WgLoP22kqdCYdS3CvCCGl1MaVzdq0R/BSs/Gj
         +NdsCcir6+RhE8r/7nww9QwERmL3s4rZ+WLCzKKVmB2emp2sh87RyRYw9QTsZRjBrEj5
         fwIYq3k9B/WqoYYcPn8Az9gEH6fvU1QNAURlf0liOeGr8kYXPrv98mUy7Q6zkp0YbV8d
         iTXcsRobQxfsjrr5E3e+V+cr/dGnyK0pNyvGisNxKxyG1iNq9hICQBNiuivcYMojTEIJ
         FsO+YzEXggI8E48jcAzSpNQm33LvsIjgMYaSW93GqEapvqnmBY/Ac6jGcXjoVhhMyl4V
         VzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=znYwEP8BlT5JhAqIxI23u4NVyVYxwHFg1esi8lZ0b3I=;
        b=X5u5WUpdJR4YO1ykF7j5W84HjrjHa2NU5Y46ii97BvdrZtAlzi6uV0MSuUhMU1Neuz
         VnBSO1FxqHuktPMxKivEb9smr7PeYqGMK5dCLjFVas6ZuwL3r4IQy92ZPPvuut28sGyb
         HRT99/6Oi/lRD2PhSVfoUGQsSjHPh2d+o5ytMIw1Iu/MX5Xw8ZMPNjlFfHpCFLZdsIaA
         0wzr3ob5M6az2iVP3yuXhJHy0ywEZinoG6ZBrsp6vw7mc/GnAXqghBlJ/ZR76WLCLBVE
         JDjouQ8yDJygvaNlmrXCJpAK2n0OxUH3drlT0cLiUo/gWddesVwUKZc8rTIdozI98Zwz
         i4BA==
X-Gm-Message-State: APjAAAUt2xEoX1hUsNCrxSa0FoGuxN5glSKUsENQ462vz1D5pbr8AcD8
        RzB920MpbTNystoCycCSdbHh2qsuD0x0PNTLhQu+wQ==
X-Google-Smtp-Source: APXvYqzid1qXDZZJNwycxElhu5/AfgZByrUXYujmLVPV1dVARwiXBDpF6hO1aoMHSiS205Uo0dD3VVOFhGH4Eunowts=
X-Received: by 2002:a63:358a:: with SMTP id c132mr4045045pga.286.1579869677153;
 Fri, 24 Jan 2020 04:41:17 -0800 (PST)
MIME-Version: 1.0
References: <000000000000de50d7059ba6acd5@google.com> <20200123102707.2596-1-hdanton@sina.com>
 <20200124022847.11244-1-hdanton@sina.com>
In-Reply-To: <20200124022847.11244-1-hdanton@sina.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 24 Jan 2020 13:41:05 +0100
Message-ID: <CAAeHK+whRFCF9WzUr55MoMiFsn83Ykr9jGGUFE4CTKVbBsZu6Q@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in v4l2_release (3)
To:     Hillf Danton <hdanton@sina.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        bnvandana@gmail.com, hverkuil-cisco@xs4all.nl,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: multipart/mixed; boundary="000000000000e671c4059ce2127a"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000e671c4059ce2127a
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 24, 2020 at 3:29 AM Hillf Danton <hdanton@sina.com> wrote:
>
>
> On Thu, 23 Jan 2020 14:19:47 +0200 Laurent Pinchart wrote:
> > On Thu, Jan 23, 2020 at 06:27:07PM +0800, Hillf Danton wrote:
> > > Wed, 22 Jan 2020 14:58:08 -0800 (PST)
> > > > syzbot has found a reproducer for the following crash on:
> > > >
> > > > HEAD commit:    4cc301ee usb: gadget: add raw-gadget interface
> > > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=17f5a721e00000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=9ba75825443d54bd
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=75287f75e2fedd69d680
> > > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a0b6f1e00000
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1327dd76e00000
> > > >
> > > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > Reported-by: syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com
> > > >
> > > > usbvision_set_audio: can't write iopin register for audio switching
> > > > usbvision_radio_close: Final disconnect
> > > > ==================================================================
> > > > BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
> > > > Read of size 4 at addr ffff8881caba1068 by task v4l_id/1913
>
> <snip>
>
> > > Add the release callback for usbvision video device and use it to release
> > > resources when the last reference to the device goes away.
> >
> > Would you be able to submit this with a commit message and your
> > Signed-off-by line ?
>
> ---8<---
> Subject: [PATCH] media: usbvision: add the release callback for video device
> From: Hillf Danton <hdanton@sina.com>
>
> To fix the UAF syzbot reported,
>
> BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
>
> a release cb which is a simple wrapper of usbvision_release() is added
> for releasing resources as the last reference to the usbvision video
> device goes away.
>
> Reported-by: syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>
> Fixes: 2aa689dd8057 ("[media] usbvision: embed video_device")
> Cc: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Hillf Danton <hdanton@sina.com>
> ---
>
> --- a/drivers/media/usb/usbvision/usbvision-video.c
> +++ b/drivers/media/usb/usbvision/usbvision-video.c
> @@ -401,7 +401,6 @@ static int usbvision_v4l2_close(struct f
>
>         if (r) {
>                 printk(KERN_INFO "%s: Final disconnect\n", __func__);
> -               usbvision_release(usbvision);
>                 return 0;
>         }
>
> @@ -409,6 +408,11 @@ static int usbvision_v4l2_close(struct f
>         return v4l2_fh_release(file);
>  }
>
> +static void usbvision_video_device_release(struct video_device *vdev)
> +{
> +       struct usb_usbvision *usbvision = video_get_drvdata(vdev);
> +       usbvision_release(usbvision);
> +}
>
>  /*
>   * usbvision_ioctl()
> @@ -1181,7 +1185,7 @@ static struct video_device usbvision_vid
>         .fops           = &usbvision_fops,
>         .ioctl_ops      = &usbvision_ioctl_ops,
>         .name           = "usbvision-video",
> -       .release        = video_device_release_empty,
> +       .release        = usbvision_video_device_release,
>         .tvnorms        = USBVISION_NORMS,
>  };
>
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -206,7 +206,10 @@ static void v4l2_device_release(struct d
>         }
>  #endif
>
> -       /* Do not call v4l2_device_put if there is no release callback set.
> +       /*
> +        * Decrease v4l2_device refcount
> +        *
> +        * Do not call v4l2_device_put if there is no release callback set.
>          * Drivers that have no v4l2_device release callback might free the
>          * v4l2_dev instance in the video_device release callback below, so we
>          * must perform this check here.
> @@ -214,16 +217,12 @@ static void v4l2_device_release(struct d
>          * TODO: In the long run all drivers that use v4l2_device should use the
>          * v4l2_device release callback. This check will then be unnecessary.
>          */
> -       if (v4l2_dev->release == NULL)
> -               v4l2_dev = NULL;
> +       if (v4l2_dev->release)
> +               v4l2_device_put(v4l2_dev);
>
>         /* Release video_device and perform other
>            cleanups as needed. */
>         vdev->release(vdev);
> -
> -       /* Decrease v4l2_device refcount */
> -       if (v4l2_dev)
> -               v4l2_device_put(v4l2_dev);
>  }
>
>  static struct class video_class = {
> --

#syz test: https://github.com/google/kasan.git ae179410

--000000000000e671c4059ce2127a
Content-Type: application/x-patch; name="usbvision.patch"
Content-Disposition: attachment; filename="usbvision.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k5s5l7xp0>
X-Attachment-Id: f_k5s5l7xp0

U3ViamVjdDogW1BBVENIXSBtZWRpYTogdXNidmlzaW9uOiBhZGQgdGhlIHJlbGVhc2UgY2FsbGJh
Y2sgZm9yIHZpZGVvIGRldmljZQpGcm9tOiBIaWxsZiBEYW50b24gPGhkYW50b25Ac2luYS5jb20+
CgpUbyBmaXggdGhlIFVBRiBzeXpib3QgcmVwb3J0ZWQsCgpCVUc6IEtBU0FOOiB1c2UtYWZ0ZXIt
ZnJlZSBpbiB2NGwyX3JlbGVhc2UrMHgyZjEvMHgzOTAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
djRsMi1kZXYuYzo0NTkKCmEgcmVsZWFzZSBjYiB3aGljaCBpcyBhIHNpbXBsZSB3cmFwcGVyIG9m
IHVzYnZpc2lvbl9yZWxlYXNlKCkgaXMgYWRkZWQKZm9yIHJlbGVhc2luZyByZXNvdXJjZXMgYXMg
dGhlIGxhc3QgcmVmZXJlbmNlIHRvIHRoZSB1c2J2aXNpb24gdmlkZW8KZGV2aWNlIGdvZXMgYXdh
eS4KClJlcG9ydGVkLWJ5OiBzeXpib3QgPHN5emJvdCs3NTI4N2Y3NWUyZmVkZDY5ZDY4MEBzeXpr
YWxsZXIuYXBwc3BvdG1haWwuY29tPgpGaXhlczogMmFhNjg5ZGQ4MDU3ICgiW21lZGlhXSB1c2J2
aXNpb246IGVtYmVkIHZpZGVvX2RldmljZSIpCkNjOiBIYW5zIFZlcmt1aWwgPGhhbnMudmVya3Vp
bEBjaXNjby5jb20+ClNpZ25lZC1vZmYtYnk6IEhpbGxmIERhbnRvbiA8aGRhbnRvbkBzaW5hLmNv
bT4KLS0tCgotLS0gYS9kcml2ZXJzL21lZGlhL3VzYi91c2J2aXNpb24vdXNidmlzaW9uLXZpZGVv
LmMKKysrIGIvZHJpdmVycy9tZWRpYS91c2IvdXNidmlzaW9uL3VzYnZpc2lvbi12aWRlby5jCkBA
IC00MDEsNyArNDAxLDYgQEAgc3RhdGljIGludCB1c2J2aXNpb25fdjRsMl9jbG9zZShzdHJ1Y3Qg
ZgogCiAJaWYgKHIpIHsKIAkJcHJpbnRrKEtFUk5fSU5GTyAiJXM6IEZpbmFsIGRpc2Nvbm5lY3Rc
biIsIF9fZnVuY19fKTsKLQkJdXNidmlzaW9uX3JlbGVhc2UodXNidmlzaW9uKTsKIAkJcmV0dXJu
IDA7CiAJfQogCkBAIC00MDksNiArNDA4LDExIEBAIHN0YXRpYyBpbnQgdXNidmlzaW9uX3Y0bDJf
Y2xvc2Uoc3RydWN0IGYKIAlyZXR1cm4gdjRsMl9maF9yZWxlYXNlKGZpbGUpOwogfQogCitzdGF0
aWMgdm9pZCB1c2J2aXNpb25fdmlkZW9fZGV2aWNlX3JlbGVhc2Uoc3RydWN0IHZpZGVvX2Rldmlj
ZSAqdmRldikKK3sKKwlzdHJ1Y3QgdXNiX3VzYnZpc2lvbiAqdXNidmlzaW9uID0gdmlkZW9fZ2V0
X2RydmRhdGEodmRldik7CisJdXNidmlzaW9uX3JlbGVhc2UodXNidmlzaW9uKTsKK30KIAogLyoK
ICAqIHVzYnZpc2lvbl9pb2N0bCgpCkBAIC0xMTgxLDcgKzExODUsNyBAQCBzdGF0aWMgc3RydWN0
IHZpZGVvX2RldmljZSB1c2J2aXNpb25fdmlkCiAJLmZvcHMJCT0gJnVzYnZpc2lvbl9mb3BzLAog
CS5pb2N0bF9vcHMJPSAmdXNidmlzaW9uX2lvY3RsX29wcywKIAkubmFtZSAgICAgICAgICAgPSAi
dXNidmlzaW9uLXZpZGVvIiwKLQkucmVsZWFzZQk9IHZpZGVvX2RldmljZV9yZWxlYXNlX2VtcHR5
LAorCS5yZWxlYXNlCT0gdXNidmlzaW9uX3ZpZGVvX2RldmljZV9yZWxlYXNlLAogCS50dm5vcm1z
ICAgICAgICA9IFVTQlZJU0lPTl9OT1JNUywKIH07CiAKLS0tIGEvZHJpdmVycy9tZWRpYS92NGwy
LWNvcmUvdjRsMi1kZXYuYworKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWRldi5j
CkBAIC0yMDYsNyArMjA2LDEwIEBAIHN0YXRpYyB2b2lkIHY0bDJfZGV2aWNlX3JlbGVhc2Uoc3Ry
dWN0IGQKIAl9CiAjZW5kaWYKIAotCS8qIERvIG5vdCBjYWxsIHY0bDJfZGV2aWNlX3B1dCBpZiB0
aGVyZSBpcyBubyByZWxlYXNlIGNhbGxiYWNrIHNldC4KKwkvKgorCSAqIERlY3JlYXNlIHY0bDJf
ZGV2aWNlIHJlZmNvdW50CisJICoKKwkgKiBEbyBub3QgY2FsbCB2NGwyX2RldmljZV9wdXQgaWYg
dGhlcmUgaXMgbm8gcmVsZWFzZSBjYWxsYmFjayBzZXQuCiAJICogRHJpdmVycyB0aGF0IGhhdmUg
bm8gdjRsMl9kZXZpY2UgcmVsZWFzZSBjYWxsYmFjayBtaWdodCBmcmVlIHRoZQogCSAqIHY0bDJf
ZGV2IGluc3RhbmNlIGluIHRoZSB2aWRlb19kZXZpY2UgcmVsZWFzZSBjYWxsYmFjayBiZWxvdywg
c28gd2UKIAkgKiBtdXN0IHBlcmZvcm0gdGhpcyBjaGVjayBoZXJlLgpAQCAtMjE0LDE2ICsyMTcs
MTIgQEAgc3RhdGljIHZvaWQgdjRsMl9kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgZAogCSAqIFRPRE86
IEluIHRoZSBsb25nIHJ1biBhbGwgZHJpdmVycyB0aGF0IHVzZSB2NGwyX2RldmljZSBzaG91bGQg
dXNlIHRoZQogCSAqIHY0bDJfZGV2aWNlIHJlbGVhc2UgY2FsbGJhY2suIFRoaXMgY2hlY2sgd2ls
bCB0aGVuIGJlIHVubmVjZXNzYXJ5LgogCSAqLwotCWlmICh2NGwyX2Rldi0+cmVsZWFzZSA9PSBO
VUxMKQotCQl2NGwyX2RldiA9IE5VTEw7CisJaWYgKHY0bDJfZGV2LT5yZWxlYXNlKQorCQl2NGwy
X2RldmljZV9wdXQodjRsMl9kZXYpOwogCiAJLyogUmVsZWFzZSB2aWRlb19kZXZpY2UgYW5kIHBl
cmZvcm0gb3RoZXIKIAkgICBjbGVhbnVwcyBhcyBuZWVkZWQuICovCiAJdmRldi0+cmVsZWFzZSh2
ZGV2KTsKLQotCS8qIERlY3JlYXNlIHY0bDJfZGV2aWNlIHJlZmNvdW50ICovCi0JaWYgKHY0bDJf
ZGV2KQotCQl2NGwyX2RldmljZV9wdXQodjRsMl9kZXYpOwogfQogCiBzdGF0aWMgc3RydWN0IGNs
YXNzIHZpZGVvX2NsYXNzID0gewo=
--000000000000e671c4059ce2127a--
