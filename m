Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC771ABA15
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 09:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439279AbgDPHhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 03:37:14 -0400
Received: from mga12.intel.com ([192.55.52.136]:36870 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438944AbgDPHhL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 03:37:11 -0400
IronPort-SDR: fm0iQoZlEs3SasQhr4hLu+U6mGFC73z/uTc7Q+Gj0VHSTBr5wScJQ+kHhY5lfM16A5pWSbUs1s
 ip5XWr9XxA9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 00:37:09 -0700
IronPort-SDR: JSs5XqYvRxe95HeI+yChSVyHIIMNxTUkZGv/75FB8wSHcgADMcQ1NV1ERM2Wc0Tr+WrVXIhtRv
 ng83PCOpKBSQ==
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="276103752"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 00:37:07 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A5234205F7; Thu, 16 Apr 2020 10:37:05 +0300 (EEST)
Date:   Thu, 16 Apr 2020 10:37:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2 1/4] staging: imgu: Address a compiler warning on
 alignment
Message-ID: <20200416073705.GH27762@paasikivi.fi.intel.com>
References: <20190301112400.24339-1-sakari.ailus@linux.intel.com>
 <20190301112400.24339-2-sakari.ailus@linux.intel.com>
 <CAAFQd5AZgXV-2isW7Ra=4fhJ6RE2_WA_DxGgjZy+3vGgGR2i3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5AZgXV-2isW7Ra=4fhJ6RE2_WA_DxGgjZy+3vGgGR2i3Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Sat, Apr 11, 2020 at 06:50:55PM +0200, Tomasz Figa wrote:
> Hi Sakari,
> 
> On Fri, Mar 1, 2019 at 12:24 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Address a compiler warnings on alignment of struct ipu3_uapi_awb_fr_config_s
> > by adding __attribute__((aligned(32))) to a struct member of that type as
> > well.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Tested-by: Rajmohan Mani <rajmohan.mani@intel.com>
> > ---
> >  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > index eb6f52aca9929..4a0e97b0cfd2b 100644
> > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > @@ -2472,7 +2472,7 @@ struct ipu3_uapi_acc_param {
> >         struct ipu3_uapi_yuvp1_yds_config yds2 __attribute__((aligned(32)));
> >         struct ipu3_uapi_yuvp2_tcc_static_config tcc __attribute__((aligned(32)));
> >         struct ipu3_uapi_anr_config anr;
> > -       struct ipu3_uapi_awb_fr_config_s awb_fr;
> > +       struct ipu3_uapi_awb_fr_config_s awb_fr __attribute__((aligned(32)));
> >         struct ipu3_uapi_ae_config ae;
> >         struct ipu3_uapi_af_config_s af;
> >         struct ipu3_uapi_awb_config awb;
> > --
> > 2.11.0
> >
> 
> I don't know how this patch was tested, but for me it breaks the
> layout of the ipu3_uapi_acc_param struct. The result is that awb_fr is
> moved from offset 37656 to 36768 and so everything else is shifted
> too. The end result is "set parameters failed" when the userspace
> tries to queue a parameter buffer.

Thanks for reporting this.

Unlike recent patches touching the struct, I didn't test (obviously) this
one with pahole.

> 
> To be honest, I don't like how alignments are used to define the ABI
> layout. Since these are definitions specified by the IMGU firmware,
> I'd suggest removing any compiler alignments, making all the structs
> packed and adding explicit padding in terms of u8 arrays, which is the
> proper way to enforce a specific binary layout.

The current use of __aligned(32) with __packed especially makes this
cumbersome and risky. __packed alone is necessary.

I'll send patches to address the alignment issue; converting to use
reserved fields would be quite a bit more work.

Similar changes should be done to ipu3-abi.h as well, but it appears to
have been less problematic so far.

> 
> Following is the relevant snippet from a diff of pahole output before
> and after this patch:
> 
> --- pahole.good      2020-04-11 16:40:18.706133867 +0000
> +++ pahole.bad      2020-04-11 16:29:48.513110117 +0000
> @@ -7353,29 +7349,27 @@ // struct ipu3_uapi_acc_param {
>         struct ipu3_uapi_anr_config anr;                 /* 36020   736 */
> 
>         /* XXX last struct has 24 bytes of padding */
> +       /* XXX 12 bytes hole, try to pack */
> 
> -       /* --- cacheline 574 boundary (36736 bytes) was 20 bytes ago --- */
> -       struct ipu3_uapi_awb_fr_config_s awb_fr
> __attribute__((__aligned__(32))); /* 36756    32 */
> -       struct ipu3_uapi_ae_config ae;                   /* 36788   480 */
> +       /* --- cacheline 574 boundary (36736 bytes) was 32 bytes ago --- */
> +       struct ipu3_uapi_awb_fr_config_s awb_fr
> __attribute__((__aligned__(32))); /* 36768    32 */
> +       /* --- cacheline 575 boundary (36800 bytes) --- */
> +       struct ipu3_uapi_ae_config ae;                   /* 36800   480 */
> 
>         /* XXX last struct has 24 bytes of padding */
> 
> -       /* --- cacheline 582 boundary (37248 bytes) was 20 bytes ago --- */
> -       struct ipu3_uapi_af_config_s af;                 /* 37268    96 */
> +       /* --- cacheline 582 boundary (37248 bytes) was 32 bytes ago --- */
> +       struct ipu3_uapi_af_config_s af;                 /* 37280    96 */
> 
>         /* XXX last struct has 20 bytes of padding */
> 
> -       /* --- cacheline 583 boundary (37312 bytes) was 52 bytes ago --- */
> -       struct ipu3_uapi_awb_config awb;                 /* 37364    32 */
> -
> -       /* Force padding: */
> -       struct ipu3_uapi_awb_config :256;
> +       /* --- cacheline 584 boundary (37376 bytes) --- */
> +       struct ipu3_uapi_awb_config awb;                 /* 37376    32 */
> 
>         /* size: 37408, cachelines: 585, members: 21 */
> -       /* sum members: 37152, holes: 13, sum holes: 244 */
> -       /* padding: 12 */
> +       /* sum members: 37152, holes: 14, sum holes: 256 */
>         /* paddings: 3, sum paddings: 68 */
> -       /* forced alignments: 16, forced holes: 13, sum forced holes: 244 */
> +       /* forced alignments: 16, forced holes: 14, sum forced holes: 256 */
>         /* last cacheline: 32 bytes */
>  };
> 

-- 
Regards,

Sakari Ailus
