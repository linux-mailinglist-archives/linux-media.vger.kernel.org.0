Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7221B4DE3A5
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 22:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241190AbiCRVp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 17:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240149AbiCRVp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 17:45:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE0C30A889;
        Fri, 18 Mar 2022 14:44:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0EECEE;
        Fri, 18 Mar 2022 22:44:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647639845;
        bh=lkM33JzxB8ZwQlccUVMWHTdzLZc6UWqnwEQ6ggU1SSg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VdrcIW9RSjtT/OwU4U72oryvMN/ksi61aAtr+DIS9yYv7ZC8A5a7BlF2s/rQ5qh7s
         WiqSDum/8b1v0sn6d4vtt2Vl615RNrLFNGJkKaCwfqTW+a8cPY+Qq6/7NGqOwL4mLf
         YReOSbFnTaGXj3JVusQc2l9/qyvJtnH9iqvpukP4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220318211446.11543-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com> <20220318211446.11543-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/3] media: vsp1: Don't open-code vb2_fop_release()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Fri, 18 Mar 2022 21:44:03 +0000
Message-ID: <164763984378.2211712.3085801061791359128@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-03-18 21:14:45)
> Use the vb2_fop_release() helper to replace the open-coded version. The
> video->lock is assigned to the queue lock, used by vb2_fop_release(), so
> the only functional difference is that v4l2_fh_release() is now called
> before vsp1_device_put(). This should be harmless.
>=20

Seems to check out.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_video.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/m=
edia/platform/renesas/vsp1/vsp1_video.c
> index 044eb5778820..8f53abc71db2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -1129,19 +1129,11 @@ static int vsp1_video_open(struct file *file)
>  static int vsp1_video_release(struct file *file)
>  {
>         struct vsp1_video *video =3D video_drvdata(file);
> -       struct v4l2_fh *vfh =3D file->private_data;
> =20
> -       mutex_lock(&video->lock);
> -       if (video->queue.owner =3D=3D vfh) {
> -               vb2_queue_release(&video->queue);
> -               video->queue.owner =3D NULL;
> -       }
> -       mutex_unlock(&video->lock);
> +       vb2_fop_release(file);
> =20
>         vsp1_device_put(video->vsp1);
> =20
> -       v4l2_fh_release(file);
> -
>         file->private_data =3D NULL;
> =20
>         return 0;
> --=20
> Regards,
>=20
> Laurent Pinchart
>
