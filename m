Return-Path: <linux-media+bounces-30664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0AA95958
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 00:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1E53B86BB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4FF224238;
	Mon, 21 Apr 2025 22:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9J69WdB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF41DF984;
	Mon, 21 Apr 2025 22:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745274417; cv=none; b=RqHkwk8H21jL8UadqIPUQHZnI48r7nAdvBKUBEqXHOx4Qw2jZXuFrscB0Hvm9EDpxu4P5fCU3x3YX0AZa6dK3L1BWFv8ATKeuRNed/CLFxOj27iZw+UKOGFpoccWsVpm9+sGaEPn/X28r37k2OIKg9s0lMUqakJwsknGUyvGd7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745274417; c=relaxed/simple;
	bh=sjB84uxPDLrSxZbudQCJO1bZYpvmP3+3SV0sD3RB5aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UT0VmCQbDTTa4iYhV3kar0kMP2kG/LGXraCoJFiGUobZUplddJphRQpEJZ0fKW5SOMshzGDh7K7u/CgUctHh1uveXOnTJ7f6Dtvf0tJ4UdnUJ05d6Wnpdtc1gRNKXfOuHB7BOISuvFRsQf8YjNMhE8SDdsiNVyxQ/HquZnXA6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9J69WdB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB8DC4CEE4;
	Mon, 21 Apr 2025 22:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745274415;
	bh=sjB84uxPDLrSxZbudQCJO1bZYpvmP3+3SV0sD3RB5aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9J69WdBBkV3WEGtVhU7DQwRwiwNhebcdw8EfDY4tpzK2HPX1q6/L1UU8nMvKiMEN
	 3hC99k9LoPNNdE331GHT4+vHtkpzaui3+DfTRw7pkItjJ+sdEftZ3IDlU7fF2nIzUu
	 Z3eY1Jg1rjobEQkPCS70yeCx6DGtZC6vsswbG5CCddxesIWPGkExX0qNGVrj3EZEex
	 XD72cUD/vWbnV9+w7DKOvJ7vW4Sdxaka+xf/XHEFw2kDjDKUEIfFs3fBOWc3lfbrGU
	 jvertGBLyRu0A7QzasJ1qBbbEexZy1MOBiM+FEt1FQ2uSsyvEEzYolVpDyGvLoNU9t
	 stAkkdDO/oALQ==
Date: Mon, 21 Apr 2025 17:26:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: krzk+dt@kernel.org, mchehab@kernel.org, devarsht@ti.com,
	hverkuil-cisco@xs4all.nl, s-jain1@ti.com, jack.zhu@starfivetech.com,
	vigneshr@ti.com, linux-media@vger.kernel.org,
	jai.luthra@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	changhuang.liang@starfivetech.com, linux-kernel@vger.kernel.org,
	tomi.valkeinen@ideasonboard.com, vaishnav.a@ti.com,
	y-abhilashchandra@ti.com, jai.luthra@linux.dev,
	devicetree@vger.kernel.org, mripard@kernel.org,
	sakari.ailus@linux.intel.com, conor+dt@kernel.org
Subject: Re: [PATCH v3 01/13] dt-bindings: media: ti,j721e-csi2rx-shim:
 Support 32 dma chans
Message-ID: <174527441344.3212247.14328786024565701263.robh@kernel.org>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-2-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-2-r-donadkar@ti.com>


On Thu, 17 Apr 2025 12:25:42 +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> The CSI2RX SHIM IP can support 32x DMA channels. These can be used to
> split incoming "streams" of data on the CSI-RX port, distinguished by
> MIPI Virtual Channel (or Data Type), into different locations in memory.
> 
> Actual number of DMA channels allocated to CSI-RX is dependent on the
> usecase, and can be modified using the K3 Resource Partitioning tool [1].
> So set the minimum channels as 1 and maximum as 32.
> 
> Link: https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/10_00_07_04/exports/docs/linux/How_to_Guides/Host/K3_Resource_Partitioning_Tool.html [1]
> Link: https://www.ti.com/lit/pdf/spruiv7
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../bindings/media/ti,j721e-csi2rx-shim.yaml  | 39 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


