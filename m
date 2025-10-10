Return-Path: <linux-media+bounces-44171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB483BCCB7B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 13:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 836B64E2CD9
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083802EDD6C;
	Fri, 10 Oct 2025 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HLgTreB5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B7E24167A;
	Fri, 10 Oct 2025 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760094875; cv=none; b=JjN9FyXeKqT1gBe2lOHp+l7LTVVfBtDLuM5TE6ApdQluc7ZjS6l4XvyCxQNzabWFyGr7Mx+04EbDkIirfn8pPeL91oDxs7g1VssLCPFNujy0MGXBJAiK4yjiMvSJlkvyQN5q1fVuMB5rVgbNjVS4r/GwL8Zrrtx4KeR94WDeXd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760094875; c=relaxed/simple;
	bh=mmFDUXArGPtUvHOrQ2jILNGevxhRGaAHHeRtvHFSaC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAI3StZNvXTGdyjiY57fV5eh04XMv6/5ig8Ep3d1FVayUa6o/tK3imZknh4nvsnqE6sPDNBgijsEANac+h8MB760IIsh0xEtbFkuGvsUUS0VD3x1psxclFEzgfDm0PjqTiMETyi18JjYREa/OaqGIBPmvxlkXYCuO1WOTkwOhu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HLgTreB5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B6669593;
	Fri, 10 Oct 2025 13:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760094777;
	bh=mmFDUXArGPtUvHOrQ2jILNGevxhRGaAHHeRtvHFSaC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLgTreB5qJ4zGZIoixBsQONAUL0bBsvHKS2AswtZL8lQc/ptIceK/L+nCVw+3hqVl
	 mFy5oAYm/h7eYoyxsOV7hUy5V24KDOKxW+El1qNpnq5W60ZHmtnRZxiTsXuqOfU6Yj
	 Vo646t9o/Afhki6gLZCP0OVj1S5qeJ1Svyr+jIp4=
Date: Fri, 10 Oct 2025 14:14:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 15/25] media: qcom: iris: Drop unneeded v4l2_m2m_get_vq()
 NULL check
Message-ID: <20251010111424.GA28598@pendragon.ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-16-laurent.pinchart@ideasonboard.com>
 <e9e353e5-76b4-49a1-e845-c8fb3be91a62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9e353e5-76b4-49a1-e845-c8fb3be91a62@oss.qualcomm.com>

Hi Dikshita,

On Thu, Oct 09, 2025 at 07:23:20PM +0530, Dikshita Agarwal wrote:
> On 10/8/2025 11:20 PM, Laurent Pinchart wrote:
> > The v4l2_m2m_get_vq() function never returns NULL. The check may have
> > been intended to catch invalid format types, but that's not needed as
> > the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> > the format type, so the type can't be incorrect. Drop the unneeded
> > return value check.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_vdec.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> > index d670b51c5839..1e9ffdbb6e18 100644
> > --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> > +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> > @@ -191,8 +191,6 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
> >  	u32 codec_align;
> >  
> >  	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> > -	if (!q)
> > -		return -EINVAL;
> >  
> >  	if (vb2_is_busy(q))
> >  		return -EBUSY;
> 
> The same change would be required for iris_venc.c as well which is part of
> linux-next[1]

Thank you for noticing. I'll rebase this series on v6.18-rc1 once it
gets released and will make sure iris_venc.c is addressed.

> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/media/platform/qcom/iris/iris_venc.c#n271

-- 
Regards,

Laurent Pinchart

