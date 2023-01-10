Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECA8663F90
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 12:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbjAJL4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 06:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbjAJL4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 06:56:04 -0500
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE9215F1C
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 03:56:03 -0800 (PST)
Date:   Tue, 10 Jan 2023 11:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1673351762; x=1673610962;
        bh=RTaiwfeNfVaSDohea553rjNIZ+5PVfJH0ykf4KKSWRI=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=hDvEFEN7w5IZSbYGp08MZLFqA9RQMCQD/lhUzVqIBk8/8wjuyavTnWVewnmtcSIQ8
         9hrvpdAn0/xbAgpnP6uhRgZ+VPMVW+lZimA4+GVBJGG+jne2CVrufDAHyXac+XKPgs
         2p9y3nOTtMs40hh7cFiatV0WVtt+fxTxlVHmJcuDG5r7zkfYkuNrr3X1hJ72rm74Wa
         Ch7vhTqJ7QQJ6mkGEi716Ar7rdvsX/2ZVn/DwK6D2vWZbdwfFfU29srgABT1UqeFkl
         72qvzHDsBXb4CCutmr/Y1523oQNm5SEBHLplBGwzrdE3tRkc0z905H6h/qcpv5zqfo
         LZUzBQXWK62XA==
To:     =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] doc: add dma-buf IOCTL code to table
Message-ID: <c9KK3fKHPFh6b-O2gCOodmh6naTwU6ez1qkpxaZAaRgdHydzKyxyc2nOUUbkvHoSf6yvNmDLIiLtwzX7830ZSjkZpmzxna5KuVRovmbn8hM=@emersion.fr>
In-Reply-To: <9b8d670e-afc8-1238-5a7d-5bbf9fc2e7d7@amd.com>
References: <20221128133853.355645-1-contact@emersion.fr> <dea4806e-f96a-262a-e0d5-ae60c199458c@amd.com> <CBxfX5V758BMJrTNNtWSrSxTq0Ep48B4PbOS-ryM5B-WDgErHc5zeJBDYNE9UwFVXDMSwd7Bj-Zu6PZZ2jnzGwcL1tHWYySujL9CgTTedoE=@emersion.fr> <9b8d670e-afc8-1238-5a7d-5bbf9fc2e7d7@amd.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tuesday, January 10th, 2023 at 12:53, Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:

> Am 10.01.23 um 12:49 schrieb Simon Ser:
>=20
> > On Tuesday, November 29th, 2022 at 10:56, Christian K=C3=B6nig christia=
n.koenig@amd.com wrote:
> >=20
> > > Should I also push this?
> > > I can push to drm-misc-next, but is that the suitable repo?
>=20
> I think so, unless you think that this is a necessary bug fix which
> should be backported.

Thanks! I pushed it there.
