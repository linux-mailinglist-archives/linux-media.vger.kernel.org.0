Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D11D663142
	for <lists+linux-media@lfdr.de>; Mon,  9 Jan 2023 21:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237394AbjAIUSk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Jan 2023 15:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjAIUSh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Jan 2023 15:18:37 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D17734764
        for <linux-media@vger.kernel.org>; Mon,  9 Jan 2023 12:18:35 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F7B46602AAA;
        Mon,  9 Jan 2023 20:18:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1673295513;
        bh=6Ta1xAzUiR3rpnY6rASm1ZY0kLnmJcpI2Y+vSCkz1PA=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=ZhGZypvVUqT2iMzoydbrjFAK3RLwDQzJk9W8s1+xGG3KMU01TjJxigbSMnNdXSwoM
         kguIcNhJTongIAMgVUoJZNuRtV8q6ovMKVJBcmSoWhEFnwWQlKXD7wr1fxRxPl1Hc0
         9s7jjWH2D7co+bp4JfLCn6qV4vUFlIa7MFvdTvbmSWxE3LLLdjVJJ68jeNcRY0h1hu
         3PgLt8II5QtQdARpblnMYY1tpEsrNE9K5+ekoLe3fXZzrFW1ASC7c6KbJfDnb7ZO1i
         nOAWxHjaN/JF2auv5daP0hpspgCjP40a4oMir7OppV+bLgipL27XJTznKnLUx8aufm
         rMGwOBW7yHzzw==
Message-ID: <e92aa9ec37cd22b2a915f357ecc46269c8f378a5.camel@collabora.com>
Subject: Re: [PATCH v1 0/4] media: rkvdec: Fix H.264 error resilience
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com
Date:   Mon, 09 Jan 2023 15:18:24 -0500
In-Reply-To: <CAGXv+5EAwVf2Tte5ErinAvE1xhTizBuQb5s5UY4BwipY5=nTFg@mail.gmail.com>
References: <20221223193807.914935-1-nicolas.dufresne@collabora.com>
         <CAGXv+5EAwVf2Tte5ErinAvE1xhTizBuQb5s5UY4BwipY5=nTFg@mail.gmail.com>
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

Le lundi 26 d=C3=A9cembre 2022 =C3=A0 12:20 +0800, Chen-Yu Tsai a =C3=A9cri=
t=C2=A0:
> On Sat, Dec 24, 2022 at 3:38 AM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > This patch serie changes the decoding mode from "exit on error"
> > to "keep decoding". Using this mode and re-enabling error detection
> > allow getting error resilience without loosing the ability to report
> > errors to userland. This have showed great results, but might be a
> > little more risky since this is not the mode that the reference code
> > uses and the documentation is very brief. With this in place,
> > userspace can chose to skip or display corrupted frames depending
> > on its application requirement. Previsouly, applicaiton would have
> > had no choice but to present the corrupted frames.
> >=20
> > Changes since V1:
> >         - Removed merged patch
> >         - Changed usage of pr_debug into v4l2_dbg
> >         - Fix typos in commit messages and comments
> >=20
> > Nicolas Dufresne (5):
> >   media: rkvdec: Disable H.264 error detection
> >   media: rkvdec: Add an ops to check for decode errors
> >   media: rkvdec: Fix RKVDEC_ERR_PKT_NUM macro
> >   media: rkvdec: Re-enable H.264 error detection
> >   rkvdec: Improve error handling
>=20
> Apart from the minor comments in patch 3, the series is
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>=20
> Do we need to add the check_error_info op for VP9?

In general, I try to avoid changes I cannot test. If you happen to have VP9=
 with
errors let me know. Looking quickly at the TRM, some part seems shared betw=
een
H.264 and VP9 indeed. Though, the TRM discourage from enabling the "keep
decoding on error" mode we use here.

>=20
> >  drivers/staging/media/rkvdec/rkvdec-h264.c | 23 +++++++++++++--
> >  drivers/staging/media/rkvdec/rkvdec-regs.h |  2 +-
> >  drivers/staging/media/rkvdec/rkvdec.c      | 34 ++++++++++++++++++----
> >  drivers/staging/media/rkvdec/rkvdec.h      |  2 ++
> >  4 files changed, 51 insertions(+), 10 deletions(-)
> >=20
> > --
> > 2.38.1
> >=20

