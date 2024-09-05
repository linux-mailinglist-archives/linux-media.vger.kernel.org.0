Return-Path: <linux-media+bounces-17642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2996CFAB
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0035FB2205D
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 06:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BAA1925B8;
	Thu,  5 Sep 2024 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duUoEs6H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A962842C0B;
	Thu,  5 Sep 2024 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725518881; cv=none; b=Oy9r+vRYWqjBWoO85k7tcGM/gghoF/K/OgIR4nx+FTkY13md0grOxUraVL0rVT855W5++WcM0/NyEPRkEvV9NA20odVsDJZIs1x7u3xOlNy9kYLQ0ETct9B79+Xgx5aQTTAaEa5elwj7MKyP1QltTzxBaJgJYteEVH1xWfjlZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725518881; c=relaxed/simple;
	bh=Njmcixp/WFQ1K49ru/lsO056x3RbOFYKJXcQ0Q4keZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tG+pyhSNwN/s6NVRwavzEE7UQAkmfGdSquA09nwHyiHSFzWulXs0CoLK5oW4S+bToatvKEXQxFmy9r8NEZWTuWRYXjEDl7mY0hKeFcvenfkukag3MutMBrgFTtH3X110pgMbi8enKlWqW0gbpcpUsUV3PaofSwaPCJXt63QEeV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duUoEs6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92548C4CEC5;
	Thu,  5 Sep 2024 06:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725518881;
	bh=Njmcixp/WFQ1K49ru/lsO056x3RbOFYKJXcQ0Q4keZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duUoEs6Hd1u6uJGJe+vLlGXNL978OGr5qOmgnYGcHCXWUEZgEU9TN9dV3Mp/639Ax
	 Pid/joQx2Zxr4G5uLOyABA6Ke3vCQh1BeW1nssV4y2phnfzM6e0SDDgGyic2Dzx8C0
	 JNCPbQhgB6YKdj7Qw98r+jt55hS9dRnrhai6pFs4SjZ/KUusRgFzLiZHhmShrsQaJc
	 0SqZ8PPEIl9juYSUDUj+S3FULb/Ukk1YA4Ge+cLLisrd3jr6VZogZswvsCkFvyP9sB
	 TG/+cl6b9CHUrjsRklnTRwjEVp11MVQHEv8tfF2oSD3TJGGcnFWMcjBMJvwKzphtmm
	 RhOPBoLgvd8Gg==
Date: Thu, 5 Sep 2024 08:47:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>, 
	Hariram Purushothaman <hariramp@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	cros-qcom-dts-watchers@chromium.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Suresh Vankadara <quic_svankada@quicinc.com>, 
	Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Subject: Re: [PATCH 01/10] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
Message-ID: <2m4dmdsivqwo45bxvuhashrlfki3akzzc3qp2vp32nrhvairyq@uibybei3fsco>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
 <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-1-b18ddcd7d9df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-1-b18ddcd7d9df@quicinc.com>

On Wed, Sep 04, 2024 at 04:40:07PM +0530, Vikram Sharma wrote:
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/interconnect/qcom,sc7280.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      camss: camss@acaf000 {
> +        compatible = "qcom,sc7280-camss";
> +

Alignment, indentation and properties order is completely wrong here.
But maybe because you keep sending the same and expect different
review?

Best regards,
Krzysztof


