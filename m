Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3124DE39F
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 22:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241128AbiCRVlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 17:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiCRVlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 17:41:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1302BB360;
        Fri, 18 Mar 2022 14:40:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 810F5EE;
        Fri, 18 Mar 2022 22:40:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647639614;
        bh=/oGOO8WyuxRbTiN5lepekDt3MordzYXQLmc8N4Lw4uw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nb+Vulkv9F5FsFBiiX4H9KkgpHMnlYiX+jQsZyqV/Zqv7PsJUdx33KuHLUnKVtVTx
         BgqdQTYuycP/1q3554yaNTuz/kD+l+YewQQhyxsVGcKpHf+haFprEfcl/zZ0qcfsfC
         g86rcbx2rqXao0ptMQRfmWkR34Fbbi7tzI57tVFg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220318211446.11543-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com> <20220318211446.11543-4-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/3] media: vsp1: Use vb2_queue_is_busy()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Fri, 18 Mar 2022 21:40:12 +0000
Message-ID: <164763961201.2211712.6942249022812611769@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-03-18 21:14:46)
> Use the new vb2_queue_is_busy() helper to replace the open-coded
> version.
>=20

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/m=
edia/platform/renesas/vsp1/vsp1_video.c
> index 8f53abc71db2..4da70b2b0869 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -1032,7 +1032,7 @@ vsp1_video_streamon(struct file *file, void *fh, en=
um v4l2_buf_type type)
>         struct vsp1_pipeline *pipe;
>         int ret;
> =20
> -       if (video->queue.owner && video->queue.owner !=3D file->private_d=
ata)
> +       if (vb2_queue_is_busy(&video->queue, file))
>                 return -EBUSY;
> =20
>         /*
> --=20
> Regards,
>=20
> Laurent Pinchart
>
