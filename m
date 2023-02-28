Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A13126A5FC0
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 20:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjB1Tgf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 14:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjB1Tgd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 14:36:33 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01CC271C
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 11:36:24 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id c3so7569197qtc.8
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 11:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WVI54ty1dVB2FShThWqr5QDeMD0Drsni5MzTQ5/3ohk=;
        b=DaesGovpBmy7zYmtJlMYKsGKoevofybApEkGvqtubTpWGdQ87UP+zQs3rueeveMupT
         whIVteRVIzBKR/hP/RkyWmCaxRkJfRJWVPhjw/K0su1JrA7R4sOUacmqJyddiA1uu2Kn
         UCm89k8GkssZ4OT0yCKRdZVzuDxVReNl8zOfs0ZM+sNebzyMVxrHwbHIo/cU5E3kvO60
         hDJfroyrLh2sQYnrl13fHRpB7niIukYxFFZxEBOzgjuoT4rmFggqyHW3Rd/iHLX5IGtW
         BxuDOb+KrosCe00/OcMiIUtmvEpgb987jFZ4f82YxYmL1XjLGupRYvnSmkSWI7vgHK+V
         f4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVI54ty1dVB2FShThWqr5QDeMD0Drsni5MzTQ5/3ohk=;
        b=HQAmbVuwdm9IwEcs1pkk9d19iBz/9ldMIXBZLu887SXOwMIOnmi79cKJnO1PZJRZAn
         MSmoPybE06iB03l1aHXYI6ByrMSNcnU4SZ5hNPpKp7CnYNT2WwRlp/1973YZX1hqtmwE
         WrBr/eAzWlWseTPSu3EeGcGNit453M8UVvbYOB8fbHiMkJe8iE6AdACOQK+pSY+GyuSh
         0TybVe24kFw1skrsUkNLVroy1nbueqqU8BQwrkM6+BLVzirHcDP4lb9Zz8h3eoUIQLYB
         4Lo+zr+zw1G0pOGe5HwbPPVzCVg5hwX+LmPDdpCBHXp3dEpfybX3SbdK6XfpIshkp6S8
         wLOg==
X-Gm-Message-State: AO0yUKV+vl9EScaRtUZYZopDoG3+6+iNE94ycKh+Xj6nHPguUVmGhzu7
        eao/MpjzWtqFDMMAO1jvBr4neg==
X-Google-Smtp-Source: AK7set/AIEbMVcaBMMSneJTnmFn+q5vuvBjDYbtG5RjYMWWDdXcKj15LiX7/Mz79/uNImRW7aXY+3w==
X-Received: by 2002:ac8:5bc4:0:b0:3bf:d4dc:7058 with SMTP id b4-20020ac85bc4000000b003bfd4dc7058mr7124047qtb.11.1677612983768;
        Tue, 28 Feb 2023 11:36:23 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id o134-20020a37418c000000b007429ee9482dsm5299108qka.134.2023.02.28.11.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:36:23 -0800 (PST)
Message-ID: <33e75f6710da0c6bc281265f3c85f2334eccb4f4.camel@ndufresne.ca>
Subject: Re: [RFC] Remove support for the video overlay interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Date:   Tue, 28 Feb 2023 14:36:21 -0500
In-Reply-To: <5f1ff21e-557d-0d80-293b-2ecccb9d5e2a@xs4all.nl>
References: <5f1ff21e-557d-0d80-293b-2ecccb9d5e2a@xs4all.nl>
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

Le mardi 28 f=C3=A9vrier 2023 =C3=A0 17:52 +0100, Hans Verkuil a =C3=A9crit=
=C2=A0:
> While working on the vb2 conversion of the saa7146 driver I dug a bit dee=
per into
> the video capture overlay support of that driver.
>=20
> For more info of that feature see:
>=20
> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-over=
lay.html
>=20
> Specifically, video overlay support relies on userspace passing the addre=
ss of
> the framebuffer to the driver with VIDIOC_S_FBUF. The PCI driver can then=
 DMA
> the captured frame straight into the framebuffer. This was useful 20 year=
s ago,
> but today not so much.
>=20
> Typically userspace would get the address from the /dev/fbX device using =
the
> FBIOGET_FSCREENINFO ioctl.
>=20
> But drm_fb_helper.c sets the smem_start field explicitly to 0 unless:
>=20
> 1) CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is set, and
> 2) CONFIG_EXPERT is set, and
> 3) set the drm_kms_helper module parameter drm_leak_fbdev_smem to 1.
>=20
> Actually, even with all that set, I *still* get a 0 value. I probably
> missed something.
>=20
> In any case, I think destructive overlay support is effectively dead and =
it
> should be removed from the v4l2 drivers.
>=20
> This would affect saa7146, bttv, saa7134 and vivid.
>=20
> Output overlay support is still around (ivtv, omap_vout). There is also a
> single driver with a non-destructive capture overlay:
> drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
>=20
> No idea what that's doing exactly in the bcm2835 driver.

On the Pi, the firmware implements arbitrary number of graphic layers. It w=
ill
start rendering the camera on a layer on top. It is non-destructive, but on
newer code base, using libcamera, they replaced that with a QT popup window=
. So
maybe they also consider this as their legacy.

Note this is CAPTURE overlay, they don't do OUTPUT overlay in any drivers t=
here.

>=20
> Removing support for this has some nice related benefits: the overlay
> window supports clipping (either a list of rectangles or a bitmap), and
> that would also disappear. That makes the compat32 code quite a bit easie=
r.
> A fair amount of code is dedicated to that.
>=20
> So, I propose to drop destructive overlay support from saa7146, bttv and
> saa7134 and vivid for the 6.4 kernel. In addition, support for
> V4L2_FBUF_CAP_LIST_CLIPPING and V4L2_FBUF_CAP_BITMAP_CLIPPING is also
> dropped. This only affects the vivid driver which is the only driver that
> supports this for output overlays.
>=20
> Any objections?
>=20
> Regards,
>=20
> 	Hans

