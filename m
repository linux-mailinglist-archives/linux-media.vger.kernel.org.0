Return-Path: <linux-media+bounces-58070-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGbCBAfC0mleagcAu9opvQ
	(envelope-from <linux-media+bounces-58070-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:11:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052339FB50
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D18E300F5D9
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 20:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751833822A6;
	Sun,  5 Apr 2026 20:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mNG9f3Dz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3C021146C;
	Sun,  5 Apr 2026 20:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775419894; cv=none; b=BISBakL5bfFF2e37cZ4jq2foQtUPqI6tViS+2LSiZBb58x2v3f4DWwAy+a1jF6ZJDKPae975oVArDKA982wo4LrG7FFos6Z/5GCXpT5OCvcv+AxHqZ7j90p8bJ3wMPoFoWLLcNryvTbnm8oQXolks+PSKlcNlEhFIZi0MufRmls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775419894; c=relaxed/simple;
	bh=ZpgSNsNB++9ZqtP3uBY2idnLE9J0ydHdGFZvmstIwMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6s/naF/JI/UL8fBevEWAD63oVTfHsHCQ3qqCGfXWSqfbK83ADPupBFRUOb+EN1eKpwvcCzQsI6+zlitlNY6iNcGAcF5tUXq7Qsd3Ltmr0zV33RIiDJF5QBhBWFUOj/OoXmzoeSBt0C+lPS9DdnnmguAK8hL/FGVlvIyOAVgCO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mNG9f3Dz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4E2DB6AF;
	Sun,  5 Apr 2026 22:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775419805;
	bh=ZpgSNsNB++9ZqtP3uBY2idnLE9J0ydHdGFZvmstIwMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNG9f3DzliYKAr++51bzH3jAp4vUGfxzn05biwxAMoMpPEkXxoycoKpSJsbzmdFZ+
	 C2AfR4S0IBYX0LLkXf/sl/sX4VbVaAq5YHBvw/y2USdYLEyISTpVP8l+5Wi43GlGeC
	 iTS+ysKuOZqvGT/kUM+W5HrMB+CNWwFAzWTyvRS0=
Date: Sun, 5 Apr 2026 23:11:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	vladimir.zapolskiy@linaro.org, kieran.bingham@ideasonboard.com,
	robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
	mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <20260405201129.GB1213462@killaraus.ideasonboard.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58070-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 6052339FB50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
> On 23/03/2026 15:31, Loic Poulain wrote:

[snip]

> >>> +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *stripe)
> >>> +{
> >>> +     struct ope_dev *ope = ctx->ope;
> >>> +     int i;
> >>> +
> >>> +     dev_dbg(ope->dev, "Context %p - Programming S%u\n", ctx, ope_stripe_index(ctx, stripe));
> >>> +
> >>> +     /* Fetch Engine */
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0, stripe->src.format);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE,
> >>> +                  (stripe->src.width << 16) + stripe->src.height);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_ADDR_IMAGE, stripe->src.addr);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.stride);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CCIF_META_DATA,
> >>> +                  FIELD_PREP(OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN, stripe->src.pattern));
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CORE_CFG, OPE_BUS_RD_CLIENT_0_CORE_CFG_EN);
> >>> +
> >>> +     /* Write Engines */
> >>> +     for (i = 0; i < OPE_WR_CLIENT_MAX; i++) {
> >>> +             if (!stripe->dst[i].enabled) {
> >>> +                     ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i), 0);
> >>> +                     continue;
> >>> +             }
> >>> +
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i), stripe->dst[i].addr);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
> >>> +                          (stripe->dst[i].height << 16) + stripe->dst[i].width);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_1(i), stripe->dst[i].x_init);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_2(i), stripe->dst[i].stride);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_PACKER_CFG(i), stripe->dst[i].format);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i),
> >>> +                          OPE_BUS_WR_CLIENT_CFG_EN + OPE_BUS_WR_CLIENT_CFG_AUTORECOVER);
> >>> +     }
> >>> +
> >>> +     /* Downscalers */
> >>> +     for (i = 0; i < OPE_DS_MAX; i++) {
> >>> +             struct ope_dsc_config *dsc = &stripe->dsc[i];
> >>> +             u32 base = ope_ds_base[i];
> >>> +             u32 cfg = 0;
> >>> +
> >>> +             if (dsc->input_width != dsc->output_width) {
> >>> +                     dsc->phase_step_h |= DS_RESOLUTION(dsc->input_width,
> >>> +                                                        dsc->output_width) << 30;
> >>> +                     cfg |= OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE_EN;
> >>> +             }
> >>> +
> >>> +             if (dsc->input_height != dsc->output_height) {
> >>> +                     dsc->phase_step_v |= DS_RESOLUTION(dsc->input_height,
> >>> +                                                        dsc->output_height) << 30;
> >>> +                     cfg |= OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE_EN;
> >>> +             }
> >>> +
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(base), cfg);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE_CFG(base),
> >>> +                          ((dsc->input_width - 1) << 16) + dsc->input_height - 1);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(base), dsc->phase_step_h);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(base), dsc->phase_step_v);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_CFG(base),
> >>> +                          cfg ? OPE_PP_CLC_DOWNSCALE_MN_CFG_EN : 0);
> >>> +     }
> >>> +}
> >>
> >> So - this is where the CDM should be used - so that you don't have to do
> >> all of these MMIO writes inside of your ISR.
> >
> > Indeed, and that also the reason stripes are computed ahead of time,
> > so that they can be further 'queued' in a CDM.
> > 
> >> Is that and additional step after the RFC ?
> > The current implementation (without CDM) already provides good results
> > and performance, so CDM can be viewed as a future enhancement.
> 
> That's true but then the number of MMIO writes per ISR is pretty small 
> right now. You have about 50 writes here.
> 
> > As far as I understand, CDM could also be implemented in a generic way
> > within CAMSS, since other CAMSS blocks make use of CDM as well.
> > This is something we should discuss further.
>
> My concern is even conservatively if each module adds another 10 ? 
> writes by the time we get to denoising, sharpening, lens shade 
> correction, those writes could easily look more like 100.
> 
> What user-space should submit is well documented data-structures which 
> then get translated into CDM buffers by the OPE and IFE for the various 
> bits of the pipeline.

The mali-c55 driver does this, it translates the ISP parameters buffers
to a list of register values in userspace context, when the buffer is
queued. In the IRQ handler, it then either copies those values to
registers with MMIO writes, or use a DMA engine, depending on the
platform. The rppx1 driver does something similar, with a different
format for the buffer containing the register values.

I think this architecture could be replicated here. This translation in
userspace context ensures that work at IRQ time is limited. The driver
can use whatever DMA engine is available depending on the platform, and
we can also force usage of MMIO for debugging or development purpose.
That way, development of ISP features is decoupled from development of
CDM support, enabling parallel development if desired, and faster
plaform enablement that allows starting the userspace side of the work
quicker.

-- 
Regards,

Laurent Pinchart

