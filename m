Return-Path: <linux-media+bounces-32717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CDBABB171
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 21:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62A61174A6F
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 19:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5BE1FDA61;
	Sun, 18 May 2025 19:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmNHQYwk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCCB1FA178;
	Sun, 18 May 2025 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747596565; cv=none; b=rklXNC6/9HAvlebyD96Nb5fXdsntYcRaE0CSFtF45sdyEBJYdzVjOVN9j8wHbk6tTi13ZTPeGen3bHhCg1dD4aqVuI5kgmznZ2tj2L5QyFkFfCwuUC5dJfW9fJMIZuAuv6AWbZtOATdWt7ezYExGpgVwP7cUOzpd+LA11tCVv5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747596565; c=relaxed/simple;
	bh=ky8ltk0PF8tipHAfrZMLL47eVSRk2GhrTPhK+KO2jkM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QJuN3VqB/dy75gePupL526DzxrN0qbov+XzFv41JffcEp2HT38KrSBvR8l6kmvEOhS/JGYiw5GGZ2PHAAektfHX7GK6sI6lB/j1pgLoz3FnaRcqzLX7mY796Eut8NfgIWh79YWRQYkkrg1e2O9pouQ+Jzz9CqDY+igI0qWWH4OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmNHQYwk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9D0C4CEEF;
	Sun, 18 May 2025 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747596564;
	bh=ky8ltk0PF8tipHAfrZMLL47eVSRk2GhrTPhK+KO2jkM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AmNHQYwkuFARltIGixBKJ9ZxLWRmpIbOrVcQ32onddVDrb3cQC30m80Ubni5YZfDs
	 euNYuLPKhRdt9+q6x5/PKfwRSL3I69HKPHt2taVCcMS0ijICNoKW7IiR4jlI54SWTh
	 pp1ZI9fzqq2S1p40FBOCx1oyB6JhKJ4iysY5Vmx3ZhdHoKXGEhHUjOrczoyLihJmAe
	 +ltHazaRZ74X2GWe36qZamMCd65g9cV91Y7JGtJ+Twe3GMnMchw6wMijeUa+RDzebD
	 3QCpQiIb7jKe69HoDbfZXwwF12iVXzm/Esi+yYZHA+gDlz083j8NAHxdl+rWYnmubg
	 6oVbZI5ScNnRw==
Date: Sun, 18 May 2025 14:29:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Todor Tomov <todor.too@gmail.com>, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
Message-Id: <174755315042.2793587.17691583538434075316.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: Add qcom,qcs615-camss binding


On Sun, 18 May 2025 14:33:07 +0800, Wenmeng Liu wrote:
> Add bindings for qcom,qcs615-camss in order to support the camera
> subsystem for qcs615.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-camss.yaml          | 356 +++++++++++++++++++++
>  1 file changed, 356 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,qcs615-camss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,qcs615-camcc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,qcs615-camcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/media/qcom,qcs615-camss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1524: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


