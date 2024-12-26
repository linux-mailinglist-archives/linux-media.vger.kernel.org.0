Return-Path: <linux-media+bounces-24103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 710609FCE7B
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 23:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA13D18820AE
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 22:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33020198853;
	Thu, 26 Dec 2024 22:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sA4yuBeB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1013E028;
	Thu, 26 Dec 2024 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735251545; cv=none; b=KPkzRFM0p/UoimHlJzl/y8aVQxmuYbRJPINJRHEkFkIAdFYtOC0OpVAsF3dmEUD7KEjpIA0AzewSateVXFAI7TG3YYG4tE/4cTS6MSQZSW9xaq5GTyt+b+5++rd8nK2vpMsLOXRFQTXY8sVS9aH54sOBbq6uvrFK6LsNlOdtn4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735251545; c=relaxed/simple;
	bh=YrW/pSNjqT30hYnndfGV0u+DxGmk+o3lH94dwC0FPUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XePbMbzQ+JMJxmFQQF+LX8SNTLegprZKfxFG4a32p8yxvOUnxpTZ+Q3k2f8ckHB+bW1QFMzVBuul507b7CZVGjttxzlHl4pc0b6p1rN2Dpe7Vvoj93OjcC7D8CXqJUjpdnzfa3ChxMThDYA/6RdvPdEJHeRK5FrrhiueIbmpb/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sA4yuBeB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB7CC4CED1;
	Thu, 26 Dec 2024 22:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735251545;
	bh=YrW/pSNjqT30hYnndfGV0u+DxGmk+o3lH94dwC0FPUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sA4yuBeBrDlPEwYOLTeCjs/z/cAkAIMJoWX7K5JlJXJt5RYhm4jFHrAH2MbUg9N9a
	 ZGmv/Eg29Q6qH8JGsqu++jMCX9InbSCPuwD8MHurHa3iyual5uCtRSwlD9i+AXveVL
	 63d/B5l3MMLVGj6h6ZcW3pqiT5NyG3RxHfhRUky79GB1uJxBOqLBK6+Pf9od5bpEC6
	 QC016aLKC2aknI8AXzpCJwFpn1FkoLfAPglu4x3dC5ruMyXj3EsRnFpiYSmKWrcg2N
	 3es22mMj6NpXPvDYF+gp1odtOo1Lz3WF/OiJ0GQ+Z0jCRysB2fxoPLhfQamGdjdSAT
	 HyZAQMmfnAUjQ==
Date: Thu, 26 Dec 2024 16:19:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 0/4] media: venus: enable venus on qcs615
Message-ID: <xygyprx3e6iagoq55bw5y2ruvoqd3jy5defpp4jyeo5sqlomto@rxkp6eolrewp>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>

On Thu, Dec 19, 2024 at 11:11:52AM +0530, Renjiang Han wrote:
> QCS615 uses the same video core as SC7180, so reuse the same resource
> data of SC7180 for QCS615 to enable video functionality.
> 
> There are no resources for the video-decoder and video-encoder nodes
> in the device tree, so remove these two nodes from the device tree. In
> addition, to ensure that the video codec functions properly, use [3]
> to add encoder and decoder node entries in the venus driver.
> 
> Validated this series on QCS615 and SC7180.
> 
> depends on:
> [1] https://lore.kernel.org/all/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com

This series has requests for changes and will as such never be merged.

Rather than relying on the maintainer to coordinate your cross-team
dependencies, it would be preferable if you grouped your patches per
functional area (i.e. you include Taniya's patch to add videocc) in your
series.

> [2] https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com

Same goes for this.

I'll drop the two two dts patches from my review queue as they have
unmet dependencies. Please resubmit them together with dependencies or
once the dependencies are available in linux-next.

Regards,
Bjorn

> [3] https://lore.kernel.org/all/20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Changes in v6:
> - 1. Remove video-decoder and video-encoder nodes from the device tree
> - 2. Add a new dependency.
> - 3. Fix missing tag.
> - 4. Update commit message.
> - Link to v5: https://lore.kernel.org/r/20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com
> 
> Changes in v5:
> - 1. Remove extra blank lines in yaml files.
> - 2. Add new variables in the driver while keeping the order of the
> original variables. And remove unnecessary variable initialization.
> - 3. Update commit message.
> - 4. Update the order of nodes in the device tree.
> - Link to v4: https://lore.kernel.org/r/20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com
> 
> Changes in v4:
> - 1. Remove qcom,qcs615-venus.yaml and use qcom,sc7180-venus.yaml for
> qcs615 dt-bindings.
> - 2. Add "qcom,qcs615-venus" compatible into qcom,sc7180-venus.yaml.
> - 3. Remove qcs615 resource from the driver and use sc7180 resource for
> the qcs615.
> - 4. Use the frequency in the opp-table in devicetree for the driver.
> For compatibility, if getting data from the opp table fails, the data
> in the frequency table will be used.
> - 5. Keep the reverse Christmas tree order coding style.
> - 6. Add "qcom,sc7180-venus" compatible in devicetree.
> - 7. Update cover letter message.
> - Link to v3: https://lore.kernel.org/r/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com
> 
> Changes in v3:
> - 1. Remove the ‘|’ after 'description' in the qcom,qcs615-venus.yaml.
> - 2. Add a blank line before 'opp-table' in the qcom,qcs615-venus.yaml.
> - 3. Put ‘additionalProperties’ before ‘properties’ in the
> qcom,qcs615-venus.yaml.
> - 4. Update the subject of qcom,qcs615-venus.yaml patch.
> - Link to v2: https://lore.kernel.org/r/20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com
> 
> Changes in v2:
> - 1. The change-id of DT and driver are removed.
> - 2. Add qcom,qcs615-venus.yaml files to explain DT.
> - 3. The order of driver's commit and DT's commit is adjusted. Place the
> driver's commit before the DT's commit.
> - 4. Extends driver's commit message.
> - 5. Split DT's commit into two commits. Add the venus node to the
> qcs615.dtsi file. Then in the qcs615-ride.dts file enable the venus node.
> - 6. Modify alignment, sort, upper and lower case letters issue.
> - 7. Update cover letter message description.
> - Link to v1: https://lore.kernel.org/r/20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com
> 
> ---
> Renjiang Han (4):
>       dt-bindings: media: add support for video hardware on QCS615 platform
>       media: venus: pm_helpers: use opp-table for the frequency
>       arm64: dts: qcom: qcs615: add venus node to devicetree
>       arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec
> 
>  .../bindings/media/qcom,sc7180-venus.yaml          |  7 +-
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  4 ++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 78 ++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/pm_helpers.c     | 53 +++++++++++----
>  4 files changed, 127 insertions(+), 15 deletions(-)
> ---
> base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
> change-id: 20241219-add-venus-for-qcs615-238af570d03d
> prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
> prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
> prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
> prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
> prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
> prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
> prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
> prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
> prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
> prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
> prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
> prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
> prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
> prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
> prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
> prerequisite-message-id: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
> prerequisite-patch-id: 3cee337bfc515f0fda75c8406e0e472313a4c895
> prerequisite-patch-id: fb56cdcbac866038943e033ceaa898e0582e5365
> prerequisite-patch-id: f7297a975e4ffcdb40e94cc7d050a1aa089b9e43
> 
> Best regards,
> -- 
> Renjiang Han <quic_renjiang@quicinc.com>
> 

