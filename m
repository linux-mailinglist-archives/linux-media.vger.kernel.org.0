Return-Path: <linux-media+bounces-41529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52CB3F858
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42E3F1660A5
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD6F2E8B6E;
	Tue,  2 Sep 2025 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUnXee45"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8213D987;
	Tue,  2 Sep 2025 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756801759; cv=none; b=pOHoVeohXEbcD7+PFDKE9uIx5EQ5m7zO8gtFMeadyD6ARGLs2kSEPtGTcBwj5wxxQ+ixKckztMHWzPuDePUbG6EKykCJD0UwhDQHS3xNkTbC5zLVpJSmSWfU4Im6Af4wGX40Z5+iWyC7/6zLvQbuAXbxU+SgRYYEzoyDRAjF5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756801759; c=relaxed/simple;
	bh=TI8iWiXPUcMsp1Yq4V7ng0SNQZgecLWmnTLlRDdrUAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMXwccuSF7ZYAVQVXq9UbmVtgeZx5JtngIdqxbogup82FRzE38fjqAc1TqufKbHNkb0xscJJJxbjg4e30CgPwAoyfJJkH86QeyT8T4pDP2XJGwRvpRPcUmasFgW/XOqyAJSV5g+QRYd2eHrZvwuMKfMCCIEYDVpD/+eGX2gyRHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUnXee45; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E0BC4CEED;
	Tue,  2 Sep 2025 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756801759;
	bh=TI8iWiXPUcMsp1Yq4V7ng0SNQZgecLWmnTLlRDdrUAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUnXee45Km6xClRAZTwN3sRjENamYZ9KGX5sNdIU5whvk9R4xxDvDF63XxVGMZRLj
	 SE29c2F5wMc/T8oFQ9R2txEAnccp2MAu4jAvWuecS4Jgls8B0n5sgECxGZ2upQgld6
	 2ryRVnvrbRU/cSpNGK5bp/4sfE5fKabw5M7IHVdXthCd+VQhFktQlFK7nPy0xtkydD
	 EcNsvcmajRwqC5sk1r77X2aRtmRL2jsHi5fS6gCKxhgQyhyK7tgPr21sJt4WaVMCPb
	 fZXgVg6dOkieSOpteNEG7WZfmyNisHRzcECS73+b8uBhpJ+lpwTXGLSmk5ZcyitWY9
	 5LOp6YRXJjObQ==
Date: Tue, 2 Sep 2025 10:29:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: media: update Dikshita Agarwal's
 email address
Message-ID: <20250902-space-sawfly-of-protection-ffdb06@kuoka>
References: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
 <20250901-update-email-v1-2-8fd49d58c0e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901-update-email-v1-2-8fd49d58c0e5@oss.qualcomm.com>

On Mon, Sep 01, 2025 at 01:03:29PM +0530, Dikshita Agarwal wrote:
> Replace quic_dikshita@quicinc.com by dikshita.agarwal@oss.qualcomm.com.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


Best regards,
Krzysztof


