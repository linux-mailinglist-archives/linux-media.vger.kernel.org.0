Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 598E3F8D53
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 11:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfKLKxs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 05:53:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47808 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfKLKxs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 05:53:48 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 56ECB290424;
        Tue, 12 Nov 2019 10:53:46 +0000 (GMT)
Date:   Tue, 12 Nov 2019 11:53:43 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Alexandre Courbot <acourbot@google.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: H264 stateless reference frames ordering lists
Message-ID: <20191112115343.1b1908ce@collabora.com>
In-Reply-To: <CAPBb6MWXj+PNbJ0_m6O6wnYf6Z9NcYwr49qbSowG66NB-23k2g@mail.gmail.com>
References: <CAPBb6MWXj+PNbJ0_m6O6wnYf6Z9NcYwr49qbSowG66NB-23k2g@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre,

On Tue, 12 Nov 2019 19:14:22 +0900
Alexandre Courbot <acourbot@google.com> wrote:

> Hi Boris and Ezequiel,
> 
> Patch c3adb85745ca6 has removed the ref_pic_list_* members from the
> v4l2_ctrl_h264_decode_params struct. The MT8183 stateless decoder
> driver I am working on still relies on these lists and I am trying (a
> bit late to the game) to remove them from the Chromium OS kernel UAPI
> in order to match upstream.
> 
> I have dug into the discussion that resulted in this removal and could
> not really find how these are supposed to be reconstructed and on the
> basis on which information. The commit log for the above-mentioned
> patch mentions that "generic helpers will be provided for drivers that
> need this list". I could not find any in the kernel so far, do you
> have any code available at the moment? Or any idea on how these can be
> reconstructed? The process seems to involve reading the DPB itself as
> well as reordering information from the slice parameters, and seems to
> be a bit involved to be done in the kernel, but maybe I am missing
> something here.

The code is here [1], and it should indeed be extracted and put in a
generic v4l2_h264 lib at some point (should happen soon, since we need
the same logic for the rkvdec driver).

Let me know if you have any questions.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v5.4-rc7/source/drivers/staging/media/hantro/hantro_h264.c#L270
