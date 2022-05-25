Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 230E7533EC6
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 16:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244750AbiEYOIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 10:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244841AbiEYOHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 10:07:49 -0400
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F547AE279
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 07:07:39 -0700 (PDT)
Date:   Wed, 25 May 2022 14:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail2; t=1653487656; x=1653746856;
        bh=PGuICWR5xVp/hCJM7WV+UGw5LoWMo7s78Bo1j4hSxSg=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=qT4+QW8hyugNtSkw43k7pfEVyQgD6A+Aga3W1hXw3vX9zWQC1HwxIyMo289XmtljB
         oJrdgZxNrifrPw8DTtyTmfLhsQ3VyX8e0tRHFC8OYVb8IMMk1j7Qf75x/JUQvnTQyf
         zlQVt8VjvJrFDOTZywKhdHh3ecIfn5bxAv9TH1EEbp7TkLf/LB4ZtkqoiAFZ/mn3IN
         wrGjvYpe+b1+iRDUGqEN802SfLnr4AKZnYjDLS3uoSnRINbB7NOZoipx0V0PsHmbqO
         ItwFaPoZDciNaBmA4qka6r59aZQGLzj4n1XQjdpcGaQ58Kmn3ashHlsTt3Xc7sJLKV
         l7obvdMrZMRjg==
To:     Daniel Vetter <daniel@ffwll.ch>
From:   Simon Ser <contact@emersion.fr>
Cc:     =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
        tvrtko.ursulin@linux.intel.com, skhawaja@google.com,
        gustavo@padovan.org, Felix.Kuehling@amd.com,
        dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, maad.aldabagh@amd.com,
        tzimmermann@suse.de, alexander.deucher@amd.com,
        daniels@collabora.com, linux-media@vger.kernel.org,
        =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        jason@jlekstrand.net, sergemetral@google.com
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: Tackling the indefinite/user DMA fence problem
Message-ID: <nR302DiNnOEkhrGg7TsRINiS2R-WuPiI2uJiERdMMaSUV9e_0xlX1eu1CzzhlCXJmJ-ss1BdkTSZ-XiEOnyMUTn6v3A_sb1jTkvAxfuS-f8=@emersion.fr>
In-Reply-To: <Yo40X03axFXXN9/d@phenom.ffwll.local>
References: <20220502163722.3957-1-christian.koenig@amd.com> <YnJQs1iusrBvpuMs@phenom.ffwll.local> <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com> <Ynkg81p6ADyZBa/L@phenom.ffwll.local> <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com> <Yo4pin1Js4KXs2HL@phenom.ffwll.local> <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org> <Yo40X03axFXXN9/d@phenom.ffwll.local>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wednesday, May 25th, 2022 at 15:51, Daniel Vetter <daniel@ffwll.ch> wrot=
e:

> > > Ofc in reality you can still flood your compositor and they're not ve=
ry
> > > robust, but with umf it's trivial to just hang your compositor foreve=
r and
> > > nothing happens.
> >
> > You can add that to the list of reasons why compositors need to stop
> > using buffers with unsignaled fences. There's plenty of other reasons
> > there already (the big one being that otherwise slow clients can slow
> > down the compositor, even if the compositor uses a high priority contex=
t
> > and the HW supports preemption).
>
>
> Yeah that's tbh another reason why I think we shouldn't do umf as a
> transparent thing - compositors need to get better anyway, so we might as
> well take this as a chance to do this right.

As a compositor dev, I agree -- we should definitely be smarter about
this. Note, it would help a lot to have a good way to integrate the
waits into a poll(2) event loop.
