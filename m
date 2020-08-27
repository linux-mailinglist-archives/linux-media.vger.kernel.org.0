Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE8D254325
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 12:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgH0KFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 06:05:48 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:33689 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbgH0KFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 06:05:47 -0400
Date:   Thu, 27 Aug 2020 10:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail2; t=1598522740;
        bh=ffaA9NalJMVU2UKTLg6pea1mHRIiZpIck6JIPScJId8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=RcAqdKVv3q+qKz9Zmjvc1aUeVstIboOQdGAIQVSt5ZYpvOol6MOTjKvq95Pr2mRVW
         QMMSrTnnfqkfwVqX2xtBElrvUP2P0tDaujD67vQSVIgoAJKqIO3qaelRNfdVu8esZG
         Bdt/Q1xqdl7WSxU8fCdZdWzCZtsG6ww7QyHFJxtyeAUM6YjMlQs00tBRTRbar1wo+t
         ZEA8lr406GbeQvMiVBWXaJ25ssbVis07WhMA36yG6AHlCEFrlVov0gT/yAYxvHg8cr
         kPjStzWn3h6Ofo1lB1eGAwFjdiSfoLpS93D/G8t0sMaAOteQ/NIHJciLIw0RXyEQu0
         EnyCx8Qu8Ha3A==
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        James Jones <jajones@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Andrew F . Davis" <afd@ti.com>, Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Daniel Stone <daniels@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
Message-ID: <HLs4Vl86o7Bizqo_-jyz_sHLhvnePm1DoLc9c_96NjYt-GeGwjX1NLz_lScgmmDBMvulyYsgzqiIXhs9yhYxsbompEotRDwtz9uNDAp7ZWs=@emersion.fr>
In-Reply-To: <a1663f6e74eca50f19b44416cdeb346a7b836108.camel@collabora.com>
References: <20200816172246.69146-1-ezequiel@collabora.com> <CALAqxLV2kOXUjATTn5Xg6-Rj-U7SVUO0t89MzpRzKFU4v8h5Lg@mail.gmail.com> <621cd69bdd4af3e5bd5f2c96450c87651620381a.camel@collabora.com> <20200820155427.GV6593@pendragon.ideasonboard.com> <a1663f6e74eca50f19b44416cdeb346a7b836108.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tuesday, August 25, 2020 10:26 PM, Nicolas Dufresne <nicolas.dufresne@co=
llabora.com> wrote:

> > I don't think we can do this in a system-agnostic way. What I'd like to
> > see is an API for the kernel to expose opaque constraints for each
>
> Please, take into consideration that constraints can also come from
> userspace. These days, there exist things we may want to do using the
> CPU, but the SIMD instructions and the associated algorithm will
> introduce constraints too. If these constraints comes too opaque, but
> you will also potentially limit some valid CPU interaction with HW in
> term of buffer access. CPU constraints todays are fairly small and one
> should be able to express them I believe. Of course, these are not
> media agnostic, some constraints may depends on the media (like an
> image buffer, a matrix buffer or audio buffer) and the associated
> algorithm to be used.
>
> An example would be an image buffers produced or modified on CPU but
> encoded with HW.

Actually, in the proposal we're working on, constraints may come from
user-space too. Rendering APIs (ie. mesa) will need to expose
constraints for buffers they can render on or texture from.

Constraints would be opaque for users like compositors (ie. programs
that merely pass constraints around and merge them don't need to
understand them), but not for user-space drivers.
