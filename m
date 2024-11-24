Return-Path: <linux-media+bounces-21867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F819D6CC3
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 07:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A19161817
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 06:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40120186E20;
	Sun, 24 Nov 2024 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gwez3x7C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F228C8828;
	Sun, 24 Nov 2024 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732428733; cv=none; b=Lza4tFauPTGBx+hY4DW9AsuJI6MUL5vJYqtKum7pWGX1BLu0WBBj9h0bHQMCDGNWEO/t5STZf8PiirUvPriOi8NiD3ZxLqmxSjI+ZFkiUgJkNIS3flPjMkTyAZENV0XUGAyp92qhbeCk6uShZv9jUC0HGR5wxFi7vGiESMJUWP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732428733; c=relaxed/simple;
	bh=B83l0SEiWv+6jdMr62dgC5qObjxKWmfUpCeu4JzKH+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY4mJkoipPuLcHHXKLsYegVj3jetMQ0AZFhfry3InPw4L/jmhG3cPNXGHiXQBy2IspMOgTcPMftZ3mVbqwsVIbYhnVWlBY6oG8OEXakQoeHnzSgIJCTEa+Hzv5NJbPG2pAOsor3U/94y+lBvu8XqKsgl1NoE165y29SFOddHIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gwez3x7C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC9C4581;
	Sun, 24 Nov 2024 07:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732428708;
	bh=B83l0SEiWv+6jdMr62dgC5qObjxKWmfUpCeu4JzKH+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gwez3x7Ci7s62mg6glT8BrBJ1hX/Y5lCRXf18R2xDvm5CkQdb1tu8cqfEDKbBIgpH
	 +CILQu6nfdTyaA27+ATbrbnTdbXNe413uopKH5zPORpWipJjq2iNm2xZtaaLD2LAQ0
	 L24/BAvt91/tJyu7kTYaODTaA0Zuv1jv5BMDrj9o=
Date: Sun, 24 Nov 2024 08:11:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: Julien Stephan <jstephan@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241124061159.GD19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <85ab1984c04b1eddbea71006ab5d95cb4333d838.camel@mediatek.com>
 <CAEHHSvaEzCGZt3GpKBNDGUphetR7JWfJ7SZfvAU=O-3M4WZY7w@mail.gmail.com>
 <1136391c4cf4067a4cac77da8490e1e009808b8d.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1136391c4cf4067a4cac77da8490e1e009808b8d.camel@mediatek.com>

On Fri, Nov 22, 2024 at 09:28:53AM +0000, CK Hu (胡俊光) wrote:
> On Fri, 2024-11-22 at 10:16 +0100, Julien Stephan wrote:
> > Le ven. 22 nov. 2024 à 08:54, CK Hu (胡俊光) a écrit :
> > > On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > > > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > > >
> > > >
> > > > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > >
> > > > This driver provides a path to bypass the SoC ISP so that image data
> > > > coming from the SENINF can go directly into memory without any image
> > > > processing. This allows the use of an external ISP.
> > > >
> > > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > > [Paul Elder fix irq locking]
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > >
> > > [snip]
> > >
> > > > +static void mtk_cam_cmos_vf_enable(struct mtk_cam_dev *cam_dev,
> > > > +                                  bool enable, bool pak_en)
> > > > +{
> > > > +       if (enable)
> > > > +               cam_dev->hw_functions->mtk_cam_cmos_vf_hw_enable(cam_dev);
> > >
> > > Directly call mtk_camsv30_cmos_vf_hw_enable().
> > > This has discussed in previous version [1].
> > >
> > > [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com/
> >
> > Hi CK,
> >
> > I forgot about that discussion sorry :/
> > I guess you want me to completely remove the  mtk_cam_hw_functions struct?
> > In that case, what do you prefer:
> > - keep mtk_camsv30_hw.c and put signatures in mtkcamsv30_hw.h and
> > include mtk_camsv30_hw.h in mtk_camsv_video.c
> > - rename mtk_camsv30_hw.c to mtk_camsv_hw.c (and all functions) and
> > put signatures in mtk_camsv_hw.h
> 
> I prefer the second one.

If we drop the indirection (which I think is a good idea until we get a
second hardware generation supported by the same driver) I would also go
for the latter.

> > > > +       else
> > > > +               cam_dev->hw_functions->mtk_cam_cmos_vf_hw_disable(cam_dev);
> > > > +}
> > > > +
> > > >

-- 
Regards,

Laurent Pinchart

