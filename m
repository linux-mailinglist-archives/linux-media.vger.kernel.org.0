Return-Path: <linux-media+bounces-67258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ov1WKvm8UGp44QIAu9opvQ
	(envelope-from <linux-media+bounces-67258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:35:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FA739208
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:35:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bEQZwyc8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F6IO4rya;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67258-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67258-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDA2C3074C94
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12543F23A4;
	Fri, 10 Jul 2026 09:28:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506113E0C70
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:28:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675684; cv=none; b=Ii6InW4no5ejZRngUODgtqPtJNj39dwgkr05MjXsWEvW+/Wz4blpl8rVbGUDGmc8xCznbbABlTZuhFz/mAGg7QHitKLbzebovKS65TgddxYRlHGxrW7nsh6F+yiGWvjKTjKcFeLvRhReib1rHVsmrRLWChK0PMWowJ8pvirtwww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675684; c=relaxed/simple;
	bh=3W9St2a+jKGkGj0S5oGaRQjvJtDzomLECmfwJ3GV3XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwkJRnF8dklFYkAObbFkDN1055ydqQDu0oDWNRHHFGnWznTz7bSCe6clJ58axNS19ZqrthF++8EL5h0OdE6RL3v+KxfZ496LWMUCY1vurJsIchoRFVwqHLcqVkv7sMIPhhRfVBU+/uVW/BPJ4l7743JsfjA91KncW5oCanWxVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEQZwyc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6IO4rya; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dQui182735
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea0QguoYL7HAG5QOZUHhNnUFaa6FuT9iaUs3b0VOK4E=; b=bEQZwyc8XDMXAW5T
	oEMWxvv0TPUNE+xjii/lGQs/yn9jua4T4pq8gYMXFaVqqv3cUCllqk9RRr0FtlZs
	FW6ncGBWWy53MmpI7kIlvuWR6NXQUazvB06l2jzszG69JXWFEvdVuY3fgJ6eTA4G
	kdh9ZpYO0R2TKghzi+ltSI7N1ljdtrWw+J8S9jvXkmApG9tpzHh/L7TMc7hPjw1X
	TIAWCIOdl2RbUMUEMI4jHB5vGnw7hkUeKicM/4bxTvqg0FZHIg59pjpn+27e0m0v
	sg+BieWuHrm/sC0Y8Rz+0LwssX/yp8NpboriYdS06O3QH1fTG5W26EU1MIvGL5Zz
	Pz25Zg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte2dr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:28:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so2081301cf.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783675680; x=1784280480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ea0QguoYL7HAG5QOZUHhNnUFaa6FuT9iaUs3b0VOK4E=;
        b=F6IO4ryaLWtGoxWuuRSr1Khcgk3XEP+a0s/k4WOPCBGahPDcTnjM3XX9dc2FqI8188
         dwZbsp6sP087f8Q3EnEhhl8zrtW/QDMk0i63h4HTRvYi9wbEFy93ujqL2Ld+dsB4lc95
         RPOtFJdu3LwXQWW9gUjAJrE/DgLPXarfkDrWWX83PZjZRkW4R1/5lEhGyTgYff9xpl/+
         V+631fh9W4762qRZtY4y5qRlXBKO9lM/ecwTWhqvqgkfUlJ6SyVUsdEsVh3TZY3nGHHQ
         n15xg2Y1gBVPkd/De2E903IpnQD1fDCammJwTRcO+rfA0Iaeg3RNLGAWHdu9sLpHbkXe
         oIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675680; x=1784280480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea0QguoYL7HAG5QOZUHhNnUFaa6FuT9iaUs3b0VOK4E=;
        b=My34E5bDeiYLz4HnOmzYsPEvZUf3SNq3RxgIPRBeGEVLfWKKcAUaHRVw+33iD3ztTt
         Btmj50nZP0hloRL5eVSym3g+9Rt4v1JsUg2cEb2KM8i/CxBuOQn3amPqLNx1DZpWnP51
         5Mz9QGzdRNXy5zAfUrKRpcripW2Z5NPdezz7nsmfILnBG49tcsoG425iXYrIrCT9inCa
         N8rqg4AdfJr3ylFFD+lmkSl6gR/+ewXkB1qvL4kez8oocU9blHjO3Se/Hq+C/RB3jTWN
         ZKbB5+zE+Y+3D5MSrdANZhRqNYi8scih5IQ6+/QKJ1u+KFHIHzvv1vP0Ua8LqWm9QFi4
         eZRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Jcda/7kxMgnqWim5L9sLI7onn5/YQ2gBJmouePqVSXAdVPC739puT0/ZKvm0y17bXCq0ARnuJpuPvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIYDL/lq/HdWSM1s2OxcejCxrZ+Csriol7qcgTExgj3VjMyV3F
	nDWHGYy353iRk+TM9t/jqfzqA6F/0C4rCO5T3QeBTQvxN2GEphzj/pQG0/DuhQilebsxbaM9Mf/
	RB21W1zVbK3xNqWVQnFwYP2FKxgxpE3kKcyf3MqOQ7h/qLkwrkz50MHBDIuYylwxQsQ==
X-Gm-Gg: AfdE7clOO1WCiaZxtNC/qzITkRdVhjfKkll3Jaq9w784Yh8H501GHLFi+bISzOERRW9
	ha7LJeYvFZOmMPXf6yhGJda13mB5REXAOHJr4aJK3ULPS5TjYMib91GTWr1gXBNZ4YVHMuRQlgk
	VbdT2WF+cDcr1FR1QbUYw9HpiJ8a2GF/JZABU3y391/JQGCZ99SuS/VdrZwDG1lBrmO/NdHaPTD
	WTtQ3XT9jSN/5hbhukw47ZhSRXOjjVS58njVr+5Sb94d0rsiO6hrwJbNtV5AVxVpsbxsdYYW72F
	ox6uOxYNkW7k97gsG5VUd/ta7SMIYa1zPRTbe3iuDAqIAhQC2nEMW9hU9qqM9YvjTifx1iMn0k2
	5dKCtQeFuWST8rRGcvNKa62my3uHKnWA90Gw=
X-Received: by 2002:ac8:5acd:0:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c9684058emr68768611cf.11.1783675679842;
        Fri, 10 Jul 2026 02:27:59 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c9684058emr68768501cf.11.1783675679321;
        Fri, 10 Jul 2026 02:27:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15cfac0f76sm402966166b.33.2026.07.10.02.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:27:58 -0700 (PDT)
Message-ID: <82326bd4-59f0-45b6-8f06-38896cf9f9bb@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:27:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
 <4f865aaf-a400-4dc6-acaa-80dc22a36af7@oss.qualcomm.com>
 <6b53fa97-0fae-4ba2-a774-ae8df2c2ad4e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b53fa97-0fae-4ba2-a774-ae8df2c2ad4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ptKgKM4Vb7jnVioAM318HuOs8eRle6VQ
X-Proofpoint-ORIG-GUID: ptKgKM4Vb7jnVioAM318HuOs8eRle6VQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfXwgE7XtYESUoF
 gb+F9e458XubrMCycPqYynn3vvOdeDYGl2YFW6+0SzIqaTl2OmAJ85cbnWgwCvhDr4Fuk7PnGLX
 7iJi6vQaD4kyFQSQO7mj3FU3YoGHzn4vobRryZeH9F4f3VFCV1HK+7BdFfg44gbuQY5LeZ+YxYj
 kpCxSrjOuu3Dvz9wUpxW/68E9x9BCK0UAixXdbZ+Nr/QAMjwXnuiy5GIyzLOO5Xe9Bd4eztvNX1
 /vtXkCKifHBMM6fZDZ0DSpd7RIs0s0+gPF2ohFvHJV0Ap3UIGNzhu4xNQjXqwzIRzOHgPao+msW
 M7m08zTDKC54xooZn5AUfpHuO3qVaPAUeSdwvOIOJoaDTVrWaiewFnNY7XkjeDrsMT231AoCwSu
 LdHTdbBjvGZcLY98jsQkDY6BScH3cvQbtoda2Qq5sqL9G5d8CWoIXX9DORwAMBPP0OA+E+5SUcg
 CLhexKnM//FgxUOuH4A==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50bb20 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7-yhJlWS37sO_0-qT9EA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX/AYMjVrJNUD+
 j4GL//PtoVtWzhPhVcLN7kQUFoCEdumwNwUq6LZc8xuS181ekxT/suwxTJOg7ULbTszmJjgwJ88
 rjCxcwBaVfm6aALCaeW+oYeQ72zBZqs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67258-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aniket.randive@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 552FA739208

On 7/9/26 8:28 AM, Aniket RANDIVE wrote:
> Thanks Konrad for the review.
> 
> Sorry, I missed your comments on the v2 patch and ended up posting v3. I'm happy to post a v4 incorporating your feedback once the discussion concludes.
> 
> On 7/6/2026 5:11 PM, Konrad Dybcio wrote:
>> On 7/5/26 3:57 PM, Aniket Randive wrote:
>>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>>> regardless of message length or bus frequency, causing unnecessary
>>> delays on error paths.
>>>
>>> Compute the timeout dynamically from message length and bus frequency
>>> with a 10x safety margin over the theoretical wire time and a 300ms
>>> floor. For GPI multi-descriptor transfers, use the maximum message
>>> length across all queued messages as the per-completion timeout.
>>
>> What's the reason for a 0.3 s floor?
> 
> The floor accounts for I2C clock stretching. The spec allows slaves to hold SCL low indefinitely during internal processing. A dynamically computed xfer time alone gives no time for that.
> 300ms value covers worst-case stretching while still detecting real hangs 3x faster than the old 1s static timeout.

Please put that in the commit message and possibly in the code as a comment

> 
> Thanks,
> Aniket
> 
>>
>> Why a 10x safety margin specifically?
>>
>> [...]
> 
> The multiplier covers the gap between theoretical xfer time and actual completion time (DMA descriptor setup, interrupt latency, and scheduling jitter on a loaded system)
> Without it, short transfers would have almost no extra time before a spurious timeout.

Likewise

(Should there be a constant safety margin added to account for all
that? Keep in mind this driver will run on a turbofast Glymur and on
a notsofast Agatti so any numbers that depend on the processor's
speed must be reasonable for both)

Konrad

