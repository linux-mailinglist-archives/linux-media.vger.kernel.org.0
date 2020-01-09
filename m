Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97889135C6B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 16:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730772AbgAIPRi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 10:17:38 -0500
Received: from mailoutvs35.siol.net ([185.57.226.226]:42845 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727945AbgAIPRi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 10:17:38 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 36512522197;
        Thu,  9 Jan 2020 16:17:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id YnHQAfJSkglZ; Thu,  9 Jan 2020 16:17:33 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id C701F5221AA;
        Thu,  9 Jan 2020 16:17:33 +0100 (CET)
Received: from jernej-laptop.localnet (unknown [194.6.237.34])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 1B75F522197;
        Thu,  9 Jan 2020 16:17:32 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     mripard@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org,
        wens@csie.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] media: uapi: hevc: Add scaling matrix control
Date:   Thu, 09 Jan 2020 16:17:31 +0100
Message-ID: <3030664.44csPzL39Z@jernej-laptop>
In-Reply-To: <20200108144336.GB229960@aptenodytes>
References: <20191213160428.54303-1-jernej.skrabec@siol.net> <20200108151157.17cf9774@kernel.org> <20200108144336.GB229960@aptenodytes>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne sreda, 08. januar 2020 ob 15:43:36 CET je Paul Kocialkowski napisal(a):
> Hi Mauro,
> 
> On Wed 08 Jan 20, 15:11, Mauro Carvalho Chehab wrote:
> > Em Fri, 13 Dec 2019 17:04:25 +0100
> > 
> > Jernej Skrabec <jernej.skrabec@siol.net> escreveu:
> > > HEVC has a scaling matrix concept. Add support for it.
> > > 
> > > +struct v4l2_ctrl_hevc_scaling_matrix {
> > > +	__u8	scaling_list_4x4[6][16];
> > > +	__u8	scaling_list_8x8[6][64];
> > > +	__u8	scaling_list_16x16[6][64];
> > > +	__u8	scaling_list_32x32[2][64];
> > > +	__u8	scaling_list_dc_coef_16x16[6];
> > > +	__u8	scaling_list_dc_coef_32x32[2];
> > > +};
> > 
> > I never looked at HEVC spec, but the above seems really weird.
> > 
> > Please correct me if I am wrong, but each of the above matrixes
> > is independent, and the driver will use just one of the above on
> > any specific time (for a given video output node), right?
> 
> I am not too sure about what the specification really entails, but it is my
> understanding that HEVC allows simultaneous block sizes between 4x4 and
> 32x32 to exist within the same coding tree and slice. That suggests that it
> makes sense to have specific coefficients for each case.

Specs ITU-T REC. H.265 (06/2019), chapter 7.3.4 shows that multiple different 
matrices can be present at the same time. If they are not, default values 
should be used instead. But in general, more than one can be needed at the 
same time.

Only real question is if default values should be also provided by userspace 
or by kernel. Since place has to be reserved for all different scaling lists 
anyway, we won't save any space by providing default values in kernel. Cedrus 
VPU has only bit switch for using default values for all matrices at the same 
time or all custom.

Note that this control contains slightly processed data. Frame has stored 
these matrices in form of deltas. But because this is the only driver that use 
this structure I have no idea what is the most proper form of this data (raw 
values or deltas). That's why this will stay in staging using private headers 
until we figure this out.

Best regards,
Jernej

> 
> Note that the hardware also has distinct registers for each scaling list.
> 
> Cheers,
> 
> Paul
> 
> > If so, why would userspace be forced to update lots of matrixes, if would
> > likely use just one at a given time?
> > 
> > IMO, the proper way would be, instead, to use an uAPI like:
> > 
> > /*
> > 
> >  * Actually, as this is uAPI, we will use a fixed size integer type, like
> >  *  unsigned int
> >  */
> > 
> > enum hevc_scaling_matrix_type {
> > 
> > 	HEVC_SCALING_MATRIX_4x4,
> > 	HEVC_SCALING_MATRIX_8x8,
> > 
> > ...
> > 
> > 	HEVC_SCALING_MATRIX_DC_COEF_32x32,
> > 
> > };
> > 
> > struct v4l2_ctrl_hevc_scaling_matrix {
> > 
> > 	__u32	scaling_type 		/* as defined by enum 
hevc_scaling_matrix_type */
> > 	
> > 	union {
> > 	
> > 		__u8	scaling_list_4x4[6][16];
> > 		__u8	scaling_list_8x8[6][64];
> > 		__u8	scaling_list_16x16[6][64];
> > 		__u8	scaling_list_32x32[2][64];
> > 		__u8	scaling_list_dc_coef_16x16[6];
> > 		__u8	scaling_list_dc_coef_32x32[2];
> > 	
> > 	};
> > 
> > };
> > 
> > And let the core use a default for each scaling matrix, if userspace
> > doesn't set it.
> > 
> > 
> > 
> > Cheers,
> > Mauro




