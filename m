Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88F5AFC377
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfKNKAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:00:36 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52173 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNKAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:00:35 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iVBvW-0005vC-Is; Thu, 14 Nov 2019 11:00:34 +0100
Message-ID: <e33cbcc4a95e025563059a121a4472eb6fb1d269.camel@pengutronix.de>
Subject: Re: [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
Date:   Thu, 14 Nov 2019 11:00:31 +0100
In-Reply-To: <e65ca03c095c99dc8482e9c36dcd099b6c69fc38.camel@collabora.com>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
         <e65ca03c095c99dc8482e9c36dcd099b6c69fc38.camel@collabora.com>
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

Hi Ezequiel,

On Wed, 2019-11-13 at 16:42 -0300, Ezequiel Garcia wrote:
> Hi Philipp,
> 
> Thanks a lot for working on this. I'm so glad about
> both efforts: the CODA JPEG support and the JPEG
> helpers.
> 
> On Wed, 2019-11-13 at 16:05 +0100, Philipp Zabel wrote:
> > Hi,
> > 
> > as far as I can tell we currently have three JPEG header parsers in the
> > media tree (in the rcar_jpu, s5p-jpeg, and mtk-jpeg drivers). I would
> > like to add support for the CODA960 JPEG decoder to the coda-vpu driver
> > without adding yet another.
> > 
> > To this end, this patch series adds some common JPEG code to v4l2-core.
> > For now this just contains header parsing helpers (I have tried to keep
> > the terminology close to JPEG ITU-T.81) that should be usable for all of
> > the current drivers. In the future we might want to move JPEG header
> > generation for encoders and common quantization tables in there as well.
> > 
> 
> Indeed, moving encoders to use these helpers sounds like the right thing
> to do. IIRC, quantization tables are implementation defined, and not imposed
> by anything. I believe gspca drivers use some tables that don't follow
> any recomendation.

Right. I was just thinking of the default tables from Annex K.3. I'll
have to recheck what's up with the CODA q tables, but the Huffman tables
are identical between hantro_jpeg and coda-jpeg. I suppose we could make
the tables userspace controlled for those drivers that support arbitrary
ones.

> I guess it's fine to leave some drivers unconverted, without using any helpers,
> and move others to use a helper-derived quantization table.  

Agreed.

regards
Philipp

