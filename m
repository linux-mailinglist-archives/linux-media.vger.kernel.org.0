Return-Path: <linux-media+bounces-54694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AgHF+ptqmkPRQEAu9opvQ
	(envelope-from <linux-media+bounces-54694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:02:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B15B521BE99
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D603D302A565
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 06:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E1C36D504;
	Fri,  6 Mar 2026 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVp5bHRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnQqiag/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E5026FD9A
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 06:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776933; cv=none; b=QP2xCF3aGpwxBMzjGbOGbpalbqT/QEtW+DRzEVKLXHFcqNFOFo5eMMiJvib9I8FyRYcvzI9FCnCh6SZID+/Oc9P34VBh2098phTWhafGhiV/iL8dEpnvcbgtWqn5e+1KJ7msTReklgqs183e0KOp60yoMWwufWfvr+jmY9sDukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776933; c=relaxed/simple;
	bh=9sk00FhwJlN27t1I+qg5f01mhKYACYC7WoG6IoYXZ24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfRw42fH6cF+sYh7vw5aPZfmP2setfY3oCBD1lI2zzQbnFi7gbWA7Ibma7p0G4wpmKmOcZPiYcIlMrC/qdLXUDNSETEML07q3xmhr3+eqZjOf2lD1OihqfUNr+OSAzTlJ/Q1hYM1GEDjmXiFaWvl5Wz+dRaH613/Pq7iR8QnBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVp5bHRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnQqiag/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264a4Xv3296744
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 06:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIdm3m1j/KPISpnH4FOXfsMMLgGhXoDcZpcCWpI/SxU=; b=DVp5bHRHm8wDGhHk
	Oy2O1jtJ4zvcdm7y3kRlm+yP5HAPHMtelRYyYQGj8XCD0uyCXMZ3AVl6IQmn5ERZ
	xYz8CWA6xnYjCWnMy9+LHRQg7mADCmNMCFbQhy3T4CChIvX+xyzUD5CYZEy6c9gu
	Jp0X3yb/XwExsqwFjLcY/n9OEh3IhpziwGyRVGI8fxrznhCRUVUn642lZTG3BSat
	KRPSWQollaniCXETLNfK2MOBwx+/PNkADcQwycPOG042Rk4wHXZvxrjYlHPNaMCu
	cfGOZ50phwPPjbfaXJyzxkBvOnPfzzFZPbFimHL8pFBtve59zmcCbKoFBvr/Kolh
	dTd1yQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdre65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:02:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so8267962a91.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 22:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772776931; x=1773381731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIdm3m1j/KPISpnH4FOXfsMMLgGhXoDcZpcCWpI/SxU=;
        b=EnQqiag/CczJC2vIqGsjykA9ie3yZu6d5xV0npjYtvWygxwxAXk+9wewuXIdBzqp7y
         9NxcVeIhOYPr+acFkoqz66iOTiM4iPF4CAZvccqQtvVGYmqH1v/dz/O75yCur6OWtuiT
         srkfBIr3Z7A6RXb+Yd857ayim4+ko06gJPNQRSiIExevSh5/hJnzcgqAAKrZeDQC84PA
         Y4rgoHnm/pkCu901jFaorz3oAEHQoGZIs8wdMCOhAX59WXPmpTUBCO9UuwBrJTVq3TR+
         /yJqAywDFI2jmdHs6B/vhZYNwV3cVM8JzoeMJoI/4P42C/QEWpBlRhDklWtvH7CfqA59
         ol3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776931; x=1773381731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIdm3m1j/KPISpnH4FOXfsMMLgGhXoDcZpcCWpI/SxU=;
        b=Ib1SIeR8V73R8QhQtq14dgkqdK5XVEyOocixgu9ZYMPe/iZAbVvziccFGUDK+Br/JJ
         jdg0uvEOph8iSFaCbQdJK6xJ1Jq9W2BtN0p1h8ADcpz+dPANOdP4VnSCRM27b4XbC7xb
         2iu1WiP+WqQvA8jPZDeA9kOYzKjRCJcdhrOhymSAy83Iwd2yhQlYAAIddds6P0ui5N+o
         FXfJuqf4j049oaBWIl6SH6FtMarNHhztLP4oZiDBvptqdt4UR239JINGPWr7Wi+uRZn1
         Ao0iIPcvu+zfEqn7LSslL/qDQ5pnCqiEQ4E0yOxMc3Vn2wgv0xGS3oMO7QveLqKYf64y
         ec+A==
X-Gm-Message-State: AOJu0YzQxTgdCYTaNyk41XcMFGE7dOhjjYwmiccb5yWaohcaYFqSqQAA
	P5M/O5wydbKidnBcMPb6Ko8S5NFYK8Esz2VwM7azBfhWIjcuazIPk5Lx4tL5KL5iubIVN67xCTI
	4FT2FADZquVKLYdjsoZsI+6QlNrv5GqQa9UJsWljdUwmgsjkwVyw9Vgx3C5ydPxrQVg==
X-Gm-Gg: ATEYQzzF/r4v7xE0Pv7FHpTHdymuDFptMbUfhlBW3V6fVqkRLQgKlnIb8T/yFdk4t6x
	A+KJX7FGI20x88oEdK1T6wk7hqIBJjfI0cf7rFU1mg93sGiddtnWVsXZoSiPKpijxFxPuPwoCzK
	nTqf9WV8OzdQ0krOF3bbZ5eK0gwkChy4Ed1Hc8Ne7B9FRwA3GFjOVb0w9J3rdRVzT0gKoiEQKDi
	oFb4iRbydfjLds5X/u2s6t8NeTjavc3Z4p9El7/Kwcp3OQ9zzWgYFHG5DAzgnVqIVQ2b0HaHrba
	u4vD3acY3qGdzgEZmswZINyCLk9Wt6s4wQ2tVWoSL2hb50lhlmQHIceEfV6cOf5I1qvWIxy5mGO
	T5DmFikdw3Qw26bZ5qkD47jBlLw7pqVRUjjPOvWkmfwFRxT1Dub8p1Q==
X-Received: by 2002:a17:90b:1d43:b0:340:b912:536 with SMTP id 98e67ed59e1d1-359be347dc9mr834395a91.31.1772776930634;
        Thu, 05 Mar 2026 22:02:10 -0800 (PST)
X-Received: by 2002:a17:90b:1d43:b0:340:b912:536 with SMTP id 98e67ed59e1d1-359be347dc9mr834367a91.31.1772776930149;
        Thu, 05 Mar 2026 22:02:10 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c005e1b2sm759808a91.5.2026.03.05.22.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 22:02:09 -0800 (PST)
Message-ID: <79396696-b5a8-c0f4-7e9e-7a947ef4de15@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 11:32:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 03/11] media: qcom: iris: handle HFI params directly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7UmtaGA4APA1yeURiTkmQ4C9QkOPms3F
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aa6de3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kX4lhrPyMP4CimkWqzEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1NSBTYWx0ZWRfX8QZDKB3EK+VU
 PQTeowu8MTAVlxR7A4fF04pdL+yedExpYkzohyDcHzWllPx1+5p5LS+92qI6DaSSigVuTsyoFZ8
 0ihij350iokycBnqZ+0JUkPYKa8mGDKfA4TcqQWFX2s0Rrf1xDKWSRQmaP+LS5mmm0Bz008TDrd
 OcYFuMmmy3/RYLoS8IlZYEyF39cEXGy7a59AEu+buixa5/Cykmg/yhjX/cEiKUET09EfsuNP+0l
 ltGhV4zzpbU7hKvfKPIu98FU8sBCvV14sVpD8Quzxn+RM5mjDmPTYokUsvKURLGAU8Q67reMSln
 mmjhcHSFDcu+1WN3P+lW5epKmaT1lq99WTp57f+j1DliTQR/Zg9ykqZG9vGb5813gKN1EKeRkeu
 XI03OXB/wr7k5liRliVqLiKqbT4js56/ja0roZ6hbadS7ng/Y1yHuLyqDvn0FaTUfxDvqTIY3cV
 LZ6AxBsLXqV7gYYLQcA==
X-Proofpoint-GUID: 7UmtaGA4APA1yeURiTkmQ4C9QkOPms3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060055
X-Rspamd-Queue-Id: B15B521BE99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54694-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> The HFI params are set per the HFI generation, they don't change between
> different platforms with the same HFI interface. Instead of copy-pasting

That's not entirely true, as the params can change for different platforms
for same HFI generation eg: HFI_PROP_LUMA_CHROMA_BIT_DEPTH won't be
supported on AR50LT even though its HFI GEN2.

Thanks,
Dikshita

> the same params between platform data over and over again, move them to
> the corresponding HFI generation source file and drop them from the HFI
> platform data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

