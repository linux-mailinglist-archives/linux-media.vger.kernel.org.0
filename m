Return-Path: <linux-media+bounces-57076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJCLNQr/w2lXvQQAu9opvQ
	(envelope-from <linux-media+bounces-57076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:28:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149C327F35
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0804333A58D9
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBBE3E1D1A;
	Wed, 25 Mar 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xtl9lsug"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583D35AC01
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451771; cv=none; b=M4k+72AO3TuvjtGIszNHQJw2VTG4N6U4PAUkw2hMXhVQg3jz8qcojA8BA02xpVIVsaQ1oryruDY0LUnG0xDCn8/XRrhpZRcvZAdX9t9yZUVJzBqAGcG8yjQhIaz8csxY2eUG0aBH9AhtQae4jCJZDwANn/WWQrI6DhymvuEuZCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451771; c=relaxed/simple;
	bh=/vywv4hZ4+kE2TvgFYQ3L9kVw42zFJldnDoEQi5wZGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtUwARMsfbyULS5MctnBaGpwMo5LQJ7172Cd0ph4yIz1111KDzIRHluhtjpGBlMGprj482aDBZfqidR1WFgoo8mn5deyhVqJ2m6TPZZkK/mQEQV2278QbYHfn8HnlB0hPVHbRbhxBIXO8oGR+V5CIQnhtOBGA5OBXa4w6fJcQZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xtl9lsug; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f97c626aaso1034753866b.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774451767; x=1775056567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeZDmS4QXWBXj1GSyJBXJGYP+hGJySEXWFfrbydgUbc=;
        b=Xtl9lsugTjkG1zZ3ws5CkNNW0aOB1buzoShWTUH9GO8vsOmYQ8EAdjqMrPBnZa24uJ
         5Oj4ABMUHI00QYCSOUD6my+zhaz9e7UFsphPqhbvaxMEMRrcyxLmWlsJQABR9VSTSv6K
         MysRVPFd5hXAOgErCJkqUQP42uxmbycD828DD1TJSpa2RqQvITZs9+gupw9snXR9kwcH
         wqqITJdDFcGkvCgAGz8EsfSTpSee4lXNkI87HVUETqllVPy3L0FGqOrq4MqxursLHngD
         UleQ6BtlB58AK/5VCf7FUsm+bY0dvRFJHXnNB+KqGy46rgBSyiJNm8UY55kJ2JfRNG0W
         MH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451767; x=1775056567;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeZDmS4QXWBXj1GSyJBXJGYP+hGJySEXWFfrbydgUbc=;
        b=Ka6VisBy9Vuw3gAx9XH/r9tGjQlPfFCSEFVxy5wOOU4FwjXiFJ5nO5t54hewrVjUt9
         1yqkWb5Gagr3+5MHEBCDR1zLy/icrdlHQwqt4AK+Kg0EH3XcsTJozGNhcGRRDodMmPBm
         +p/n6+NE6WQtZVrNYNY1iY1MmhGL3dD7a/CU/6dKKuJPacn8/uSbpQktO02XmxZXkA8T
         oWuMXLjuxaumWrI+AOHbXi7l5p2iRFzPdVqsLoTOmmANLlAXzf51Ej7wFXvudyfDZZHu
         Zdj4qljIth6W7YWljmhPuGHYFnEzco1iW+tCvlsDhnpd7oXiWckJDJeRoJ1cm1X8Ey+R
         fVpg==
X-Forwarded-Encrypted: i=1; AJvYcCU2TuardI10ewz44xRacjgkHbk1XTIjrj18I9nKfGSdPTr3elZ7zitEGWx+RcUwYYaUnv97igEhR7gFtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0zzegpNKehnhQtU7r9iGJ683JvS2O00WjMCMx5SHPi+8qOwS
	oo4Ng4Pn6d6edQRQd//rWZAuWiY8M/wbjrIoJmm2lNR/tcdPlCJzLyVkg/GuDqq5vgc=
X-Gm-Gg: ATEYQzzKFGo4mEMQy20PoeCedN3KOuB0lLIxJKVVjQ6WzKQPCpO1LMF7QyzLU/hPAko
	BMbVEqx4VGnp/ztSCiN8LYLmuKxyfeF3vAEoVNFid2b2YApLIiZ6d527Vf+pYWpDfXtjeI3YWKN
	t2YZ7VedEaErpmLa2xsIlp1EtjxC5tu7WKGnEtEcjYu+oWiFKIfQQmJ702nJYZr/X3MqvgUt+Gg
	9kPc5VKlAjxYBB3li4Joe5B03Ywm/qs+MnHKV5YePZjCc7lN9LTU6KixhdBjJz+ivNt+dZL0cCe
	oAOwYCjfH/erxWfxZBMV4hQw+I5EoZBfpWbHqLiOC2kPwON7cgOPECzZN8YqOKU5qTCdf7KqoP/
	2L7SejYg58RK1IvSZCqeMH2On0IlOJGsbTLpGcG9EkZ07W5UyikvOC4/SDxEoSGTymJ2I/Eo1CS
	mVsUQPPSS8X9QPOY7Maxg+gsB+LgdFdhYqW/Rd
X-Received: by 2002:a17:907:619b:b0:b98:1129:51 with SMTP id a640c23a62f3a-b9a3f1abe69mr195370666b.17.1774451767271;
        Wed, 25 Mar 2026 08:16:07 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440e7sm800025966b.3.2026.03.25.08.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:16:06 -0700 (PDT)
Message-ID: <2c5b8402-6036-43b9-bda3-aeee0c6a9d7d@linaro.org>
Date: Wed, 25 Mar 2026 15:16:03 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
 <7dbf7a23-7a02-4e9e-99c8-6716e3dcf7d9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <7dbf7a23-7a02-4e9e-99c8-6716e3dcf7d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57076-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5149C327F35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 15:14, Vikash Garodia wrote:
> 
> On 3/13/2026 6:49 PM, Vikash Garodia wrote:
>> Currently the driver switches the vcodec GDSC to hardware (HW) mode
>> before firmware load and boot sequence. GDSC can be powered off, keeping
>> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
>> carry default (reset) values.
>> Move the transition to HW mode after firmware load and boot sequence.
>>
>> The bug was exposed with driver configuring different stream ids to
>> different devices via iommu-map. With registers carrying reset values,
>> VPU would not generate desired stream-id, thereby leading to SMMU fault.
>>
>> For vpu4, when GDSC is switched to HW mode, there is a need to perform
>> the reset operation. Without reset, there are occassional issues of
>> register corruption observed. Hence the vpu GDSC switch also involves
>> the reset.
>>
>> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with 
>> necessary hooks")
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
> 
> Hi Bryan,
> 
> Please pull this fix patch, let me know if you need me to resend this 
> separately.
> 
> Regards,
> Vikash

np

---
bod

