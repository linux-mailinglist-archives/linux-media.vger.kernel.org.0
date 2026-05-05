Return-Path: <linux-media+bounces-60446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFfTFfgD+ml1HAMAu9opvQ
	(envelope-from <linux-media+bounces-60446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:51:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C22014CFC0D
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6B58307EBD5
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8886B480DD2;
	Tue,  5 May 2026 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/9FEifz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYfOPbc8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF97C480DC7
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992610; cv=none; b=oSAD8WvtDVQLtIEiCxvr5SjCvDvkQBht3i8IOcgPLXcGKoZvDCOmM32d92C39pT1ENRSGUP/bl71TXIGn+P/l09TFP0JzdsNodizqFTzMqA7zDqYhZZ80LEwVMnuab9IgRTHCmcMS56DZlOAG8END4Oxu8fonwcL/ey8W9CPjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992610; c=relaxed/simple;
	bh=/ThHF8hJw+I5T6qQTw/Q1CJUS1knLMz9fJpBGnuPP7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCFFP5WTLt3QKr29ICk3WfjbWk8+S7Yr3KtGEDmWFBF/RDbux7w2yIRL6fyQm7FWn0XmdfoeSX7tp9R239ommkYY8iQTX/DAQTwiOyLyKchm3JYSKxPn2txknXF2Z90DrhScX/83DSW2f6aW0ORsisw6Wg98676coJG3h/DjlSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/9FEifz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYfOPbc8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6QxU3091483
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 14:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=; b=l/9FEifzdbjK9Knf
	VYMr3kcwzNNLhbAzkKvw0GYs2OJ7sGEeOZWHWKf0cK+obbOnyvKMJDrIQJ8lgoHV
	XU/JcwvsxKjYVEKjIGZuOVpxLX4NZmGktmosZokNx+YJqslTQBCiGGl9BCYdMXNE
	crE7L0LpAeXm5vmofh7Uggtr3DCHMeTSJtLFDz6DF2o4nJfDx6jsKCqBo1yrq0Jy
	rqamtvs6nhXmQIdnBDGtNhhFEDzHZ0fsjdc6/iAFVW2wmae8RcSCd8kJi5+jxz5F
	c8fmALkBNzOLw+891xaprdQssFDUYsd3Hx7I5HqJ9STd75ldyI54mKNtTm1wzK9E
	wtw6lQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct0tgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:50:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1309f4ee96dso2948994c88.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777992607; x=1778597407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=;
        b=HYfOPbc86IkFt32OydKGHNPuFrJhwRBtktawwqQaL7c+EwDKjquwu1Nyfu4zfnyZZ+
         LKuOVbPuGhWk8PkIk4FQLc4XJkqLBiSb/6+oKDCRJO1nUf1rRB3wJRc/v70wBRRgF9DN
         iSVh7qluczutqvfo49cFDgf2Wz1lIfLhGgt7anZasKbS1/LTjTUFjx2jK36v4tmJw6Ez
         37ahNZZYuKLmU1b9fyeb6hZOdAWCo5JJVOTt/emCyUSI1X3RhiKqbN2MymwCQvG1UfTy
         +I0/XzR6GoghJrUAswzo09bzPtargiq16SBaOR8Tm6AIg4rFQc8rullqQrhkI0rRDcDX
         GNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992607; x=1778597407;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=;
        b=a2s98aC8rnd2TUDlqhKOEHs0sA/W3ptv9F2AdmJ8HgDSGSWGyUQrwE3onj1WenCkbr
         3/aDS/XAifwSiLxB1wuR7LppfpOEAiv2/En5Yycqz1bme/QYW7MNYBef9ytxwcBnKeb1
         LvJw/Flkf5orONYs4jiW+GObP6CiX+F+tZwZn4cXSZC5qA8hNhYkAhmhYnvubUe+wx9k
         5gMQqSa3iDRKmQyIc4F/ITf2Mi07Y7qr1fxLGDP7SxJIc4Y7LByRhs05Ps8ga7umbOva
         LxXc/Pva353FzuLmu5HJqMvd8yG8msFaxzLX+6nYD3GpJ+51xC+aQeqBwPYJWniOJ99g
         51rQ==
X-Forwarded-Encrypted: i=1; AFNElJ9erjTpH181jdAw6qbY068nfiGlbEzZE048GtSPHXTbX2dEyQMr2YTzPX8eq1xe7M26hSphUM0Zz9G4GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEZhmKcFysNpuE3ljElEyy/eNGEHQg+mySJUslZJiWK2F9cwp3
	VCP1Vf3NTSAw9vJFNdmu91SjlIxU1z9+kVXQk/pi7bqiXlIdhbcAlNhPZxMg7zWYrfzRw6NqPnD
	vSErWdheVH1BA5rSUKDdUJE3hQR3LQgnlmP/mer27GKcoBVHvRfKt9o2QDKmFd0RLrQ==
X-Gm-Gg: AeBDieucmN08Qi6Mz+6Sd0ogc/A0qx/xyrrsLnC1Am7dyou0HTTIncWW9788GUGB2xY
	yNQntZ+RVZJdbHNiCbOo24JfDbKHozPqpWPJ1hUUWg7n1S9POVFeQSZ/xmeOb1HHkEupRMNxdvV
	hVKhepVaCEcqrRZTwlEzRT8v4n7Wua8oHkWESpcwwyVZFJLjQNDTDm7xOnbSZVhFv5nor0dI7EN
	ovbbuvFVlnZ5HSwJPiTllKgbySnNahWgXZ6KfUctd+QznnVzfgLNLA4vJ0+P/KZRH4jVf35YRw1
	Vtb4FmGmfKH2qt2QihjXG6aDrAurcwJjWYZFfM3ukxLBP5AjR7N7aH3l8wqT5pzTcu5DPei2ffg
	I7Wlm+N0QdMvrrL1HtmYrAdV3KP7RGVM7omOnX2x6bQXu9W3Vb0lXVH+eK/vcjBVFjCcLsYoID5
	JxSXnYb6nVn+3Gx2V7
X-Received: by 2002:a05:7022:6628:b0:122:33e:6d41 with SMTP id a92af1059eb24-12dfd84327fmr6504971c88.23.1777992607377;
        Tue, 05 May 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:a05:7022:6628:b0:122:33e:6d41 with SMTP id a92af1059eb24-12dfd84327fmr6504928c88.23.1777992606769;
        Tue, 05 May 2026 07:50:06 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8279e57sm19149584c88.3.2026.05.05.07.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:50:05 -0700 (PDT)
Message-ID: <ae68bdb3-d683-4e7a-a27f-739214656ce2@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:50:03 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
 <20260504130603.1474043-15-sumit.garg@kernel.org>
 <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sMAAxpDn6jiCjpOxkV2sCAv34SPzwzQv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0MSBTYWx0ZWRfX4gbL0EYEfBet
 cIMwFANRnJZaAiAQF0ftHmNeZ+MUffjSjxqIEjaE4NScbcSN4IZ5l17Z6OIO6xhW1HdZZWe46BD
 uH00DsY+76BulRx2AQbBzL05zxEKdo9X4tkXWB9WpYCn5kQ7vS5xgOy7acrCrwtuMw2Mh3o+OD2
 hg2aRGoSBFcXas6bwtUn3sYiznmbHF0qmyPPmuwhHkTHS4BLMeZmLbtyeLiXgQuiE45+c0LE7z2
 qcQI+Y+AfyGvGbd4qSp5S6H4vjqJHO/dFm/lqXIVZ5TL/rJVkGQXOlqbHFYYscIIl24i8KLQpR5
 24atIFVu877yejOwI2og4rE6Lk996oyqpD2Uk4d8KsIasW7gqX4D8FKQhU4IwxYVjvo8zMbOgvT
 uFvtIcTsyRrgIx8oL3HIpHRIT+pRG+VPAxpzkun3c1XHlL3IGtv41fevnHGzLBnf/GS1b5d4sD1
 rR7pjVU0Dw17h6iwsPw==
X-Proofpoint-ORIG-GUID: sMAAxpDn6jiCjpOxkV2sCAv34SPzwzQv
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69fa03a0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VMT16xk1LGalzlQIQqAA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050141
X-Rspamd-Queue-Id: C22014CFC0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-60446-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[51];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/2026 7:27 AM, Jeff Johnson wrote:
> On 5/4/2026 6:06 AM, Sumit Garg wrote:
>> @@ -485,9 +485,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>>  			 ATH12K_AHB_UPD_SWID;
>>  		/* Release the firmware */
>> -		ret = qcom_scm_pas_shutdown(pasid);
>> +		ret = qcom_pas_shutdown(pasid);
>>  		if (ret)
>> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
>> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
>>  				   ab_ahb->userpd_id);
> 
> at some point the "ret" param was dropped, and this now generates build warnings
The 'ret' param was dropped by:
8fb66931fe31 ("wifi: ath12k: Enable IPQ5424 WiFi device support")

Not sure if that was on purpose or accidental. Sowmiya?

-       if (ret)
-               ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
-                          ab_ahb->userpd_id, ret);
...
+               if (ret)
+                       ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
+                                  ab_ahb->userpd_id);





