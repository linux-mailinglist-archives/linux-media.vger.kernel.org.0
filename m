Return-Path: <linux-media+bounces-61235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB5II5jxAmrpywEAu9opvQ
	(envelope-from <linux-media+bounces-61235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:23:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BD51D94A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7818530B27EC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459B349550F;
	Tue, 12 May 2026 09:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2nZCxqR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B842B72B;
	Tue, 12 May 2026 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577446; cv=none; b=rOZaCuCZihASqLbGyRnGTVW6DxckguuzrljkvbPiYwuJslrunNX19Gy/JZ3IU1MKqIetg2Sfr30GvuEKh+5xVmyfqnOIy/nUfPPmOjDim5fDso9Wwo19ezdS26VS4dBalIubkhlnB9Hs8PgHM/9SWCoCB5RmtUcZgYiCJcGTlNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577446; c=relaxed/simple;
	bh=8Y13EsEyZb7cILHRpxmoq+9zMBOXxuWDBruFP5HMvY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRZQ3UJuHkoCSBlq5w1PrVYQmrd8y0Id7NP9L5xoz0dAsUO90+SxlxmUOVrjS7Sd3hF6nY0+Le1hWOtVejfWZRswQswZIUFcKB8XKCpa1320oh4NjnxLPfWV+1jHiGZcpeb2Qt/yB54z4yvfp7TcJZJMtSfX6u47b1tQKQbxJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2nZCxqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E04C2BCB0;
	Tue, 12 May 2026 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778577444;
	bh=8Y13EsEyZb7cILHRpxmoq+9zMBOXxuWDBruFP5HMvY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C2nZCxqRN5W9icnha1kAmS1md3NeWCLlm2GEP/Nq8jdq/z7pmGhAMjhMSLklFjkF4
	 aVs7QXZrrAhy+OZB6srNT3ZuFGtivMYCqdoZH/R7MEVZ6aywkmjBAT8Chgyvth1aIQ
	 j8YXxmnKIfh30qa7xK6BuHBnmj4oEHVfAMcGzUob/du24bsY8j8lcznntu5Sm6hJon
	 +sFAyU7OlySium0xJtlhx4OsMI9/SDXKBEFSpr1N6u+y94MChYSHsA0pOwyHHk2579
	 WUgC6dY+9gVEmm/UcQgPrEpimN8MPMcL/yhU9b/UiDafTOK2N9yQO+UAiPOq9DPVd9
	 gGFKMMiHixHOQ==
Message-ID: <9deb4b13-be1c-4163-a421-bcf5f3babd29@kernel.org>
Date: Tue, 12 May 2026 10:17:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] media: qcom: venus: add MSM8939 support
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <k-DF0RGht93wXW1P6HM3qlZuXIYqVpHIKYFu9l6z96km16C4l2xdRs_WRSg-CGedvnnjzaWo_VzIg05JKTNoIg==@protonmail.internalid>
 <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0E3BD51D94A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61235-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 10/05/2026 10:47, Erikas Bitovtas wrote:
> This patch series adds support for Venus on MSM8939. It is mostly
> similar to MSM8916 Venus, except it needs two additional cores to be
> powered on before it can start decoding.
> 
> As per Dmitry's request, I am attaching Fluster results and
> v4l2-compliance output. Fluster results were very inconsistent and
> caused power collapse fails.
> H.264: https://pastebin.com/C15qeq5W
> H.265 (HEVC): https://pastebin.com/WDsnxvuk
> VP8: https://pastebin.com/egAgEm15
> v4l2-compliance: https://pastebin.com/VpBhEFc1
> Power collapse fail log: https://pastebin.com/rTivMcpK
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> Changes in v6:
> - Added a more generic mechanism on blacklisting codecs.
> - Reworded a commit for setting Venus core GDSCs to hardware controlled.
> - Reworded a commit for adding HEVC decoding to MSM8939.
> - Link to v5: https://patch.msgid.link/20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com

Since you've indicated you are doing a v7 here's some more feedback on v6.

- A clear description of what has been tested and verified as working on
   each core. I think we got lost in the weeds of discussing the GDSC
   change, when what I was trying to understand was the bitmap
   of working encoder/decoder, what is particular to each core.

- HEVC decoder only works on 8939 afaict so there's no sense in
   trying to make it do encoder

- Ideally we have one node that works as an encoder and one as a
   decoder - which is pretty standard and normal on this genration
   of hardware.

- If that is not possible then decoder/decoder is also acceptable
   with the caveat that the declared list of decoder formats should
   be true from the perspective of user-space.

   We discussed blacklisting/whitelist particular codes, that's up
   to you to decide in your submission.

   For my part I think a list is better than a strcmp() as you never
   know how complex the logic might end up getting.
> 
> Changes in v5:
> - Undid the merge of vcodec_clks, they are split back to
>    vcodec{0,1}_clks now.
> - Extracted a dev_pm_domain_attach_list() call into a function of its
>    own to reduce nesting.
> - Added missing "power-domain-names" required property to device tree
>    binding.
> - Renamed vcodec clocks and power domains to match other Venus bindings.
> - Reordered commits and grouped them by subsystems. Now first come DTB
>    patches, then clock, then media.
> - Removed "status = "disabled"" in the device tree example.
> - Link to v4: https://patch.msgid.link/20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com
> 
> Changes in v4:
> - Removed vcodec{0,1}_pmdomains and merged vcodec{0,1}_clks into
>    vcodec_clks instead for MSM8939.
> - Inlined video decoder and encoder device tree nodes in the driver and
>    removed them from the binding.
> - Kept vdec and venc methods for HFI v3 separate from HFI v1.
> - {vdec,venc}_get() are now called as early as before, since it is no
>    longer needed for us to attach power domains to dev_dec and dev_enc.
> - Link to v3: https://patch.msgid.link/20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com
> 
> Changes in v3:
> - Added missing vcodec1_clks to resource struct.
> - Removed enc_nodename from resource struct since we include
>    video-decoder now.
> - Link to v2: https://patch.msgid.link/20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com
> 
> Changes in v2:
> - Enabled GDSCs during encoding as well.
> - Merged vcodec{0,1}_pmdomains_num into vcodec_pmdomains_num.
> - Reworded commit for marking GDSCs as hardware controlled. Same
>    situation as in cdc59600bccf ("clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock")
> - Clarified the reason for missing firmware-name property in device
>    tree.
> - Clarified the reason for moving vdec_get and venc_get for later.
> - Link to v1: https://patch.msgid.link/20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com
> 
> To: Bryan O'Donoghue <bod@kernel.org>
> To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: André Apitzsch <git@apitzsch.eu>
> To: Erikas Bitovtas <xerikasxx@gmail.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney@redhat.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> 
> ---
> André Apitzsch (4):
>        media: dt-bindings: venus: Add qcom,msm8939 schema
>        arm64: dts: qcom: msm8939: Add venus node
>        arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node
>        media: qcom: venus: Add msm8939 resource struct
> 
> Erikas Bitovtas (4):
>        arm64: dts: qcom: msm8939-asus-z00t: add Venus
>        clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
>        media: qcom: venus: add power domain enable logic for Venus cores
>        media: qcom: venus: add codec blacklist mechanism
> 
>   .../bindings/media/qcom,msm8939-venus.yaml         |  79 +++++++++++
>   arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
>   .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
>   arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
>   drivers/clk/qcom/gcc-msm8939.c                     |   4 +
>   drivers/media/platform/qcom/venus/core.c           |  47 +++++++
>   drivers/media/platform/qcom/venus/core.h           |   2 +
>   drivers/media/platform/qcom/venus/hfi_parser.c     |  10 +-
>   drivers/media/platform/qcom/venus/pm_helpers.c     | 149 ++++++++++++++++++++-
>   9 files changed, 321 insertions(+), 9 deletions(-)
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260416-msm8939-venus-rfc-c025c4c74fae
> 
> Best regards,
> --
> Erikas Bitovtas <xerikasxx@gmail.com>
> 


