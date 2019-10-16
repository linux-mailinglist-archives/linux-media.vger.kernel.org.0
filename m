Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6364D950A
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 17:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404746AbfJPPIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 11:08:05 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47429 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfJPPIE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 11:08:04 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iKkuA-0007tm-42; Wed, 16 Oct 2019 17:08:02 +0200
Message-ID: <a020830817e4be787067aa82d56331979d80f53e.camel@pengutronix.de>
Subject: Re: [PATCH] media: uapi: h264: clarify
 num_ref_idx_l[01]_(default_)active fields
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Date:   Wed, 16 Oct 2019 17:08:00 +0200
In-Reply-To: <20191016133756.GB325584@aptenodytes>
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
         <20191003211247.GC3927@aptenodytes>
         <CAAFQd5BG5_up_Ov7GU3qcB5NCjWcnP4Da0GKWJTuRzGr-WEa4g@mail.gmail.com>
         <20191005133920.GB19943@aptenodytes>
         <CAAFQd5AE8=bzQH+i4EoKYpB8RkprnWEAW0=8xS=fCa7Y4Hsfaw@mail.gmail.com>
         <20191005141228.GC19943@aptenodytes>
         <CAAFQd5BTff65TyMbLi+L8ejmC7CchRMt-iZ7mQnBuZn117ARvQ@mail.gmail.com>
         <20191016133756.GB325584@aptenodytes>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-10-16 at 15:37 +0200, Paul Kocialkowski wrote:
[...]
> > > The bottomline is that we have use cases for each of the two set of fields
> > > independently, so I feel like this is reason enough to avoid mixing them
> > > together.
> > 
> > What do you mean by mixing together? Hardware parsing the slices
> > always uses num_ref_idx_l[01]_default_active_minus1 from the PPS.
> > Hardware not parsing the slices always sets override to 1 and uses
> > num_ref_idx_l[01]_active_minus1 from the slice header struct.
> 
> To summarize, what I don't understand is why it's worth re-purposing
> the slice header's num_ref_idx_l[01]_active_minus1 to contain
> num_ref_idx_l[01]_default_active_minus1 when the flag is not set in the initial
> bitstream instead of exposing the flag.
> 
> There's hardware (like cedrus) which takes both fields and the flag directly
> in-registers, so it's really not a simplification here. And even in cases where
> the hardware only takes one field, I believe that the downside of re-purposing
> the field of the control is much greater than the benefit of the supposed
> simplification.
> 
> I know this sounds quite futile, but I thought there was an implicit agreement
> that controls must stick as close as possible to the bitstream. This is an
> occurence where we are diverging for no particularly strong reason.

FWIW, I agree with Paul on this. That drivers for codecs which do not
parse the slice headers always completely ignore the
num_ref_idx_l[01]_default_active_minus1 fields, but instead expect the
num_ref_idx_l[01]_active_minus1 field to be repurposed to contain the
default values if the corresponding fields do not exist in the slice
header (that is, when the num_ref_idx_active_override_flag is not set),
confused me at first [1].

This seems to follow what libva does [2], and it does simplify drivers a
tiny bit, but I'd still prefer to explicitly have the
num_ref_idx_active_override_flag contained in the API, and to have the
num_ref_idx_l[01]_active_minus1 fields only be used for
num_ref_idx_l[01]_active_minus1, and not have them sometimes contain the
values of another field.

[1] https://patchwork.linuxtv.org/patch/58580/
[2] https://github.com/intel/libva/blob/95eb8cf469367b532b391042fa0e77ca513ac94e/va/va.h#L3138

> Expecting that userspace does this pre-processing of fields feels quite
> counter-intuitive and confusing for people wishing to use the API, too.
> One would certainly naively expect that the fields in the controls carry the
> same meaning as in the bitstream when they have the same name.

I certainly naively did.

regards
Philipp

