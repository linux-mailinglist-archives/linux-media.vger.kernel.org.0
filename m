Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E3D1B757
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 15:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbfEMNrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 09:47:49 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48863 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728961AbfEMNrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 09:47:48 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hQBIq-0001mO-DH; Mon, 13 May 2019 15:47:40 +0200
Message-ID: <1557755257.4442.8.camel@pengutronix.de>
Subject: Re: Hardware-accelerated video decoders used through a firmware
 instead of hardware registers
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Date:   Mon, 13 May 2019 15:47:37 +0200
In-Reply-To: <bfe1680249569241227ab90d5736b228de7b10f9.camel@bootlin.com>
References: <19804f842e80f1f8bd85b8eb49e75e149abf0062.camel@bootlin.com>
         <69c10fdd26566049c523d4c8cfb1b8c35018b738.camel@ndufresne.ca>
         <bfe1680249569241227ab90d5736b228de7b10f9.camel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sun, 2019-05-12 at 18:32 +0200, Paul Kocialkowski wrote:
[...]
> I would be curious to know what the situation is on the i.MX6 coda
> block, which also seems pretty obscure.

FWIW, I had started collecting things I learned about the BIT processor
in the CODA IP cores, mostly by looking at the firmware files
distributed by Freescale/NXP: https://github.com/pH5/coda-bits

It is a somewhat strange custom 16-bit DSP architecture. There is a
rudimentary start for a disassembler in there as well, but large parts
of the instruction set are still completely unknown, and I have no idea
how the address generator / DMA units or bitstream accelerators work.

I would be delighted if somebody would like to pick up analyzing the BIT
processor ISA further. I think it could be fruitful to start
systematically throwing instructions at it and see what happens, to
learn more. I haven't had much motivation to play with this, recently.

About the internal connections and available accelerator units, there is
a block diagram in the i.MX53 TRM, but I am not aware of any register
level description for any of these.

regards
Philipp
