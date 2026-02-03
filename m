Return-Path: <linux-media+bounces-52109-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GtWBqgEgmmYNgMAu9opvQ
	(envelope-from <linux-media+bounces-52109-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 15:22:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C0DA818
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 15:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 311C130909F5
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 14:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE493A8FF4;
	Tue,  3 Feb 2026 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjSf/ZFF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EN+P8f0t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB733A8FEC
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128363; cv=none; b=mJVnf82UQ7JcmLiEJbcQrT1CVYLsiHDTly6bCehJiXFn4xd8KyVSUo0YRVyZPWjDLmkxDdzVSSZU/Z4kS63t3EDHEveAwkn27FOF9SarR+PH+U8PPKk9XyvDt5/jhT0l7p0lgVxZWcqzseEfJyscP7xyWKQubcTgTgF/uw4xFks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128363; c=relaxed/simple;
	bh=rAaF3IJyKMtMVHi4hbNf4T+7dOMjju3GOZeNCYpnCZo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VtR8vggAOryscQIrP7m5EyUgs01vXzbS8zq7qhn5jvYoRO1Oe6gzcvjMo1F39ZT9xwTwiSy6iopwcjIOTcdrr6RG7SZa4+7Qh+ZxmpsnF+1/ywab9NGMaJwMsHgFfUvDTUyjOi9BqlC185j6DtBjnO40tpiNywUZaJKK7Nq34UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjSf/ZFF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EN+P8f0t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613DpQP9277353
	for <linux-media@vger.kernel.org>; Tue, 3 Feb 2026 14:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rfFv6kfMbhro4k4r2I8vRYN/RWIM5KJYEpa411uDzw=; b=BjSf/ZFFaQoN/MaL
	rkMc3PW7aZa26VNkzmqPIqpcLLUqRSeSkd/3haNJG5KrxPq35WCki20FR3odWoNe
	L//mTObl9Rk5U6ImSSrlgiH97pVGBmGbhNH8rIsAPgJqXvhfRe8NgRkarRLjI/7f
	jn6Cp0T/Jlm7n3NkeZoxgBJ6y6KhSmQyJefZy9fitnadddwAw6rqWBzhXOG41anl
	qzvZ5ZeLlbPP9/xQ4W+Tx1BWoHCXIFhuvoOExb9zfxriJ/r8+4P5M70h9JUoRPTt
	RBCQ+jVh4WVXR7Lgp/KiRSTh3ZhRym+a0suk3sggLQvWHyb3LZ0se+8AvsXMN5ND
	Qfdv3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s3aw1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 14:19:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52d3be24cso894488285a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 06:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770128356; x=1770733156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4rfFv6kfMbhro4k4r2I8vRYN/RWIM5KJYEpa411uDzw=;
        b=EN+P8f0tTI+bZH8vkRBQYonu0Jig1CFyNqtnCN6A8vcDwNeKzTcKpB40w7fJtyyfVy
         SziHocqsHncSocE118r3vdUokKRx/ITHY0pTrofnkb6W+hrmf1h5nkMnlo2+rfh3nMej
         IDST+wuW1jtAH8KdZWttfKDO2Wd6SUNVAnF01rI7MCaTx1hu+8LeOJMFTYgNl/1PFRMz
         5j4T/aT8hTSw/4yBn+otB95d2pdTyDwFPydiESMBk6VuIp5MIuUnYxx9xKjsdt8aV43x
         UUoSdyy/XYj+IJN3Ky09qWOc0jvUK5Vo/0FBpbqkY76S3gP22pcjamCdWDsEKr0u8cGQ
         9rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770128356; x=1770733156;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rfFv6kfMbhro4k4r2I8vRYN/RWIM5KJYEpa411uDzw=;
        b=LOIxlxTzZTg+t7rLBuH9S0kwoOGJ19lP82J+NClnwMBtXbKYa02oxsRTmBqv0QRNzT
         RC8uh7qF/ZRyn9hXtkyy5hlO5UpePg9sdWEAJSpDPz3LIBahSLYkCTq+pRQjT6loHiW2
         OnujdVJD9DES1oeJXT8GY2UvCtc6JbTAXaI14BZsGa7jZXc6tx7ZHnYfHubla2OwTcip
         MdADPWkhy0VASpRYxIGNwtcnnLVAsH5sw8Tv86gGpLgpirKCaM7u3Vh6pFlpAIK+Kf3E
         yvBa2qNszc2TuBIzwDUi7Ddr0FiryYTUYECTTKDc9+mwgyBSqjvXbJFoB0FFph28bh1N
         /Sag==
X-Forwarded-Encrypted: i=1; AJvYcCXeqjzJF5P200EpAnghJB5yMZ13XLMLnFpCFE1aVROoAINu/eLqgMHkDv441GbnH8tlS7Tm8IOVPPt3rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/3fMAbS+e6LtbGxhQm+ciyX/zLobZ1aui3usOKk8TAkRvF3Q
	mdHQ5M4vlwD5m/hJC/ZK3cIeI7MJFTIBnXfZIwZT0FF54rlxd84Jq69pMwfCNEMxpzE6v5nA547
	eC6g91LUhBGPpySVR0brIz1KeHyjG7BpcsQ6JV9XrwkKsmGBLvsBq8mnaThtL0wf4eg==
X-Gm-Gg: AZuq6aKoTjh4f0J3PGwIKB35gVqOQalIp+Qoa+nSbpIxOWidwKWbldlGV0rZ8hIkz6j
	k75/c22NaF4s9RFUOZl1NY1/sQdg/wnQF2eqS5VxyPJSiq1IrzspNKxFGrpM7RJD0tgzP50jRXC
	pg8Av8okRjsXcZT0lBakYhzCtFkDlDSeJGUHAXy4R9HGNp9SB72ytKYiWvkY/W7uE/w4LUhkHFp
	LZDLnoOPcIHmOfhgJyZUg2peG9fFTiCtw6irkpCNjLEZIIkLf11g3w3lM6BVJspl4y7cxb79jEZ
	9qXTuL1IIiW45LXm1vwXNVNcLtbKHdq0qiQYtd9EGsxf3tTu9GfN1dBLtOA7ZwXw5h3rzxlirn6
	Vww9KfpaS1vAoyU/T47MZX0k/xI1xTH1XHCjafH0C7QcXLVrnnsS1FkSL05nqmqYYbhINfQBsjr
	79eJgHvho0rlkr/U0ouHfKh6oEmcwNNMhoGRsRIGjfvBkkgxUZaNqwH9Byow/0DNPEA4XlyK29+
	TWN
X-Received: by 2002:a05:620a:bd5:b0:8c5:1fd2:e9ef with SMTP id af79cd13be357-8c9eb27018amr1905935985a.28.1770128355934;
        Tue, 03 Feb 2026 06:19:15 -0800 (PST)
X-Received: by 2002:a05:620a:bd5:b0:8c5:1fd2:e9ef with SMTP id af79cd13be357-8c9eb27018amr1905930185a.28.1770128355359;
        Tue, 03 Feb 2026 06:19:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1847f9sm1064954166b.42.2026.02.03.06.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 06:19:14 -0800 (PST)
Message-ID: <c6b5832f-d7b3-4bc2-834e-4ce7b0c0b4cd@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 15:19:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH v2] media: Virtual camera driver
To: Jani Nikula <jani.nikula@linux.intel.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org
Cc: anisse@astier.eu, oleksandr@natalenko.name,
        linux-integrity@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260202204425.2614054-1-jarkko@kernel.org>
 <6b192c71-c389-4a6e-b7c3-ddcd5cc4aa34@oss.qualcomm.com>
 <37a0d91c2e78c97f3d956444c4f7a2a2fca9ae06@intel.com>
Content-Language: en-US, nl
In-Reply-To: <37a0d91c2e78c97f3d956444c4f7a2a2fca9ae06@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=698203e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=E8RJ7uGaLTfD5B8v_isA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Y91Bw_MApAzN57lawsfxbQT4YpkOTSzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDExNCBTYWx0ZWRfX9B8s0eo08BRO
 7x+diCvuavxwinAMas7OSIO+bc2R7gmcSM+aQ/LwEerGXtQGm3wF4O6cVSe8p7yXH+oAX13kM0U
 1LndBLEgWwhqh+/djds3ksbBiLJu8nR/Axa8iAiu9SHFt92fGrk9UYmN57/DAeAdktgDAScHcwY
 +XWU+vRcpfL7paMWaUw6PpG21eMZ4fsfocd2hfSc9gPd7PzSQKAZ2U2iSgSd7s4fl3B453ziIbh
 pGPhieUoO5kE5WjQ0lXNL2dhwat79dO4X18Zh5hKPZ+xxTjm71qRHuy6xAyAJuc7rXIsdXC+kHN
 Wavv+5NEmaPR/ltWHtAHd3s6sbh6lw8NHZihs1s5vLGFfQCfo+VlJ/2HeVVj50chaRUO3KzK/WR
 dDgbsLtKWQXs4HDM/d2qCD2iPN+l+MZDvK5YRrZWtHNTbquON92HAHCcKw3+NNnaFrtgbMaVyNk
 RpsFNCHbQzfSj/nUjhg==
X-Proofpoint-GUID: Y91Bw_MApAzN57lawsfxbQT4YpkOTSzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52109-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A93C0DA818
X-Rspamd-Action: no action

Hi Jani,

On 3-Feb-26 14:20, Jani Nikula wrote:
> On Tue, 03 Feb 2026, johannes.goede@oss.qualcomm.com wrote:
>> The problem is that what you're suggesting is basically a much
>> improved (using dma-buf is way better) v4l2-loopback driver and
>> v4l2-loopback has been blocked from getting merged into the kernel
>> because besides the mobile-phone camera use, the other main use-case
>> is to allow running proprietary camera stacks like Intel's proprietary
>> camerastack and then presenting that to userspace as a standard v4l2
>> cam so that userspace apps will just work.
> 
> ...
> 
>> The community concensus is that the solution here is for apps to
>> access cameras through pipewire. Together with the shift of laptops
>> cameras from UVC to "raw" MIPI cameras there also is a shift to
>> running applications sandboxed as flatpacks because of the changing
>> "cyber" security landscape. This is why pipewire was chosen because
>> it also solves the accessing cameras from a sandbox issue.
> 
> Why is v4l2-loopback problematic from the perspective of facilitating
> running proprietary camera stacks, but pipewire isn't?

Once pipewire mostly works everywhere for camera access then indeed
this will allow proprietary stacks to present themselves as a pipewire src.
For now though most proprietary stacks seem to prefer v4l2loopback because
pipewire is not supported as camera source yet by a lot of apps.

As I indicated in my original email personally I'm a bit divided on
whether a virtual camera driver should be kept out of the kernel
to not promote proprietary userspace stacks, but this is not my call.

OTHO evdi: https://github.com/DisplayLink/evdi has been kept out
of the kernel for pretty much the same reasons by the drm/kms folks.

At least AFAIK there still is no way to present virtual kms capable
display outputs backed by userspace in the kernel.

I completely understand where you're coming from wrt v4l2-loopback
support (or something equivalent) but asking for this really is
the same as asking for the evdi driver to get merged, which AFAIK
has been blocked for the reason of avoiding proprietary userspace
display output drivers (I guess there might be technical reasons too).

Regards,

Hans



