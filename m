Return-Path: <linux-media+bounces-58069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OgVIMcW+0mmoaQcAu9opvQ
	(envelope-from <linux-media+bounces-58069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 21:57:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9FA39FAAF
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 21:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B12FE3002932
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 19:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1C8381B17;
	Sun,  5 Apr 2026 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BIt4G966"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C34336EE1;
	Sun,  5 Apr 2026 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775419070; cv=none; b=I7z3kDOO0H2bd6swH9ovhxvgluVVmWdTDgyFDTy277yWaN281PhmFtitmO8SF3TosdI+/2cX5QRXT02QFc8Gl5Md/E1EHP8JZifNXV+4DbEAHnsv9/iq4XT5oJ/PQKMvQoPLkfecNmpp6NPGOXGg1XyAn9Ml07ij12jX21PwbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775419070; c=relaxed/simple;
	bh=Q7h8DDBFdWSsoyKWkwieyTKsOeBPb0Ufe/tiuoC6voE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qApMhr5uPX+1IPzNfATyPGTWNe2AalFw1vHNV8yVE3TbsQyFHi2c7fsdK0+xQ+CfXvRUNnQQiNHvxpd+EMCAVQ9cCnpgFS/+DDyXW4axGd0Jun/V5j97xw+taC6ocvuufM1sveE0YrVSJmJ/s0V1ZOJQnDWBz2rrfhm5WUK7JGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BIt4G966; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CE6EA316;
	Sun,  5 Apr 2026 21:56:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775418980;
	bh=Q7h8DDBFdWSsoyKWkwieyTKsOeBPb0Ufe/tiuoC6voE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIt4G9661Y4dxC0anEAPhbTXBfLdqvShcse8TI2xFg3c3hPMHH8lwlGniOUC/NqIU
	 2x4hX77hDeyMmFr/+h+rdRgJhWcsINoR/c8niG1rtN9fVB8QakWROrRobIjWn99OiO
	 Jz6Jgr7jS9FanK5s9xzgUcoPwgQmnB6EdLEv51N4=
Date: Sun, 5 Apr 2026 22:57:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
	kieran.bingham@ideasonboard.com, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
Message-ID: <20260405195744.GA1213462@killaraus.ideasonboard.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58069-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: BE9FA39FAAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Loic,

I'm really happy to see this on the list :-)

On Mon, Mar 23, 2026 at 01:58:21PM +0100, Loic Poulain wrote:
> This RFC series introduces initial support for the Qualcomm CAMSS
> Offline Processing Engine (OPE), as found on Agatti-based platforms.
> Boards such as Arduino UNO-Q use this SoC family and will benefit
> from hardware-assisted image processing enabled by this work.
> 
> This represents the first step toward enabling image processing beyond
> raw capture on Qualcomm platforms by using hardware blocks for
> operations such as debayering, 3A, and scaling.

I assume you mean colour gains instead of 3A, based on what I can see in
the driver. I'm looking forward to hardware support for the rest of the
3A :-)

> The OPE sits outside the live capture pipeline. It operates on frames
> fetched from system memory and writes processed results back to memory.
> Because of this design, the OPE is not tied to any specific capture
> interface: frames may come from CAMSS RDI or PIX paths, or from any
> other producer capable of providing memory-backed buffers.
> 
> The hardware can sustain up to 580 megapixels per second, which is
> sufficient to process a 10MPix stream at 60 fps or to handle four
> parallel 2MPix (HD) streams at 60 fps.

Isn't 10 MPix/frame * 60 fps = 600 MPix/s, higher than 580 MPix/s ?

> The initial driver implementation relies on the V4L2 m2m framework
> to keep the design simple while already enabling practical offline
> processing workflows. This model also provides time-sharing across
> multiple contexts through its built-in scheduling.

I understand this decision, but that will need to change. In order to
enable support for more ISP processing blocks, we will need to introduce
parameter buffers. The rkisp1 and mali-c55 drivers are two examples of
how it can be done. If you need any help, please don't hesitate to reach
out.

> This first version is intentionally minimalistic. It provides a working
> configuration using a fixed set of static processing parameters, mainly
> to achieve correct and good-quality debayering.
> 
> Support for more advanced use-cases (dynamic parameters, statistics
> outputs, additional data endpoints) will require evolving the driver
> model beyond a pure m2m design. This may involve either moving away
> from m2m, as other ISP drivers do, or extending it to support auxiliary
> endpoints for parameters and statistics.

Ah, I should have read this before writing the above :-) Let's align the
userspace API of driver with the other ISP drivers.

> This series includes:
>   - dt-binding schema for CAMSS OPE
>   - initial CAMSS OPE driver
>   - QCM2290 device tree node describing the hardware block.
> 
> Feedback on the architecture and expected uAPI direction is especially
> welcome.
> 
> Loic Poulain (3):
>   dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
>   media: qcom: camss: Add CAMSS Offline Processing Engine driver
>   arm64: dts: qcom: qcm2290: Add CAMSS OPE node
> 
>  .../bindings/media/qcom,camss-ope.yaml        |   87 +
>  arch/arm64/boot/dts/qcom/agatti.dtsi          |   72 +
>  drivers/media/platform/qcom/camss/Makefile    |    4 +
>  drivers/media/platform/qcom/camss/camss-ope.c | 2058 +++++++++++++++++
>  4 files changed, 2221 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
>  create mode 100644 drivers/media/platform/qcom/camss/camss-ope.c

-- 
Regards,

Laurent Pinchart

