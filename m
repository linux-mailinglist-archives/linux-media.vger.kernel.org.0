Return-Path: <linux-media+bounces-57686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI9nCoD+ymk2CgYAu9opvQ
	(envelope-from <linux-media+bounces-57686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:51:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9506036220E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98414303B2C7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 22:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D333E959D;
	Mon, 30 Mar 2026 22:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlVazujy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E003EAC75
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 22:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910993; cv=none; b=iYAuxXhU2HtPEq0krXthIfi4VXm87WSu4pFOKRvr7hQU1qWX7tuFUnDGhxW1qnerRQr2t5YtV867FIZrKbMg06tD7G7v88YpJ8u4FxJJAYvRdBmXpEaCBcrTgyVWbiAj7jfC8xOvmn0WvV0oAR0vmHTNz+HbP2GYc0PxKRpqnys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910993; c=relaxed/simple;
	bh=7anFCZoYp9WMJApmuJm70DGhnai/wq766/BxAZxtR5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcI2fGTH6CfNSvAqhj6pvDf10O6uhI7oxJ25myFrJxZ7z1Ur1XeW1lMlOM5qUo2CizViuSdklRaF4l3CZUnQHhi7Dox6WCXFf6M14RBCczrGp1/U2F9rzmnkWAI/SyIdUbkiOMRnSM75+HhZI2HPbV8D9hRjpp59sOSCgfTbt+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XlVazujy; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38c6bd590f5so5250991fa.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 15:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774910985; x=1775515785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkzA/8PwZigV8lDDqxn0XcVr3NG0HEYSbBhRSeKkujA=;
        b=XlVazujyKcR0C8KyRR2oyhxlw51MIpvS2V96BIh+KIfYvgfxoe1W7l9xv4O2f83rIV
         Kmle/eVgmKFldbE3CB18Ipz9tb2/yns7uBYL/hYrkPVmJ0h3qqvAc/wbHDkKneuvKSWm
         7iuIGFXs1Lr9Hjb3UHgP1WHl5HsLQUP8Zf4TOOHxx60qdQW9RTPVVDSAZkFWZ9xlUck1
         cF7HM2OtMrTkfpCw+e0QGkGwtwiNJ7weaYlpNjdgKieLbauzeN/D02xHHxtHZHASfmzc
         Zift4rk7MMTWqI9r+l/6Rw0/i9MXYgqJl9uVLYVeMrJLuFeHURbk/hfuYxlVRbH7aixL
         fJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774910985; x=1775515785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkzA/8PwZigV8lDDqxn0XcVr3NG0HEYSbBhRSeKkujA=;
        b=ex/hxciqFClNoeNWfhKaYHizYCg1l137hC0gvpLDKBThDX+bnoLgz78wGaRDpfP5ez
         MmYtozIm6FH1BC8W9HwzNfR1ut0Cz/DjYCK1JgNhivcF5Gvryt6CZwKLKf7cU0s5rZue
         ZzATuAA3ptlYvUHr+aOP5fDcGuLW9Jbp4Lt16IEKafpoKfiLtnINVOfwdBBYbF7A5NHy
         v6NpLwAf/DkMqJHvSilfFjO9rB/KJ0EF3vnggd9ZWISUxHiX8A7u2WfbCDzmYboh1v/a
         BTE8OJcSjfJVuhbuzmoZfrDhzw0ixGluHdyx21eA0Vnm3LeVdN0OLfpMH/ZumxjjiRvg
         ZxsA==
X-Forwarded-Encrypted: i=1; AJvYcCUl26vc0gYFjI+MGIKZoqoF9fkQaHjN1a6fapJgHm9kE06Du2UbfnqyvRkmwuulQmEjDCqQoF2CMBtMeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYIMM30ILs0nFWCv8v9pm89CKWgknZOE/mYlR7Y71TXxNkJXFY
	xT5fFXj35XnspLO2UTT4jiBNuJVNewOUzQbQxZ49trwu20QbymyAiOrxsF8CF2AYIfg=
X-Gm-Gg: ATEYQzzU5ljj+6o8uoB9UXQrQtDlX1UTJFH/BnmhFh9TOBGqKGBVt9wkAXozEdSnZRZ
	/t8FM4Me5FyWUkRFIWfEZao/tK9FwaRN/7TmDGTaE4SBW4T8fm86cLDoqwTNFtAlllJRUFqgj16
	uOZps0A5HYEuw55N3ycADxZ25QvPsuq1zCQV3/jKRkN2pPrYVYvCnWfocSSbxzjWNJ39Zz/4D+V
	4Pd1SL/+7g+Tklls6gIfSAuMNDSQslwXwW7RgkJUqPzQvLYWSzILTEPHFOEbNq42eIMrXte4ADe
	z/+UYofr2hcI8sGlR2p0ATjE3HlkWadeJ7QfLPaLgYQ2dez66g8fxp6vlg9VgM6Quf898TZkjpg
	We6nnNMbwx4IyJ5fYptwp3/R5NtTfXr0D+lvLEgXwm129Uo/XKyrSdpldpDaYHVDjIOAXM3XGGH
	MuI3UhNG/wuan5qB90R8qX5mOiL1tdHqaGJOjNKwcpv8gVLMBlwlT9hkFxzStQuD+M0b0GPO58S
	A0AHSaJjy9IJ9AM
X-Received: by 2002:a05:6512:1252:b0:5a2:a23b:c439 with SMTP id 2adb3069b0e04-5a2ab92cc5fmr2237800e87.6.1774910985110;
        Mon, 30 Mar 2026 15:49:45 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f426csm1959250e87.7.2026.03.30.15.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 15:49:44 -0700 (PDT)
Message-ID: <2a108976-374a-46e1-968d-7befa4369a74@linaro.org>
Date: Tue, 31 Mar 2026 01:49:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.sr.ht,vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57686-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 9506036220E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

On 2/16/26 10:54, Luca Weiss wrote:
> Add bindings, driver and dts to support the Camera Subsystem on the
> SM6350 SoC.
> 
> These patches were tested on a Fairphone 4 smartphone with WIP sensor
> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
> far as I can tell.
> 
> Though when stopping the camera stream, the following clock warning
> appears in dmesg. But it does not interfere with any functionality,
> starting and stopping the stream works and debugcc is showing 426.4 MHz
> while the clock is on, and 'off' while it's off.
> 
> Any suggestion how to fix this, is appreciated.

I've looked at CAMCC recently, and I do notice that SM6350 CAMCC does not
set '.use_rpm = true' flag for whatever reason.

If you find a free minute, can you test the change below?..

----8<----
diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index 7df12c1311c6..ba880e4edcaf 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1880,6 +1880,7 @@ static const struct qcom_cc_desc camcc_sm6350_desc = {
  	.num_clks = ARRAY_SIZE(camcc_sm6350_clocks),
  	.gdscs = camcc_sm6350_gdscs,
  	.num_gdscs = ARRAY_SIZE(camcc_sm6350_gdscs),
+	.use_rpm = true,
  };
  
  static const struct of_device_id camcc_sm6350_match_table[] = {
----8<----

This change could be considered to be included in any case, I believe.

> [ 5738.590980] ------------[ cut here ]------------
> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
> [ 5738.591081] Modules linked in:
> [ 5738.591099] CPU: 0 UID: 10000 PID: 6918 Comm: plasma-camera Tainted: G        W           6.17.0-00057-ge6b67db49622 #71 NONE
> [ 5738.591118] Tainted: [W]=WARN
> [ 5738.591126] Hardware name: Fairphone 4 (DT)
> [ 5738.591136] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 5738.591150] pc : clk_branch_toggle+0x170/0x190
> [ 5738.591164] lr : clk_branch_toggle+0x170/0x190
> [ 5738.591177] sp : ffff800086ed3980
> [ 5738.591184] x29: ffff800086ed3990 x28: 0000000000000001 x27: ffff800086ed3cd8
> [ 5738.591208] x26: 0000000000000000 x25: ffffda14fcfbd250 x24: 0000000000000000
> [ 5738.591230] x23: 0000000000000000 x22: ffffda14fc38bce0 x21: 0000000000000000
> [ 5738.591252] x20: ffffda14fd33e618 x19: 0000000000000000 x18: 00000000000064c8
> [ 5738.591274] x17: 0000000000000000 x16: 00001ae003667e9e x15: ffffda14fd2a07b0
> [ 5738.591295] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
> [ 5738.591317] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffda14fd2a0838
> [ 5738.591338] x8 : 0000000000057fa8 x7 : 0000000000000a16 x6 : ffffda14fd2f8838
> [ 5738.591360] x5 : ffff0001f6f59788 x4 : 0000000000000a15 x3 : ffff25ecf9d7e000
> [ 5738.591381] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000baf5c100
> [ 5738.591403] Call trace:
> [ 5738.591412]  clk_branch_toggle+0x170/0x190 (P)
> [ 5738.591429]  clk_branch2_disable+0x1c/0x30
> [ 5738.591445]  clk_core_disable+0x5c/0xb4
> [ 5738.591462]  clk_disable+0x38/0x60
> [ 5738.591478]  camss_disable_clocks+0x44/0x78
> [ 5738.591496]  vfe_put+0x7c/0xc0
> [ 5738.591512]  vfe_set_power+0x40/0x50
> [ 5738.591528]  pipeline_pm_power_one+0x14c/0x150
> [ 5738.591546]  pipeline_pm_power+0x74/0xf4
> [ 5738.591561]  v4l2_pipeline_pm_use+0x54/0x9c
> [ 5738.591577]  v4l2_pipeline_pm_put+0x14/0x40
> [ 5738.591592]  video_unprepare_streaming+0x18/0x24
> [ 5738.591608]  __vb2_queue_cancel+0x4c/0x314
> [ 5738.591626]  vb2_core_streamoff+0x24/0xc8
> [ 5738.591643]  vb2_ioctl_streamoff+0x58/0x98
> [ 5738.591657]  v4l_streamoff+0x24/0x30
> [ 5738.591672]  __video_do_ioctl+0x430/0x4a8
> [ 5738.591689]  video_usercopy+0x2ac/0x680
> [ 5738.591705]  video_ioctl2+0x18/0x40
> [ 5738.591720]  v4l2_ioctl+0x40/0x60
> [ 5738.591734]  __arm64_sys_ioctl+0x90/0xf0
> [ 5738.591750]  invoke_syscall.constprop.0+0x40/0xf0
> [ 5738.591769]  el0_svc_common.constprop.0+0x38/0xd8
> [ 5738.591785]  do_el0_svc+0x1c/0x28
> [ 5738.591801]  el0_svc+0x34/0xe8
> [ 5738.591820]  el0t_64_sync_handler+0xa0/0xe4
> [ 5738.591838]  el0t_64_sync+0x198/0x19c
> [ 5738.591854] ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v4:
> - Update power-domain-names order (Krzysztof)
> - Make hex numbers lower case in init seq (David)
> - Pick up tags
> - Link to v3: https://lore.kernel.org/r/20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com

Should find some time myself to issue RBs, sorry for the delay.

> Changes in v3:
> - Update dt-bindings to include everything related to camss
> - Update regulator names
> - Remove slow_ahb_src
> - Link to v2: https://lore.kernel.org/r/20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com
> 
> Changes in v2:
> - Remove prefix from interconnect-names
> - Move 'top' power-domain to the top of list
> - Update regulator supply names
> - Link to v1: https://lore.kernel.org/r/20251024-sm6350-camss-v1-0-63d626638add@fairphone.com
> 
> ---
> Luca Weiss (3):
>        dt-bindings: media: camss: Add qcom,sm6350-camss
>        media: qcom: camss: Add SM6350 support
>        arm64: dts: qcom: sm6350: Add CAMSS node
> 
>   .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm6350.dtsi               | 233 ++++++++++
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 261 ++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   6 files changed, 1093 insertions(+)
> ---
> base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
> change-id: 20251024-sm6350-camss-9c404bf9cfdd
> 
> Best regards,

-- 
Best wishes,
Vladimir

