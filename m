Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 624F765540D
	for <lists+linux-media@lfdr.de>; Fri, 23 Dec 2022 20:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbiLWTvd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Dec 2022 14:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiLWTvc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Dec 2022 14:51:32 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B240EE0F
        for <linux-media@vger.kernel.org>; Fri, 23 Dec 2022 11:51:31 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 01E1C6602CDF;
        Fri, 23 Dec 2022 19:51:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1671825090;
        bh=nFOwtY+N4s2DaKJwh52euDgaqv1eWICMbfNY38ztSNA=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=XHM80TeCYHMclj3fao44MR3vOBWDiWtw7Gaud8Mg6ak8lTm/VIF/imzJ2CbePjrAQ
         BF6LQaKoyO0JwliMGX78w0roo+vK0w3y4wbeUmkOetS8ZLXL4rfljLayBLy9taWVSM
         yLJD1ybudYUTRP/+oFEzVqpBUHSlFGJZTdJVZwOjsYuXLVkvNrGtByF7gjkKrDIDvh
         tTWJaA92L/8ejF6Z70el6lKcUac3nhsLdYlukdOOzUhDTXAp52bjCmtG0LYSjaw0Ot
         Gjwp2LOwpv+8CGCHGXkNAH44zft2dcUNrhuYlvvjIxOwiLnBWQ6FsQtFlvvrSZm0Vv
         RctlySpZAjUtA==
Message-ID: <2ad38f3d4998a3e912c5acbb40053ff04d26fa8e.camel@collabora.com>
Subject: Re: [PATCH v2 0/4] media: rkvdec: Fix H.264 error resilience
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com
Date:   Fri, 23 Dec 2022 14:51:19 -0500
In-Reply-To: <20221223193807.914935-1-nicolas.dufresne@collabora.com>
References: <20221223193807.914935-1-nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fyi, this cover letter was v2.

Le vendredi 23 d=C3=A9cembre 2022 =C3=A0 14:38 -0500, Nicolas Dufresne a =
=C3=A9crit=C2=A0:
> This patch serie changes the decoding mode from "exit on error"
> to "keep decoding". Using this mode and re-enabling error detection
> allow getting error resilience without loosing the ability to report
> errors to userland. This have showed great results, but might be a
> little more risky since this is not the mode that the reference code
> uses and the documentation is very brief. With this in place,
> userspace can chose to skip or display corrupted frames depending
> on its application requirement. Previsouly, applicaiton would have
> had no choice but to present the corrupted frames.
>=20
> Changes since V1:
> 	- Removed merged patch
> 	- Changed usage of pr_debug into v4l2_dbg
> 	- Fix typos in commit messages and comments
>=20
> Nicolas Dufresne (5):
>   media: rkvdec: Disable H.264 error detection
>   media: rkvdec: Add an ops to check for decode errors
>   media: rkvdec: Fix RKVDEC_ERR_PKT_NUM macro
>   media: rkvdec: Re-enable H.264 error detection
>   rkvdec: Improve error handling
>=20
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 23 +++++++++++++--
>  drivers/staging/media/rkvdec/rkvdec-regs.h |  2 +-
>  drivers/staging/media/rkvdec/rkvdec.c      | 34 ++++++++++++++++++----
>  drivers/staging/media/rkvdec/rkvdec.h      |  2 ++
>  4 files changed, 51 insertions(+), 10 deletions(-)
>=20

