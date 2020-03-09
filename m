Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A61717DEEC
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 12:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgCILqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 07:46:42 -0400
Received: from gofer.mess.org ([88.97.38.141]:56507 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCILqm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 07:46:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 86F34C63FC; Mon,  9 Mar 2020 11:46:40 +0000 (GMT)
Date:   Mon, 9 Mar 2020 11:46:40 +0000
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v2] media: rc: make scancodes 64 bit
Message-ID: <20200309114640.GA9321@gofer.mess.org>
References: <20200129115419.8456-1-sean@mess.org>
 <20200129115419.8456-2-sean@mess.org>
 <20200302103127.0eff8aa4@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302103127.0eff8aa4@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Mar 02, 2020 at 10:31:27AM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 29 Jan 2020 11:54:16 +0000
> Sean Young <sean@mess.org> escreveu:
> 
> > There are many protocols that encode more than 32 bit. We want 64 bit
> > support so that BPF IR decoders can decode more than 32 bit. None of
> > the existing kernel IR decoders/encoders support 64 bit, for now.
> 
> The reason why we don't properly support 64 bits yet [2] is that it requires 
> some changes in order to provide a backward-compatible set of functions.

This should be supported.

> [2] Actually, I guess we have one driver with has 64 bits scancodes.

Which one is that?

> > The MSC_SCAN event can only contain 32 bit scancodes, so we no longer
> > generate these input events. The full 64 bit scancode can be read from
> > the lirc chardev.
> 
> For example, if all possible scancodes are <= 32 bit, it should still
> generate MSC_SCAN, as otherwise existing tools that rely on it will 
> break.

The scancodes are generated from the driver, and even if there is no
keymap loaded, scancodes are still generated. Therefore I don't think it
makes sense to switch on whether there are any 64 bit scancodes in the
current keymap.

We don't know if a driver will produce 64 bit scancodes right now. Although
BPF is the only route (currently) which can produce 64 bit scancodes,
there is no way to see if a BPF program will generate 64 bit scancodes
in advance.

So, I've changed the code to generate MSC_SCANCODE if the scancode fits
into 32 bits, reluctantly. However, I think this is the best we can do
for compatibility. I will post a v2 shortly.

Thanks
Sean
