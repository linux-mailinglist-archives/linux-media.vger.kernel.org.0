Return-Path: <linux-media+bounces-67110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lyTmIdJRT2qGeQIAu9opvQ
	(envelope-from <linux-media+bounces-67110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 09:46:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E88372DE8A
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 09:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ca5aqJA5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="c6/QT2qQ";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67110-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67110-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BEB93000887
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 07:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F86A3D6690;
	Thu,  9 Jul 2026 07:46:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A1395AF2
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 07:46:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583176; cv=pass; b=ABs79DsnHvhxVyEhMYu5yl2szYbKefSlLUeORqglVA1HbuHULkWYlq85jqhhibTxF6aY0qzv7PW46fMCrPSja9NQC59ENyNuBzpiQvJ9C2TD6KjrqSEW7+zhThyZ4ZZNDPJdEa/XVLyqCTfHYMBYIVPlgJ4VjnJ3vr5s4BIw4DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583176; c=relaxed/simple;
	bh=07wva2+HW2Xk8v4uN43Cx4PhQoeKjtx49ALQficpH+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7N/oQ3UdOeS/ERdzpgX6mM9x9Sai65Yvjgao51EX4bhC/OR6lHRgKKnSX5Qf0x7Leca179ex0K00DVHwlQ/gcfz02+UQk/Zg4EOr/L3cjZhtW1c8NGclxryrd3eE0ueP92/9I5avAyLKGQMXBKqvcUpPnCvQ+Xx49fGWBNCYK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ca5aqJA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6/QT2qQ; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Gxp887939
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 07:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=; b=ca5aqJA5NBD4tfAF
	yKnSTzw+vMLvpqGGwD/U8VkWR+Dmshjaq/96UQ4Tu+ENN/SFhVJ3Np+m5TbM11Ag
	Gcc1w9uMjI6mtzV7pDqYnRMRzmptfl2DsNs8EqyU9ToIOgO/h8i2qobqDjitDmZz
	4bZIejbD5Vr/lup7R2Rm31EMCUniKXE3gsIEniNoc0o2hQXtkmm7cfWDLQd1dLlm
	xZj3jRnb+1BG9HCpyt0KnqscZSYMdbZlZFO887tll6u86YwTxXe8s9dgUmgEZu/T
	eb1+9lPfEFA5/s7o+8UDK/zu9BiYa1iC7VU0O6+s/INuJ2MpLmCUTHwXf/UBlgEh
	9BtVLQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33c8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 07:46:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so8860226d6.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 00:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783583170; cv=none;
        d=google.com; s=arc-20260327;
        b=s4XkZ5uMjNf7almVPVUu3bhVgw/HhPG6KHoNytnRbLfns6J4yxkGq6WntWSHzKodID
         S0PwgZRILDsSegSvEtrTGG+oWM7oxY+/Tzqi2p5DyHRnQmCnTy2dpK6M+yItaPzDHBRg
         vScnFgNFTAlW8SCKSwR5wWSZrZ5/s2Ad3AwBs4I9TkE9tvvr/LoKX3vPW3w8fOwuXhxs
         FrJJ1Wghm1Gc716dWQIzh1cC3T18vl8NDRlJV5g6sUl8yPL7Adz5bkbMb18GhxpnDZ/x
         E1x3z8eonsQv+sogu109RF6Zgb5Foc6+K1Z9ou/4OEnQaqf5pec+/td9NX2Xgh2eWIXW
         anXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        fh=zro6DR4hKTcp5ae00gYHe2ZX0HKfvcpT7bwQnLYlQQQ=;
        b=ZFAjR8BJF3kgKDzWGEDwuVB5b0RJQ0FOqN/hY44rd8/1IrW33Th929XyZ342V18E56
         6VImtgNmuj3iSGMa8bZpXWhfXH+PIqhxd0z8SsblyjsSqjkuLO19nOPKbD403q5bM12S
         ZUYZ95qrZh5vXvGpMcNFvOyvGMsrXLwlz+81rRRrXkEBF/VCMFGHcUxhBhbpBFQtZAl2
         wz6Chh7CBrAVZ5OSrD1hHLHxO/Bl5WcmPyqM6kCAcaJYzT5XcVHgekFetkBKMXJDNnzb
         DklHhW46UC/RB6cKqRn5+4mVYLlcLMWkzKBglEZS31DlxnA6G41nrDQIXC8YKIgtqdwq
         ZScA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783583170; x=1784187970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        b=c6/QT2qQfoNXGfM35oBzWZNtQaxt08eTRwKWVlH3IiMxE1+zYfOiOdQQ1nflORUu8u
         y0n+5xVzeOQZov++dLZqJ8QIaRH7g2f6IHIJcBYiFNC7XEIhsMFhIur2TTWXuO51mrrP
         n8W654bnYby0s4+xPpGpjV7d+leyBjAm/pJNhzMSO9J6+H4I4gVlS0DUzdMimSB4UPpJ
         zEVZLX1pVwD8NnesMi4pn5gpPXwtRZUs8EDQAB8TTgUGmbdBRdQapPOV1rowEzKtivSX
         RDfd9IAJBojTKcL03xWaP46B5uO1VTNYcg1rwupYeiS0BrpD9RRbnAhN8TsmXqWuK5dU
         exNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583170; x=1784187970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        b=QOpQHHl9AKLDMFIRMWnB0yeOvYijEQOpNSLEBKxHesEpekg+ghIPPVAesBvkL2dMwT
         12/HKpABC1vBAQP9RNhpxAUepGrOeCpzIhKj6gYtlkoijx/x6TaZf3f/im0d664B0FrG
         ip3s6o9AFSdb3KD4paO7yHm/GU6lm/BnA2MHZx8bSihikCVozY5riKv3cRM6BW6mq59O
         Gq3wOYPf6ggWMQeXPPjlSXls9xDWHhQVP3TReJb6Nnwh+plA5ez64fqI7HSg8PYIfn58
         f0OVQvjICGiCtQG8TLG45XiBUuUC/QwlT9zjnUdK/S8F9EaLAtlz5N3imJ9YxdjF/dH3
         15pg==
X-Forwarded-Encrypted: i=1; AHgh+RrkOiFUv5rKikhi7dup4ADj11KuHk1ivNRRfg7sbnUWREZh3ZpNrkJ/kWH5ia9nNvwJ6ADzehT5QLVmJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Xg+07mdWSb6UKlWIduMhQyZKky4QX3rh7dmsEu+nx4l14iIm
	LgLDq05WFxXWXDvaWLaPvxpWrA0FGlkCwvvrgL8S9ZV0doGF10rT8DH5EMAAJADa4nC4rld79ou
	YnKII3fvIDXeMc4WWOjIL33U0Ol+vDMU5WmKMgj3c0Jj8ZvH3bZEGaM1qeF+a7xa25E4U7C6B6q
	hRUia3LZKhctCStFR8RdDOe9D+ftcArfTpAE4lX3HF
X-Gm-Gg: AfdE7cnRL7fMeBBFUpkEvt1+kDU3IyPZ/A/Z53KStc8ytWBtRM3VLD4xyuD8xaNgtbL
	LxCkgJqANf1H31g3HYWJ2Nvl+/dy5qe0k1hLokhrERkhsreVJBGLV1EMc7/uY4UbAdRngn7hhMB
	/Qvd5oqn6k5yeek/Y7B0cUJl/3nxSNbtACvK76ekgOjWt/udosRdEorS8x/KcLWTxsb7QBg7eB2
	C5TpJAWOyNMcWjfuTS5g226HA/lY9E81z++tmt1C/T3NH3Mk/G0trGpnWzXZ1v2etAh978bkVKf
	NqlP8T1Xzw==
X-Received: by 2002:a05:6214:450b:b0:8ee:ff2e:c2f4 with SMTP id 6a1803df08f44-8fec557ab7dmr64350766d6.17.1783583170412;
        Thu, 09 Jul 2026 00:46:10 -0700 (PDT)
X-Received: by 2002:a05:6214:450b:b0:8ee:ff2e:c2f4 with SMTP id
 6a1803df08f44-8fec557ab7dmr64350496d6.17.1783583170002; Thu, 09 Jul 2026
 00:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com> <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
In-Reply-To: <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 09:45:58 +0200
X-Gm-Features: AVVi8CfzimAcZqI-0huc1ogOqlRyuYjOXyQidt826_gI6qT68v2jCz-ds2hC2iI
Message-ID: <CAFEp6-0rwuRzXM0fu0uyrvSvgG0ttpygOULkKfTT7aw8m_HUog@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qZXjqlx2eNgib_FrsECJYF-Q45ud-uHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX8gYmEl7Oy/zx
 /cDVkad4LSmLW6NDANzHCTHiK/k6Ph2sz9/ijkMs3oHKjjqP29Ds5K7OoKCoCdx0a6lAnVTIfJh
 4hxA+0yf99KEQU/tgOiBcLcLGAN6RxiX0zJdZe188uwXlbU2KVQwav6J0KntA2ROCl0ClOiGsXs
 X2fxtltt0v+3BWFF/MdeJmn4uBOjCeb/KlbrEdqOerKHG+PAP1Aqyn1bjQ0HwFnx3NtdnfdM/eB
 b/M589Kju3NWxaH8n2Qab9v7CpedmSWwck2blRDNe1dfJEVJiw6MFRUyRTyqIBJIzH4xmBkI4sU
 W1kT8wH0O7HVLCnK+DBGUvRIQgnc30qaAnySm9s2DhwqQPB2jnfFzT8RfUS0mNQ7Hb8tk0o0lLj
 yzgcyhFgGRM0lww9wIL4WzDQjnPqgGI8fNHWG7xbbYgGxrwmKSWF5ztgxDzaeGV1J0UCwtXzZgp
 whcnN6d2JnnkShylDig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX7rsyKhwzvk6E
 cekjCr4X8+yTiWWv5bm4+2KoDTLQr3wRVuY1T/BnCF0AWhyO1ddWuDiS2NeD8js0oz0aNqxzwuN
 boQOWCmYCL+9YHHH0GBXGkVf6gTXpgQ=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f51c3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=y-x-Ysk6LtgDBV_-dcYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qZXjqlx2eNgib_FrsECJYF-Q45ud-uHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67110-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,mail.gmail.com:mid,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E88372DE8A

On Thu, Jul 9, 2026 at 12:30=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/07/2026 08:11, Atanas Filipov wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Use devm_of_platform_populate() so that child nodes declared under the
> > CAMSS device tree node (e.g. OPE) are automatically instantiated as
> > platform devices. This is required now that CAMSS is modelled as a
> > simple-bus and ISP blocks such as OPE are described as child nodes.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>
> Looking at my commit logs I see this isn't my commit message ..
>
> Anyway.
>
> > ---
> >   drivers/media/platform/qcom/camss/camss.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/=
platform/qcom/camss/camss.c
> > index 2123f6388e3d..95e655a8b6aa 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -16,6 +16,7 @@
> >   #include <linux/of.h>
> >   #include <linux/of_device.h>
> >   #include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/pm_domain.h>
> >   #include <linux/slab.h>
> > @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pd=
ev)
> >       if (!camss)
> >               return -ENOMEM;
> >
> > +     devm_of_platform_populate(dev);
> > +
> >       camss->res =3D of_device_get_match_data(dev);
> >
> >       atomic_set(&camss->ref_count, 0);
>
> Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do
> the same with the CSIPHY and Loic the OPE.
>
> Modelling for subnodes is nice if you have the idea the camera block
> should be a bus.
>
> But for what reason ? As you pointed out it should be possible to both
> compile and run JPEG without the compat=3Dcamss node on sm8250.
>
> Making the camera block a bus is a nice idea for "reasons" as this
> thread has shown, its a problem to implement with an upside we struggle
> to define.
>
> When the facts change, I change my mind.
>
> You were right to argue to have this as a peer node. Lets do that.

Having a camera-subsystem bus/parent still makes sense, especially
when dealing with shared resources. Whether that should be the
existing camss node is indeed the question. Today, camss effectively
describes only the VFE (including the CSID) and CSIPHY, so using it as
the subsystem parent would introduce incorrect layering unless the
node is significantly reworked/broken. So yes, for now, keeping the
components as peers appears to be the simpler and more scalable
approach.

Regards,
Loic

