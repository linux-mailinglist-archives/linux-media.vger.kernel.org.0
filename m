Return-Path: <linux-media+bounces-53054-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCWeCNHilWliVwIAu9opvQ
	(envelope-from <linux-media+bounces-53054-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 17:03:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1315794B
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 17:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F40930158A9
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 16:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55F6343D7F;
	Wed, 18 Feb 2026 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YaVd/VB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y68kzkf3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1952034321B
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771430602; cv=none; b=dMSgovle5EXikJDyj+9NYuA7gS5niXQKMeLdmWK7ivtEEJt7Zia4ECVlkBDwzed2BP07CZICuLn/1mt9cEP+9gx8X08M769UNR3CbR6OD9c8ljxqk5d07N4GW2xWsdUfCWmAVBD1dsrhIB0RAXVPTol0ItIqycg2zQ5meZyw4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771430602; c=relaxed/simple;
	bh=fOizu7zBrj+MQQkvSStK8D4iOf7AEuwU1NEC5bbec8E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sy9UCGd9BYtEJDXiP9YsXY2m22DA/Pz9/kXTOBddBA/PE0Orkob0Kdj4NRgtTyw+DyL4n0B89nyDbtJi9TwXd14QaMumn7O5QyRF6eoFk2cANwEGCp8Qna8eComFWh0E9h8qECmDUZ92iB5NvIIjnDDMZkIWyKeOb/x0ZTDPZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YaVd/VB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y68kzkf3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IDVncD1046481
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 16:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0mgeSU7GEweqPZBHk6PjQg+j5ejQEthUWDA/kDwyy4=; b=YaVd/VB+xaxIB4TH
	4u4zJrQqzcOB5nSBbAFKgan0hJ1n8FMuHu2HMBbs4309dLjTFaj0EcGPAuRGsvqo
	CDj9Jgn2uLDA26tk1pjjgc2y3/UdVwxhl/e8/GACUX+4kO8JU57jsJpLRR7yalnd
	ztFMAN9FZh3nxEffyLCg9sq+5jGBD/BNMFL74Bl29kHdgTMSnomriiq+7Gm5i2zv
	QnQQ6CFeGJyXEUXbu/P0Yz4Lu3Gl9D6xkd0pbSo+nbMBno3g5HOO20bjUBvtY/9q
	MvRILfQWGTc0MREi0xXs1xyWyzbBjEcLpjV8PWj528y1QG3V/8tyTunewqO0msLG
	nenwyA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cded00dxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 16:03:19 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-677d059c0d4so9826908eaf.3
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771430598; x=1772035398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e0mgeSU7GEweqPZBHk6PjQg+j5ejQEthUWDA/kDwyy4=;
        b=Y68kzkf3yQ9uv3sE18+a330wRxLyjzYf3rFKcNg/2FH69SgOF8v2q3tQ85JQ6W7adp
         rURvF5Av/mrpqvjiQAYQ9tKP/Xm7rAkUfxxUuPbLvrd+YTtQHmi9jl1Tk9uOFX/tfx5o
         XZ7eJeIw7Kqwdg6Pq0hqV4cxvzsQw//WDsZcV68AegYvNARKLfRR/F8nDURQz5tiBqIQ
         iPrDPpb8WqI/dDxw4y1UAo44AnfmygKq/+bp+yZQ5LH2dDughb3VgcozBpeUiqff5xM+
         1T2Y0hDj392/TrgU9i1ouU41cnRK9bMvBS7Ft169KcFFHGQZkqW3yUCzGTIxZiiIZBT3
         Wfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771430598; x=1772035398;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0mgeSU7GEweqPZBHk6PjQg+j5ejQEthUWDA/kDwyy4=;
        b=h+L3nVtaz5sn/NeuBzFeMOQ7exOnNEiimPnH8/MLK+KiBWCZ3hLPJAYN6Be1teJu5Y
         JWofuia5uaVL2bmsYZ91L2kXJNAsPvQ0RhutzpZYbknDtBMoylkiLtrJAMJE/y+U2hH4
         hQfUaA9Ad/3zNYR2OblzKT0uDYumYFdDalGzM+hW9ygYJ8Oso+y601JpdDgr0leT66LF
         zm/2aXekdDrYC5tlyFgZUUPQ3ZZoyP94cVd6NyUvhpzWz2gQoDIZYPccsLOvFWUfQLla
         1eSsPhh4oPl6WuneVThblRRgIJv76hIQOlvzIe6ERez/CXRtfholHcvL3cRTZFc8BZ5j
         inQg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0mSlhWIM7tD12KIoPUOHt7p+CCbMz4Io6ouJ3xKWcB4l6e8wsSbv/eBzOC8sj1HlLlfITHeon5ZeUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIV9qn604MTQEehYYyjL+MXZm0lrCzHSjOwexbXKdk85gwY0Jt
	hNALWsST29W6YjGdbCYZgyshcul4H51M7T0kn84pyh/ws4mLLEOzWewIgn7ihb6QN2Fki0IwRR4
	ae99hyO35tRVWiuP6aRI2hXSQ8q0wliIwK77HcjHpDEJ3ZZ3IEf/jBY0+Ei/Er6qqeRvo5M90EA
	==
X-Gm-Gg: AZuq6aKwD4OugaJTN+U/51YzQnnmxV2BBZeOO2IFXOhx+Y3Ll81oDp5kAMCgtKfZTRF
	qC9HZqyiLWBqMLXX41xTQYGu+4skTMTb+qvcMsu4Nki8lVwoLybLcXfRT+sWkQREs79qELNNHrV
	mkHUNwvjhq9LlBw8FHHqaWD+hOfwdjZW6zpvqvznJp597EJjeTAs41v0VALZypSSuCXLfSTxD7E
	tfADicSemmukFf2yELZDTeNF24GggUZ/p3vc2QJ4PR/TrrQt+wfFbznVbzmqLOHJzmTfJxQEh4T
	eQVyTZbX/xI/v9pLMFjkCdnE64tXrOc9eYUXnyGqHfMD7XLeeTOYPqDR6o5gaFzJMYqeCsJg7cl
	Lv9ZKAvaoL6QRj0GWqgF/loUpULZKjnCUNElZUOqsi+tdCPjW+kKNfTnnK4SuNn5nPMKzfkKkpu
	ZkY0HIp5euvpRn9hHqMLNMcgaORUb4ADf4JfKTpwGYCIQjm/60Kxu5e61WR2+iafsXWfEVm8rvh
	UjOPVDpRDE6Q9bP
X-Received: by 2002:a05:6808:5296:b0:450:41ca:6bd8 with SMTP id 5614622812f47-46410bf9d9emr1232837b6e.25.1771430597911;
        Wed, 18 Feb 2026 08:03:17 -0800 (PST)
X-Received: by 2002:a05:6808:5296:b0:450:41ca:6bd8 with SMTP id 5614622812f47-46410bf9d9emr1232810b6e.25.1771430597227;
        Wed, 18 Feb 2026 08:03:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76c7020sm460311566b.67.2026.02.18.08.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 08:03:16 -0800 (PST)
Message-ID: <1af7c71b-3074-4892-a545-e6a9338bc2af@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 17:03:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] media: ipu-bridge: Add DMI quirk for CVS-sensor
 dependency
To: ole@sandum.net, linux-media@vger.kernel.org
Cc: antti.laakso@linux.intel.com, Kate Hsuan <hpa@redhat.com>
References: <20260210084152.332001-1-antti.laakso@linux.intel.com>
 <0110019c622e1880-12e257f8-af57-4538-aad4-686c363a0695-000000@eu-north-1.amazonses.com>
Content-Language: en-US, nl
In-Reply-To: <0110019c622e1880-12e257f8-af57-4538-aad4-686c363a0695-000000@eu-north-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q-Ex36hoN-35XouqMdzaJXMaApVbM-aE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEzNiBTYWx0ZWRfX9Aslem10oBQl
 bj+SE8FjMZ2J/AF0W6/gA9YogjwfoaIcdslCH2Cva0b993Nuv1uvaW4WluEbOjJt81Hg4o4plGo
 5/pWCJDTXywVSpCn5p80omI3QkHuWkrgSDCvyqy380G9JLRJfP/MjiRrlHHAp6uaPboRTKxUlk6
 tb2cLH2EFfYf+ZadHMIxE7kAFabWpMqELagdq0uZ3L7rWxK9+CVWAEzct/BM27tSmjgSdKjQ9ux
 e1Pq+ecpkwLkpDgjXT5I7tsRV3gEtnn62XHJlb4KtSbNH+eY+sBhfvo/u+eu3ICZqMkZpRfvh68
 mdPVXm0c1ofUOwwg3cB6YUMyNasj2Vo9vHbsaigNyqlYLE+8tpje9RbFYGGtpAhqWtcjXnZTewG
 6ExHJQjkp6gr5Cwol8Dbp/B8xq0UfbjUVkMJC8wZ4lkVHPiGdDg107uWNGdB2n0vSZBuhDIzi3M
 Y+nsbeJ6uBg4EPfYT3A==
X-Authority-Analysis: v=2.4 cv=b/q/I9Gx c=1 sm=1 tr=0 ts=6995e2c7 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=KmPrHzGgAAAA:8 a=NV2yZPIief2NgxyNQEYA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=XJOcxSgcUkSFv7jV65FU:22
X-Proofpoint-GUID: Q-Ex36hoN-35XouqMdzaJXMaApVbM-aE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53054-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CB1315794B
X-Rspamd-Action: no action

Hi,

On 15-Feb-26 17:41, ole@sandum.net wrote:
> For what it's worth, I have the CVS driver (from intel/vision-drivers)
> working on another affected Dell model:
> 
>   Dell XPS 13 9350 (Core Ultra 200V, Lunar Lake)
>   OV02C10 (OVTI02C1:00) + INTC10DE CVS chip
>   Fedora 42, kernel 6.18.8
> 
> The upstream driver needs one fix to probe on this hardware:
> SET_HOST_IDENTIFIER returns -EIO (via USBIO I2C bridge, protocol 1.0,
> no magic number) and the driver treats it as fatal. Making that
> non-fatal lets the GPIO handshake complete and the sensor powers up.
> Filed with patches at https://github.com/intel/vision-drivers/issues/32
> 
> I'm currently working around the probe ordering with a udev rule that
> re-binds ov02c10 after CVS probes.

Interesting, as a workaround Fedora has a kmod package with
the out of tree driver in there for now. It would be good to
add that udev rule to the kmod package, can you share your
udev rule?

Regards,

Hans



