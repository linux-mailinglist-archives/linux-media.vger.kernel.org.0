Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB88B34298
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfFDJFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:05:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40888 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfFDJFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:05:31 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 839D9260D64;
        Tue,  4 Jun 2019 10:05:30 +0100 (BST)
Date:   Tue, 4 Jun 2019 11:05:27 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190604110527.48d16907@collabora.com>
In-Reply-To: <20190604085503.GE9048@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
        <20190603112449.GA30132@ulmo>
        <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
        <20190604085503.GE9048@ulmo>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 4 Jun 2019 10:55:03 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Mon, Jun 03, 2019 at 02:52:44PM -0400, Nicolas Dufresne wrote:
> [...]
> > There is one thing that come up though, if we enable per-frame decoding
> > on top of per-slice decoder (like Cedrus), won't we force userspace to
> > always compute l0/l1 even though the HW might be handling that ? Shall
> > we instead pass the modification list and implement the non-parsing
> > bits of applying the modifications in the kernel ?  
> 
> Applying the modifications is a standard procedure, right? If it's
> completely driver-agnostic, it sounds to me like the right place to
> perform the operation is in userspace.

Well, the counter argument to that is "drivers know better what's
needed by the HW", and if we want to avoid doing useless work without
having complex caps checking done in userspace, doing this task
kenel-side makes sense.
