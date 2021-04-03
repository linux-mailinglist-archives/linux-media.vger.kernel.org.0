Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5815D3534E1
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 19:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236866AbhDCRSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 13:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236364AbhDCRSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 13:18:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948FCC0613E6;
        Sat,  3 Apr 2021 10:18:05 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9018F1F457AA
Message-ID: <59328f10f03f9bf20ba0d1fbc2b4e7657e782c92.camel@collabora.com>
Subject: Re: [PATCH v4 1/9] media: uapi: mpeg2: Rework quantization matrices
 semantics
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>
Date:   Sat, 03 Apr 2021 14:17:49 -0300
In-Reply-To: <6488f83a1a46c43991d239137c26c40817b3e459.camel@collabora.com>
References: <20210329181329.48006-1-ezequiel@collabora.com>
         <20210329181329.48006-2-ezequiel@collabora.com>
         <6488f83a1a46c43991d239137c26c40817b3e459.camel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Mon, 2021-03-29 at 16:53 -0400, Nicolas Dufresne wrote:
> Le lundi 29 mars 2021 à 15:13 -0300, Ezequiel Garcia a écrit :
> > As stated in the MPEG-2 specification, section 6.3.7 "Quant matrix
> > extension":
> > 
> >   Each quantisation matrix has a default set of values. When a
> >   sequence_header_code is decoded all matrices shall be reset to
> >   their default values. User defined matrices may be downloaded
> >   and this can occur in a sequence_header() or in a
> >   quant_matrix_extension().
> > 
> > The load_intra_quantiser_matrix syntax elements are transmitted
> > in the bistream headers, signalling that a quantization matrix
>                                              quantisation
> 
> Not really a typo, just a suggestion to follow the specification spelling. I
> would like to see concistant spelling the API. My rational is that you can copy
> and paste the strings when searching inside the specification PDF, and you don't
> mix both in the API like we do now.
> 

Absolutely. Thanks for spotting this.

> > needs to be loaded and used for pictures transmitted afterwards
> > (until the matrices are reset).
> > 
> > These "load" semantics are implemented in the V4L2 interface
> > without the need of any "load" flags: passing the control
> > is effectively a load.
> > 
> > Therefore, rework the V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION
>                                                         S
> 
> > semantics to match the MPEG-2 semantics. Quantization matrices
>                                                  s
> 
> etc.
> 
> > values are now initialized by the V4L2 control core to their
> > reset default value, and applications are expected to reset
> > their values as specified.
> > 
> > The quantization control is therefore optional, and used to
> > load bitstream-defined values in the quantization matrices.
> 
> Perhaps:
> 
> "The quantisation controls is therefore optional for decoding streams that uses
> the default matrices."
> 
> A stack that would not handle the default, would have to read the control at
> least once in order to avoid overriding valid values with 0s, not sure if that
> is worth mentioning ?
> 

Hm, not entirely sure. If application calls S_EXT_CTRL with 0s,
then that's what will happen.

Thanks,
Ezequiel

