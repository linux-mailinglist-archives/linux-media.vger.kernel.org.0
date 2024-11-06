Return-Path: <linux-media+bounces-21015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB149BED4B
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 14:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C59D1C2406F
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 13:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054B11F8EE6;
	Wed,  6 Nov 2024 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iF+f2JrO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6891F8EE3;
	Wed,  6 Nov 2024 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730898287; cv=none; b=Ny/KlYp0RRxz/qW1tca17KLw4HqIiXssjMfuEeQaB9YasI3xy9UxC058scXTb/Qq13zi0b2aMMy/TkkxCg4md0+aK/VWDpzuaUiZk86Y9cq1QkhsbbnO1PDlLVZ3EhysYUDdlysaz06ckVq9mK2cfbSe+dOlWQ/Vaz+xcIHxsO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730898287; c=relaxed/simple;
	bh=682rZ4W8M3E5mVOEB3/2mrEAAw15OgHnlpXKz526rA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RT6qeKQu3qb/bgAre/5lwbFpw4qcwI+cex6T6xwggSgPHPX+0q6iYRxt6sAHZukRr5VuEB5V6GxnllTcp6Ff7WxhngOihH/Ow6EVrXQ/hlRZIDUN9NH4T/2q1I643lwh2QXB2+WS4eNxmfXg4SViHCSXLPCnD7mWs7hva8+XlGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iF+f2JrO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B6BA475;
	Wed,  6 Nov 2024 14:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730898275;
	bh=682rZ4W8M3E5mVOEB3/2mrEAAw15OgHnlpXKz526rA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iF+f2JrOf8LKiTjHV1UChMRbmf6ckq9rA1BPUFp1xg1DRGXF+rkuI5950BTGfwpL+
	 Yu4AWc7mmgpAU2nekPMMSN1CPfv8fof6p/lUxd1J/aU5O1aWQByo6hUgRFK9fVFltt
	 vI+mieU5JY7lKw6pBcmWAlmuai8Wap7Qb23EoTFI=
Date: Wed, 6 Nov 2024 15:04:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shu-hsiang Yang =?utf-8?B?KOaliuiIkue/lCk=?= <Shu-hsiang.Yang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Yaya Chang =?utf-8?B?KOW8tembhea4hSk=?= <Yaya.Chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Teddy Chen =?utf-8?B?KOmZs+S5vuWFgyk=?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"hidenorik@chromium.org" <hidenorik@chromium.org>,
	Shun-Yi Wang =?utf-8?B?KOeOi+mghuWEhCk=?= <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 10/10] uapi: linux: add mediatek isp_7x camsys user api
Message-ID: <20241106130437.GA16791@pendragon.ideasonboard.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-11-Shu-hsiang.Yang@mediatek.com>
 <ff96b314cdd3d52a14a5e91f79ec3097d04c4380.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff96b314cdd3d52a14a5e91f79ec3097d04c4380.camel@mediatek.com>

On Mon, Oct 14, 2024 at 05:56:40AM +0000, CK Hu (胡俊光) wrote:
> Hi, Shu-hsiang:
> 
> On Wed, 2024-10-09 at 19:15 +0800, Shu-hsiang Yang wrote:
> > Add UAPI for MediaTek ISP platform, providing user-space
> > interfaces for the new camsys driver.
> > 
> > Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +/* MTK ISP camsys controls */
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE_LIMIT	(V4L2_CID_USER_MTK_CAM_BASE + 1)
> > +#define V4L2_CID_MTK_CAM_BIN_LIMIT		(V4L2_CID_USER_MTK_CAM_BASE + 2)
> > +#define V4L2_CID_MTK_CAM_FRZ_LIMIT		(V4L2_CID_USER_MTK_CAM_BASE + 3)
> > +#define V4L2_CID_MTK_CAM_RESOURCE_PLAN_POLICY	(V4L2_CID_USER_MTK_CAM_BASE + 4)
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE		(V4L2_CID_USER_MTK_CAM_BASE + 5)
> > +#define V4L2_CID_MTK_CAM_BIN			(V4L2_CID_USER_MTK_CAM_BASE + 6)
> > +#define V4L2_CID_MTK_CAM_FRZ			(V4L2_CID_USER_MTK_CAM_BASE + 7)
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE_TRY	(V4L2_CID_USER_MTK_CAM_BASE + 8)
> > +#define V4L2_CID_MTK_CAM_BIN_TRY		(V4L2_CID_USER_MTK_CAM_BASE + 9)
> > +#define V4L2_CID_MTK_CAM_FRZ_TRY		(V4L2_CID_USER_MTK_CAM_BASE + 10)
> > +#define V4L2_CID_MTK_CAM_PIXEL_RATE		(V4L2_CID_USER_MTK_CAM_BASE + 11)
> > +#define V4L2_CID_MTK_CAM_FEATURE		(V4L2_CID_USER_MTK_CAM_BASE + 12)
> > +#define V4L2_CID_MTK_CAM_SYNC_ID		(V4L2_CID_USER_MTK_CAM_BASE + 13)
> > +#define V4L2_CID_MTK_CAM_RAW_PATH_SELECT	(V4L2_CID_USER_MTK_CAM_BASE + 14)
> > +#define V4L2_CID_MTK_CAM_HSF_EN			(V4L2_CID_USER_MTK_CAM_BASE + 15)
> > +#define V4L2_CID_MTK_CAM_PDE_INFO		(V4L2_CID_USER_MTK_CAM_BASE + 16)
> > +#define V4L2_CID_MTK_CAM_MSTREAM_EXPOSURE	(V4L2_CID_USER_MTK_CAM_BASE + 17)
> > +#define V4L2_CID_MTK_CAM_RAW_RESOURCE_CALC	(V4L2_CID_USER_MTK_CAM_BASE + 18)
> > +#define V4L2_CID_MTK_CAM_TG_FLASH_CFG		(V4L2_CID_USER_MTK_CAM_BASE + 19)
> > +#define V4L2_CID_MTK_CAM_RAW_RESOURCE_UPDATE	(V4L2_CID_USER_MTK_CAM_BASE + 20)
> > +#define V4L2_CID_MTK_CAM_CAMSYS_HW_MODE		(V4L2_CID_USER_MTK_CAM_BASE + 21)
> > +
> 
> Please give introduction of how to use these user space interface.

I'm very, very *not* thrilled by all this. It looks like a big pile of
hacks really. Every single parameter used by those controls needs to be
clearly documented, including explaining how they are used, in order for
us to review the API. I suspect that many of the parameters should
instead be handled through the ISP parameters buffers, or be controlled
from standard V4L2 APIs.

-- 
Regards,

Laurent Pinchart

