Return-Path: <linux-media+bounces-60243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GnLBW5H+GmesAIAu9opvQ
	(envelope-from <linux-media+bounces-60243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:14:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D74B93B0
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EFDC63004D37
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 07:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422332DAFDF;
	Mon,  4 May 2026 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lTj1Zsc+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D5F2DF144
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878863; cv=none; b=rKAJ52+MexUgpthd+4sVOSCzINz3dagjQNbZGVDkGZVhLkLq4Uz5VexhIoIU306Ik6WSvXkaINaju4CvYudjMtRfSyAJbd48c/GY791FeIDrNkUize1FmgPAbdl2ipqJZ3CQ4gYQehblli7+6KIEXC3WmkoGI2zEDxsrywXSNtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878863; c=relaxed/simple;
	bh=pv9jAeuFRhkHKpIR5bfO5WT9b7wRC1Arsl11qQKhKHw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=GJ1T2puF4TgQoclSk8vexfEqOYeaz3I/3FpZ7479KzSYrwt7JOy98rOtmBSQ2kjoErATJMO4N0RrGEOY3wR+Z7bn7btPQoV6r/ECNUpKBPmvTHHAXY+vVTODRUVKn4mCHbXwMagdH3Jj6deI5M0o3QQTtzHfQVDGrnotVq3bXdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lTj1Zsc+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so55241335e9.0
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777878860; x=1778483660; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5o9x9GYyoZ+AFvL1xpCIK5IQIqCECCAGULCOqSDjJ8=;
        b=lTj1Zsc+UslpaIjsXlwi4PGhDnO/95Qaclv3/mAxtumYFdmv/JPb90/eJkIdeixXrZ
         yjeKp/rJcYc9S3NuR55zGyOc3ViC9ijxPuhmO2yM08wultpNL5MLiMqjjZbIa/tN2fAa
         Lkbnk4c/+/g1DcX1SGFe2nf/5VvAeuTvktbx7d+Z7Y+KixFt+nLPdBHRF/HycVVAiLEO
         OXX3U/TwLX4rNWfJMNQTFbaVx8EME+yQoRl3uwijHG0CumqO2J+1rAuCUgvQ8Jju3UJP
         FxqMivKosFBDnc0cp9h1a9Hr00al/q4TDzL0LG9GxPbwQrrsI9pQ6Eh02V4eSqmypEwn
         wvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777878860; x=1778483660;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5o9x9GYyoZ+AFvL1xpCIK5IQIqCECCAGULCOqSDjJ8=;
        b=YSXoRzl3XRrNBSmj5NkvS42DYdLYMpyNFxMStXR+O+npWw586O+n/ACGPJQqpML+gp
         izl1G2F0tmTxaxOmt6q30/RI80wuz6f5AmBlc+OXyUIUl4ytTMa/xQSF9y4GpphVGGL1
         IvRYZi2JGyub3y+Kf1cx/c1t5cXqki7eK8xoZx/7BmSuCxnJf3nyi8ol1V/h36yEpC//
         iWWNyrRcbBZwjSDDbKybrfuCEv9HNLLmkF7/mJGjcD354BY9KiSeWsN3uoTlz3VETZS2
         Pj/+EydwSbHtiRuYwQFJmM05lSjjcAss11YridVAi46Dizl7vX0ogfZbD5QO1fFlt2el
         8VDg==
X-Forwarded-Encrypted: i=1; AFNElJ/1R7hJ3ELyPiuejGrT8SLx/sxf+WLUnIjd8R7NYoIYGQ9bcNfQGjwmu8yPqgmQVsLifv3+KFR7sUQOyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzON6HEhsKkAocyoQSHQbDqocnABV5Io/QsEIy0vQ6rNpY/f84C
	hh0krpNF3jLavUtGxD9ien6tvDt3+HDujOEaTN//X3o2JndMaIpdfHjA2SJwQIZgkGo=
X-Gm-Gg: AeBDievxcIY41fHmGvJkzJy/g6Ayv6ygacRxQ+z2q/A4RWmApio6pyHVZot9IvV6Eju
	kbOk2taR6vZ7i7dfBZm8i8Ud+bpQqV1gDV0pn8mmBV2+nYt5den0feDo3c1uXruHLzyNEkQmPcV
	KTuJIlG5sH7+pXhTqBs/QeMt7UK7UwTJJHvnDX8C3Fa9Gs5JnKZll4JrHwnbGxKTSMg0+QGGkba
	6DbvisczKuciD0vzrwHv/ZC2loCYOh1SVHUo+xf7B1+jrt6NTPszIt66b21tDFc/bQFuEftNylD
	Lwzlo8KoEkn+bZ/I9+pZ6FWQPZbADO4OIQ7993nLVwF4DRv82fAkozJwQiFbsnq0zc1D7QBzaHG
	7YlWFBTpHcTdJdMr4hxOJfnY6p8QTbCbxK7hRimdpTakoVe7jEYdtjJJMx5r0W/8AfdGvhZqyIW
	OGfFGUTNYXFf/ZONM3+r0NBA6h+8o4d4wHrFSSWSSv+fZ3TFlcFrLKVs2HqBB8/WBtSbtXTcP0B
	A61uR4lMw==
X-Received: by 2002:a05:600c:8903:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48a98663f36mr111227975e9.22.1777878860050;
        Mon, 04 May 2026 00:14:20 -0700 (PDT)
Received: from localhost (046124194177.public.t-mobile.at. [46.124.194.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm305101835e9.1.2026.05.04.00.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 09:14:17 +0200
Message-Id: <DI9PGFY950VK.3VURRR6215P75@fairphone.com>
Subject: Re: [PATCH v4 0/3] Add CAMSS support for SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bryan O'Donoghue" <bod@kernel.org>, "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Todor Tomov"
 <todor.too@gmail.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <2a108976-374a-46e1-968d-7befa4369a74@linaro.org>
 <4SLDL62Oin3XdiLjUEC_YAVA-m1dKV4j_8_RolU6NJFWCIWtem6e6sCb9n7OIHbcIWBfWdXx_vZy5mXCAbWUDg==@protonmail.internalid> <DHJD7P2TXQTH.1TQ4YQQ21A6CS@fairphone.com> <c87d229c-137c-4e59-99cc-a97ef04f6e1b@kernel.org> <DI79CX4PU08J.2M2V0U4PTOVEU@fairphone.com> <108ecc23-c821-4387-a324-5e3c20c3cc5e@linaro.org>
In-Reply-To: <108ecc23-c821-4387-a324-5e3c20c3cc5e@linaro.org>
X-Rspamd-Queue-Id: 185D74B93B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.sr.ht,vger.kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60243-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

Hi Bryan,

On Sat May 2, 2026 at 12:32 AM CEST, Bryan O'Donoghue wrote:
> On 01/05/2026 11:12, Luca Weiss wrote:
>> Hi Bryan,
>>=20
>> On Fri Apr 3, 2026 at 5:07 PM CEST, Bryan O'Donoghue wrote:
>>> On 03/04/2026 09:09, Luca Weiss wrote:
>>>> Hi Vladimir,
>>>>
>>>> On Tue Mar 31, 2026 at 12:49 AM CEST, Vladimir Zapolskiy wrote:
>>>>> Hi Luca,
>>>>>
>>>>> On 2/16/26 10:54, Luca Weiss wrote:
>>>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>>>> SM6350 SoC.
>>>>>>
>>>>>> These patches were tested on a Fairphone 4 smartphone with WIP senso=
r
>>>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly=
 as
>>>>>> far as I can tell.
>>>>>>
>>>>>> Though when stopping the camera stream, the following clock warning
>>>>>> appears in dmesg. But it does not interfere with any functionality,
>>>>>> starting and stopping the stream works and debugcc is showing 426.4 =
MHz
>>>>>> while the clock is on, and 'off' while it's off.
>>>>>>
>>>>>> Any suggestion how to fix this, is appreciated.
>>>>>
>>>>> I've looked at CAMCC recently, and I do notice that SM6350 CAMCC does=
 not
>>>>> set '.use_rpm =3D true' flag for whatever reason.
>>>>>
>>>>> If you find a free minute, can you test the change below?..
>>>>
>>>> Unfortunately that change does not resolve the "gcc_camera_axi_clk
>>>> status stuck at 'on'" warning.
>>>>
>>>> fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.cl=
ock-controller/power/runtime_status
>>>> active
>>>>
>>>> fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.cl=
ock-controller/power/runtime_status
>>>> suspended
>>>>
>>>>>
>>>>> ----8<----
>>>>> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc=
-sm6350.c
>>>>> index 7df12c1311c6..ba880e4edcaf 100644
>>>>> --- a/drivers/clk/qcom/camcc-sm6350.c
>>>>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>>>>> @@ -1880,6 +1880,7 @@ static const struct qcom_cc_desc camcc_sm6350_d=
esc =3D {
>>>>>     	.num_clks =3D ARRAY_SIZE(camcc_sm6350_clocks),
>>>>>     	.gdscs =3D camcc_sm6350_gdscs,
>>>>>     	.num_gdscs =3D ARRAY_SIZE(camcc_sm6350_gdscs),
>>>>> +	.use_rpm =3D true,
>>>>>     };
>>>>>
>>>>>     static const struct of_device_id camcc_sm6350_match_table[] =3D {
>>>>> ----8<----
>>>>>
>>>>> This change could be considered to be included in any case, I believe=
.
>>>>
>>>> I guess this change is now the way to enable pm_runtime, I had this
>>>> series 3 years ago in February 2023:
>>>> https://lore.kernel.org/linux-arm-msm/20230213-sm6350-camcc-runtime_pm=
-v3-0-d35e0d833cc4@fairphone.com/
>>>>
>>>> But I never followed up due to me not understanding pm_runtime well an=
d
>>>> no direct need for it.
>>>>
>>>> But I guess reviving that with use_rpm =3D true, add power-domains &
>>>> required-opps to dt-bindings and sm6350.dtsi should be a good idea?
>>>>
>>>> Regards
>>>> Luca
>>>>
>>>>>
>>>>>> [ 5738.590980] ------------[ cut here ]------------
>>>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-bra=
nch.c:87 clk_branch_toggle+0x170/0x190
>>>>>> [ 5738.591081] Modules linked in:
>>>>>> [ 5738.591099] CPU: 0 UID: 10000 PID: 6918 Comm: plasma-camera Taint=
ed: G        W           6.17.0-00057-ge6b67db49622 #71 NONE
>>>>>> [ 5738.591118] Tainted: [W]=3DWARN
>>>>>> [ 5738.591126] Hardware name: Fairphone 4 (DT)
>>>>>> [ 5738.591136] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS=
 BTYPE=3D--)
>>>>>> [ 5738.591150] pc : clk_branch_toggle+0x170/0x190
>>>>>> [ 5738.591164] lr : clk_branch_toggle+0x170/0x190
>>>>>> [ 5738.591177] sp : ffff800086ed3980
>>>>>> [ 5738.591184] x29: ffff800086ed3990 x28: 0000000000000001 x27: ffff=
800086ed3cd8
>>>>>> [ 5738.591208] x26: 0000000000000000 x25: ffffda14fcfbd250 x24: 0000=
000000000000
>>>>>> [ 5738.591230] x23: 0000000000000000 x22: ffffda14fc38bce0 x21: 0000=
000000000000
>>>>>> [ 5738.591252] x20: ffffda14fd33e618 x19: 0000000000000000 x18: 0000=
0000000064c8
>>>>>> [ 5738.591274] x17: 0000000000000000 x16: 00001ae003667e9e x15: ffff=
da14fd2a07b0
>>>>>> [ 5738.591295] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574=
732073757461
>>>>>> [ 5738.591317] x11: 0000000000000058 x10: 0000000000000018 x9 : ffff=
da14fd2a0838
>>>>>> [ 5738.591338] x8 : 0000000000057fa8 x7 : 0000000000000a16 x6 : ffff=
da14fd2f8838
>>>>>> [ 5738.591360] x5 : ffff0001f6f59788 x4 : 0000000000000a15 x3 : ffff=
25ecf9d7e000
>>>>>> [ 5738.591381] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff=
0000baf5c100
>>>>>> [ 5738.591403] Call trace:
>>>>>> [ 5738.591412]  clk_branch_toggle+0x170/0x190 (P)
>>>>>> [ 5738.591429]  clk_branch2_disable+0x1c/0x30
>>>>>> [ 5738.591445]  clk_core_disable+0x5c/0xb4
>>>>>> [ 5738.591462]  clk_disable+0x38/0x60
>>>>>> [ 5738.591478]  camss_disable_clocks+0x44/0x78
>>>>>> [ 5738.591496]  vfe_put+0x7c/0xc0
>>>>>> [ 5738.591512]  vfe_set_power+0x40/0x50
>>>>>> [ 5738.591528]  pipeline_pm_power_one+0x14c/0x150
>>>>>> [ 5738.591546]  pipeline_pm_power+0x74/0xf4
>>>>>> [ 5738.591561]  v4l2_pipeline_pm_use+0x54/0x9c
>>>>>> [ 5738.591577]  v4l2_pipeline_pm_put+0x14/0x40
>>>>>> [ 5738.591592]  video_unprepare_streaming+0x18/0x24
>>>>>> [ 5738.591608]  __vb2_queue_cancel+0x4c/0x314
>>>>>> [ 5738.591626]  vb2_core_streamoff+0x24/0xc8
>>>>>> [ 5738.591643]  vb2_ioctl_streamoff+0x58/0x98
>>>>>> [ 5738.591657]  v4l_streamoff+0x24/0x30
>>>>>> [ 5738.591672]  __video_do_ioctl+0x430/0x4a8
>>>>>> [ 5738.591689]  video_usercopy+0x2ac/0x680
>>>>>> [ 5738.591705]  video_ioctl2+0x18/0x40
>>>>>> [ 5738.591720]  v4l2_ioctl+0x40/0x60
>>>>>> [ 5738.591734]  __arm64_sys_ioctl+0x90/0xf0
>>>>>> [ 5738.591750]  invoke_syscall.constprop.0+0x40/0xf0
>>>>>> [ 5738.591769]  el0_svc_common.constprop.0+0x38/0xd8
>>>>>> [ 5738.591785]  do_el0_svc+0x1c/0x28
>>>>>> [ 5738.591801]  el0_svc+0x34/0xe8
>>>>>> [ 5738.591820]  el0t_64_sync_handler+0xa0/0xe4
>>>>>> [ 5738.591838]  el0t_64_sync+0x198/0x19c
>>>>>> [ 5738.591854] ---[ end trace 0000000000000000 ]---
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>> Changes in v4:
>>>>>> - Update power-domain-names order (Krzysztof)
>>>>>> - Make hex numbers lower case in init seq (David)
>>>>>> - Pick up tags
>>>>>> - Link to v3: https://lore.kernel.org/r/20260213-sm6350-camss-v3-0-3=
0a845b0b7cc@fairphone.com
>>>>>
>>>>> Should find some time myself to issue RBs, sorry for the delay.
>>>>>
>>>>>> Changes in v3:
>>>>>> - Update dt-bindings to include everything related to camss
>>>>>> - Update regulator names
>>>>>> - Remove slow_ahb_src
>>>>>> - Link to v2: https://lore.kernel.org/r/20251114-sm6350-camss-v2-0-d=
1ff67da33b6@fairphone.com
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Remove prefix from interconnect-names
>>>>>> - Move 'top' power-domain to the top of list
>>>>>> - Update regulator supply names
>>>>>> - Link to v1: https://lore.kernel.org/r/20251024-sm6350-camss-v1-0-6=
3d626638add@fairphone.com
>>>>>>
>>>>>> ---
>>>>>> Luca Weiss (3):
>>>>>>          dt-bindings: media: camss: Add qcom,sm6350-camss
>>>>>>          media: qcom: camss: Add SM6350 support
>>>>>>          arm64: dts: qcom: sm6350: Add CAMSS node
>>>>>>
>>>>>>     .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++=
++++++++++++++
>>>>>>     arch/arm64/boot/dts/qcom/sm6350.dtsi               | 233 +++++++=
+++
>>>>>>     .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++
>>>>>>     drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>>>>>>     drivers/media/platform/qcom/camss/camss.c          | 261 +++++++=
+++++
>>>>>>     drivers/media/platform/qcom/camss/camss.h          |   1 +
>>>>>>     6 files changed, 1093 insertions(+)
>>>>>> ---
>>>>>> base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
>>>>>> change-id: 20251024-sm6350-camss-9c404bf9cfdd
>>>>>>
>>>>>> Best regards,
>>>>
>>>
>>> What about taking the clock out of hardware gated mode ?
>>>
>>> =E2=94=8C=E2=94=80[deckard@sagittarius-a] - [~/Development/qualcomm/qlt=
-kernel] - [Fri
>>> Apr 03, 16:05]
>>> =E2=94=94=E2=94=80[$]> git diff
>>> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm635=
0.c
>>> index a4d6dff9d0f7f..f98cb35bcd408 100644
>>> --- a/drivers/clk/qcom/gcc-sm6350.c
>>> +++ b/drivers/clk/qcom/gcc-sm6350.c
>>> @@ -909,8 +909,6 @@ static struct clk_branch gcc_camera_ahb_clk =3D {
>>>    static struct clk_branch gcc_camera_axi_clk =3D {
>>>           .halt_reg =3D 0x17018,
>>>           .halt_check =3D BRANCH_HALT,
>>> -       .hwcg_reg =3D 0x17018,
>>> -       .hwcg_bit =3D 1,
>>=20
>> Unfortunately this change has no effect, still getting the same error
>>=20
>> [  192.154311] ------------[ cut here ]------------
>> [  192.154339] gcc_camera_axi_clk status stuck at 'on'
>> [  192.154364] WARNING: drivers/clk/qcom/clk-branch.c:87 at clk_branch_t=
oggle+0x170/0x190, CPU#5: CameraManager/5996
>> [  192.154387] Modules linked in:
>> [  192.154403] CPU: 5 UID: 10000 PID: 5996 Comm: CameraManager Tainted: =
G        W           7.0.0-00074-gb9262f98394c-dirty #31 PREEMPTLAZY
>>=20
>> Regards
>> Luca
>
> Sorry wait a second did you say you had a fix for this around CX ?
>
> https://lore.kernel.org/linux-arm-msm/20230213-sm6350-camcc-runtime_pm-v3=
-2-d35e0d833cc4@fairphone.com/
>
> Is this series adding or missing power-domains =3D <CX> ?
>
> Shouldn't this be in the gcc node ?
>
> +			power-domains =3D <&rpmhpd SM6350_CX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>;

In this thread I've tried ".use_rpm =3D true" for *camcc* - which I
believe is the modern equivalent to all the code added in the linked
series.

For gcc I don't believe I've tried adding anything.

But practically, isn't CX always on anyways, especially with screen on
and everthing, so practically it shouldn't make any difference?

Regards
Luca

