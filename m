Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD63575037
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 16:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240358AbiGNOBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 10:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240362AbiGNOB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 10:01:29 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5B91133
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 07:00:38 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id y3so1459899qtv.5
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=m+jHR4sAE1y5Y091lWoLeObD154WtwTbrqEn/d1LhU0=;
        b=34x+fsqE8TN+RKp8LjQOl9Pp+ckJFM+xnFISAplSV33xwdmgDA/cgdFRXfbxxoYo8h
         74MH1CMXOMMFGCqqHpW4Qgj/s3zElzpaBycP7mN4widvdIrLsCFw+vVuDv99e1/JUPMg
         Bd02Vxbvu6xGDRrj1Alhzsm6AjF0+yJnXuRS5Df02u7RwJ73VO7g7Dteilj2jf7WvUYj
         LGZ0MnyXf6etlXKoGUzWanE3TbA07kcc9U0Fu/11u/uNb9G59FoQlKa5Cfa9/uFIPC7J
         V6Tn1VRi3k8ILZZx4xuIsYbhPj7e3gAYaMOGTx9LJWxqzA5YCpp8IZ6i8TsefvcwPamW
         2QQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=m+jHR4sAE1y5Y091lWoLeObD154WtwTbrqEn/d1LhU0=;
        b=GsaTmLfrf8AT7cMHaML6mVbIH43AjREBFUVAXAoLKhMmlhluFPCZmSTM7DbLzSpJ12
         5Q5sKhNl56wZNKAvzDjf1nD/JFdBweXLut6EmLuWhKJ878T5d7TXzeNpq2/5t9MwalTw
         grpEvsbr3i8MZRpN+B9KvbRdLJCdfFbcL70TMykoZ4kFzES4aTPAyQAifWzDZQiRHQKy
         rPdG18z8xOn34fC7SgLxXqZOjsOjpyd7GxY9CkmrJfbliPTMHUvBC5mI9pTsSawj7Fwg
         j7HazM2QOHVzPZcR4z6ZZyStQkc5x3S8LkHfjMpJ8wCFj/0x9ZKetbW9ogQfC8DqT+o7
         0W+A==
X-Gm-Message-State: AJIora+vnY/lX+u+ZjXWduphEKeGV/jo3uivCJsOJOgzg7xIykmPYUiz
        dlTppY1O7gWcBh1bvzXvIgjKyg==
X-Google-Smtp-Source: AGRyM1sDT9SrgkOD7+g2N4ukGgBHdWmc9r9++ifMXTWJ7m/V961HEKBCoYl+s8EAL51I60FQckQvVQ==
X-Received: by 2002:ac8:5f0e:0:b0:31e:d2d1:2d23 with SMTP id x14-20020ac85f0e000000b0031ed2d12d23mr2102979qta.620.1657807236491;
        Thu, 14 Jul 2022 07:00:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id s27-20020a05622a1a9b00b0031d3996d304sm1631668qtc.17.2022.07.14.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 07:00:35 -0700 (PDT)
Message-ID: <3b2ab95e03171e6e5e14242b4f553b1530dabcb1.camel@ndufresne.ca>
Subject: Re: The problem of VP9 decoder adapter V4L2.
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "nanxin.qin@amlogic.com" <nanxin.qin@amlogic.com>,
        "xiaohang.cui" <xiaohang.cui@amlogic.com>,
        arch-proaudio <arch-proaudio@lists.archlinux.org>
Cc:     "hui.zhang" <hui.zhang@amlogic.com>,
        "zhi.zhou" <zhi.zhou@amlogic.com>,
        linux-media <linux-media@vger.kernel.org>
Date:   Thu, 14 Jul 2022 10:00:33 -0400
In-Reply-To: <40f89567-9221-ffc8-1425-ef9d0aac50e7@xs4all.nl>
References: <2022052415253222043142@amlogic.com>
         <2022052416125814193863@amlogic.com> <2022052515525877798112@amlogic.com>
         <CAFixvNP+f1LPCx32nhbiK_T_Hfyrqc39u-UVBR3T6MuLb=GDmQ@mail.gmail.com>
         <2022052516504276013416@amlogic.com> <2022060216264643796616@amlogic.com>
         <202207141532283153508@amlogic.com>
         <8d61af39-9cd5-3e03-6b22-3e77625b81b6@xs4all.nl>
         <2022071418182653336122@amlogic.com>
         <40f89567-9221-ffc8-1425-ef9d0aac50e7@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

here's some note of the discussion we had on IRC. First thing to mention, t=
his
is a none-issue for stateless decoders, since the special frame with
show_existing_frame flag set are just never sent to the kernel in that case=
.
This only affect stateful decoders (which not much design time was put in
really).

The show_existing_frame flag have two uses cases. The most common one is fo=
r
video playback, it is used to simulate B-Frame (future references). In the =
case,
the frames is first decoded, but not outputed. It is part of the same tempo=
ral
unit (super frame) as another frame. This frame will use a VB2 buffer, but =
it
won't be displayed. In that case, it will only be displayed later once, wit=
h
show_existing_frame, and for that, you can just delay the buffer_done marki=
ng.

The problematic case would be for still picture handling (video with repeat=
ed
images and no noise). In this case, the same frames is being displayed over=
 and
over. You could use this while encoding slide deck. There is currently no z=
ero-
copy mechanism in place to allow this in VB2 design. I've made a suggestion=
 to
Hans (which I doubt will be adopted), so I will leave that there for now.

regards,
Nicolas

Le jeudi 14 juillet 2022 =C3=A0 13:03 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
>=20
> On 7/14/22 12:18, nanxin.qin@amlogic.com wrote:
> > Hi, Hans=C2=A0
> > thanks for your reply. Currently, our source code has not been submitte=
d to
> > the kernel tree, so you might didn't got them.=C2=A0
> >=20
> > /drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c/
> > /=C2=A0/
> > /Or at least, it does a memcpy to the new buffer and it has some buffer
> > refcounting,/
> > /although I didn't go deep into the details. In any case, this might he=
lp./
> > /
> > /
> > =C2=A0 =C2=A0 if (frm_to_show->fb !=3D inst->cur_fb) {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This frame is show exist frame and no de=
code output
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* copy frame data from frm_to_show to=
 current CAPTURE
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* buffer
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((frm_to_show->fb !=3D NULL) &&
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (inst->cur_fb->base_y.size >=
=3D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frm_to_show->fb->base_y.size)=
 &&
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (inst->cur_fb->base_c.size >=
=3D
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frm_to_show->fb->base_c.size)=
) {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy((void *)inst->cur_fb->=
base_y.va,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void *)frm_to_=
show->fb->base_y.va,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frm_to_show->fb=
->base_y.size);
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy((void *)inst->cur_fb->=
base_c.va,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void *)frm_to_=
show->fb->base_c.va,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frm_to_show->fb=
->base_c.size);
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > You should be talking about this code,=C2=A0If the picture buffer is se=
cure and
> > protected, this memory may be prohibited memcpy, so what should we do?=
=C2=A0
>=20
> Yeah, that won't work for protected memory. But if it is in protected mem=
ory,
> doesn't that mean that you are using dmabuf for the actual buffer?

Please note that older (stateful) Mediatek drivers will are unlikely to gai=
n
secure memory (this is old HW). But if they do, Mediatek have a firmware ru=
nning
on a pretty generic co-processor that sits ont the secure side. They could
simply add a function in the firmware to solve this problem.

On the secure note, be aware that another challenge exist with the handling=
 the
the probability context updates. I notice that, similar to most stateless
decoders, Amlogic HW requires the driver to do the update. The probability
tabled filled during decode will inevitably have to be protected. You need =
a
special firmware feature to copy this table back and fort to allow the
probability updates. Or have that update happen forward (a bit like the VP9
stateless uAPI), but executed in secure space with compressed header being
parsed there* (firmware, OPT-TEE, ...).

* in Widevine L1, there is a small design error regarding VP9 and compresse=
d
headers are encrypted

>=20
> We don't have any codec drivers that work with protected memory in the ke=
rnel,
> but the only way to support that would be through dmabuf.
>=20
> Question: does VP9 indicate that a buffer will be repeated when you recei=
ve
> the first buffer of that sequence? I.e., do you know when you dequeue the
> first buffer that it will be repeated? Or do you only discover that
> afterwards?
>=20
> I'm also assuming that you are talking about a stateful codec driver, not=
 a
> stateless codec driver, correct?
>=20
> Regards,
>=20
> 	Hans
>=20
> > Our idea is to dque this buffer to user space multiple times through th=
e videobuf2 framework.
> > But v4l2 does not support this behavior, if the buffer is not returned =
to the driver, it will be output again.
> >=20
> > -----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------
> > nanxin.qin@amlogic.com
> >=20
> >     =C2=A0
> >     *From:*=C2=A0Hans Verkuil <mailto:hverkuil-cisco@xs4all.nl>
> >     *Date:*=C2=A02022-07-14=C2=A015:59
> >     *To:*=C2=A0nanxin.qin@amlogic.com <mailto:nanxin.qin@amlogic.com>; =
xiaohang.cui <mailto:xiaohang.cui@amlogic.com>; arch-proaudio <mailto:arch-=
proaudio@lists.archlinux.org>
> >     *CC:*=C2=A0hui.zhang <mailto:hui.zhang@amlogic.com>; zhi.zhou <mail=
to:zhi.zhou@amlogic.com>
> >     *Subject:*=C2=A0Re: The problem of VP9 decoder adapter V4L2.
> >     [ EXTERNAL EMAIL ]
> >     =C2=A0
> >     Hmm, it looks I missed the earlier email.
> >     =C2=A0
> >     In any case, please post this to the linux-media@vger.kernel.org ma=
ilinglist.
> >     =C2=A0
> >     Please mention which driver you are using, is it drivers/staging/me=
dia/meson/vdec?
> >     =C2=A0
> >     If so, then clearly mention this in the subject line.
> >     =C2=A0
> >     If it is an out-of-tree driver, then also mention that, ideally wit=
h a link to the code.
> >     =C2=A0
> >     By posting to the mailinglist you'll reach the real experts on code=
cs.
> >     =C2=A0
> >     Based on a quick look at the meson driver it looks like it does not=
 support this
> >     feature. It can detect it, but it doesn't appear to do anything wit=
h that
> >     information. But the mediatek decoder appears to handle this situat=
ion properly:
> >     =C2=A0
> >     drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> >     =C2=A0
> >     Or at least, it does a memcpy to the new buffer and it has some buf=
fer refcounting,
> >     although I didn't go deep into the details. In any case, this might=
 help.
> >     =C2=A0
> >     Regards,
> >     =C2=A0
> >     Hans
> >     =C2=A0
> >     On 7/14/22 09:32, nanxin.qin@amlogic.com wrote:
> >     > Hi, Hans
> >     >
> >     > I'm sorry to bother you again. Do you have any good suggestions f=
or
> > this problem? The VP9 spec development team suggested a change to the V=
4L2
> > API to allow the vb2 can be deque more times, which seemed difficult.
> >     >
> >     >
> >     -------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------
> >     > nanxin.qin@amlogic.com
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 *From:*=C2=A0xiaohang.cui@amlogic.com <ma=
ilto:xiaohang.cui@amlogic.com>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 *Date:*=C2=A02022-06-02=C2=A016:26
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 *To:*=C2=A0arch-proaudio <mailto:arch-pro=
audio@lists.archlinux.org>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 *CC:*=C2=A0hverkuil-cisco@xs4all.nl <mail=
to:hverkuil-cisco@xs4all.nl>; hui.zhang <mailto:hui.zhang@amlogic.com>; Nan=
xin=C2=A0Qin <mailto:Nanxin.Qin@amlogic.com>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 *Subject:*=C2=A0Re: Re: The problem of VP=
9 decoder adapter V4L2.
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 Dear linux.org multi-media team,
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 I am a multimedia software engineer from =
AmLogic. We have
> > encountered some=C2=A0decoder=C2=A0problems=C2=A0on V4L2=C2=A0when supp=
orting VP9.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 Reading the VP9 specification, show_exist=
ing_frame is a feature
> > added in intra-only to solve the problem of video conferencing. If
> > show_existing_frame is equal to 1, the decoder outputs the previously
> > decoded frame. This part is explained in the specification output proce=
ss.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 At present, we need to implement VP9 deco=
der based on V4L2. All
> > decoded frames need to be passed to userspace using VB2 buffer. If
> > show_existing_frame exists, the same frame may be output multiple times=
. If
> > VB2 buffer was dequed to userspace by APP, and no queue into the videob=
uf2
> > driver, then the VP9 decoder driver will fail to output the frame again
> > because the VB2 buffer has not returned to the driver, In other words t=
he
> > buffer's owner is APP not decode driver. So the decoder cannot pass the
> > frame from the VB2 buffer again.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 According to the above analysis, the show=
_existing_frame feature
> > seems to conflict with the V4L2 Videobuf2 framework because V4L2 does n=
ot
> > allow the same VB2 buffer to be output more than once.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 I would like to ask, for VP9 decoder adap=
tation on V4L2, how to
> > should deal with the problem of repeated output frame?
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 I'm looking forward to receiving your rep=
ly. Thank you very much.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 Attachment is the coded stream for refere=
nce
> > (big_buck_bunny_720p.mp4).
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0
> >     -------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 =E5=B4=94=E6=99=93=E8=A1=8C
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 SW=C2=A0=C2=A0Department
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 Amlogic=C2=A0Inc.=C2=A0Shenzhen=C2=A0offi=
ce
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 -----------------------------------------=
--------------------
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 =E6=B7=B1=E5=9C=B3=E5=B8=82=E5=8D=97=E5=
=B1=B1=E5=8C=BA=E7=A7=91=E6=8A=80=E5=8D=97=E5=9B=9B=E9=81=938=E5=8F=B7=E5=
=88=9B=E7=BB=B4=E5=8D=8A=E5=AF=BC=E4=BD=93=E8=AE=BE=E8=AE=A1=E5=A4=A7=E5=8E=
=A6=E4=B8=9C=E5=BA=A79-10=E5=B1=82
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0 Tel:=C2=A00755-86315800-8169
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *From:*=C2=A0nanx=
in.qin@amlogic.com <mailto:nanxin.qin@amlogic.com>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *Date:*=C2=A02022=
-05-25=C2=A016:50
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *To:*=C2=A0peter.=
derivaz <mailto:peter.derivaz@gmail.com>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *CC:*=C2=A0agrang=
e <mailto:agrange@google.com>; tinghai.chen <mailto:tinghai.chen@amlogic.co=
m>; hui.zhang <mailto:hui.zhang@amlogic.com>; xiaohang.cui <mailto:xiaohang=
.cui@amlogic.com>; yixin.peng <mailto:yixin.peng@amlogic.com>; Gan Zhang <m=
ailto:Gan.Zhang@amlogic.com>; kuan.hu <mailto:Kuan.Hu@amlogic.com>; miaohon=
g.chen <mailto:miaohong.chen@amlogic.com>; lele.xiang <mailto:lele.xiang@am=
logic.com>; Shihong.Zheng <mailto:shihong.zheng@amlogic.com>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *Subject:*=C2=A0R=
e: Re: The problem of VP9 decoder adapter V4L2.
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hi, Peter
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for your r=
eply, we will try to feedback this problem with Linux, we plan to implement=
 the second solution according to your proposal, which may be more convenie=
nt for us to implement, thanks again.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> >     -------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nanxin.qin
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SW=C2=A0=C2=A0Dep=
artment____
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Amlogic=C2=A0Inc.=
=C2=A0Shenzhen=C2=A0office____
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -----------------=
--------------------------------------------____
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E6=B7=B1=E5=9C=
=B3=E5=B8=82=E5=8D=97=E5=B1=B1=E5=8C=BA=E7=A7=91=E6=8A=80=E5=8D=97=E5=9B=9B=
=E9=81=938=E5=8F=B7=E5=88=9B=E7=BB=B4=E5=8D=8A=E5=AF=BC=E4=BD=93=E8=AE=BE=
=E8=AE=A1=E5=A4=A7=E5=8E=A6=E4=B8=9C=E5=BA=A79-10=E5=B1=82____
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tel:=C2=A00755-86=
315800-8169
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *From:*=C2=A0Peter de Rivaz <mailto:peter.derivaz@gmail.com>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *Date:*=C2=A02022-05-25=C2=A016:33
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *To:*=C2=A0nanxin.qin@amlogic.com <mailto:nanxin.qin@amlogic.com>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *CC:*=C2=A0agrange <mailto:agrange@google.com>; tinghai.chen <mailto=
:tinghai.chen@amlogic.com>; hui.zhang <mailto:hui.zhang@amlogic.com>; xiaoh=
ang.cui <mailto:xiaohang.cui@amlogic.com>; yixin.peng <mailto:yixin.peng@am=
logic.com>; Zhang <mailto:Gan.Zhang@amlogic.com>; kuan.hu <mailto:Kuan.Hu@a=
mlogic.com>; miaohong.chen <mailto:miaohong.chen@amlogic.com>; lele.xiang <=
mailto:lele.xiang@amlogic.com>; Shihong.Zheng <mailto:shihong.zheng@amlogic=
.com>
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *Subject:*=C2=A0Re: The problem of VP9 decoder adapter V4L2.
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 **[ EXTERNAL EMAIL ]**
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> >     -------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 I can see two choices:
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1)
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 You could change the V4L2 API to allow the buffer to be returned mul=
tiple times (this would involve discussion on the Linux mailing lists as it=
 is not something within our control).
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 2)
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 You could treat the frame with show_existing_frame=3D1 as a normal f=
rame with zero motion vectors and no residual.
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 In other words, you just copy the reference frame data from the fram=
e indicated by=C2=A0frame_to_show_map_idx into a new frame and return it.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Option 1 would be a bit more efficient, but option 2 is probably sim=
pler to implement.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Peter de Rivaz
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 On Wed, May 25, 2022 at 8:55 AM nanxin.qin@amlogic.com <mailto:nanxi=
n.qin@amlogic.com> <nanxin.qin@amlogic.com <mailto:nanxin.qin@amlogic.com>>=
 wrote:
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Dear:
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 agrange,=C2=A0peter.=
derivaz
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am a multimedia so=
ftware engineer from AmLogic. We have encountered some problems when suppor=
ting VP9 decoder + V4L2.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading the VP9 spec=
ification, show_existing_frame
> > is a feature added in intra-only to solve the problem of video conferen=
cing.
> > If show_existing_frame is equal to 1, the decoder outputs the previousl=
y
> > decoded frame. This part is explained in the specification output proce=
ss.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 At present, we need =
to implement VP9 decoder based
> > on V4L2. All decoded frames need to be passed to userspace using VB2 bu=
ffer.
> > If show_existing_frame exists, the same frame may be output multiple ti=
mes.
> > If VB2 buffer was dequed to userspace by APP, and no queue into the
> > videobuf2 driver, then the VP9 decoder driver will fail to output the f=
rame
> > again because the VB2 buffer has not returned to the driver, In other w=
ords
> > the buffer's onwer is APP not decode driver. So the decoder cannot pass=
 the
> > frame from the VB2 buffer again.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 According to the abo=
ve analysis, the
> > show_existing_frame feature seems to conflict with the V4L2 Videobuf2
> > framework because V4L2 does not allow the same VB2 buffer to be output =
more
> > than once.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I would like to ask,=
 for VP9 decoder adaptation
> > V4L2 should be how to deal with the problem of repeated output frame?
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thank you very much =
for your reply.
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Attached is the code=
 stream for reference
> > (big_buck_bunny_720p.mp4).
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
> >     -------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 nanxin.qin
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 SW=C2=A0=C2=A0Department____
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Amlogic=C2=A0Inc.=C2=A0Shenzhen=C2=A0office____
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -------------------------------------------------------------____
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =E6=B7=B1=E5=9C=B3=E5=B8=82=E5=8D=97=E5=B1=B1=E5=8C=BA=E7=A7=91=E6=8A=
=80=E5=8D=97=E5=9B=9B=E9=81=938=E5=8F=B7=E5=88=9B=E7=BB=B4=E5=8D=8A=E5=AF=
=BC=E4=BD=93=E8=AE=BE=E8=AE=A1=E5=A4=A7=E5=8E=A6=E4=B8=9C=E5=BA=A79-10=E5=
=B1=82____
> >     >
> >     >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Tel:=C2=A00755-86315800-8169
> >     >
> >     =C2=A0
> >=20

