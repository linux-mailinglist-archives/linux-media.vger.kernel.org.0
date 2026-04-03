Return-Path: <linux-media+bounces-58019-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBs8NzR2z2kewgYAu9opvQ
	(envelope-from <linux-media+bounces-58019-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:11:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F232391F7A
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A81330685BC
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C4036F426;
	Fri,  3 Apr 2026 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ca5SeQ6v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF322D9ECD
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203766; cv=none; b=iYWS5z/iXbLUTBNS3ci7UHZJ34pmy+Pdat5L6xVgmgis9z5PG8nN+nFXTWeb+7p7oUVU3meKHWTLbWUlQAXCvFwQHH3wH6znpLO22bNYimbzF+1kl5UieVBGunCl43N8IhmeP9NX2ACfLVKOf/nnwDlEdKUIOWIAAHij4+bmChM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203766; c=relaxed/simple;
	bh=VXCsauP+Z1gOYiKZ4PNqbm6HsOdURbg18M59hGnLtm0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=MZ7QB7S3h9mX3bUIKkeIe+jf3+bFXhFIAj2+I6PZ6U/INg4P8oo7u2n2Krecalt5OIa8ytbyfHYYZvOCy6Ouj/TH5eKoXiXOANz/36XPQ6/PJkFaBiA77647gBW0ULT5NunHYXNsXNOD8HiXIG/aW4aqCggmSSKaLIaIZyJ0d/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ca5SeQ6v; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so214016066b.1
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 01:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775203761; x=1775808561; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Xb5q3glRQmv4yoLtws8RCHguDjoOvEO7Ky6Ff+GZds=;
        b=ca5SeQ6vQsVHNFrnGoeB049W0OM3+KD/6bSqGetZjSiBR3Dp8IrR0V+SkTozG9+3Uy
         MVuJ8wVL8QLurQ+Mrm2MNdkYSr5EEOYed+pZYyO96zHCAZ3pvJ0xaDY/2FTWw+3swBzi
         eBZ8I1QfuAEwdT/8BlaR138c1DPDSCyF9hbtnceNlHcWqBM3aLuv5wk5pGmta7yt9oxN
         8tGFXsSdf3y7p6qLjJXQBkacE1jLQ27pBVtzyoeNIQh8Z7rEwPVCzp7BH8aV7edlknN6
         50N0dkIaGySIdnyhqcYyB4FRLYTym9a0RYrjC4AjnfUQBuX2MTTuvP03c0oc4g/cKZXF
         vAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203761; x=1775808561;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Xb5q3glRQmv4yoLtws8RCHguDjoOvEO7Ky6Ff+GZds=;
        b=Qu+Gw0zkqWzYq/uuB+CiU4HzBD8KoN/ChBlvGBcxiHOZRtFLCEL2bnMaGweboLdr/X
         xLu7ViX9ZM8AKAq1bpJm1Meltb1tV3C+AxIicQAP5DjoNDp/EZZYkiNOIrxxQA72HG1r
         k3q8NJd4n1TRKPosiuvKwMYOPqpqWuEmnKsvJzS5zmkgFCezCkoh0X865cD4MZG9B4Ep
         fStG3g1hi6gcX3BNWwACzngftulXlgr7AUT/riDL2+dmGSO8jtatis1umLIOL88BTMTL
         DSnavqrugJ3zkX65lnSrEyHu6iVWzBn5dpGZQdnIWAN0R+nOcJQtThqh4oHLMtEWZVsu
         EUhg==
X-Forwarded-Encrypted: i=1; AJvYcCWlVIGt0XnJyhZXc0WYVhxMdapZBh4nUxS9OVjADiVWRbP5pPuYoWBBwJ1Ux3IPRCPSjktmvU3XJEyf8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nZymj59lzkuxShh6bASKtbAup1JeaFZ39X63cpHwWcILI2H5
	dbiBs27mC4PccWrj7kxEZ48wCJ7A7pZCU9uVze5yiVShZY4Ii0pdSoEm/HrqWI4YzUQ=
X-Gm-Gg: ATEYQzzKjxW2mf4Z/7sN3IDh488CCIcLZxCZmqO6IY1xB9UqgaEQy0KuIIibUxxk5sZ
	IBN+Y+OjJYkhpnJNLHF8W5M8DGq+rP3IMe3i5409fmnLjsB+/Qz+hiKNx6QfUq/nkKRr/V5ELiN
	ZIQ/AO+NPhvPpxe29VZ1iQ1brMlzcaau+Id8s06+d0O+mcxLqbWqyZ4HzF/e/n9hVLuO4UP2xE5
	FHJzW7GnZeNFFHRKXhBcaZWhL9VmnVRqNnK2+7CMA4Bbe7ib2WztHt21hJ/fdMXRqNT8Pk7mBZT
	BhSwLzOXxRYLlL5kykaNQV3RVmdTf9cX9fA6eeVUPhOxXFP1tRwSMyrPL2FMBu4mXk18ReS1t2H
	PicJYT/nB3Ef9/Lf5grT5rMe010vESP7dc5pS10CwhUfpLV8QxLPaVboxJpt+owC5SKPGgLUG7t
	fOJEjYleFpsP8FhmecPb/BT4Au2Z6YfjA/C77HoXU9vqM0cOQQEzEf6lhwS7pZrzjmUNTO6uvvb
	VYA2ovI6ZV692dTorMdtIRURgFvyib2/Sma
X-Received: by 2002:a17:907:d91:b0:b9c:393b:f6a7 with SMTP id a640c23a62f3a-b9c67957d43mr100406866b.31.1775203761272;
        Fri, 03 Apr 2026 01:09:21 -0700 (PDT)
Received: from localhost (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm174541566b.14.2026.04.03.01.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 10:09:20 +0200
Message-Id: <DHJD7P2TXQTH.1TQ4YQQ21A6CS@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Todor Tomov"
 <todor.too@gmail.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>
Subject: Re: [PATCH v4 0/3] Add CAMSS support for SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <2a108976-374a-46e1-968d-7befa4369a74@linaro.org>
In-Reply-To: <2a108976-374a-46e1-968d-7befa4369a74@linaro.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58019-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.sr.ht,vger.kernel.org,oss.qualcomm.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F232391F7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Vladimir,

On Tue Mar 31, 2026 at 12:49 AM CEST, Vladimir Zapolskiy wrote:
> Hi Luca,
>
> On 2/16/26 10:54, Luca Weiss wrote:
>> Add bindings, driver and dts to support the Camera Subsystem on the
>> SM6350 SoC.
>>=20
>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>> far as I can tell.
>>=20
>> Though when stopping the camera stream, the following clock warning
>> appears in dmesg. But it does not interfere with any functionality,
>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>> while the clock is on, and 'off' while it's off.
>>=20
>> Any suggestion how to fix this, is appreciated.
>
> I've looked at CAMCC recently, and I do notice that SM6350 CAMCC does not
> set '.use_rpm =3D true' flag for whatever reason.
>
> If you find a free minute, can you test the change below?..

Unfortunately that change does not resolve the "gcc_camera_axi_clk
status stuck at 'on'" warning.

fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.clock-c=
ontroller/power/runtime_status=20
active

fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.clock-c=
ontroller/power/runtime_status
suspended

>
> ----8<----
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6=
350.c
> index 7df12c1311c6..ba880e4edcaf 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -1880,6 +1880,7 @@ static const struct qcom_cc_desc camcc_sm6350_desc =
=3D {
>   	.num_clks =3D ARRAY_SIZE(camcc_sm6350_clocks),
>   	.gdscs =3D camcc_sm6350_gdscs,
>   	.num_gdscs =3D ARRAY_SIZE(camcc_sm6350_gdscs),
> +	.use_rpm =3D true,
>   };
>  =20
>   static const struct of_device_id camcc_sm6350_match_table[] =3D {
> ----8<----
>
> This change could be considered to be included in any case, I believe.

I guess this change is now the way to enable pm_runtime, I had this
series 3 years ago in February 2023:
https://lore.kernel.org/linux-arm-msm/20230213-sm6350-camcc-runtime_pm-v3-0=
-d35e0d833cc4@fairphone.com/

But I never followed up due to me not understanding pm_runtime well and
no direct need for it.

But I guess reviving that with use_rpm =3D true, add power-domains &
required-opps to dt-bindings and sm6350.dtsi should be a good idea?

Regards
Luca

>
>> [ 5738.590980] ------------[ cut here ]------------
>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.=
c:87 clk_branch_toggle+0x170/0x190
>> [ 5738.591081] Modules linked in:
>> [ 5738.591099] CPU: 0 UID: 10000 PID: 6918 Comm: plasma-camera Tainted: =
G        W           6.17.0-00057-ge6b67db49622 #71 NONE
>> [ 5738.591118] Tainted: [W]=3DWARN
>> [ 5738.591126] Hardware name: Fairphone 4 (DT)
>> [ 5738.591136] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
>> [ 5738.591150] pc : clk_branch_toggle+0x170/0x190
>> [ 5738.591164] lr : clk_branch_toggle+0x170/0x190
>> [ 5738.591177] sp : ffff800086ed3980
>> [ 5738.591184] x29: ffff800086ed3990 x28: 0000000000000001 x27: ffff8000=
86ed3cd8
>> [ 5738.591208] x26: 0000000000000000 x25: ffffda14fcfbd250 x24: 00000000=
00000000
>> [ 5738.591230] x23: 0000000000000000 x22: ffffda14fc38bce0 x21: 00000000=
00000000
>> [ 5738.591252] x20: ffffda14fd33e618 x19: 0000000000000000 x18: 00000000=
000064c8
>> [ 5738.591274] x17: 0000000000000000 x16: 00001ae003667e9e x15: ffffda14=
fd2a07b0
>> [ 5738.591295] x14: 0000000000000000 x13: 6f27207461206b63 x12: 75747320=
73757461
>> [ 5738.591317] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffda14=
fd2a0838
>> [ 5738.591338] x8 : 0000000000057fa8 x7 : 0000000000000a16 x6 : ffffda14=
fd2f8838
>> [ 5738.591360] x5 : ffff0001f6f59788 x4 : 0000000000000a15 x3 : ffff25ec=
f9d7e000
>> [ 5738.591381] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000=
baf5c100
>> [ 5738.591403] Call trace:
>> [ 5738.591412]  clk_branch_toggle+0x170/0x190 (P)
>> [ 5738.591429]  clk_branch2_disable+0x1c/0x30
>> [ 5738.591445]  clk_core_disable+0x5c/0xb4
>> [ 5738.591462]  clk_disable+0x38/0x60
>> [ 5738.591478]  camss_disable_clocks+0x44/0x78
>> [ 5738.591496]  vfe_put+0x7c/0xc0
>> [ 5738.591512]  vfe_set_power+0x40/0x50
>> [ 5738.591528]  pipeline_pm_power_one+0x14c/0x150
>> [ 5738.591546]  pipeline_pm_power+0x74/0xf4
>> [ 5738.591561]  v4l2_pipeline_pm_use+0x54/0x9c
>> [ 5738.591577]  v4l2_pipeline_pm_put+0x14/0x40
>> [ 5738.591592]  video_unprepare_streaming+0x18/0x24
>> [ 5738.591608]  __vb2_queue_cancel+0x4c/0x314
>> [ 5738.591626]  vb2_core_streamoff+0x24/0xc8
>> [ 5738.591643]  vb2_ioctl_streamoff+0x58/0x98
>> [ 5738.591657]  v4l_streamoff+0x24/0x30
>> [ 5738.591672]  __video_do_ioctl+0x430/0x4a8
>> [ 5738.591689]  video_usercopy+0x2ac/0x680
>> [ 5738.591705]  video_ioctl2+0x18/0x40
>> [ 5738.591720]  v4l2_ioctl+0x40/0x60
>> [ 5738.591734]  __arm64_sys_ioctl+0x90/0xf0
>> [ 5738.591750]  invoke_syscall.constprop.0+0x40/0xf0
>> [ 5738.591769]  el0_svc_common.constprop.0+0x38/0xd8
>> [ 5738.591785]  do_el0_svc+0x1c/0x28
>> [ 5738.591801]  el0_svc+0x34/0xe8
>> [ 5738.591820]  el0t_64_sync_handler+0xa0/0xe4
>> [ 5738.591838]  el0t_64_sync+0x198/0x19c
>> [ 5738.591854] ---[ end trace 0000000000000000 ]---
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Changes in v4:
>> - Update power-domain-names order (Krzysztof)
>> - Make hex numbers lower case in init seq (David)
>> - Pick up tags
>> - Link to v3: https://lore.kernel.org/r/20260213-sm6350-camss-v3-0-30a84=
5b0b7cc@fairphone.com
>
> Should find some time myself to issue RBs, sorry for the delay.
>
>> Changes in v3:
>> - Update dt-bindings to include everything related to camss
>> - Update regulator names
>> - Remove slow_ahb_src
>> - Link to v2: https://lore.kernel.org/r/20251114-sm6350-camss-v2-0-d1ff6=
7da33b6@fairphone.com
>>=20
>> Changes in v2:
>> - Remove prefix from interconnect-names
>> - Move 'top' power-domain to the top of list
>> - Update regulator supply names
>> - Link to v1: https://lore.kernel.org/r/20251024-sm6350-camss-v1-0-63d62=
6638add@fairphone.com
>>=20
>> ---
>> Luca Weiss (3):
>>        dt-bindings: media: camss: Add qcom,sm6350-camss
>>        media: qcom: camss: Add SM6350 support
>>        arm64: dts: qcom: sm6350: Add CAMSS node
>>=20
>>   .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++=
++++++++
>>   arch/arm64/boot/dts/qcom/sm6350.dtsi               | 233 ++++++++++
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++
>>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>>   drivers/media/platform/qcom/camss/camss.c          | 261 ++++++++++++
>>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>>   6 files changed, 1093 insertions(+)
>> ---
>> base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
>> change-id: 20251024-sm6350-camss-9c404bf9cfdd
>>=20
>> Best regards,


