Return-Path: <linux-media+bounces-63176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBQ2JJIbHGqqJwkAu9opvQ
	(envelope-from <linux-media+bounces-63176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:29:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB8615C6F
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 386F0301B934
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 11:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652D0384238;
	Sun, 31 May 2026 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THPzK2Wu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A69376A0E;
	Sun, 31 May 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780226951; cv=none; b=LNnQH3xRF4cqiRXUtLbbwv9fn+0+N5aROD4aild3ao9kJzc/A+bWdXMQ1cmL3EvtGqtCtjyXeUcaZftzHLfFgliOjcYwBdLG9SsaKLhOnhlN3EipyPINzrYz9I00hIxkD3rW151rBa6+VgJe/0Q0ObE66vw0UVnAbDYjOmErbA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780226951; c=relaxed/simple;
	bh=fYT6nafkX80yYFXRbPXfrli8P2EaYbaES3huieh7ZHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3t7N1e88W+3hWhT/dV65ra9YKH6PJDjGCSK5TlHAWzqjDbOzhYUXMa46D/3fo2GMY9nN+9YH9AXgHFjQfuHgGxCcRB92KDl0QG/c7cS+iAkkpvQmqH2wscmJRGTY6h7f/k++y69J0I/0vFHjMrKH1fdTHebNRliCanDzaCsCuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THPzK2Wu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5257F1F00893;
	Sun, 31 May 2026 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780226950;
	bh=VqtpD1J2WLu5u3GrzIy1uvzE78OXRwpnpREBL76bfeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=THPzK2WuACvHjmn6VXnYWdW8ji60fYQiuCxFMEwgH+o1pb1oSCtVrdelYi8MkHC6X
	 dXmrRyyJhoG5YdXhOZ9zqbMOQfBlFN91158zadoPKZXGsq8Nbyb02A7jlbE42HLvXf
	 HwMY+6XrLfBvDN4cBqv6mN/w9zRKHi1Qb8wo4/+IfeRFlgOWBuRvlz/sC4hCK2s2/f
	 3QIiipxvE3C1E7LvHHfXJc9+qlOoGRfhaHNiXsL7/MywUVscXCaCRJ08erZQRF2n23
	 dOulW/pjaWCMqtn8HjnmsvjMux1jR69ADl9ZY3FR5zrxnt4hy06Aym+sBcNx5g/sm7
	 S62M72roxdWgA==
Message-ID: <9542cc9c-5571-4cae-9c81-a2c259f73350@kernel.org>
Date: Sun, 31 May 2026 12:29:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/5] media: qcom: camss: Add Kaanapali support
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <FXDAuI5m6Enkr_1xXCRtdAt_nLft5hGS75Kmuwi4PN4Rv4Z-d631VEvnGqL3Vygade8Z6Bnqwllnv8tU8oqH_g==@protonmail.internalid>
 <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63176-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 2EAB8615C6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/05/2026 09:05, Hangxiang Ma wrote:
> Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
> modules, with each TFE having multiple RDI ports. This hardware
> architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.
> 
> Kaanapali camera subsystem provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> This series has been tested using the following commands with a
> downstream driver for S5KJN5 sensor.
> - media-ctl --reset
> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> Changes in v13:
> - Remove prerequisite dependencies that have been merged upstream
> - Remove redundant empty 'regulators' initializers in csid and vfe  - bod
> - Revert binding from full hardware description to CAMSS-only scope for
>    modular and incremental development - bod
> - Rename icc path names and vfe clock names to drop redundancies - Krzysztof
> - Separate port index from VC value in csid_configure_stream(). Previously
>    vc was used as both the loop iterator and the hardware VC, causing
>    misconfiguration on RDI path starting from 1 - bod
> - Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/
> 
> Changes in v12:
> - Add CSIPHY regulator current due to regulator interface changed - bod
> - Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com
> 
> Changes in v11:
> - Rebase this series due to conflict - bod
> - Update binding commit message to align with previous generations
> - Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com
> 
> Changes in v10:
> - Update interconnect and CX domain AXI clock names to be consistent with
>    previous generations - bod
> - Update the struct name for csiphy lane register settings to make it reusable
>    for other compatible chipsets
> - Updated power domain names to IFE for consistency - Krzysztof
> - Add description for acronyms listed in binding commit message - Dmitry
> - Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com
> 
> Changes in v9:
> - Updates the names of some of the resources in DT bindings to be consistent
>    with previous generations and improve the commit its message. The name
>    changes are also applied to csiphy and vfe camss resource lists - bod
> - Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com
> 
> Changes in v8:
> - Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
> - Add missing register descriptions to binding and cover letter commit log - bod
> - Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com
> 
> Changes in v7:
> - Add ICP SYS registers to camss binding - bod
> - Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
>    after csid config to make it clearer and simplify its call path - bod
> - Remove unnecessary bitwise AND while configuring image address to bus- bod
> - Tidy up a comment and a couple of hex values and csid/vfe - bod
> - Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com
> 
> Changes in v6:
> - Modified the bindings to represent the whole of the camera hardware on
>    KNP than just what is exercised by the CAMSS driver by extending the
>    descriptions and the properties, the regs, clocks, interrupts, power
>    domains, iommus etc. In addition, use the word 'vfe' everywhere in the
>    bindings to be clear that all of those resources are referring to the
>    same front end modules. - Krzysztof/bod
> - Change camss vfe power domain names to align with the binding file
> - Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com
> 
> Changes in v5:
> - Refine v4 change log - Krzysztof
> - Fix typo by removing redundant numerical version in kaanapali camss binding
>    comment description - Krzysztof
> - Add missing tags that should be posted with v4 revision - Krzysztof/Andi
> - Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com
> 
> Changes in v4:
> - Add detailed hardware descriptions and revise message title to follow the
>    standard comment format for kaanapali camss binding file - Krzysztof
> - Format kaanapali camss binding file to keep style consistency, by reverting
>    power domain name from TFE to IFE and keeping clocks name order as last
>    generation - Krzysztof
> - Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
>    for arbitrary board design with common or unique supplies to each of the PHYs
>    in kaanapali camss binding example, based on v2 comments - bod/Vladimir
> - Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com
> 
> Changes in v3:
> - Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
> - Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
> - Resolve the dependency issues in the camss bindings file using ephemeral
>    DT nodes - Vladimir/Dmitry
> - Update hf mnoc name and bandwidth values for icc module - bod
> - Split CSIPHY status macro changes into a separate patch series - bod
> - Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
> - Clarify why the RUP and AUP register update process is deferred - bod
> - Clarify the necessity to keep NRT clocks for vfe - Vijay
> - Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com
> 
> Changes in v2:
> - Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
> - Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
> - Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
> - Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
> - Add whole vfe write engine client mappings in comment - bod
> - Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
> - Remove SoC specific logic for vfe ops->reg_update and add a new variable
>    to determine whether ops->reg_update is deferred or not - bod
> - Add description to explain why 'qdss_debug_xo' should be retained - bod
> - Add the procss node in csiphy register list comment - bod
> - Rename the variable 'cmn_status_offset' to 'common_status_offset' and
>    align this with macro in csiphy register structure to avoid ambiguity - bod
> - Aggregate Kaanapali items into the definition that introduced by
>    'qcom,qcm2290-cci' in cci binding file - Loic
> - Format 'kaanpali-camss.yaml' binding file
> - Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com
> 
> ---
> Hangxiang Ma (5):
>        media: dt-bindings: Add CAMSS device for Kaanapali
>        media: qcom: camss: Add Kaanapali compatible camss driver
>        media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
>        media: qcom: camss: csid: Add support for CSID gen4
>        media: qcom: camss: vfe: Add support for VFE gen4
> 
>   .../bindings/media/qcom,kaanapali-camss.yaml       | 433 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/Makefile         |   2 +
>   drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
>   .../media/platform/qcom/camss/camss-csid-gen4.c    | 376 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 ++++++
>   drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 ++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 360 +++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   12 files changed, 1512 insertions(+), 5 deletions(-)
> ---
> base-commit: b25f15a8600145233c948b40cab6d7d57bac3076
> change-id: 20260112-kaanapali-camss-73772d44eff7
> 
> Best regards,
> --
> Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> 

This series doesn't apply.

Please resend when fixed.

---
bod

