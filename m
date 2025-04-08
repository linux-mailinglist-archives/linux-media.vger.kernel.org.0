Return-Path: <linux-media+bounces-29677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A1CA8179C
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0111B1B83CA4
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B862F2550B7;
	Tue,  8 Apr 2025 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ky3+e52e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DB622D4FF;
	Tue,  8 Apr 2025 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744147752; cv=none; b=l6OqymsybFA/6YAL54DWIDGMiXIApFCO6+69EgBHAKUP5Q2WKwrmS0DDlKFWKNPD+ytIQW77t7iXnJwAXpaVMBPu8MySDAo9JcoUNQChPxPyeL7upCfoUHDkx2HvrVXmwDwV6PD0awdHZiVXWSEP9NoDVOvFKt5monukYao1bm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744147752; c=relaxed/simple;
	bh=xMVLzNRDQS5jU7k6dRei5Ha252MS5+pr4YTv/gJK1ic=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mr9gE5yb21hsLSUHd+kUUi0lSyc65eNdJGHuDM9WauThhSBQ9hb0r9iIuGSJPUwDoyACE5vd/a/DvbWSeUCgna9IYI6EQHgWUh6MEY2kYU+/HkEYL4t7OKLb9Y5z0Kty3B6oZ8o55FF00IRkwUVQI6SeDgwuFiAmohpScNKTa2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ky3+e52e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0FBC4CEE5;
	Tue,  8 Apr 2025 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744147750;
	bh=xMVLzNRDQS5jU7k6dRei5Ha252MS5+pr4YTv/gJK1ic=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ky3+e52eN01VZrS7y4UubhVQOvj7dZJEL+IolLCUIPVj4pLLvfWqkNdKhFWICW/Nq
	 j3a3xcT9sbpIsgNaJUSG+HitK7uyD/q2092eU4LwzbvLGvdbSJ5n5KwiAJo7afoFnm
	 jLrO6SFtpyD6eXCiC8S+kzeTCvtij73xdDHrhxnficXvziSu3prp3T/FAeWXApMsdW
	 6B4DipVWUrgEWAPUxgLa59C3DTo3VsL34icej09linsY4A7esLwEry3EvG2pv4Mqoi
	 g9njBA3XRdJWZ+Yxc7hcfGCxDczbmo9xZ7KkhVVZyb9CEGITFdoEVxVepGsAnpnXs3
	 TdPNoW6OvVEAQ==
Date: Tue, 08 Apr 2025 16:29:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 devicetree@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250408-tegra-cec-v2-1-2f004fdf84e8@gmail.com>
References: <20250408-tegra-cec-v2-0-2f004fdf84e8@gmail.com>
 <20250408-tegra-cec-v2-1-2f004fdf84e8@gmail.com>
Message-Id: <174414774921.2842816.8049997021161543075.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] media: dt-bindings: Document Tegra186 and
 Tegra194 cec


On Tue, 08 Apr 2025 15:29:58 -0500, Aaron Kling wrote:
> These are already used in device trees, so describe them here. As the
> driver only declares up through Tegra210, these must use a fallback
> compatible of tegra210-cec.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../bindings/media/cec/nvidia,tegra114-cec.yaml           | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml:20:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml:25:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250408-tegra-cec-v2-1-2f004fdf84e8@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


