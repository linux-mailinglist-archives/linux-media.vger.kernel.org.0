Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244F95262AC
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 15:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbiEMNLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 09:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbiEMNLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 09:11:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C04387A3
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 06:11:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7FEA6200C
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 13:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8D6C34100;
        Fri, 13 May 2022 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652447491;
        bh=9NmCixj6Yz8r0N5r/kmeWtE9rN0p87+5XfP+Ba5/8XE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SG+6wjTTNNFmL0wNIBBZ5lN2m406jm/GjvTdJy80l/ub0at3f1uc1kP5feQ+HZoWg
         VmwRNOuFUHM7LUSlHRVo/Dix4AxWKCyAXi9GGgcv0U3EIh/SZZDHToLCWxT/bymF2R
         hCdKyX4deJQTArnDhu+YjL0yMrwYk4MHpeWdOfGYc6sQ4FgNjK/X3rtxFVH8Ba5EXK
         nuv/9M7oSw5Es+kgJKOOcdAwmi0r2i1KKoUTKzwXI2IVzfDyupiElKCzGc5eRbjo9+
         v1G2a0TiFpVty2txAQvK4i4EhLCi9JwRFeKnHB2rWChBwBtydev4uIiXTSeUnmFaxE
         DhHrljOMfz7rw==
Date:   Fri, 13 May 2022 15:11:26 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        jonas@kwiboo.se
Subject: Re: [GIT PULL FOR v5.19] v2: H.264 Field Decoding Support for
 Frame-based Decoders
Message-ID: <20220513151126.2dafc3aa@coco.lan>
In-Reply-To: <68d6a73a-5571-0ea3-0fca-ff06fe6bda45@xs4all.nl>
References: <68d6a73a-5571-0ea3-0fca-ff06fe6bda45@xs4all.nl>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Em Fri, 13 May 2022 10:46:56 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> This PR contains this Nicolas' v4 patch series:
>=20
> https://patchwork.linuxtv.org/project/linux-media/patch/20220426125751.10=
8293-2-nicolas.dufresne@collabora.com/
>=20
> except for patch 03/24 ("media: videobuf2-v4l2: Warn on holding buffers w=
ithout support")
> which needs more work. It's independent of the other patches though, so t=
hat can be
> done later.
>=20
> Regards,
>=20
> 	Hans
>=20
> Changes since v1:
>=20
> - patch "Use v4l2_h264_reference for reflist" failed to compile: the tegr=
a-vde change used
>   a field that was only added 3 patches later ("Store all fields into the=
 unordered list").
>   Keep the old field and only update it in the later patch.
>=20
>=20
> The following changes since commit 02970914dbc7152d6de615127261e778ef425a=
09:
>=20
>   media: amphion: ensure the buffer count is not less than min_buffer (20=
22-05-13 10:05:09 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19f
>=20
> for you to fetch changes up to 57ee62e3da43e55fe7a83115bc941e9c84b2cd1f:
>=20
>   media: hantro: Enable HOLD_CAPTURE_BUF for H.264 (2022-05-13 10:42:24 +=
0200)
>=20
> ----------------------------------------------------------------
> Tag branch
>=20
> ----------------------------------------------------------------
> Jonas Karlman (5):
>       media: rkvdec: h264: Fix bit depth wrap in pps packet
>       media: rkvdec: h264: Validate and use pic width and height in mbs
>       media: rkvdec: h264: Fix reference frame_num wrap for second field
>       media: rkvdec: Ensure decoded resolution fit coded resolution
>       media: hantro: h264: Make dpb entry management more robust
>=20
> Nicolas Dufresne (18):
>       media: doc: Document dual use of H.264 pic_num/frame_num
>       media: v4l2-mem2mem: Trace on implicit un-hold
>       media: h264: Avoid wrapping long_term_frame_idx
>       media: h264: Use v4l2_h264_reference for reflist

This one has a non-trivial conflict. Basically, part of the code it
modifies are not there at the header file.

I suspect it could be due to some conflict with this patch:

commit 024b1f4fedc87db2aeea77dbfb1b32bbac096304
Author:     Yunfei Dong <yunfei.dong@mediatek.com>
AuthorDate: Thu May 12 04:19:46 2022 +0200
Commit:     Mauro Carvalho Chehab <mchehab@kernel.org>
CommitDate: Fri May 13 14:48:31 2022 +0200

    media: mediatek: vcodec: Extract H264 common code
   =20
    Mt8192 can use some of common code with mt8183. Moves them to
    a new file in order to reuse.
   =20
    [hverkuil: replaced memcpy_toio by memcpy, was left over from a prev ve=
rsion]
   =20
    Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
    Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
    Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

That was merged from another branch.

I'll apply only the 3 patches that came before this one, e. g.:

	4a18d21649f4 media: h264: Avoid wrapping long_term_frame_idx
	86ef61ad686c media: v4l2-mem2mem: Trace on implicit un-hold
	804e192a8114 media: doc: Document dual use of H.264 pic_num/frame_num

Regards,
Mauro

Thanks,
Mauro
