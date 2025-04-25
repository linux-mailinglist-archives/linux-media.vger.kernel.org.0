Return-Path: <linux-media+bounces-31066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F7A9CA11
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 15:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1AA21BC6B05
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 13:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47DE253926;
	Fri, 25 Apr 2025 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDg2Q+t0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C8624A074;
	Fri, 25 Apr 2025 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587231; cv=none; b=Vrj3oTvxx+sRkL9RXSBEwWHaEjaHKoUYOK1Xr7AYRDPvOL8z5E75VD0Rl3pr1oFJCav5QPekQe9JhI4oWebs5yPETyyoFjvMsrAAnvqYNg/xcHztRwd/DPFVvLFUWqhVuS4KXdOXekOkAq57mW8LX10QexKJcNFrpRC/EyX1mIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587231; c=relaxed/simple;
	bh=hb6E8C1ttpx3cKoDNmpMY75ubZTHmF1p12ffwEeLTm4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GxyulAg1WI5VPDU8T85IVpoOu1DPLFfF2JLGNr4i6e8xMxdk8W9ue6vxmkvAjer79ytBvbe2dAotkOq1NcIcROWf7Vx3jwmaMKEQX7AYV+l+CG9brB4WlCwLzgRQ+Ljq0Y6YshzM9IwX2sT4LRdEEZ/1A1qTyKmXvqmDLkQpezg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDg2Q+t0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479E1C4CEE4;
	Fri, 25 Apr 2025 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745587230;
	bh=hb6E8C1ttpx3cKoDNmpMY75ubZTHmF1p12ffwEeLTm4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SDg2Q+t0mad6LPRi26dhMlsrG3nTVxOf8qeOB00TKXuuzL7WPZBwLnJ8ngh+DRd/Z
	 CEr3rMMcLJBYEpe6D6jPDVU6I7p157/FX/WKAF5f0pifdrzehNHevbaMj6anfrvRNX
	 UzOo5hWK8z3PHxFUnIVGIK0jv+sj//mppCe5suZew09q9wqXxxVTI0XNGAcm3V5PXV
	 9INM11yOGF6K1PoZRAfjOfeb3evPQwbbddu7GgVAk3KVdR1IS8YHap9ArcJQegKphQ
	 vBDyn5QH0diMXzYsKixjP3Sw316s0dDOCYM2ol2dqJxqVgQRnCoz8Ol2EStkCE9H7l
	 HqVui0MMeO8PA==
Date: Fri, 25 Apr 2025 08:20:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, krzk@kernel.org, 
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, vladimir.zapolskiy@linaro.org, 
 linux-arm-msm@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
 linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-1-2a3dd3a47a6a@linaro.org>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org>
 <20250425-b4-media-committers-25-04-25-camss-supplies-v1-1-2a3dd3a47a6a@linaro.org>
Message-Id: <174558722845.2020003.4626992465358101962.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup
 csiphy supply names


On Fri, 25 Apr 2025 13:01:51 +0100, Bryan O'Donoghue wrote:
> Declare a CSIPHY regulator pair 0p8 and 1p2 for each CSIPHY.
> 
> Name the inputs based on the voltage so as to have a consistent naming of
> these rails across SoCs and PCBs.
> 
> There are no upstream users of this yaml definition yet so this change is
> safe to make.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:153:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:156:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:159:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:162:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:165:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:168:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:171:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:174:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:193:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:196:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:199:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml:202:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250425-b4-media-committers-25-04-25-camss-supplies-v1-1-2a3dd3a47a6a@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


