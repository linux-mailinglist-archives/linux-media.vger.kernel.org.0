Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 632655F8D6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 15:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfGDNGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 09:06:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51250 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfGDNGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 09:06:07 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E9D8F287FCD;
        Thu,  4 Jul 2019 14:06:04 +0100 (BST)
Date:   Thu, 4 Jul 2019 15:06:01 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Pawel Osciak <posciak@chromium.org>
Subject: Re: [PATCH v2 1/2] media: uapi: Add VP8 stateless decoder API
Message-ID: <20190704150601.05509027@collabora.com>
In-Reply-To: <dadc0a899608939b456ea714c86d56ad0a3a08f9.camel@collabora.com>
References: <20190702170016.5210-1-ezequiel@collabora.com>
        <20190702170016.5210-2-ezequiel@collabora.com>
        <4206efe071473daee60cc330ae7934697110516f.camel@collabora.com>
        <dadc0a899608939b456ea714c86d56ad0a3a08f9.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 04 Jul 2019 10:00:33 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:


> 
> Oops, this is just an internal note, it seems I forgot to remove this one.
> 
> > I am right to think that this is basically the size in bits of the
> > frame header ? Maybe it could be another way to formulate it ? I'm just
> > trying to think of formulation that will better guide the developers
> > implementing the parser feeding this. You basically need to parse the
> > header to get this size (as everything is dynamically sized).
> >   
> 
> Depending what you call "frame header", then yes, it's the size in bits.
> 
>                              first_part_size          parttion_sizes[0]
>                                 ^                     ^
>                                 |                     |
>                        +--------+------+        +-----+-----+
>                        | control part  |        |           |
>    +--------+----------------+------------------+-----------+-----+-----------+
>    | tag 3B | extra 7B | hdr | mb_data | dct sz | dct part0 | ... | dct partn |
>    +--------+-----------------------------------+-----------+-----+-----------+
> 
> The above shows a VP8 frame, "macroblock_bit_offset" is the size in bits of
> the "hdr" portion: i.e. the header of the first partition (aka control partition).
> 
> Thinking about it, the current description is quite confusing.
> 
> How about:
> 
> "Size in bits of the frame header. In other words, this the size in bits of the header
> portion of the first partition".

How about having a similar diagram somewhere in the spec? It's usually
much clearer than a sentence, at least that's my opinion.
