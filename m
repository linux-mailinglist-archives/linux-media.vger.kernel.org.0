Return-Path: <linux-media+bounces-58074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNXRBhHF0mn1agcAu9opvQ
	(envelope-from <linux-media+bounces-58074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:24:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A254239FBF8
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04427300CBF4
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 20:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21F9382365;
	Sun,  5 Apr 2026 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eSzqkjK6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B82BF002;
	Sun,  5 Apr 2026 20:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775420675; cv=none; b=Ce8ofgXfZKd62XTon6pBM+PMZo7oHCrKU/S02u/Ql0l/MsDR9GpzAAPq4A7zFUjj+CqGFaAqhPLFPCrBBiZMQWui2r4o9wyrJMUVY+bu4LGZ1gRD89ZTu6Zl8YPfq1hpdoD0o5BZCUHU5nZbnBDApcOlxepS2/t5BpZM9mAcGwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775420675; c=relaxed/simple;
	bh=4URvBvx60TZ/gMFeDnx2oBlXjJOgy0M8Xq8rQDZnM9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn8Yg3PTxsO518Xlb0gRuDliomEIhC7TmQM0hgIInQfZlaMba7tHwITkhKarqMtQoZ+LFeHGFEhlRTceFhXlmxKTimrOsoUsIJS89MzGc/YUkouMrlZ4OrXSxdB06X72nM2EovXfhapfbMCmgS8hKrcA8z4ynJCsAx82KndW4L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eSzqkjK6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 72E5DC87;
	Sun,  5 Apr 2026 22:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775420586;
	bh=4URvBvx60TZ/gMFeDnx2oBlXjJOgy0M8Xq8rQDZnM9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSzqkjK6AriNtRg5H6geutSclpKKO+LtYE0CkNhzaF7X0aTTZkaDn8jJOKNLot7+U
	 ABpJ4fQyT4kkCNFborDF9JeQgVbeyA9CD/lHT4n7aOrxCr1toejvVzd0SIxhIFVb21
	 k7tKZs/t+qiPh6C3rkrGpjokKzCO94qKNExWcX0I=
Date: Sun, 5 Apr 2026 23:24:31 +0300
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
Message-ID: <20260405202431.GE1213462@killaraus.ideasonboard.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <Coon32Ka9XbQ-1AzN_iIIH8paxBBuz2astLCFhzSxOoDSHFP_1HoJOl0XKC7urJtTl3r64nBEeZP8ng7iNa5Qg==@protonmail.internalid>
 <20260405201129.GB1213462@killaraus.ideasonboard.com>
 <3bcd8500-ff6c-4a1f-8b7e-3e7c474f6345@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3bcd8500-ff6c-4a1f-8b7e-3e7c474f6345@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58074-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A254239FBF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 09:15:47PM +0100, Bryan O'Donoghue wrote:
> On 05/04/2026 21:11, Laurent Pinchart wrote:
> > The mali-c55 driver does this, it translates the ISP parameters buffers
> > to a list of register values in userspace context, when the buffer is
> > queued. In the IRQ handler, it then either copies those values to
> > registers with MMIO writes, or use a DMA engine, depending on the
> > platform. The rppx1 driver does something similar, with a different
> > format for the buffer containing the register values.
> > 
> > I think this architecture could be replicated here. This translation in
> > userspace context ensures that work at IRQ time is limited. The driver
> > can use whatever DMA engine is available depending on the platform, and
> > we can also force usage of MMIO for debugging or development purpose.
> > That way, development of ISP features is decoupled from development of
> > CDM support, enabling parallel development if desired, and faster
> > plaform enablement that allows starting the userspace side of the work
> > quicker.
> 
> I think that's a reasonable plan.
> 
> We make the buffer in user-space which could be used by CDM but stage 
> the implementation.

My proposal is to use an abstraction for the ISP parameters buffer, with
logical parameters, and translate that to the CDM buffer in kernelspace,
but in userspace context instead of IRQ handler context.

> That way if CDM proves too hard, we can do MMIO for a while, and then 
> transition to CDM if/when.
> 
> For me though I really think translating between formats is storing up pain.

-- 
Regards,

Laurent Pinchart

