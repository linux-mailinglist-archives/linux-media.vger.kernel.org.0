Return-Path: <linux-media+bounces-5436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9185AB07
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 19:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25CD81C21B96
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 18:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3141D528;
	Mon, 19 Feb 2024 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4FSXvUX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F428522F;
	Mon, 19 Feb 2024 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708367582; cv=none; b=VNA7tLZ8dMVDH9C0tKvVEjixqkUklbHbbJp5r8kVpanFf/5r7W8Y3nEnRhN4AL+Bb5NS+bOWF0NazvzC+k+aB7CIpWRMuh6hppatNYlrjaK1tsr/r5uPdgACw4FSil8hBP4m2JuQiUYyY7Bl1hrJHqh9acE0bp1X4rWsYuRsZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708367582; c=relaxed/simple;
	bh=dg9n3FCKSh07Q8zYEx+AzGyguaIHEF8nlhan6FJvmTQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=IGy+YlyJAmFw5JyfXzNhac248NXB8zzu6mDOpqJnCESozZ5tfD4OGDYur4/uGL9/yrOfLPSFgpV4JV1KC6cQK8ZI8/BnYScqU0pyPdVsadBnJxaDL8QPfDtDVbWhDxxEBRZttKeQ4DMgxNMDdOyp85Styrr3LRaBwy1H6jGseAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4FSXvUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CEEC433F1;
	Mon, 19 Feb 2024 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708367582;
	bh=dg9n3FCKSh07Q8zYEx+AzGyguaIHEF8nlhan6FJvmTQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=L4FSXvUX6o1xFZ4KLNcNAzHdfFhucJ7yD8fK6tt5NdihGG2lRTCKjNDnlRTGtyPGJ
	 enTXhFM8Bchdyx2I6wnQiLm8uSRkqR1DuC2gYJkp5ApM7sMSRpykP24wgiXlmvkwW+
	 MTGAsLHpktdHF2VuZkSbMwkT0sokRRr8VYZ6OJW7QYBV3/YBQ3SBr3FUapijcdoAlu
	 dIuxP+yedP8wv/VmQX77ke+TaSERnPxSBOwikYF8mCJXf6Hyap/ygY9JYWbtIepNnL
	 ecW2Bz6ENQnIAuNjMcqozQbjtAjKVVm9gODKXGAgGxViN6XByk1ozvAD7eVlsIOzJx
	 hE4905XYNKmNg==
Date: Mon, 19 Feb 2024 12:33:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: DT <devicetree@vger.kernel.org>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, linux-media <linux-media@vger.kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Pierre-Hugues Husson <phh@phh.me>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
Message-Id: <170836757975.201421.15611904209909777692.robh@kernel.org>
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property


On Mon, 19 Feb 2024 18:18:55 +0100, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> On our msm8998-based device, calling venus_sys_set_power_control()
> breaks playback. Since the vendor kernel never calls it, we assume
> it should not be called for this device/FW combo.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
> TODO in v2: split the patch in 2
> Is "qcom,no-low-power" a proper name for the property?
> Is a boolean property the right approach?
> ---
>  .../devicetree/bindings/media/qcom,venus-common.yaml     | 3 +++
>  drivers/media/platform/qcom/venus/hfi_venus.c            | 9 +++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,venus-common.yaml: properties:qcom,no-low-power: 'description' is a dependency of 'type'
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


