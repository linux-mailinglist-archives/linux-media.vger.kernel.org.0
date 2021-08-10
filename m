Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922483E7D82
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 18:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbhHJQa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 12:30:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:52989 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229997AbhHJQa6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 12:30:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="195206802"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="195206802"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 09:30:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="638856731"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 09:30:33 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id EF95B20345;
        Tue, 10 Aug 2021 19:30:30 +0300 (EEST)
Date:   Tue, 10 Aug 2021 19:30:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hardening@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 1/2] media: staging/intel-ipu3: css: Fix wrong size
 comparison
Message-ID: <20210810163030.GJ3@paasikivi.fi.intel.com>
References: <cover.1627646101.git.gustavoars@kernel.org>
 <184d96f95d6261b1a91704eb68adbd0a2e1c2cc2.1627646101.git.gustavoars@kernel.org>
 <20210802060546.GL3@paasikivi.fi.intel.com>
 <3c9ac43d-09ca-e5d5-83a8-7b6d23928763@embeddedor.com>
 <20210810151852.GI3@paasikivi.fi.intel.com>
 <a5e19508-4d7a-ba63-7ac0-ed2e56bc3bc1@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5e19508-4d7a-ba63-7ac0-ed2e56bc3bc1@embeddedor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 11:26:14AM -0500, Gustavo A. R. Silva wrote:
> Hi Sakari,
> 
> Please, see my comments below...
> 
> On 8/10/21 10:18, Sakari Ailus wrote:
> > Hi Gustavo,
> > 
> > Apologies for the delay.
> > 
> > On Mon, Aug 02, 2021 at 08:46:20AM -0500, Gustavo A. R. Silva wrote:
> >> Hi Sakari,
> >>
> >> On 8/2/21 01:05, Sakari Ailus wrote:
> >>> Hi Gustavo,
> >>>
> >>> I missed you already had sent v2...
> >>>
> >>> On Fri, Jul 30, 2021 at 07:08:13AM -0500, Gustavo A. R. Silva wrote:
> >>>> There is a wrong comparison of the total size of the loaded firmware
> >>>> css->fw->size with the size of a pointer to struct imgu_fw_header.
> >>>>
> >>>> Fix this by using the right operand 'struct imgu_fw_header' for
> >>>> sizeof, instead of 'struct imgu_fw_header *' and turn binary_header
> >>>> into a flexible-array member. Also, adjust the relational operator
> >>>> to be '<=' instead of '<', as it seems that the intention of the
> >>>> comparison is to determine if the loaded firmware contains any
> >>>> 'struct imgu_fw_info' items in the binary_header[] array than merely
> >>>> the file_header (struct imgu_fw_bi_file_h).
> >>>>
> >>>> The replacement of the one-element array with a flexible-array member
> >>>> also help with the ongoing efforts to globally enable -Warray-bounds
> >>>> and get us closer to being able to tighten the FORTIFY_SOURCE routines
> >>>> on memcpy().
> >>>>
> >>>> Link: https://github.com/KSPP/linux/issues/79
> >>>> Link: https://github.com/KSPP/linux/issues/109
> >>>> Fixes: 09d290f0ba21 ("media: staging/intel-ipu3: css: Add support for firmware management")
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> >>>> ---
> >>>>
> >>>> It'd be just great if someone that knows this code better can confirm
> >>>> these changes are correct. In particular the adjustment of the
> >>>> relational operator. Thanks!
> >>>>
> >>>> Changes in v2:
> >>>>  - Use flexible array and adjust relational operator, accordingly.
> >>>
> >>> The operator was just correct. The check is just there to see the firmware
> >>> is at least as large as the struct as which it is being accessed.
> >>
> >> I'm a bit confused, so based on your reply to v1 of this series, this patch
> >> is now correct, right?
> >>
> >> The operator in v1 _was_ correct as long as the one-element array wasn't
> >> transformed into a flexible array, right?
> >>
> >> Notice that generally speaking flexible-array members don't occupy space in the
> >> containing structure:
> >>
> >> $ pahole -C imgu_fw_header drivers/staging/media/ipu3/ipu3-css-fw.o
> >> struct imgu_fw_header {
> >> 	struct imgu_fw_bi_file_h   file_header;          /*     0    72 */
> >> 	/* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
> >> 	struct imgu_fw_info        binary_header[] __attribute__((__aligned__(8))); /*    72     0 */
> >>
> >> 	/* size: 72, cachelines: 2, members: 2 */
> >> 	/* forced alignments: 1 */
> >> 	/* last cacheline: 8 bytes */
> >> } __attribute__((__aligned__(8)));
> >>
> >> $ pahole -C imgu_fw_header drivers/staging/media/ipu3/ipu3-css-fw.o
> >> struct imgu_fw_header {
> >> 	struct imgu_fw_bi_file_h   file_header;          /*     0    72 */
> >> 	/* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
> >> 	struct imgu_fw_info        binary_header[1] __attribute__((__aligned__(8))); /*    72  1200 */
> >>
> >> 	/* size: 1272, cachelines: 20, members: 2 */
> >> 	/* forced alignments: 1 */
> >> 	/* last cacheline: 56 bytes */
> >> } __attribute__((__aligned__(8)));
> >>
> >> So, now that the flexible array transformation is included in the same patch as the
> >> bugfix, the operator is changed from '<' to '<='
> > 
> > '<' is correct since you only need as much data as the struct you're about
> > to access is large, not a byte more than that. As Dan noted.
> > 
> > I think you could add a check for binary_nr is at least one.
> 
> If we need to check that binary_nr is at least one, then this would be the right
> change:
> 
>         css->fwp = (struct imgu_fw_header *)css->fw->data;
> -       if (css->fw->size < sizeof(struct imgu_fw_header *) ||
> +       if (css->fw->size < struct_size(css->fwp, binary_header, 1) ||
>             css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
>                 goto bad_fw;

There's already a check the space required for the array of binary_nr is
there. But not the number itself.

-- 
Sakari Ailus
