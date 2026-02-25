Return-Path: <linux-media+bounces-53409-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPjIBhZLn2lEZwQAu9opvQ
	(envelope-from <linux-media+bounces-53409-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:18:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6507619CAA6
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 894F03045A83
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD043EDAB8;
	Wed, 25 Feb 2026 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBIuGH+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="judDxENA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235C2C11CF
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046992; cv=none; b=tGBI5dlJPM+0DHSCOOdT633nbXL78gtajgBbkn0Whbfpj3vLMy5hSTtr6B06BCZHSWzkm5xSqOauBN4oO/N3LW7PeHgNFSQPCDsYJcPgjFDPDAqr1DotYqks/k33xc/tL1R79kZa6BO0P7LhT50e0d9XRgVHKMo4RXo4pHpbUfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046992; c=relaxed/simple;
	bh=JKDW/3JaTVDQQN1HGh2Kx50563O3XSftBtp3y9MuSmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEOGLiXusMlKTpqaHfXHD3ma44EXCaNVDRijtp9qAUiMl28xpwPEuFWsqdddW9p3j9xnzdM5DveUhe2T9apIGRbTGGhDkbEGah5JhcYlK3uIgdbmJptEUK6ejdok8HyL5kFurLXsMyff6OUHka+cu62g1zTTvJEuIkDrRf/pobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBIuGH+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=judDxENA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH2Kkm3100869
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=; b=NBIuGH+qsITYkPXs
	Lof0N/6lSzDAv7Bpsm1A94Chi6YXXVYgoHooLmZ82JXaMITNohWCFCF5VA++xnoN
	yFJorSI5utmoSnY1IhQPWMnBVJp91XxB28WwAFzWVEGN3qSiQZCVtHkO5nZsRo2c
	JpJvOGSulZmLVv3Ty54oc1DNU2nIwPiaHIsLPqsoM1WW3qQCi34G+Bvjexxh6JlM
	uafSnrGYntn6CiqjATlu+MZVNOrBjrL6486X76+gARLA1z3DqX0pMoQtPXmQWMhN
	YH7S0MKzRKnXfjyz3xCY97lqnaDBIvi8uc5BjAJfkuSc/hfMmthY1ejzMJHJ1Gi+
	Zxh29A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54p8frx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:16:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdc0bb5ea0so863eec.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046989; x=1772651789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=;
        b=judDxENASDtWRPk1RjrdYNQmPdZ6zl83fwVveVZG/dekj2O7E+UmeJxAc9KwrzCx1x
         UI53kcbj5D+4B0ZmOJL+9zZBnX2ZsobAF+q8LwXic8yJCDRIXeUvFDBctogM6jwNs2Zj
         tGh5FNh00YR0/xrs1yrFIQvplo2/3kQO3382RiNuT4O8gQwHaeaBc8KGnjGqWK8kO/u+
         XKgw3Ghj97pFsZu1zBhqBD5D9kj5qr+KJZqGs2iXLhUkBBVhlawPb4cC6adQfPvkX5x3
         cwuB5mOKK7aZOE4sCNiFHhHYaI9q/xJCmCP9zGXboccwuwtmkj3p1apDnL2H3Nir7GLP
         qF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046989; x=1772651789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdS/QntJSaGj5m5uHLTyiULnHKwPg/+0nR+soa0YEdU=;
        b=TJylMXEAaHcA0iKSCOoWfnHF/eXRqrKnlHrYZsMH9a3Ctm9lElnl4UdLbao5G7kHqi
         vAnwNE+lxbpcg2o0NBf3Zwh0c33vMozF7TPBgTuv7YvcMR6WKadZhGvSZqigxzk9qzlT
         foG8+3eICHQP+gVcvfWzwhsJSHIq1Ais2IA1rPjk3q0RzOgAdjsZDZy0WghL52w68uOV
         1DFfTaDXqJ+b9QyNW5kUkWnYnnTsnaAUGRoENhAcn2RlbIl5H3Lr+n3E5yk+6GQEdJOv
         6bwhjkR0kshtrzSrNEyhfUY3PH988CEZ4GpkZpl5M7zpKx6I9/maWucIVe8/i13OzPWD
         5qfg==
X-Forwarded-Encrypted: i=1; AJvYcCWJqaTGD/XOctJw5Cjcs/tzyvBNMwhtUUBXDesnPp2JLw+R5+QX5Xi/UHijVQYN9bOY/RGGKZMtXFuELA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqyUvb8MMvwS3SED2++c4Bymbiol/IwJbjAXrbbZvb4R2NKFM
	Hvh3OuZBIWKVss3YCXc8FPlvsr+5PH1ZO2XdEuUqazGZrbpE1aHmV6wJkfipXJ0GKrI6a3AHzwv
	61p5fzaGn6EVwEoLei6Kbc6FHFFRHLS49JXVMISo0MoY9jhvHfH6wNWAWKrBLv5trLg==
X-Gm-Gg: ATEYQzy8LtwoeewWmJ9e2W9msXbhW0TjA8WKPEHEaHL27XD5bgVNMREtw1Ww2LWkHlV
	HluUWbQRwhuYR/vsGMkQHYXzzd6ZpdDx3T2lkVNGwXwvyHzR5h2SdeiWTjElRJob/lteOuzA+Aa
	trKf5c284t00p0EtLTvWxrgGnV3kM9Y1Z4ganpaPPI2ja9yWilxfd4h3adeY734mU7GfKMWAXeT
	icWu6zLMnk1GzquV7JC6S5nDP5EvP8vkaO1RJ/ui45eGzfh06jz9TkojelzNWFAf2+TrtmUDk1k
	hX39uVSxdS0paU0GG6LPXzuno6ygy8Cce+jJo7TaGTH7HnSXv+MxnErsjOi5aU7r0B8MBjhYapI
	/VCKHHy1e00qax/GrilsaVvFGCHMEtNaTAorPoT5z8YeUpOogOzMd7MQ=
X-Received: by 2002:a05:7301:434b:b0:2ba:990a:4829 with SMTP id 5a478bee46e88-2bd7bd112fcmr7841911eec.30.1772046989276;
        Wed, 25 Feb 2026 11:16:29 -0800 (PST)
X-Received: by 2002:a05:7301:434b:b0:2ba:990a:4829 with SMTP id 5a478bee46e88-2bd7bd112fcmr7841890eec.30.1772046988649;
        Wed, 25 Feb 2026 11:16:28 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8304sm9699189eec.17.2026.02.25.11.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 11:16:28 -0800 (PST)
Message-ID: <4e4b50fe-1091-451e-b854-f7b061ebd88d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:16:26 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Bjorn Andersson <andersson@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
 <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
 <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfXxMwXwRCJq/9/
 bOfYsd5StcEozt6BPB/u9mDoYHJC3OPMwdAAtJSW86EkQ+1UzL11g7GARjeaQfrSasJplwZO7Y/
 3HcvgvilBp5YtlghIX33OSeEz3ihLIhjsOwdP0XOYRjn3yYv0JVMWmwRO2nYkn4VbOxVSLKJmcj
 KxMdHdaEKPgNu9iaEzePiuGgJFH2JJNEbplxdC09Lp4V0FEHbZmEG9xjzJSpsWE/UtGxHyqexVK
 fLNN84M3kweU4fyRrmXOryJ9+WpsEU21cIfE0tSCP727enggpTJQvyo/nzqj747kaX7LuCuMZjH
 sRuBBj2uTxO5H5Ox1tZaK2OvnSZeVNRkt7B0W8jPZH45MW2R79ltrCstwrtH/EyXaV65JMcV8VN
 GPNPrRT057g53YmErIShPEm5fo5AYCFtGMX7aofCF+4GI5rSMb+WrQQ1MMy18rab7O8dSwuYF/a
 tttbk5sFUQcXa5ewZqA==
X-Proofpoint-GUID: hiMJIO8QLPBp3zUE75xGb13JnaDVGvd8
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699f4a8e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Vs6AG_5Z_IHWLNxo5LUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: hiMJIO8QLPBp3zUE75xGb13JnaDVGvd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53409-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6507619CAA6
X-Rspamd-Action: no action

On 2/25/2026 7:12 AM, Bjorn Andersson wrote:
> On Wed, Feb 25, 2026 at 07:47:08PM +0530, Ekansh Gupta wrote:
>>
>>
>> On 2/24/2026 9:03 AM, Trilok Soni wrote:
>>> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>>>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
>>>> integrated in the DRM accel subsystem.
>>>>
>>>> The new docs introduce QDA as a DRM/accel-based implementation of
>>>> Hexagon DSP offload that is intended as a modern alternative to the
>>>> legacy FastRPC driver in drivers/misc. The text describes the driver
>>>> motivation, high-level architecture and interaction with IOMMU context
>>>> banks, GEM-based buffer management and the RPMsg transport.
>>>>
>>>> The user-space facing section documents the main QDA IOCTLs used to
>>>> establish DSP sessions, manage GEM buffer objects and invoke remote
>>>> procedures using the FastRPC protocol, along with a typical lifecycle
>>>> example for applications.
>>>>
>>>> Finally, the driver is wired into the Compute Accelerators
>>>> documentation index under Documentation/accel, and a brief debugging
>>>> section shows how to enable dynamic debug for the QDA implementation.
>>> So existing applications written over character device UAPI needs to be
>>> rewritten over new UAPI and it will be broken once this driver gets
>>> merged? Are we going to keep both the drivers in the Linux kernel
>>> and not deprecate the /char device one? 
>>>
>>> Is Qualcomm going to provide the wrapper library in the userspace
>>> so that existing applications by our customers and developers
>>> keep working w/ the newer kernel if the char interface based
>>> driver gets deprecated? It is not clear from your text above. 
>> Thanks for raising this, Trilok.
>>
>> This is one of the open items that I have. I'm not exactly sure what would be the
>> acceptable way for this. 
>>
>> As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
>> without modification.
>>
>> I was thinking in the same lines as you have mentioned and  having some shim/compat
>> driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
>> character devices and route the calls to QDA. The compat driver could be built via Kconfig.
>>
> 
> This is a fundamental requirement, you need to address this in order for
> this to move forward.
> 
> Which makes me wonder if it would be possible to reach an accel driver
> through incremental transition of the current driver, instead of just
> dropping in a few thousand lines of new code/design.
> 
>> However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
>> before, so I would want guidance from maintainers on whether this is an acceptable
>> model or not.
>>
>> Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
>> unchanged in terms of definitions and expectation. The same project can be build for both
>> FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
>> not face any problem if the libs is built with proper configure options.
>>
> 
> You're assuming that the kernel and userspace are a unified piece of
> software, they are not. It must be possible for me to install a new
> kernel package without having to replace the userspace libraries.

Thank you Bjorn for providing the inputs. 

I also foresee that we will be stop adding (or already happened) new features
into the existing fastrpc driver, so calling the new driver as an alternative
is in oversold category.

You are pretty much began the deprecating the existing fastrpc driver, so let's
just mention it if that is the case and provide migration/shim path so that
existing binaries doesn't break.

---Trilok Soni


