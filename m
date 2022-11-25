Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFD6638E57
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 17:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiKYQkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 11:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiKYQkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 11:40:08 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C0A4D5EA
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 08:40:06 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id e15so2830925qts.1
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M7vbIwl+/fvLQH2FFFO+pS8hv/f21DHk1Zk9oQnQSyg=;
        b=baCMPYRiGmv4nNjq0fISCCMILHJoCecvFoDJbM4uWRU/YmEDafEV6kcgM4L3vE/oBp
         KpodMp0IhnUahSEKrf7NLXAIipZo5D+3wsePZJmaDt1K+jAyQv1XEXnGXTjGKpU3XOT2
         8m31mL5YdkWGV/VZ339G1x3ZRUWLHfnu54MT7jwOvzohpR6NHexBG2cRh69Lq8OJKOST
         4KtMsf8AvGg4JTnc6Svyt9pWa8UzqmvceUaerMia9BoCaLi3HULwDCbZ0sy6n07LKX5U
         /hX4PvRnd9nD5zX+DDrpcodRUroRTuFSXm1knSWZ0Nx7Z1igEtNQWB87MBw9jiyodEPc
         +6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7vbIwl+/fvLQH2FFFO+pS8hv/f21DHk1Zk9oQnQSyg=;
        b=HxNEEgzwh5FzxyE35VKutIZewFVhFA+E1qwe+QGA6e6DzhOC1VqeBTutg3mEDDbVAl
         5f+DMZrJTfcKTCK83xcLLZ55bJgw8EjgpCx8iRUCSAcmSZ+SQ18DeFsTGhasQJHpAS6r
         d28980bwwIOaD+VwfS528Vhlh2M4vdiEbkekgv4+n01VvqM0hGL8Rc4ykZu0mTKhacCV
         RaTn7Nx0KNzTRmtcdlMdiL04EiG+wwGLCeXR/iAywRTvx1HUX5muDfGy8tlOjR+r+aC2
         +r/x82lCbe8JpfsD+Flo7fd2jsepUldBl4QpmGh1T+3zhA0wtwwpQdAy93o9rNle0/hR
         eunQ==
X-Gm-Message-State: ANoB5pl+egZqXoEgBQ1/fpQVWq07NMPnjIXkAFU4r3lmUHmDa4+vr+hx
        N38RU5G1Yz5wYxLNuCOEahgbpQ==
X-Google-Smtp-Source: AA0mqf5GX0lNZDIsHrQa5Zn2FHtDVn1hNwF7Y79T83y4UcicdENZlRS6zqIBovKjG9S4bPGe3Mteag==
X-Received: by 2002:a05:622a:4d4e:b0:39a:78d4:57e with SMTP id fe14-20020a05622a4d4e00b0039a78d4057emr21097351qtb.118.1669394406051;
        Fri, 25 Nov 2022 08:40:06 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id k12-20020a05620a414c00b006fa22f0494bsm3071540qko.117.2022.11.25.08.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 08:40:05 -0800 (PST)
Message-ID: <ba6e42f04c436d93bfa71d5dee7fd35ef2245073.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Stone <daniel@fooishbar.org>, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Date:   Fri, 25 Nov 2022 11:40:04 -0500
In-Reply-To: <Y35LcspZ385IC4lJ@phenom.ffwll.local>
References: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
         <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
         <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
         <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
         <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
         <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
         <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
         <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
         <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
         <20221123103338.238571e1@eldfell> <Y35LcspZ385IC4lJ@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 23 novembre 2022 =C3=A0 17:33 +0100, Daniel Vetter a =C3=A9crit=
=C2=A0:
> On Wed, Nov 23, 2022 at 10:33:38AM +0200, Pekka Paalanen wrote:
> > On Tue, 22 Nov 2022 18:33:59 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >=20
> > > We should have come up with dma-heaps earlier and make it clear that=
=20
> > > exporting a DMA-buf from a device gives you something device specific=
=20
> > > which might or might not work with others.
> > >=20
> > > Apart from that I agree, DMA-buf should be capable of handling this.=
=20
> > > Question left is what documentation is missing to make it clear how=
=20
> > > things are supposed to work?
> >=20
> > Perhaps somewhat related from Daniel Stone that seems to have been
> > forgotten:
> > https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collab=
ora.com/
> >=20
> > It aimed mostly at userspace, but sounds to me like the coherency stuff
> > could use a section of its own there?
>=20
> Hm yeah it would be great to land that and then eventually extend. Daniel=
?

There is a lot of things documented in this document that have been said to=
 be
completely wrong user-space behaviour in this thread. But it seems to pre-d=
ate
the DMA Heaps. The document also assume that DMA Heaps completely solves th=
e CMA
vs system memory issue. But it also underline a very important aspect, that
userland is not aware which one to use. What this document suggest though s=
eems
more realist then what has been said here.

Its overall a great document, it unfortunate that it only makes it into the=
 DRM
mailing list.

Nicolas
