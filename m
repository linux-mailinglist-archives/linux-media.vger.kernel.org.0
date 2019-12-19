Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4782126311
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 14:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfLSNNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 08:13:09 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60744 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfLSNNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 08:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=b19D01GW7IXrWH+vRY+lZyneOZ5z2vaIf8i+GrPkBEM=; b=XRfXw9hHABlpSPXTnRE07e4g4
        616KoKvB7Mfzg2lB/qJw4qpA2ebyJXlI/MJsta/Qi0kSnjR5nXoHZMzLrc0vr4qflOSWXVnAGcO3f
        yWgEAWOYausRXmkyYu7luYnqpv9zFIy/u5DuhGbICcqYjKUhMKQNezcxpQ4J3XFh4mFViPmLnDuVt
        uPiZhfJBXUrfTHk3uLvZkzxYP9aJLino1at/QtuIq0u+Ad8U5JnFTue3ePctY3QWQmGgJ4NujSNDF
        AsDCimahXmrm9mddPk/eXdpGRmDCUrs2lXP7V7fn5tBLfVNxJvbPd3eQAEVe5ZdQMRdoo1mED7asm
        HGxOIEliA==;
Received: from x2f7fbd9.dyn.telefonica.de ([2.247.251.217] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ihvc0-0000XR-R7; Thu, 19 Dec 2019 13:13:05 +0000
Date:   Thu, 19 Dec 2019 14:13:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Antti Palosaari <crope@iki.fi>
Cc:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 04/14] si2157: Add analog tuning related functions
Message-ID: <20191219141300.3ffbdb1e@kernel.org>
In-Reply-To: <f2375be1-5bb2-ef59-ecd9-a3a8f6081b99@iki.fi>
References: <20191114200408.28883-1-brad@nextdimension.cc>
        <20191114200408.28883-5-brad@nextdimension.cc>
        <f2375be1-5bb2-ef59-ecd9-a3a8f6081b99@iki.fi>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 24 Nov 2019 07:09:07 +0200
Antti Palosaari <crope@iki.fi> escreveu:

> On 11/14/19 10:03 PM, Brad Love wrote:
> > Include set_analog_params, get_frequency, and get_bandwidth.
> > 
> > Tested with NTSC and PAL standards via ch3/4 generator. Other standards
> > are included, but are untested due to lack of generator.
> > 
> > Signed-off-by: Brad Love <brad@nextdimension.cc>
> > ---
> > Changes since v1:
> > - remove __func__ from dev_dbg macros  
> 
> After all it looks pretty simply, but implementation is not done that 
> simply. Crazy RF/IF offsets, impossible values and so.
> 
> I think you need to study some tuner basics:
> * what IF frequency is, why, and so
> * IF vs. BW, what is relation, what are possible values
> * Down conversion RF to IF. OK, *on that case* firmware covers PLL, but 
> it is fundamental. So basics of integer-N and fractional-N PLL is always 
> you must to know.
> * Filtering. Especially IF filtering, which is generally low-pass 
> filtering. Think possible filters when selecting IF.

For me, the implementation seems to make sense. I mean, for analog TV, both
channel bandwidth and chroma/audio sub-carrier IF depends on the TV standard
only.

So, for NTSC and PAL/M/N/N', bandwidth is always 6MHz. For other standards, it
may be either 6MHz, 7MHz or 8MHz. the actual bandwidth depends if it is
a channel at VHF or at UHF range.

So, this part of the patch sounds OK to me.

The IF is actually a little trickier. Yet, if you take a lok on other
tuners, like drivers/media/tuners/tda827x.c, it is up tot he tuner to
automatically set the IF that will work for each video standard:

static void tda827x_set_std(struct dvb_frontend *fe,
			    struct analog_parameters *params)
{
	struct tda827x_priv *priv = fe->tuner_priv;
	char *mode;

	priv->lpsel = 0;
	if (params->std & V4L2_STD_MN) {
		priv->sgIF = 92;
		priv->lpsel = 1;
		mode = "MN";
	} else if (params->std & V4L2_STD_B) {
		priv->sgIF = 108;
		mode = "B";
...

static int tda827xo_set_analog_params(struct dvb_frontend *fe,
				      struct analog_parameters *params)
{

...

	N = freq + priv->sgIF;

In other words, for analog TV, the tuner will always receive the 
channel central frequency, with may vary depending on the video
standard, and will adjust it to tune at the right channel, using the
per-standard IF (if needed), as, on most tuner drivers, the tunning
frequency should be either initial frequency or the main carrier
frequency, and not the center frequency.


Cheers,
Mauro
