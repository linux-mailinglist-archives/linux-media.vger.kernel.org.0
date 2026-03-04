Return-Path: <linux-media+bounces-54462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP6CHasiqGl3ogAAu9opvQ
	(envelope-from <linux-media+bounces-54462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 13:16:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D971C1FF8FA
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 13:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E4C730156DB
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 12:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBC93368BA;
	Wed,  4 Mar 2026 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6tM4S2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj4nsa0V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368DF336884
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626597; cv=none; b=TUCL0g/9ZAGU2vMtGd+hnxawKAio3z6Lincq8guybBDFCcL6En4/6NEopTM0soaSbS37bVqPEVAGDlJQ6N0eiJas97jC0YHOSx0OEsmt87c0sEy/gT6MwzN7ssB0uqJnFZ0VVpH7kJXA/1KcbXI/+jG8jjI0EQ3TIlGnohT2LTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626597; c=relaxed/simple;
	bh=NbiXa7bPeCfXnb0eJ6roMUQPvSZszwH2dmHI96Bh+Bg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AF5dekH/S/T55Di3CfiPea8Fcd0A07as/JG2br2UrGslRkWJmQSBk5o6U1k8LldLAETZSQqWr/GEejixVagfxIvVXdtWKIUgqLQNtTN5J4cJb6JNXyHawhjOR/wVG4gxFTXsNSy54IMtLftIWyfg1nVewp6Vuk8htffxheIOD7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6tM4S2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj4nsa0V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SrrF957847
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 12:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kk6weI9Ev+ZViQOTezCFQsZxbaerWLizccW8t7puD4M=; b=D6tM4S2DzkVrsxNW
	DJb3hbyNg2NLj1PnmE+VBk2QI3u9HJewIjQhcsNFswF5+QBTcbJl7pRPJPm6RD79
	J7pgeoEZwzjvgaKjA9MImdFm0jMS8Zf+zkKOYkAcgh6u7joAcq1Uqh0TWF4wrgDd
	d5gXrfDrdEtdWM0GecEkHC/8FW2cAZKU3pxUk7CkSypEn6a82fE8NX/f5HkzOqFf
	jN9Hm0kIbfYdv99tUSSFwFqfPWRRUu8JER5tH4RzgGNNlrJRrIjGaTcaQKPCgfgg
	dKwFWUV0fF95QWWKPrimoPsBj7dUPhuZi0VKng+uFMyO9c7vrC0aREbjdfacbh+4
	mhxLFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgat3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 12:16:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3fae6f60so4988424885a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 04:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772626589; x=1773231389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kk6weI9Ev+ZViQOTezCFQsZxbaerWLizccW8t7puD4M=;
        b=gj4nsa0VIPnFX6Z3cOak11ZlXa7mrbMc7oMw9YQTc7AP6DXKFqrH179qzZuGy+kP5b
         OSmQbjuiCjdtVfMu5fWvEgGLFbj2VldSe7pJxyb3tg3U+UZHjQhN5Z6iu0eViQIxrhq7
         TvYWttGsjjPZ1taFYwaFDb6SO0s6utVrZ7tT5xNc+5DMAGePjViKF2gDSLJjizZr6lcb
         n+WJMZcX3y6oTzVSH1He6zEJfPZ0MguF1Khr6ZN5XbaLopVYemjOKDNN1tcJqTaDtdCV
         7pBoO6NHqFvOdM0jfMY7WHZca2fI7SRkuPAvPf4FjepI2/aQl3askp1G64uwhME355bl
         5OzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626589; x=1773231389;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kk6weI9Ev+ZViQOTezCFQsZxbaerWLizccW8t7puD4M=;
        b=mTDYWBMtUn2ACDheRuZXBdq4/a8awujSLaF6TjRj6+9SXLp6XKjBsgJHM9gqdT0zyu
         wEQQ7+gO4C9aL4rfY5jH7uXDmiquxMEeFpzHz7p2ugHGRK98m5olViPoERdDb6j4GkTq
         7uGDby11m3clCh6AnF/M67WiDA+J9EKKBrumGFQBoqQGy+d8FtrnRN7lFzFnvKTpieAP
         3v3T/MQmb8DRSVscNI+jcMQiuySdK4QEJqj8T2ennjp+fzpJrEtA/StrH0L94a8iVLtc
         9SxVqymjdkSoeRnFMSf9ndU3YTb+dKUQwPC25F+fLr5h35CKjlOMwKhdnTVMej5UgGzf
         V78A==
X-Forwarded-Encrypted: i=1; AJvYcCVuijdqrV3OIaazU/xD5QUYLUvWZv+8TbTWsIXtFiy9By/6LbO8Fx06ISiH+sCzGMblX6HLI+dgQzUfkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfCw9dxKHOwOvidfGkSZlGi3gslSdpwTv83fgfNjqPrkrd17Me
	UMlMnZLXu7AvKmFSTooUeGTnGkcV2WEG9AU9+KSZkVv3+tq19RSd3ydI31C95VqYNcAYepc7mWZ
	ANII5NCbimnd0TCshNSIX9NY0p36DRXrfu5U7vhHwsfuNZQpbi1YUjym8D/Hr8RgAlA==
X-Gm-Gg: ATEYQzwRQabw0cumMEmQ6efEPzD8P0hLzBldCYrpM03q0AtXWzP9VfyRjpE1szKiSmW
	LATzfqYXlTycKVF2I3KCign6KWc+LhQ2hCROenZMqxAstN+Nr8pu+xPbh8hiieCYUsod25raHOp
	LfI3vPxXsHlK4BEP+KyEWAQw/4nmeX4meVT2UvYKcjNZEhY9cs+x7CRw5rRvHPR59lfZX45xF4W
	XiV2b0x+ptmK1QKVrbkqOGXwhbxVHZFvqBXSu/PKo3f1eEgmS45V0BhuUKD7jgu5XB9U3wk5ovJ
	pcgVwbaIwLJTo89XyRhkB6OYKdefvhOCSrVE5DQyWaikRTDixNzM4/6t8E9oC/i4R1ugVw1qxDr
	B3hZUGglLXQf54QlvW1+GgqiLLGAOI/BDdZZOpzn+
X-Received: by 2002:a05:620a:700f:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cd50bddf12mr617679485a.45.1772626589171;
        Wed, 04 Mar 2026 04:16:29 -0800 (PST)
X-Received: by 2002:a05:620a:700f:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cd50bddf12mr617647085a.45.1772626583900;
        Wed, 04 Mar 2026 04:16:23 -0800 (PST)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3c97sm721595466b.63.2026.03.04.04.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 04:16:22 -0800 (PST)
Message-ID: <a5d899cf-a344-4780-8906-2ac0f148c90e@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 13:16:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: RFC: Intel IPU4 driver proof of concept
To: Ruslan Bay <ruslanbey@proton.me>, sakari.ailus@linux.intel.com,
        Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, claus.stovgaard@gmail.com,
        laurent.pinchart@ideasonboard.com, andriy.shevchenko@linux.intel.com,
        tomi.valkeinen@ideasonboard.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
 <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
 <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
 <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
 <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
 <e136389011517dbc65b30f6bf0b1a9c49ab4e599.camel@gmail.com>
 <6f37f978-4898-473e-b774-7965d25bf27b@proton.me>
 <jsjMql5IQTMsAgViwR9vrMG4CZ1hVx9JMN4wbc0E98BvUP-TRpgtYalrmzQeor4UHRCbLg3bBeeZcaWrTujAMrf0G8q8NyQrd4o954ZayKA=@proton.me>
Content-Language: en-US, nl
In-Reply-To: <jsjMql5IQTMsAgViwR9vrMG4CZ1hVx9JMN4wbc0E98BvUP-TRpgtYalrmzQeor4UHRCbLg3bBeeZcaWrTujAMrf0G8q8NyQrd4o954ZayKA=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA5NyBTYWx0ZWRfXxDuBuqlJgsnb
 OoNT8LjsSYHlk9Q4I9gSJTaNyY7mgPKX71yvBBHQ3+pIu/oUyfIKIC1D2K84Nc5q7C5lVV7TQDU
 p5G8anzEHmjhwul6kliH63Pqg/BV+dmD3CvZPxzeADRc+vTnD4GKsGHezA0Q/4uGGOnIeCRW/9h
 hT03KVqYFD2oNaaxo8cZU5X9IEP5u+07TJ2nCkwDhOGnC9dZbtkWQyx9iRSK5rnJK8qKmYat8H9
 BqDsE4hv76/NMWIy3I0Pu9LzBQU9Hsy7+ZTe37kW2cOKe6WZ9IjtLo3UHbOnwBRS8EzIAEdm95s
 wRUOdsDhsCt0UbAawsup+L/YxEVgIR/+M+AI0F0ZJ3qo7tlc1RlsezSywkHigpAFPtGWcyBw24X
 QhU0S016mkof7LNqKL5pO5sbFJ+1YT13/FmwRxsgAo10mG+Mto7tJbro9ubNi3Q+b1IE89cay8Q
 izxIfOqKIO1izfBUWtQ==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a8229e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=9AdMxfjQAAAA:20 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=eYij6cvhAAAA:8 a=cueW_2Deuo_w9YXS3rQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=s0V7auAMc2pWXALKi75_:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: j_9gDxMVudo_8SX64u0LfEZNcMHqzy6u
X-Proofpoint-GUID: j_9gDxMVudo_8SX64u0LfEZNcMHqzy6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040097
X-Rspamd-Queue-Id: D971C1FF8FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54462-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,linux.intel.com,ideasonboard.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,proton.me:email,clearlinux.org:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Ruslan,

First of all thank you for your work on this and very cool that you've this working!

On 4-Mar-26 12:03 PM, Ruslan Bay wrote:
> Currently there are multiple IPU driver implementations actively
> maintained by Intel engineers:
> 
> - mainline IPU6 [1]
> - downstream IPU6 [2]
> - downstream IPU4/IPU4P [3]
> - staging IPU7 [4]
> - downstream IPU7 [5]
> 
> As mentioned earlier, IPU4 and IPU6 share a large portion of the
> code base, and IPU7 appears architecturally very similar as well.
> 
> The IPU7 TODO mentions working toward a common IPU module [6].
> There was also an attempt to move from ipu6_* back to more
> generic ipu_* naming [7].
> 
> Is a unified IPU core still planned?

Note I'm not working on this myself, but yes to the best of my knowledge
the plan for moving the IPU7 isys support out of staging is to move
to a single unified ipuX driver supporting both the ipu6 and ipu7.

> If so, is it expected to include IPU4/IPU4P support?

This is not planned, but it would definitely be good to have.

Since you say that the isys has a lot in common I would expect
that the ultimate goal would be get the unified ipuX driver to
also support this.

For now I think you could start with adding IPU4 support in drivers/staging/media,
with the same TODO note as the IPU7 .

Sakari, any comments ?

Regards,

Hans



> 
> Links:
> [1] https://github.com/torvalds/linux/tree/master/drivers/media/pci/intel/ipu6
> [2] https://github.com/intel/ipu6-drivers
> [3] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-android_t-251103T063840Z/drivers/media/pci/intel
> [4] https://github.com/torvalds/linux/tree/master/drivers/staging/media/ipu7
> [5] https://github.com/intel/ipu7-drivers
> [6] https://github.com/torvalds/linux/blob/master/drivers/staging/media/ipu7/TODO#L17
> [7] https://lore.kernel.org/all/20250502154446.88965-6-stanislaw.gruszka@linux.intel.com/
> 
> 
> 
> On Sunday, February 22nd, 2026 at 8:57 PM, Ruslan Bay <ruslanbey@proton.me> wrote:
> 
>> We now have a working IPU4P driver for Ice Lake devices [1][2].
>>
>> The current IPU4P implementation is based on Intel’s downstream IPU4
>> driver [3]. ISYS capture works with libcamera and has been tested on
>> Surface Pro 7 and Surface Book 3 [4]. The world-facing camera (ov8865)
>> works; the user-facing (ov5693) is still being debugged.
>>
>> IPU4P and IPU6 both contain PSYS implementations downstream, but in
>> practice only ISYS is usable with libcamera today.
>>
>> Earlier in this thread Andreas noted that IPU4 and IPU6 share more than
>> 85% of the code base.IPU7 appears architecturally very similar as well.
>>
>> Before preparing an RFC, I would like clarification on direction:
>>
>> 1. Is the long-term plan to unify IPU6 and IPU7 under a common driver
>>    structure?
>> 2. If so, should IPU4/IPU4P be aligned on top of that?
>> 3. If not, would it make sense to follow Andreas’ approach [5],
>>    implement IPU4P on top of the IPU6 structure, and move it to
>>    staging while iterating, as has been done for IPU7?
>>
>> The primary goal is upstream IPU4P support (large Ice Lake user base),
>> but ideally this should align with the Apollo Lake IPU4 work shared
>> earlier [5].
>>
>> What direction would you recommend?
>>
>> [1] https://github.com/ruslanbay/ipu4-drivers/tree/main/patches/kernel/v6.19
>> [2] https://github.com/ruslanbay/linux/commits/ipu4-6.19
>> [3] https://github.com/intel/linux-intel-lts/tree/lts-v5.15.195-android_t-251103T063840Z/drivers/media/pci/intel
>> [4] https://github.com/linux-surface/linux-surface/discussions/1353?sort=new
>> [5] https://github.com/Kleist/ipu4-driver
>>
>> Thanks,
>> Ruslan Bay
>>
>> On 12/20/23 1:53 PM, Andreas Helbech Kleist wrote:
>>> Hi,
>>>
>>> As mentioned previously in Bingbu's IPU6 patch series, I'm working on
>>> porting the driver to IPU4. I've now got a hole through so I think it
>>> makes sense sense to share the code.
>>>
>>> I'm able to capture frames with yavta with the current code, but there
>>> are several issues that needs to be fixed for it to be complete.
>>>
>>> # How it is tested
>>> ==================
>>> The hardware is a custom x86 PC-like embedded device with the following
>>> video pipeline:
>>> Endoscope -> FPGA -> tc358748 -> IPU4 (E3950/Apollo Lake)
>>>
>>> See my colleague Claus' description[2] for more info.
>>>
>>> There is currently no V4L2 subdevice for the FPGA, so we have a custom
>>> ambu-tc358748.c driver which pretends to be an image sensor.
>>>
>>> $ media-ctl -v \
>>>   -V "\
>>>     \"tc358748 0-000e\"    :0 [fmt:RGB888_1X24/800x800],\
>>>     \"Intel IPU4 CSI2 0\"  :0 [fmt:RGB888_1X24/800x800],\
>>>     \"Intel IPU4 CSI2 0\"  :1 [fmt:RGB888_1X24/800x800]\
>>>     "\
>>>   -l "\
>>>     \"tc358748 0-000e\"    :0 -> \"Intel IPU4 CSI2 0\" :0 [1],\
>>>     \"Intel IPU4 CSI2 0\"  :1 -> \"Intel IPU4 ISYS Capture 12\" :0 [5]\
>>>   "
>>>
>>> $ yavta --data-prefix -c2 -n2 -I -s 800x800 --file=/tmp/frame-#.bin \
>>>         -f XBGR32 /dev/video12
>>>
>>> This produces frame-*.bin files containing 800x800x4 bytes of valid
>>> "BGR0" data.
>>>
>>> # The code
>>> ==========
>>> The code is available at the tag
>>> https://github.com/Kleist/linux/tree/kleist-v6.6-ipu4-hacks-1
>>> (15245fe26e07)
>>>
>>>
>>> Note that I haven't renamed the files to ipu4, to make it clear what
>>> the changes are compared to the IPU6 driver.
>>>
>>> It is based on v6.6 with the IPU6 v2 patches[1] on top, and then my
>>> hacks to make the IPU4 work. This is not meant for upstreaming as it
>>> is. The commits are a cleaned up version of the chronological order I
>>> made the port in. It is not yet in a state where I think an RFC PATCH
>>> series makes sense yet, but I wanted to share it anyway.
>>>
>>> ## Changes compared to IPU6
>>> diff --stat of the changes in ../ipu6/ compared to the IPU6 v2 patches:
>>>
>>>  drivers/media/pci/intel/ipu6/Kconfig               |  12 +-
>>>  drivers/media/pci/intel/ipu6/Makefile              |  13 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-bus.c            |   2 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-bus.h            |   6 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  71 ++-
>>>  drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   8 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  45 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   2 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        | 171 ++++---
>>>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        | 237 ++++++----
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      | 219 +++++----
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |  11 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  33 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   8 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 212 +++------
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |   4 -
>>>  drivers/media/pci/intel/ipu6/ipu6-isys.c           | 435 +++----------
>>> -----
>>>  drivers/media/pci/intel/ipu6/ipu6-isys.h           |  18 +-
>>>  drivers/media/pci/intel/ipu6/ipu6-mmu.c            | 130 +++++-
>>>  .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  98 +---
>>>  .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   | 226 ++-------
>>>  drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  | 172 ++-----
>>>  drivers/media/pci/intel/ipu6/ipu6.c                | 511 ++++++++-----
>>> --------
>>>  drivers/media/pci/intel/ipu6/ipu6.h                |  37 +-
>>>  24 files changed, 1032 insertions(+), 1649 deletions(-)
>>>
>>> Note that most of the deleted lines are removed because they are not
>>> used in IPU4. E.g. the watermark handling, which I haven't seen an
>>> equivalent for in the old IPU4 driver.
>>>
>>> ## Ambu-specific tweaks
>>> Note that I'm using a hacked ipu-bridge (AMBU_IPU_BRIDGE) to setup the
>>> fwnode graph for our hardware. You don't want if you're testing this,
>>> so revert at least the "ambu: Add AMBU_IPU_BRIDGE" commit.
>>>
>>> I'm not sure the right approach for handling this would be going
>>> forward. Of course the ambu-ipu-bridge shouldn't be upstreamed, so I'm
>>> wondering how we can achieve something similar? The ACPI tables from
>>> our BIOS unfortunately don't contain any info about the Toshiba Bridge
>>> (tc358748), so we can't derive the information from there. Maybe some
>>> kind of platform driver could be created which tweaks the ACPI info
>>> before the ipu-bridge driver reads it?
>>>
>>> What do you typically do when you have some proprietary hardware that
>>> does not provide proper ACPI information? We could carry the ambu-ipu-
>>> bridge patches in our internal kernel tree, but that is not desirable
>>> in the long term.
>>>
>>> # Inspiration for the IPU4 port
>>> ===============================
>>> We are currently using a Intel LTS 4.19.217 based kernel[3], which
>>> contains the old IPU4 driver. The port was basically made by comparing
>>> mmiotrace's between the old IPU4 driver and the new driver.
>>>
>>> We're using the IPU4 FW ipu4_cpd_b0.bin extracted from a ClearLinux
>>> package[4].
>>>
>>> # Known issues
>>> ==============
>>> ## Doesn't yet work with gstreamer for unknown reasons
>>> I get "Unexpected buffer address:" errors from
>>> ipu6_isys_queue_buf_ready, and don't get an image through.
>>>
>>> ## 64 byte chunks of wrong data
>>> We occasionally get 64 byte aligned 64 byte wrong data (all 0xCC) in
>>> the captured frame*.bin files. This could be a cache invalidation
>>> issue, we haven't looked into this yet. The code currently doesn't use
>>> zlw_invalidate, even though it was ported from the old driver. We
>>> haven't yet tested if enabling this fixes the issue.
>>>
>>> # Upstreaming
>>> =============
>>> We would like to upstream this driver, probably after the IPU6 driver
>>> has been merged. We're definitely not ready yet (either), but I already
>>> have a couple of questions, that it would be nice to get some input on
>>> from the community.
>>>
>>> ## How to share code between IPU4 and IPU6
>>> Big parts of the code (approximately 6k out of 7k lines) does not need
>>> to be changed compared to the IPU6 driver, so there is clearly a big
>>> overlap in what the two drivers need to do. I'm not sure how the best
>>> approach would be for sharing this functionality. I see a few options:
>>> 1. Shared driver that supports both IPU's (still split in PCI driver
>>> and -isys driver)
>>> 2. Shared PCI driver that supports both IPU's, but device-specific
>>> intel-ipu4-isys/intel-ipu6-isys drivers
>>> 3. Separate drivers that use a shared "library module" (for lack of a
>>> better term)
>>>
>>> My gut feeling is that 2. is the right choice, especially if we moved
>>> the shared code in to the PCI driver and the more version-specific code
>>> was moved into the specific drivers.
>>>
>>> The answer to this could also be input to Bingbu's IPU6 series, maybe
>>> it would make sense to place some files differently if they eventually
>>> will be used in both IPU4 and IPU6 drivers?
>>>
>>> ## How to implement our platform specific fwnode graph?
>>> As mentioned above, we currently have a hacked ambu-ipu-bridge driver,
>>> which is clearly not upstreamable. What would you typically do if you
>>> need to make a v4l setup where the ACPI table information about
>>> sensors/bridges is missing?
>>>
>>> /Andreas
>>>
>>> [1]https://lore.kernel.org/all/20231024112924.3934228-1-bingbu.cao@intel.com/
>>> [2]
>>> https://lore.kernel.org/all/471df7ffdf34b73d186c429a366cfee62963015f.camel@gmail.com/
>>> [3]
>>> https://github.com/intel/linux-intel-lts/tree/lts-v4.19.217-base-211118T072627Z
>>> [4]
>>> https://download.clearlinux.org/releases/32370/clear/source/SRPMS/linux-firmware-ipu-19ww39-104.src.rpm
>>
>>
> 


