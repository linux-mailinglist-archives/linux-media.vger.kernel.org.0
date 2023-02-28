Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25C86A5FD6
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 20:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjB1TkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 14:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjB1TkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 14:40:15 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C443822DCB
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 11:39:55 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id op8so7665158qvb.11
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bXALE3SnpRT6Y82pT0EBZWO3LsVKthOmf7B/HRq+aXA=;
        b=oC3+t49d7j61ZX3U6Kwg6127bmHoLe7dUB4N1w3CadgRbuL98wcOtFP+YBvy1uKUze
         0ogN+fdJAa8fWws6BH2RWjeXsx/gbjhLPjjZbwuxCK5wOElZAOXsfTPEyzAExp3lgY1l
         ok9P6Wh1BEzSd/Ge+omg7DO6onDAxba8l0lw5gxY4DeIMQpRQVtsMDy9LoQmJYAP5FE+
         OqniJw2Lg0KrGAGh2eVqCX9+0Sym5HxcAH++1gKKextdZcxD3lvPbzbemlz/M+m4NHas
         fhcFimou4FHZ5BYIFtn0ifQOctuR4QTtPdvdPVIPhWkFcPTdvEsyRBNubQnk/idQdtEg
         7/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXALE3SnpRT6Y82pT0EBZWO3LsVKthOmf7B/HRq+aXA=;
        b=QkjboqqqMDsYihIP0iv6uSYKXIWb8bcnNb/pBx6SyOzyE622pqcVaSN6I8ptA24oGi
         bcr3rDupG/sU0YEpaoXBnT6wSv+/zeL292AgAerfALBnTs1LxNt7Fwp08Wpv9sYKn7l8
         uPCwi2/rgTa3Ln7svuFRgFpF3VR5bumFhXcba9Fo1Zd6zw0Xm4+09ehjVH101z4jqORO
         /JOdVC2nW/Ho3c9qevvDGi95dIF5W69LQMpRk6Imdsmp1vYQ9A8KfA6PHF+dYPRRaIO6
         w3Ok7sWjHQSu24afb1kCyz49+U06jyUd0FBoLK50Jzo/kKqo8muEStboxSg3Sr5UYggp
         jBGQ==
X-Gm-Message-State: AO0yUKWYI1dZny3+hDo6tQKHMQqPgbZhJnX0C8tdO10nGUYUsQqIgi6w
        wWeWj0+mBeq0Ta2Yslo30lYj4g==
X-Google-Smtp-Source: AK7set8OMVXB5Jxt2n0WeIO9uLoz1yGz0LJsI3sXsa26dT3PpXwo8NV4Hi0w6y5IUNhFMjAhMkQJIA==
X-Received: by 2002:a05:6214:4111:b0:56e:ba02:1bf4 with SMTP id kc17-20020a056214411100b0056eba021bf4mr6962768qvb.10.1677613194809;
        Tue, 28 Feb 2023 11:39:54 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id q27-20020a05620a025b00b0073b575f3603sm7242805qkn.101.2023.02.28.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:39:54 -0800 (PST)
Message-ID: <b2cad98612cf1812dbe0c1473ca1b8140106110c.camel@ndufresne.ca>
Subject: Re: [RFC] Remove support for the video overlay interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Date:   Tue, 28 Feb 2023 14:39:53 -0500
In-Reply-To: <33e75f6710da0c6bc281265f3c85f2334eccb4f4.camel@ndufresne.ca>
References: <5f1ff21e-557d-0d80-293b-2ecccb9d5e2a@xs4all.nl>
         <33e75f6710da0c6bc281265f3c85f2334eccb4f4.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 28 f=C3=A9vrier 2023 =C3=A0 14:36 -0500, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> Le mardi 28 f=C3=A9vrier 2023 =C3=A0 17:52 +0100, Hans Verkuil a =C3=A9cr=
it=C2=A0:
> > While working on the vb2 conversion of the saa7146 driver I dug a bit d=
eeper into
> > the video capture overlay support of that driver.
> >=20
> > For more info of that feature see:
> >=20
> > https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-ov=
erlay.html
> >=20
> > Specifically, video overlay support relies on userspace passing the add=
ress of
> > the framebuffer to the driver with VIDIOC_S_FBUF. The PCI driver can th=
en DMA
> > the captured frame straight into the framebuffer. This was useful 20 ye=
ars ago,
> > but today not so much.
> >=20
> > Typically userspace would get the address from the /dev/fbX device usin=
g the
> > FBIOGET_FSCREENINFO ioctl.
> >=20
> > But drm_fb_helper.c sets the smem_start field explicitly to 0 unless:
> >=20
> > 1) CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is set, and
> > 2) CONFIG_EXPERT is set, and
> > 3) set the drm_kms_helper module parameter drm_leak_fbdev_smem to 1.
> >=20
> > Actually, even with all that set, I *still* get a 0 value. I probably
> > missed something.
> >=20
> > In any case, I think destructive overlay support is effectively dead an=
d it
> > should be removed from the v4l2 drivers.
> >=20
> > This would affect saa7146, bttv, saa7134 and vivid.
> >=20
> > Output overlay support is still around (ivtv, omap_vout). There is also=
 a
> > single driver with a non-destructive capture overlay:
> > drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> >=20
> > No idea what that's doing exactly in the bcm2835 driver.
>=20
> On the Pi, the firmware implements arbitrary number of graphic layers. It=
 will
> start rendering the camera on a layer on top. It is non-destructive, but =
on
> newer code base, using libcamera, they replaced that with a QT popup wind=
ow. So
> maybe they also consider this as their legacy.

Maybe it will make more sense if I mention that the firmware can encode the
stream and pass it as H.264, while displaying the overlay.

regards,
Nicolas

>=20
> Note this is CAPTURE overlay, they don't do OUTPUT overlay in any drivers=
 there.

>=20
> >=20
> > Removing support for this has some nice related benefits: the overlay
> > window supports clipping (either a list of rectangles or a bitmap), and
> > that would also disappear. That makes the compat32 code quite a bit eas=
ier.
> > A fair amount of code is dedicated to that.
> >=20
> > So, I propose to drop destructive overlay support from saa7146, bttv an=
d
> > saa7134 and vivid for the 6.4 kernel. In addition, support for
> > V4L2_FBUF_CAP_LIST_CLIPPING and V4L2_FBUF_CAP_BITMAP_CLIPPING is also
> > dropped. This only affects the vivid driver which is the only driver th=
at
> > supports this for output overlays.
> >=20
> > Any objections?
> >=20
> > Regards,
> >=20
> > 	Hans
>=20

