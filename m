Return-Path: <linux-media+bounces-58041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLFMEuvYz2mb1AYAu9opvQ
	(envelope-from <linux-media+bounces-58041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 17:12:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB93395A6F
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 17:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA331303E5EA
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 15:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B273C3C1B;
	Fri,  3 Apr 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNVDfreg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E7E26F46F;
	Fri,  3 Apr 2026 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228876; cv=none; b=oE2n3T4z+O2zqjizuObtmG4rF3y9NYcA252Tmm1LDOKs/EY9d/dH2GDmWqLjDUyGeU+YPb+7M+GiS7q2GZ+JSqjx2qhOddUrZktlpZygAp5QaJcJf8Uji4WGbFubv2AACeBZK9PuGHm2CHFLKyYvbCEDAoGDAIkr+wY1jsHzd8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228876; c=relaxed/simple;
	bh=MBl//kVf0h7ViOMDV5/e95VwI4Fm6fUWPiijBlkByPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5U1XR/PDQCn7D9sq3FND6mdLhCoB7Htj5+kO/XhQHi1YsQf3T7VOPBrTdjR5EraPuYfXnhmPD9TsnLbXN6MihsZktT111L6X0EMlkJHVdYtzJPtEp2y9aFokClJHm8ZjrSr22sAVlJv5NJEfLG9RVAZ3qOzZo5sqmfd7mc/xqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNVDfreg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4C6C2BCAF;
	Fri,  3 Apr 2026 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775228876;
	bh=MBl//kVf0h7ViOMDV5/e95VwI4Fm6fUWPiijBlkByPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tNVDfregz0Oo7WeU26r7V03urlU7jBW3Tvif+avKYtKi87XKZzPMMtZjFcI0ZLJHs
	 MM0hjD9LY7DnR8jZ6zkYso6GQ91+1WoB3gZg+uw4dtvJZLza1tksLnKHGTPQ8WZtze
	 digTKFzrJ3E/YiOiNoCFwewfuJMENmVi8xXem1C1LGsxGvKABcBmabYujBMHjUbdbe
	 Sgq6e+5DjLv3p6Jq8aP8wJxUJ2r2+ZEPYMODN5PiGVUvm7dQZZYuzmomBUvTk7Tzax
	 NkD126yUg7BSLrdXLQ04FPXjm/FjpixWVReuyDKYu35ynAhitDWYuj0GFfxJnt62UK
	 u57yvp2YgvnnA==
Message-ID: <c87d229c-137c-4e59-99cc-a97ef04f6e1b@kernel.org>
Date: Fri, 3 Apr 2026 16:07:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <2a108976-374a-46e1-968d-7befa4369a74@linaro.org>
 <4SLDL62Oin3XdiLjUEC_YAVA-m1dKV4j_8_RolU6NJFWCIWtem6e6sCb9n7OIHbcIWBfWdXx_vZy5mXCAbWUDg==@protonmail.internalid>
 <DHJD7P2TXQTH.1TQ4YQQ21A6CS@fairphone.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <DHJD7P2TXQTH.1TQ4YQQ21A6CS@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58041-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.sr.ht,vger.kernel.org,oss.qualcomm.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: DFB93395A6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03/04/2026 09:09, Luca Weiss wrote:
> Hi Vladimir,
> 
> On Tue Mar 31, 2026 at 12:49 AM CEST, Vladimir Zapolskiy wrote:
>> Hi Luca,
>>
>> On 2/16/26 10:54, Luca Weiss wrote:
>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>> SM6350 SoC.
>>>
>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>> far as I can tell.
>>>
>>> Though when stopping the camera stream, the following clock warning
>>> appears in dmesg. But it does not interfere with any functionality,
>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>> while the clock is on, and 'off' while it's off.
>>>
>>> Any suggestion how to fix this, is appreciated.
>>
>> I've looked at CAMCC recently, and I do notice that SM6350 CAMCC does not
>> set '.use_rpm = true' flag for whatever reason.
>>
>> If you find a free minute, can you test the change below?..
> 
> Unfortunately that change does not resolve the "gcc_camera_axi_clk
> status stuck at 'on'" warning.
> 
> fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.clock-controller/power/runtime_status
> active
> 
> fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.clock-controller/power/runtime_status
> suspended
> 
>>
>> ----8<----
>> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
>> index 7df12c1311c6..ba880e4edcaf 100644
>> --- a/drivers/clk/qcom/camcc-sm6350.c
>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>> @@ -1880,6 +1880,7 @@ static const struct qcom_cc_desc camcc_sm6350_desc = {
>>    	.num_clks = ARRAY_SIZE(camcc_sm6350_clocks),
>>    	.gdscs = camcc_sm6350_gdscs,
>>    	.num_gdscs = ARRAY_SIZE(camcc_sm6350_gdscs),
>> +	.use_rpm = true,
>>    };
>>
>>    static const struct of_device_id camcc_sm6350_match_table[] = {
>> ----8<----
>>
>> This change could be considered to be included in any case, I believe.
> 
> I guess this change is now the way to enable pm_runtime, I had this
> series 3 years ago in February 2023:
> https://lore.kernel.org/linux-arm-msm/20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com/
> 
> But I never followed up due to me not understanding pm_runtime well and
> no direct need for it.
> 
> But I guess reviving that with use_rpm = true, add power-domains &
> required-opps to dt-bindings and sm6350.dtsi should be a good idea?
> 
> Regards
> Luca
> 
>>
>>> [ 5738.590980] ------------[ cut here ]------------
>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>> [ 5738.591081] Modules linked in:
>>> [ 5738.591099] CPU: 0 UID: 10000 PID: 6918 Comm: plasma-camera Tainted: G        W           6.17.0-00057-ge6b67db49622 #71 NONE
>>> [ 5738.591118] Tainted: [W]=WARN
>>> [ 5738.591126] Hardware name: Fairphone 4 (DT)
>>> [ 5738.591136] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [ 5738.591150] pc : clk_branch_toggle+0x170/0x190
>>> [ 5738.591164] lr : clk_branch_toggle+0x170/0x190
>>> [ 5738.591177] sp : ffff800086ed3980
>>> [ 5738.591184] x29: ffff800086ed3990 x28: 0000000000000001 x27: ffff800086ed3cd8
>>> [ 5738.591208] x26: 0000000000000000 x25: ffffda14fcfbd250 x24: 0000000000000000
>>> [ 5738.591230] x23: 0000000000000000 x22: ffffda14fc38bce0 x21: 0000000000000000
>>> [ 5738.591252] x20: ffffda14fd33e618 x19: 0000000000000000 x18: 00000000000064c8
>>> [ 5738.591274] x17: 0000000000000000 x16: 00001ae003667e9e x15: ffffda14fd2a07b0
>>> [ 5738.591295] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
>>> [ 5738.591317] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffda14fd2a0838
>>> [ 5738.591338] x8 : 0000000000057fa8 x7 : 0000000000000a16 x6 : ffffda14fd2f8838
>>> [ 5738.591360] x5 : ffff0001f6f59788 x4 : 0000000000000a15 x3 : ffff25ecf9d7e000
>>> [ 5738.591381] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000baf5c100
>>> [ 5738.591403] Call trace:
>>> [ 5738.591412]  clk_branch_toggle+0x170/0x190 (P)
>>> [ 5738.591429]  clk_branch2_disable+0x1c/0x30
>>> [ 5738.591445]  clk_core_disable+0x5c/0xb4
>>> [ 5738.591462]  clk_disable+0x38/0x60
>>> [ 5738.591478]  camss_disable_clocks+0x44/0x78
>>> [ 5738.591496]  vfe_put+0x7c/0xc0
>>> [ 5738.591512]  vfe_set_power+0x40/0x50
>>> [ 5738.591528]  pipeline_pm_power_one+0x14c/0x150
>>> [ 5738.591546]  pipeline_pm_power+0x74/0xf4
>>> [ 5738.591561]  v4l2_pipeline_pm_use+0x54/0x9c
>>> [ 5738.591577]  v4l2_pipeline_pm_put+0x14/0x40
>>> [ 5738.591592]  video_unprepare_streaming+0x18/0x24
>>> [ 5738.591608]  __vb2_queue_cancel+0x4c/0x314
>>> [ 5738.591626]  vb2_core_streamoff+0x24/0xc8
>>> [ 5738.591643]  vb2_ioctl_streamoff+0x58/0x98
>>> [ 5738.591657]  v4l_streamoff+0x24/0x30
>>> [ 5738.591672]  __video_do_ioctl+0x430/0x4a8
>>> [ 5738.591689]  video_usercopy+0x2ac/0x680
>>> [ 5738.591705]  video_ioctl2+0x18/0x40
>>> [ 5738.591720]  v4l2_ioctl+0x40/0x60
>>> [ 5738.591734]  __arm64_sys_ioctl+0x90/0xf0
>>> [ 5738.591750]  invoke_syscall.constprop.0+0x40/0xf0
>>> [ 5738.591769]  el0_svc_common.constprop.0+0x38/0xd8
>>> [ 5738.591785]  do_el0_svc+0x1c/0x28
>>> [ 5738.591801]  el0_svc+0x34/0xe8
>>> [ 5738.591820]  el0t_64_sync_handler+0xa0/0xe4
>>> [ 5738.591838]  el0t_64_sync+0x198/0x19c
>>> [ 5738.591854] ---[ end trace 0000000000000000 ]---
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Changes in v4:
>>> - Update power-domain-names order (Krzysztof)
>>> - Make hex numbers lower case in init seq (David)
>>> - Pick up tags
>>> - Link to v3: https://lore.kernel.org/r/20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com
>>
>> Should find some time myself to issue RBs, sorry for the delay.
>>
>>> Changes in v3:
>>> - Update dt-bindings to include everything related to camss
>>> - Update regulator names
>>> - Remove slow_ahb_src
>>> - Link to v2: https://lore.kernel.org/r/20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com
>>>
>>> Changes in v2:
>>> - Remove prefix from interconnect-names
>>> - Move 'top' power-domain to the top of list
>>> - Update regulator supply names
>>> - Link to v1: https://lore.kernel.org/r/20251024-sm6350-camss-v1-0-63d626638add@fairphone.com
>>>
>>> ---
>>> Luca Weiss (3):
>>>         dt-bindings: media: camss: Add qcom,sm6350-camss
>>>         media: qcom: camss: Add SM6350 support
>>>         arm64: dts: qcom: sm6350: Add CAMSS node
>>>
>>>    .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++++
>>>    arch/arm64/boot/dts/qcom/sm6350.dtsi               | 233 ++++++++++
>>>    .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++
>>>    drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>>>    drivers/media/platform/qcom/camss/camss.c          | 261 ++++++++++++
>>>    drivers/media/platform/qcom/camss/camss.h          |   1 +
>>>    6 files changed, 1093 insertions(+)
>>> ---
>>> base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
>>> change-id: 20251024-sm6350-camss-9c404bf9cfdd
>>>
>>> Best regards,
> 

What about taking the clock out of hardware gated mode ?

┌─[deckard@sagittarius-a] - [~/Development/qualcomm/qlt-kernel] - [Fri 
Apr 03, 16:05]
└─[$]> git diff
diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index a4d6dff9d0f7f..f98cb35bcd408 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -909,8 +909,6 @@ static struct clk_branch gcc_camera_ahb_clk = {
  static struct clk_branch gcc_camera_axi_clk = {
         .halt_reg = 0x17018,
         .halt_check = BRANCH_HALT,
-       .hwcg_reg = 0x17018,
-       .hwcg_bit = 1,
         .clkr = {
                 .enable_reg = 0x17018,
                 .enable_mask = BIT(0),

---
bod

