Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46F1C54420B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 05:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbiFIDkq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 23:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbiFIDkp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 23:40:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58829262E21
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 20:40:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C38D501;
        Thu,  9 Jun 2022 05:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654746042;
        bh=wWRbcvr6khoTf1/opwCYWgajbLLxi0Zhp5allBFtry0=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=ee1pwoFOMzHbFBwO87lhf1QownkIiqndbyjrHgF2sjiq4/v1hf9LL7vpCV6emLpK4
         e9DlAJJl3+ydMHsrovtYUELECPa2+RKbZrlv+tXFmFVuDK867WF1rlPKv/HUo4hxeo
         jdfQYbW96ffgE9pMJnTlWhd2ytmemx5S9LFuDpnA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yp5lIHTt/NhgHNGm@carbon.lan>
References: <Yp5lIHTt/NhgHNGm@carbon.lan>
Subject: Re: imx492 camera driver on imx8mm
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>,
        linux-media@vger.kernel.org
Date:   Thu, 09 Jun 2022 04:40:39 +0100
Message-ID: <165474603930.316514.12230941117228914111@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Petko Manolov (2022-06-06 21:35:44)
>         Hi guys,
>=20
> I am developing Sony imx492 driver on an imx8mm-based board.  I am obviou=
sly
> missing something important because trying to stream from the sensor (by =
using
> v4l2-ctl) i get: "VIDIOC_REQBUFS returned -1 (Invalid argument)". This do=
esn't

'-1' is -EPERM. Invalid argument would be -22?

If you look at vb2_core_reqbufs(), it can return -EINVAL if the planes
are not set correctly.


> look too bad until one look at dmesg, which goes like:
>=20
> [   66.589320] link-frequencies 0 value 600000000
> [   66.589331] imx492 1-0010: imx492_power_on
> [   66.625823] imx492_detect: detected!
> [   66.625853] mxc_mipi-csi 32e30000.mipi_csi: Registered sensor subdevic=
e: imx492 1-0010
> [   66.668356] imx492_set_ctrl: fmt ctrl->id 9963793
> [  192.742375] mx6s-csi 32e20000.csi1_bridge: csi v4l2 busfreq high reque=
st.
> [  192.742387] imx492_s_power(1):
> [  192.742428] mx6s-csi 32e20000.csi1_bridge: VIDIOC_G_SELECTION not impl=
emented
> [  192.742570] mx6s-csi 32e20000.csi1_bridge: VIDIOC_G_SELECTION not impl=
emented
> [  192.742618] mx6s-csi 32e20000.csi1_bridge: count=3D3, size=3D0

Is this driver (mx6s-csi) in an upstream kernel?

> [  192.742620] size=3D0
>=20
> and then (just the short version):
>=20
> [  192.742714] CPU: 2 PID: 506 Comm: v4l2-ctl Not tainted 5.4.127 #23
> [  192.742716] Hardware name: Variscite VAR-SOM-MX8M-MINI on Symphony-Boa=
rd 1.4a and above (DT)

Is this using mainline drivers? Are there BSP patches? Have you tested
on a mainline kernel (5.18, linux-media master branch?)

> [  192.742719] pstate: 80000005 (Nzcv daif -PAN -UAO)
> [  192.742723] pc : vb2_core_reqbufs+0x134/0x400

Have you deciphered which line this is yet on your build?

> [  192.742726] lr : vb2_core_reqbufs+0xfc/0x400
>=20
> register dump not very important, and then the call trace:

Was this a panic? or output from a WARN_ON?

>=20
> [  192.742778] Call trace:
> [  192.742782]  vb2_core_reqbufs+0x134/0x400
> [  192.742787]  vb2_reqbufs+0x78/0x84
> [  192.742791]  mx6s_vidioc_reqbufs+0x3c/0x70
> [  192.742795]  v4l_reqbufs+0x48/0x60
> [  192.742798]  __video_do_ioctl+0x180/0x3e0
> [  192.742801]  video_usercopy+0x134/0x500
> [  192.742805]  video_ioctl2+0x14/0x20
> [  192.742807]  v4l2_ioctl+0x3c/0x60
> [  192.742813]  do_vfs_ioctl+0x860/0xaf0
> [  192.742816]  ksys_ioctl+0x44/0x8c
> [  192.742819]  __arm64_sys_ioctl+0x1c/0xc0
> [  192.742825]  el0_svc_common.constprop.0+0x68/0x160
> [  192.742828]  el0_svc_handler+0x20/0x80
> [  192.742831]  el0_svc+0x8/0x204
> [  192.742834] ---[ end trace 25eae7f9180cbb88 ]---
>=20
>=20
> Have i not enabled something important for imx8's IPU or is it something =
on my
> driver's side?

What does your driver do ? I'm not sure how to answer that without
seeing the driver.

--
Kieran

> thanks,
> Petko
