Return-Path: <linux-media+bounces-66082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CEnXBJ24Q2oZfwoAu9opvQ
	(envelope-from <linux-media+bounces-66082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:37:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 061736E43E5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:37:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hMAv06XB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CyuOJQ8a;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66082-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66082-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87D0C3010CFD
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A9F40DFC7;
	Tue, 30 Jun 2026 12:36:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618DD3FD946
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:36:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822999; cv=none; b=o81/lCPnDZlIErpeAnnbrAZVG6v1tBT9cu42Wvvs7TJUYr7dL/n9a5w7Jbnn0+5+kMkM6TzlfT5+vLntDnYybHn7A6qigosU5IDy/FveoGMxtEiiOVmnDqzl6Cd5GqmsYD/x/LdOE9LRSzxiFbL2O6YqBLwKER5heY/3lm+RS9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822999; c=relaxed/simple;
	bh=xalr14ue42EEz8a0KF+uv2BCteqC/Z7u/YTLcm6EW80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBhJP4d8fQyQZaDtHlCHWgf7Qly2dkDmNZpvRWYpgj+qbDZF+p8teL3vJuep/Fv/+gZ7sQZp0rI/mfmMOQWHIAtNnU4gwmPdFgLx5OMX7yc6ddPfn5iZHSfXVhRmKXOClodXbb8r5UfdWkAVarRYWrjv3fFF3l8ZfXxj23jVJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMAv06XB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyuOJQ8a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1QE1573385
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWECIwdx2FjYu4F2Dv37YsQcOFv1h/HrdIPZgZxYiUo=; b=hMAv06XB7kVL6dKY
	+mHGw3jLF/V8VbrZUImQfj2Obz1kqidz2H33ovgOc19u+mb+yDLaOpPN/kUCihqJ
	VxyDFRhHHF3LE+BMpwV25kokDuysV/+xRDcxCR/nksSgx/Y98VucDYD/N4RQvqAS
	RfzOiO2B+ckua6pWwG5ZmOxuB/BsGWc4mZ8/uTlRsGQW8OZvq0FVIp5Rwvm2/qnM
	rHSsXx4FPnD7merqI3IYjqYhb4n5YQSq2ebVHHhxuIgh4ogpK92nyJAxaWQOyjrY
	yPhPlQTtcEYNELxEP7xiMOsLVXEo0PekJnEHp1ItAwYxkBJailhxbT8YtECLlLUg
	7O5slQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f468626yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:36:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5a63e1f2so23539885a.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822995; x=1783427795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWECIwdx2FjYu4F2Dv37YsQcOFv1h/HrdIPZgZxYiUo=;
        b=CyuOJQ8aAG8xUVeyvM3TPGSI4qTUS9FXv9stfk8bBFZGV1MQORxD7ofxwlowYGd+VC
         7v3o91fY8mlC7ZL1jyPj+JjnoDwj7yaBeg55nZHPM6RptrMMGTXm8YNRlkmddvP0d7Zl
         OSMy19AdvsL2kYc5wBfOhgjw6N9KCP3yqdE+qkAXc/o6hP+JYI3lZY+Lw6BlKnQCts/B
         BTwvPo7wPAQ5FQl8cvPfPvIbWqCLt6hioKVxKAltV79DXQ1VvxmerrwxwMeh+7FqgEpd
         q6wZMQ2D9MCBJxpXXEYmtUbYW+y5LLISRnjV7VV7/Cb2sssmm6oxm0RkKo3LA/5Tkmdf
         8+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822995; x=1783427795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWECIwdx2FjYu4F2Dv37YsQcOFv1h/HrdIPZgZxYiUo=;
        b=MFUjqI71foSzv9x2wo2D1uVU51ezYlyjACz560pG9HfiIWVA7Q9N1qpsLJNG3uHtrf
         xNvhdaTx1IV3IKz8voi3kIFKn/37YJ0EaWVCZQ43eqy3O8fXj5DoSIZyYoYkjAkWs20w
         LRfOU3x2AHvjqTJRwYt60XO3qfhaU197TiUptNcHJY+Zm7JCj4E8bDyKZLrlUDjkt62q
         kJ5ubSa/j7tmc8ZvIU8biDMBGHyQS3jZZDWnFzYWFXFSlpZXTKTBiH9Ddz94yABf9odK
         aK1kYVdqp3bq8YJVZaQcV45hOA/3ML2UnZHOT8sOZPnHAukWgtvSVOnVBzZrOXF/wf6r
         0I+w==
X-Forwarded-Encrypted: i=1; AFNElJ/pkg9NS9DTQwi3UCnK87kq7+ORYcIs8Izojrjl+WW4IURCiHWb7IfgdJNlsUtWO//QAkSPH/g+wem3cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJDaKndSccETU218yw9keVr1+/3Jq/N9mIZm/J4+4iaffbNRjG
	s6dE9pxTqYBHcc/rbUyvSekCNttdPzeTvTRmmUKkF1RPleofhcuwBS7M01Yo7W46lYLyRnlWvmR
	WhC8sEECLxm5YtR8NYC06JX7JGBHmE2UnpShVeDLaSr8PHLI151rmnrDpPKvp5AynpA==
X-Gm-Gg: AfdE7cnRVtojeTuACdyqUg/xF4qrNPYVcoKGSgAcfq5dtVLBRnMvutRYAqHohLemOlO
	aN/pq9SSLwf0f+jrV1VXX0ld3Dz40MUrL716ClC0D5yEBYq4y+EPWbgd2YhHhSXCzREXgklKRUJ
	4nl0MlfEhon+C+rklLw4I6nehcMARnGgKFTlk6V5LvHhTvdEuvwaXuhLt/pYCt1T2elGYMsx5rJ
	ub8/AKw+AXCRZciIZIXU7mkATLnPGJZMgBE5kBJCyHDWSTY3rT5cNaorgEVN4RagCp8k7qZxMZE
	K6xZsRuLkaknVU2qAYy0cLr30I7sq27hYgm4x+Hcju77DEX+hhBhTClpMIN8TnzRyvwJ2kxC9Kx
	0wNCkuggqanI089QkgBq4cNXUnUuvGQEQl9k=
X-Received: by 2002:a05:620a:2a13:b0:92b:14bc:7936 with SMTP id af79cd13be357-92e6247af35mr377075785a.1.1782822994728;
        Tue, 30 Jun 2026 05:36:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2a13:b0:92b:14bc:7936 with SMTP id af79cd13be357-92e6247af35mr377067885a.1.1782822994089;
        Tue, 30 Jun 2026 05:36:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f48b35sm115852066b.46.2026.06.30.05.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:36:33 -0700 (PDT)
Message-ID: <6ea161a2-d959-4028-8aec-175b73df18ea@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:36:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/14] remoteproc: qcom_wcnss: Switch to generic PAS TZ
 APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-7-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-7-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CVBZD2WJ-u4vTf1RTVrnPNnOHe5zeciy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXxEXoSE92DCyC
 2p3uPxrZDV33RyFopBg3jDl1U6S6vY/H0UZnJ5BpEu+ph6sLaxD3jaDF+kxShSYeM1js8JXvdEA
 51gPo/0lclHSF4PiUpbMO+c5A2BMqVrzANRhNw8N3715wNnAEf5XFq+UYm8EpgPyDKJNxA6oWzy
 RijmESn8+99pNSZ/gAPwG8an+pcMHGdCg/judbcn6Mh4dbyXtqRCXQTpegc/YvhEAlSkVz87EZ5
 8e3KZTjkhCK34JVbLa7Tr5zqBYaHmUlCVrDA3GWUXFId6U2QRm4/GHENl44qWWCkyr7mcTCcpvX
 Uu/4kvYk8uvSEzi/wjA3iPuxrD9BaoVSYVqxOlsyu5FwqFAK/JYh5tv14/M+FHu2eF9dv8Jp3qx
 dOz2CBaSdb858upQ01BFV7IVBAMT1WLLReb3iZ4U1IhjhOtS3rvGy/V1Ufu0wnwdKM+271GcqM4
 uQ9wIdwb3jS2Zo93Qqg==
X-Proofpoint-GUID: CVBZD2WJ-u4vTf1RTVrnPNnOHe5zeciy
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43b853 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jx0KCs2Px1p7SxVd6dwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX2NdrxxXbJz8b
 R9JOG5XsxwtToM3n3EC3v3fbBtfGQ5COJeL6qdNf9vvmHUm2MqCO2uEAhE/+z2FS0uRSW7WfElV
 0A86YeYpuQ/NpxU0sjuCSiYReSNmzuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	TAGGED_FROM(0.00)[bounces-66082-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 061736E43E5

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_wcnss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

