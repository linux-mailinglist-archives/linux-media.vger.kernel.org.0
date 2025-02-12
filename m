Return-Path: <linux-media+bounces-26083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3BA32FA5
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD67A188AB0D
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 19:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284C6263C8B;
	Wed, 12 Feb 2025 19:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkrwTntz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C93725D553;
	Wed, 12 Feb 2025 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739388418; cv=none; b=r/u878BENVSf9mWVvETxVDdji8nQeecgfR4P5ZT6bgqOsGGCYFDRqdMplDhIf7p20AmIePSCidHgRtdoLi5npj4k1MAtQ/ZyLGZEc6W/bqGyBPUyg5Y5Yvj8zquCbzEpujGDFihCY4LbMaX05pQV9cveK97Nr0TelBpMlYvX1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739388418; c=relaxed/simple;
	bh=qheZOutIWKdBvuT8/LvT+TN4/VsqMfhKb87TvdQ6DnA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Y5ezoaJ2iLyYMfkfNBgm0APthHLXpe6ijPp2xu6OS+3UH9YD7GBti9Tfc1Ix+7C6Lane3jvDtpksC8sKg8G0er/TS237mBGPImFtgMnV2Ep40Lvuzr3lcHkHgv878Ez9+tezaQnl2NNMlwLBbYvqY7EAzdodZvl2c74go+Cyxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkrwTntz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C592EC4CEDF;
	Wed, 12 Feb 2025 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739388418;
	bh=qheZOutIWKdBvuT8/LvT+TN4/VsqMfhKb87TvdQ6DnA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YkrwTntzRAje2eUBjd/HK8wMnW35ginLdxJ3Amm8raytWeeWSymc6SAB4izQBQK+J
	 4oIVzdlEswTWGiESut9OjT0pAzbumnT8h1BxhZMP1erYS7I1uv0rm8ZMf7v5we/cMh
	 /box+XGhvdljzUAtmN5u8OIEs0QhBimTrkiDn2DToEJ8mvmjHn8cjytpGyGUJM7C+W
	 X/iGKoAZ1wKBIPiejgjuJ+SQyWLERh08h3S5qcFJDuKf0V16M+j4AobzNfJrQhf9Ub
	 aZ+RuWxhuIJGewYgwSuxgWoh4GBImspnSoMEFodoJfTmpIDwBHDlJKmVdoo7rebpGZ
	 Olr4Wqzi6Cgcw==
Date: Wed, 12 Feb 2025 13:26:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, devicetree@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>
To: Matthew Majewski <mattwmajewski@gmail.com>
In-Reply-To: <20250212170901.3881838-2-mattwmajewski@gmail.com>
References: <20250212170901.3881838-1-mattwmajewski@gmail.com>
 <20250212170901.3881838-2-mattwmajewski@gmail.com>
Message-Id: <173938841678.103791.15257194096562741977.robh@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add dt bindings for
 m2m-deinterlace device


On Wed, 12 Feb 2025 12:09:00 -0500, Matthew Majewski wrote:
> Create a new yaml schema file to describe the device tree bindings for
> the generic m2m-deinterlace driver.
> 
> Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
> ---
>  .../bindings/media/m2m-deinterlace.yaml       | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/m2m-deinterlace.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/m2m-deinterlace.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250212170901.3881838-2-mattwmajewski@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


