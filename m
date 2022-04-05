Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78B324F4B0B
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573833AbiDEWx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457523AbiDEQDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 12:03:20 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBDB3B4
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 09:00:05 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id t2so11765755qtw.9
        for <linux-media@vger.kernel.org>; Tue, 05 Apr 2022 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=FG0tvdnxIVqeRhoUiTGCMEpSEQ0H8e8w3d2SXzn4rws=;
        b=a1wYsbOy9fVRrE48NenmQbhMFXlwq//PRR7LH0GkOLrwdPvh1Ok458zk41NMXYmQbs
         vd9fAODO3ObWWhNV4fUywmboY6dBymmmhI7GlPTmvXbDi61wvLX6ma7kJO4nqWDNduv1
         JlW0F4jY4/imTSA/mJDsF0Dx2TuhxoEgLOpzC0bUZ7vd24+QHcUkv43OMl4iMsEC6koc
         nVTrTmHF31dJd5Kg832Gfqf6d1GwKYMY/koI9cKFMaju2BV7Vii6+mcYnlN5ebenJHaW
         Xi0k95+Ak1dMVaMr9reSRPaq5+m3eukeC2CnyuCOVIVTMrdHC6aGyUsgInZF6Tg/5NVc
         Zfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=FG0tvdnxIVqeRhoUiTGCMEpSEQ0H8e8w3d2SXzn4rws=;
        b=LVx870bvm9oovJtwhs9XZc6ymvDt+WIsuMymghuV87rOx8Wjzckk4QrzwCztBVsbbD
         AqNvtDhRlY+60hR+m1+zIOIVeQ1HInMt+XwbRyeyNz75lcNxkFaX+PjxxUIpY1tgz075
         r4gKNpSphbLBJfFstTP4YGp6dNUJ0Z+prVpgSA2m3qT68sLNQMNCXud/ZfhoBcn94D5D
         VgSK6OcplIOaQxPoUfpxgMtOsbHE7s7/dmzglPVvILOwZtjgVRnDuznhakWR3WFFHth7
         KCXM40Ci33BL8/ykxtEW93imXpeS1M0/iUfgjJmAqrv7FZjpCybaZcpUP/wEcRIwiMd1
         jeJw==
X-Gm-Message-State: AOAM532ceH7FaAXf0m7zn9oW5zpbcQAE+AFWcIwZPCw0nQR1oZrut7fM
        ROTpv7GzB77+Ln0TgcQDFyiWvw==
X-Google-Smtp-Source: ABdhPJwRBgg4q9WIgPbeVCSlHtqm2vEJN/aI+LJtMxvvnwehBYkSZSpif4H0hCUUfwXUCzh0tVfWuQ==
X-Received: by 2002:ac8:7dd5:0:b0:2e1:ea4a:a743 with SMTP id c21-20020ac87dd5000000b002e1ea4aa743mr3610756qte.30.1649174403836;
        Tue, 05 Apr 2022 09:00:03 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id j21-20020ac85f95000000b002e1cde99863sm11144758qta.83.2022.04.05.09.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 09:00:03 -0700 (PDT)
Message-ID: <f9a650be2d0d669f77da97efedd55779a1829d3a.camel@ndufresne.ca>
Subject: Re: [PATCH 7/7] media: coda: enable capture S_PARM for stateful
 encoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 05 Apr 2022 12:00:02 -0400
In-Reply-To: <d9398b1b6bd96cfff80e91bca930281f77bd749b.camel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-7-p.zabel@pengutronix.de>
         <bda20ff01f8aa7898416810743dac300f997e9c0.camel@ndufresne.ca>
         <d9398b1b6bd96cfff80e91bca930281f77bd749b.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 05 avril 2022 =C3=A0 17:03 +0200, Philipp Zabel a =C3=A9crit=C2=A0=
:
> Hi Nicolas,
>=20
> thank you for the review. You bring up a good point here, I think this
> part of the spec is not very easy to understand.
>=20
> On Di, 2022-04-05 at 10:22 -0400, Nicolas Dufresne wrote:
> > Le lundi 04 avril 2022 =C3=A0 18:35 +0200, Philipp Zabel a =C3=A9crit=
=C2=A0:
> > > Allow to call S_PARM with type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT,
> > > to fix the following v4l2-compliance test failure:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0fail: v4l2-test-formats.cpp(1413): got error 22
> > > when setting parms for buftype 1
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test VIDIOC_G/S_PARM:=
 FAIL
> >=20
> > That one may be missing something though. As you don't implement perfor=
mance
> > target, you need to override the value somehow with the value you wrote=
 into the
> > bitstream no ? Otherwise we just ignore what userland sets silently ?
>=20
> You are right that we don't implement any performance targets.
> But the spec also says [1]:
>=20
>   Changing the OUTPUT frame interval also sets the framerate that the
>   encoder uses to encode the video. So setting the frame interval to
>   1/24 (or 24 frames per second) will produce a coded video stream that
>   can be played back at that speed. The frame interval for the OUTPUT
>   queue is just a hint, the application may provide raw frames at a
>   different rate. It can be used by the driver to help schedule
>   multiple encoders running in parallel.
>=20
>   In the next step the CAPTURE frame interval can optionally be changed
>   to a different value. This is useful for off-line encoding were the
>   coded frame interval can be different from the rate at which raw
>   frames are supplied.
>=20
> And
>=20
>   Changing the CAPTURE frame interval sets the framerate for the coded
>   video. It does not set the rate at which buffers arrive on the
>   CAPTURE queue, that depends on how fast the encoder is and how fast
>   raw frames are queued on the OUTPUT queue.
>=20
> [1] https://docs.kernel.org/userspace-api/media/v4l/dev-encoder.html?high=
light=3Dstateful%20encoder
>=20
> So far I'm only implementing the OUTPUT->CAPTURE rate passthrough part
> to make v4l2-compliance happy.
>=20
> Since the "frame interval for the OUTPUT queue is just a hint" and the
> spec only says that "the encoder may adjust it to match hardware
> requirements", I felt free to just ignore the raw frame interval part
> for now.
> My understanding is that the driver may limit this value to the
> achievable real time encoding speed (if it even knows).
>=20
> One thing I'm not doing according to spec right now is that calling
> S_PARM on CAPTURE will also change the OUTPUT interval, as the driver
> just stores them in the same variable.
> Also the driver does not set the V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL
> to signal it supports S_PARM on CAPTURE.
> My understanding is that the CAPTURE frame interval is the value that
> should be written to the bitstream and that should be used for the
> bitrate control algorithm.

This is another very good point, if a driver does not set
V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL, why can't it return ENOTTY for
S_PARAM(CAPTURE) ? Is the test even correct?
>=20
> > I might not have got exactly how this case is supposed to be handled.
> > Looking for feedback on what is proper behaviour for drivers that do
> > not implement performance targets (resource reservation).
>=20
> Same here. I'd love to learn whether my understanding of the spec is
> correct or not.
>=20
> regards
> Philipp

