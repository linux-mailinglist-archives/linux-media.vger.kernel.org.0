Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B173DB518
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 10:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238009AbhG3Ihl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 04:37:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:34958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230285AbhG3Ihl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 04:37:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE1B760F6B;
        Fri, 30 Jul 2021 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627634256;
        bh=DTpglHmXKXbKluct01aDVZ1dxfkxjsh42N5aehKR9Rw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WMCQWW6aFx/dz9ZgTZwV8OMq4XoL07U/pp9qTgPiD0WU731WK58/THpK69POPQaoD
         bx7FZgutrYCniJ8c4+6++AbWWjWKYghYONEGfAmLAuqDK7BNFCy/jgKpg+9J5nPOBR
         D+zUYXi+/Xsnqs9+P8BqOHhRnwMjNamw4sBM1JEEwDdgnDGbcABUVb4c8GlknGFTMR
         G1xOzRDSghQSDsO6GLHN1PPG7tXls3FXFIPewfgl2WMubt836XIzcDWi8cyIyKi2iK
         9tBvUxbVI9aVO2USwYrfMThHhxCZvfsMYMoSCJB2AstYZPDUo8AXd9ma2+YV3UeFCg
         gkG4/qsNQBNVQ==
Date:   Fri, 30 Jul 2021 03:40:09 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2][next] media: staging/intel-ipu3: css: Replace
 one-element array and use struct_size() helper
Message-ID: <20210730084009.GA5422@embeddedor>
References: <cover.1627600430.git.gustavoars@kernel.org>
 <8db90c8f5124bbeab20af9c1314439da8f033184.1627600430.git.gustavoars@kernel.org>
 <20210730074950.GW1931@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210730074950.GW1931@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 30, 2021 at 10:49:50AM +0300, Dan Carpenter wrote:
> On Thu, Jul 29, 2021 at 06:22:40PM -0500, Gustavo A. R. Silva wrote:
> > There is a regular need in the kernel to provide a way to declare having
> > a dynamically sized set of trailing elements in a structure. Kernel code
> > should always use “flexible array members”[1] for these cases. The older
> > style of one-element or zero-length arrays should no longer be used[2].
> > 
> > Replace a one-element array with a flexible-array member in struct
> > imgu_fw_header and use the struct_size() helper.
> > 
> > This also helps with the ongoing efforts to globally enable
> > -Warray-bounds and get us closer to being able to tighten the
> > FORTIFY_SOURCE routines on memcpy().
> > 
> > [1] https://en.wikipedia.org/wiki/Flexible_array_member
> > [2] https://www.kernel.org/doc/html/v5.10/process/deprecated.html#zero-length-and-one-element-arrays
> > 
> > Link: https://github.com/KSPP/linux/issues/79
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-fw.c | 5 ++---
> >  drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
> > index ab021afff954..3b7df1128840 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-fw.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
> > @@ -127,9 +127,8 @@ int imgu_css_fw_init(struct imgu_css *css)
> >  	if (css->fw->size < sizeof(struct imgu_fw_header) ||
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Originally this was sizeof() the pointer which is clearly wrong.  Then
> patch 1 changed it to force that binary_header[] had at least one
> element, but now it's changed again to say that binary_header[] can have
> zero elements.  So either patch 1 or patch 2 is wrong.
> 
> I feel like the probably the correct fix is to just fold these two
> patches together and say that binary_header[] with zero elements is
> allowed.  But I don't know this code well.

Oops... I forgot to tag this one for stable, too. But it would probably
be better to fold both of these into a single patch as you suggest.

To me these two pieces of code suggest that binary_header[] should not
be declared as a one-element array, but a flexible one instead:

130                 if (sizeof(struct imgu_fw_bi_file_h) +
131                     css->fwp->file_header.binary_nr * sizeof(struct imgu_fw_info) >
132                     css->fw->size)
133                         goto bad_fw;
...
147                 for (i = 0; i < binary_nr; i++) {
148                         struct imgu_fw_info *bi = &css->fwp->binary_header[i];
...

Thanks
--
Gustavo
