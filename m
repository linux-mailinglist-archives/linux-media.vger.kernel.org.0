Return-Path: <linux-media+bounces-63464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1mqvBEJsH2pElwAAu9opvQ
	(envelope-from <linux-media+bounces-63464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:50:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C46D632FD6
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:50:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=poLfBzV0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kwn6S8dH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63464-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63464-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 015DC305BFBE
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8567E3AB47C;
	Tue,  2 Jun 2026 23:49:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3658E35B654
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 23:49:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780444180; cv=none; b=DbBweyMGb5M8jIypWce6tfpzYaNIME4MweN3bLPRmHNbD8WulX0gScp5zEFGycWPa3RRf6hy9rCzTqLVLUIpLiAKCDxTifQ8Dg6GxViF1acsWnKK2f8zVEZLyQ1Gf17iPfkyttMUiqP2cU7MbXxeyJpNSTnFqXxJuIUyp1iohCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780444180; c=relaxed/simple;
	bh=PP4Ab7q7bBhZBforAUmhfQA46fPz+szxQvwSCoQNmMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUGoxRVnoDO20H1r+YKq5qXNeLwyT3yHXwHTu2xpG8z4FxDecO7zyqbrEOij6WWgmUhes2Vb3YyjyDjAVYQy09TQ2KTIi2ASwgLdR9rJAMqfYqGtGnaoJySzjLqLsrX9ipVp25x9JDPR486fsUch3sqEcFPXUdFngGWXggxWV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poLfBzV0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kwn6S8dH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652JGWTS4012505
	for <linux-media@vger.kernel.org>; Tue, 2 Jun 2026 23:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=; b=poLfBzV04IZsVhrS
	XamRq4LLahGtNtLNrLxWrtzRuKPZ4wfGUlX/rVsO4OS4EuJcpMl3g4D9RiVGOfiB
	AlgfRN8E1o5AbtV6DEj1Ij0CrB7y/H8qm4NY5DkbrMPv75Za3TBHai9Sk4bOY/ug
	cx7uhFOZXXEy/bVyIl1gwQCcTgCoSDsfIv4/S3jno/UEgbqxZHyfs97AkVC1+sW+
	5jg8135YlYGFvRYHsfhDBq9xdPpw1eOZffcSxEoWXJLyINmjl9Gu0UKYvJd2L6BZ
	Y7KYPpr54Np5IbVUredYU75TLr9DdWVkkbUREId8uNkc6oIGl+kB/iqAycQp+IAq
	LcFDRQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4mc2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 23:49:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ea1eea05so14606588eec.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780444177; x=1781048977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=;
        b=Kwn6S8dHe2u24yHZp5rX7gD4lHVGQdkDI3P3eDMkR/nItaBRe5yQ+M4F6BTyzUOp6r
         w75GHTUszVRuAcSydgcBAFzy8zc05L6nXB52wI7M4wtZ/eyEKj1He+Aru01YF+/virXp
         BqZpz1plzguZS+CukDqscVz/yiaOSXGZh+QzE8cGgZr+Xs5XcMtJZNtF6OdsUhNu1vDZ
         exmhWFU9a34KInccVfYyGWxtTZ3SJjqZOxF3hbeQR8rkO44YsyTPyl0UJvLnhNgHO9Xa
         wrCJv7GvCBnAZaeyojsLvJl1cX2RfRlk900AcZcVkSHvPM3ujQZLJp6kv2MuXdmKppFq
         FAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780444177; x=1781048977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=;
        b=P+PJyrSxde/K1zF0gt98pKkAF66Q6OOrafgtLq8INhtpjI6zcoewjmyx8zUzi4eo2H
         qockWIuS4ZTyLBVNJwq4dWPpGuHk/OgDEQqBIniTK1TFA1zXDrt7eAFbBWeHwX362X5N
         9pZqxaYj2DzRHXmlBzg7W86Kv+E9T241M3ZCKCH33TsVyXpkfRKXTlRvoOltnVBLPZIe
         f5BPxdvWP2jfx0jK+NJhlTGM/yaGJ8wwc2k8Jb3TzsfPJLJ+e4AUwC+aXTRVD1+p1jEd
         uMSHCVAEWDdSXzLf0LT7RsYry5MW1hYIv/TscBdqjafiJFDDxBr8REXSZGFoMepbpSlQ
         NXDw==
X-Forwarded-Encrypted: i=1; AFNElJ8iY/92UY0IdOyeq/RHAdozm4cG014/LINdrk7z8DhpoTEnUekTA7TYRuihgCtrN+vihNgyYO2i0+fmHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx589cFulaLTulmQt9Lp5tKDQVpC7g0pFYxwjyVMxrVQz1srN54
	GYNW2DdK8Ohix9xrUt1oNYM9hVITj7943MHRrp1c5Ud/J7lFh1ye7m36l1pmFJ+SF0j6qvHXvbu
	x6VnHiizW2LxGDEKtZ/4SDYIyf6gCwznDs78Q3e8hNhfdMosWagKemLidbblwa1FX5W4kDKF1kw
	==
X-Gm-Gg: Acq92OHaR/0GE58oHMWMGhnUZ66j0CM+Cz2cC+KBd+Sv144zfNsJQyqZdqZLzoXiCUK
	WYdbqhT8+nuJqAAnC2hCvO1/Vp0brxxk0Pu3+5wc3F7VC+MiTDJE6/U8tgEA2IMZpPE9PAqSFzU
	C/DvFN+lYXGhqB6sDRoVzBbY6LzY0BGZtKsnGLO3plGmH6+ARRGigOk9ISDS3rIuVv53oU6fb1u
	wEyW+nY7TQY44crcpisrkwDiOD/cctqlBtmiTMV33FKV6tBSo07viRtCCSi/48WnIKEQEvhoghL
	BeSFniMNof0Ey/41s1PNS3z2MAnwY6MkdvNk+YjHGM/AgEXSZPhT/4o4kShLa7rJWCfej36R2Ka
	FTQhXCEENCNNAVLPqMdSgUQ/GSHyMJzmACTQdVctUD8d3i785xcDayEJxStkMNECgT2APSqLG1a
	jjkjBf2g5piIc=
X-Received: by 2002:a05:7300:7483:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-3074fcaa2bcmr580435eec.34.1780444176615;
        Tue, 02 Jun 2026 16:49:36 -0700 (PDT)
X-Received: by 2002:a05:7300:7483:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-3074fcaa2bcmr580416eec.34.1780444176064;
        Tue, 02 Jun 2026 16:49:36 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm1153763eec.13.2026.06.02.16.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 16:49:35 -0700 (PDT)
Message-ID: <cabea216-23ad-48dd-aa75-47c9708afdbf@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:49:34 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/5] media: qcom: camss: vfe: Add support for VFE gen4
To: sashiko-reviews@lists.linux.dev,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260601-kaanapali-camss-v14-5-e76f26aa6691@oss.qualcomm.com>
 <20260601164403.8CE831F00893@smtp.kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260601164403.8CE831F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIzMiBTYWx0ZWRfX1Tr7h78Mr4Ie
 QTmW8fVI0EcI64Jkr6i0/dtx0Z6Jluhgnq7D3I6ggGfZWubyG2uxF+lJTcE8s5vXFcsvOxRk8gJ
 KpVTIV2OmOkwDkhhvUArDNHjaiv3ZziMksvCkqi/kEr2pcEPU/OoTIo68737R+4Ddv7nNHXTauH
 QKzbAQNHIWr2VrwQEX0kilkd7DDuOqTDBpLmFDBwuz5SzlZ/OvfBJNHS4OqHJSgPSR77VFyF3ac
 l/xEGf99SNSse6KRyrFS2cfIsV07nhX0+7Y3xljL7KUrKtSrw7s5XkQWPBTm+Z6onOjt6n9vInT
 iKkSq734YqPuzfU7qA/Jv4hV48OgzFGsZBbs2pMy1DjnOC0dxcSkxJRPEutQjCi3l33rjzhVArl
 kyJdJbEADKmPfvPTBVJj52366IpeB/VXgCQlfqo2ZnUt784QxINIj1Yyx3+zsxziS1JWmW1mEL1
 Q9+ZiUbgdN8XrQxY2HQ==
X-Proofpoint-GUID: TrjwMXbhoicXYkl5a8Z8tSbqjE7cn3L2
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1f6c11 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NFO_ntjReJqzzR5GOAAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: TrjwMXbhoicXYkl5a8Z8tSbqjE7cn3L2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020232
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63464-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:hangxiang.ma@oss.qualcomm.com,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C46D632FD6



On 6/1/2026 9:44 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Unconditional issue of `CAMSS_INIT_BUF_COUNT` AUP_UPDATEs in CSID stream configuration violates the Kaanapali hardware constraint, mismatching the actual number of enqueued VFE buffers.
> 
> Pre-existing issues:
> - [High] Cross-linked VFE and CSID pipelines will write `reg_update` commands to the wrong CSID instance.
> - [High] Concurrent read-modify-write of `csid->aup_update` and `csid->rup_update` across process and interrupt contexts without synchronization.
> --
> 
> commit 961118b5c346fbca24b27d8e33cf75e4120aa72e
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: vfe: Add support for VFE gen4
> 
> Add Video Front End (VFE) version gen4 as found on the Kaanapali SoC.
> The FULL front end modules in Kaanapali camera subsystem are called TFEs
> (Thin Front End), however, retaining the name VFE at places to maintain
> consistency and avoid unnecessary code changes.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
>> new file mode 100644
>> index 0000000000000..d73d70898710a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
> [ ... ]
>> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>> +{
>> +	int port_id = line_id;
>> +
>> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
>> +}
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but cross-linked VFE and CSID
> pipelines will write reg_update commands to the wrong CSID instance.
> 
> When this callback executes to commit buffer addresses during runtime, it
> passes vfe->id as the hw_id to camss_reg_update(). In camss_reg_update(), this
> hw_id is used to index into the CSID array:
> 
>      csid = &camss->csid[hw_id];
>      csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> 
> If the media graph cross-links a CSID source pad to a mismatched VFE sink pad
> (e.g., CSID 0 to VFE 1), the register update is erroneously dispatched to
> CSID 1. Could this starve the active CSID of necessary buffer updates and
> trigger an unclocked register access (and panic) if CSID 1 is powered off?
> 
> [Severity: High]
> This is a pre-existing issue, but there appears to be a data race when updating
> the CSID register bitmasks across process and interrupt contexts.
> 
> When userspace queues a buffer during an active stream, vfe_queue_buffer_v2()
> runs in process context and delegates to __csid_aup_update() via this
> reg_update callback. In __csid_aup_update(), a read-modify-write operation
> is performed:
> 
>      csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
> 
> Concurrently, a hardware interrupt can fire on another CPU, executing
> csid_isr() in hardirq context. This delegates to __csid_aup_rup_clear() which
> modifies the exact same bitmask:
> 
>      csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
> 
> Because neither context acquires a shared lock to protect csid->aup_update,
> can this data race silently corrupt the bitmask and cause hardware commands to
> be dropped or repeatedly dispatched?
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 319d191589884..826ab85a44a14 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> [ ... ]
>> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>   		output->gen2.active_num++;
>>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>   				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>> +
>> +		if (!vfe->res->reg_update_after_csid_config)
>> +			ops->reg_update(vfe, line->id);
>>   	}
> 
> [Severity: High]
> The commit message documents a Kaanapali hardware constraint: "the number of
> AUP_UPDATEs should match the number of buffers enqueued to the write master
> while it's being enabled."
> 
> Here in vfe_enable_output_v2(), active_num is accurately populated based on
> available buffers, but since reg_update_after_csid_config is true, the register
> update is deferred to the CSID.
> 
> However, csid_configure_stream() unconditionally loops CAMSS_INIT_BUF_COUNT
> times:
> 
> for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
>      __csid_aup_update(csid, i);
> 
> If userspace queues fewer than CAMSS_INIT_BUF_COUNT buffers (since
> min_queued_buffers defaults to 0), this unconditional loop will violate the
> hardware constraint. Does this mismatch instruct the hardware to ingest more
> frames than there are configured buffer addresses, potentially causing the
> hardware to process uninitialized memory or trigger IOMMU faults?
This seems to be the only issue that is specific to this series here. To 
answer this, we verified it and confirmed with the HW team as well that 
it is not possible for the hardware to use random address to write data 
to the memory just because an extra AUP is issued. It only takes effect 
after the ADDR update is issued.

Thanks,
Vijay.>


