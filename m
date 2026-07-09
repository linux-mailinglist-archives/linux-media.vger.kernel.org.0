Return-Path: <linux-media+bounces-67163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 41LdEi2nT2onlwIAu9opvQ
	(envelope-from <linux-media+bounces-67163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:50:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8276731C69
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:50:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nupLAG3n;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ZROn4/XP";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67163-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67163-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEB5730FCFD7
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A522E7388;
	Thu,  9 Jul 2026 13:42:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E62EBBAF
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604527; cv=none; b=lt5jNzeu5z/zgX+s9KsjupUmsVIxwUW32p8lV+P+Dzj71gGjDnkh91qdwOjk+kv5KdtYwxJqFLKD9C/nc3ifh6SPV7dA6IiwOJTnEuA8wIQPArDnHz/CGEzsCRuAJnf1rHi5+w8LgOWo5BX8mW2qU8gl3WTSsbmfziQYKJKQU+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604527; c=relaxed/simple;
	bh=VbS0IMuxzMNkxQfP89vNdvWv2LpSimeJUB2QWr/93to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWy0RLtZRW8YhvzG4cdoEUYgG+ss0obhvuoqv8W9YP4z3kQZHdIUB04tEEBWGfxd8PN0iBjloOJVdlMz5xPcfMe6ufLvYLCkXttHAHStbFdAsNnY5AA9trMD4ey5WvgTGC4jGJ+PdJu3Z8zDAQ9donVEvrSGpi98BCsIfCXCvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nupLAG3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZROn4/XP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNT731667815
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziVzmpUb8mAQuQF/Qq/UTLKCkjYYCciGe6FAgP4HxQ8=; b=nupLAG3nGb8ymkfw
	DWu3pw47ta8pV69eW70R9xBZChRyWxKCe4fDk7BCB19hPdTV1KQ7/tryTShyvNsc
	UnLy3DZaIUybPlQzV9919vb3AotPFDJLR9Xt+fybYkihSH9k02TQLmCNkyQNIygH
	F2DsXdF+DLnhye/voMM0kU3jLtqNumH3CSgov49MkmbLcvk6+bkMAMLYmnDen91T
	O5cNsDNCc2R6yiTB+3+/04lZMgLDICnY8srcfsJzO4nPh1f0cSE9BQRP53N3eIko
	YqZBOFqIMZeXGUHxPYhSxz1GqDgSeCDA+9CkX4/nnLGGsnzc5o8LtimLaPe2vsON
	BBJOtA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6m1ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-970cc72ccd4so399213241.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604523; x=1784209323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziVzmpUb8mAQuQF/Qq/UTLKCkjYYCciGe6FAgP4HxQ8=;
        b=ZROn4/XPUa26WCCQu9e1OEDGwAKteMeC58ynsqEqkxpUP/V3MtdpIGh10QJwJmKitc
         Ij0EOfh8/SFQWv9EdFiOJ5SlDBfLYJzl4P3zIWonquqdDQLrGf/kATXKVmZSBUNfyx4X
         eEWY4bWwxeROWsY+evFoMD7v2XEt5qan6WzbkzEosadmANEr265CxSGwUF+QWp/mHllM
         LKa+CQvIRKzYgpVdnAppZOqvUfJwpYN1r572ydtJa+Xqjw9/dI7ecZv22/yq/hXGbUHI
         KR/VFpPulQKR8KNw7WjnMZNXyypvnqLGoqr2BZboGlse3FlfqmMIsmqnJHe1CjSi4CsE
         WGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604523; x=1784209323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziVzmpUb8mAQuQF/Qq/UTLKCkjYYCciGe6FAgP4HxQ8=;
        b=HMNaIZVZcAEoGyBPQOMS1fTjCX1AZcuKn1QKVNCxH2MOL62PKWKtpHHYc39sMbbGtc
         adHnc0bmfsVQhZE52b36xwySQ8WSZyXBUlatJdSqbinYQheHhFpp1spVuwGQjgT165Kz
         eJFSFefBOojP/hbdBhXGKJtpRhwYA+euzaITBV1mngs5UxDVmwfeKMpnnGEajYSHiPxp
         m2ecy03s+DZwfJ/b8accO5/KXawnKeWEW5DRgqCJ3kjxpRCrTLS1BWcsfBT7zHYhWOpU
         SOAgruGhM0LwtCuvIOvzFrTUrX65oc/TlmJqsf3kI+lVwJuSsRNsMj59JYOGdPfL2Q/d
         k7tQ==
X-Gm-Message-State: AOJu0Yy/i195EasMvK0SERCoR0ubLsl+W6m1VkUYNsbePtXpktuX3QDK
	uyk7H8eu0KB3fv7cjIXkmUKIDIFdADFvG0ZpIwfHrRT026bqyEjxRCrmS8gzCcPw+A+ndAFS1IH
	rnsB5ExRgbwtv426aFuGTooJqm9PFA+lXepi7M3uDKRwSYC+fhx1cqkHZ5sm2oPLxUQ==
X-Gm-Gg: AfdE7ckOid5O5kkhF9BEX50wQt2uuTW7+B8+nqC4CgLiXvS6kKo22ZXmK2S5Dstn735
	R0pFhBgBN2pxNCZvr+CjXD1pr+YTsF8iaYbzH8j7/sx4j2MlRYRaNzcJTh81KSxpqFgvzwDzmzU
	i+QLwT7W1TiehsrzA3MEXWK+hQH4rQ1fDzlSyoUV8qpguP6J2GGbVbYXpW6+CSWYyfheiQKIzo/
	5u0YfLVOYRxVl9mCOYv84mr3fP4JROqw/XmQu2nF6PFphTtdvtALgbhfHGl995EbDe0m+HRXgWX
	1DCkCi1iLBH2IAzaoC+7DrCTtwIsNFOeCvXXPcp0Sl8f12x3nsAtWaoK8uv+A43FmrP5oRJuQwC
	/uoyxJT1uAljc9Wjj363OAmoWTrIBBjZsQOv+LBSWWaizuYrPjHHkAD1WzQPYerslZPTxsXp89V
	nMjXs5kJWN/n6CnQVEuH4GEcdw
X-Received: by 2002:a05:6102:604c:b0:744:e453:b1fb with SMTP id ada2fe7eead31-744f65e68d7mr2040184137.9.1783604523022;
        Thu, 09 Jul 2026 06:42:03 -0700 (PDT)
X-Received: by 2002:a05:6102:604c:b0:744:e453:b1fb with SMTP id ada2fe7eead31-744f65e68d7mr2040140137.9.1783604522429;
        Thu, 09 Jul 2026 06:42:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:52 +0300
Subject: [PATCH v7 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14562;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9o5uCGYveOje3riltY5os8i9OFE4eSGgRv+dCemUTMM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6Uj1PNYh1zYg4yEGLq8fb/WNv1gB/q455dIL
 E5ng7XwbwqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lIwAKCRCLPIo+Aiko
 1WIHB/4iBn+NZ8kJjVbxzV3Hb774yCoGKEakG6lo3MpPJvoKsbizcreXdXw4RUd2CA6X5Z49Qd7
 WGefB3szz+Dh1RxXkEmnj2IVGNq+lZgjc8MP5gLkr6jsboEQcfq4u8Ov/IXJoYVJu2D85Q0nhO3
 ikeJa2/2tLDw+l+HxGplxm3PDRrf6PSEFwkfv9a0rJUvrSfxTl7yDqZ40VJNb8PeqDwBJsHjamI
 EXbdcMwEG/mLPYoz5d3NbwFqB9gYhOZdpBjITZjjEtWkE4tjz+Ph9Vdp5o/bzJnFMM3pvEGFvSQ
 rE8SRXi/PrEx5mMR9XUunzeHoR4fbelPHP99/Npw6ZJpB3Jl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX8yF7GBlD07+x
 HP5VHmmfWVXUtPYM+/NdgCPWzAaSTDVH2vw26daLybwIFfNBIV18M4b9pYC+q8seZ0/vh9q4dUh
 GvALfHT4GA2WpuMG2F7ChoR7ulQ1wOY=
X-Proofpoint-GUID: 8n0xMdxBLPXj2mih9ZSBKU-d5E5Jo3GT
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fa52b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bvaAtN3xl-eaVbRrWUUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 8n0xMdxBLPXj2mih9ZSBKU-d5E5Jo3GT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX5Hcx05+eUVMq
 VHr+A+BtvK1ri3CNTvQfehw3T7AW5a9uF5Nznlktwq2kDtqKH6BJr2pmajpuBFrJkGb8MKPIMt9
 r5VkN9Rb7WbzElrzQiiv62XDi4bWxielsH8jr3YUATP+XyEzhA3LuC74YiaED+YbCe1vCk6Codq
 FBvJgAnzhyL1znIdouyFWYCeXWC/iIK9L0owiuQFyE4Wx7rU8eJ0bh6sjmGaEjHixFSdw+4bik9
 UtQHe5zAecfchXpVigASN7WLrgIdnfO3iXd56dzOhUPda7yhT2CK3dVmsSi2G5jC+oGCtkTSo7u
 5COVL928kyb8FevbAJCzWMxSgdWARQ8z+jJZ/ZJr9Q3QGePw4tmPtWMbUkSlWMnNSymHgrWllp5
 Jop1adhNevzhMFHCv1+xLt0L+TEiLvxEM5hLZBrE1uIN9U0+6iJREKZiJL2X9a+I7x9NQS+CEix
 Y2pArlcq/iar36D9K6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67163-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8276731C69

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 default : If no DT override exists, select the Gen2 firmware
   descriptor when present and attempt to load the corresponding
   firmware image.
3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
   descriptor is available, retry with the Gen1 firmware image.

When a platform provides both Gen1 and Gen2 firmware descriptors and the
firmware is loaded via a DT override, the driver detects the
firmware generation at runtime before authentication by inspecting
the firmware data. The firmware is classified as Gen2 if the
QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
"video-firmware.N.M" format with N >= 2.

If a Gen1 firmware image is detected in this case, the driver switches
to the Gen1 firmware descriptor and associated platform data so that
the correct HFI implementation is used.

This change makes firmware generation detection platform‑agnostic,
preserves DT overrides, prefers newer Gen2 firmware when available,
and maintains compatibility with platforms that only support Gen1.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |   2 +
 drivers/media/platform/qcom/iris/iris_firmware.c   | 146 ++++++++++++++++++---
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 7 files changed, 147 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..6dbe18be5b49 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -6,6 +6,7 @@
 #include <linux/pm_runtime.h>
 
 #include "iris_core.h"
+#include "iris_ctrls.h"
 #include "iris_firmware.h"
 #include "iris_state.h"
 #include "iris_vpu_common.h"
@@ -79,6 +80,7 @@ int iris_core_init(struct iris_core *core)
 		goto error_unload_fw;
 
 	core->iris_firmware_data->init_hfi_ops(core);
+	iris_session_init_caps(core);
 
 	ret = iris_hfi_core_init(core);
 	if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..a3aa41aa1e66 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -16,20 +16,138 @@
 
 #define MAX_FIRMWARE_NAME_SIZE	128
 
-static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+/* Detect Gen2 firmware by scanning the blob for:
+ *   QC_IMAGE_VERSION_STRING=<version>
+ * and then checking:
+ *   - version starts with "vfw", OR
+ *   - version matches "video-firmware.N.M" with N >= 2
+ */
+
+static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
+{
+	static const char *marker = "QC_IMAGE_VERSION_STRING=";
+	const size_t mlen = strlen(marker);
+	static const char *vfw = "vfw";
+	const size_t vfwlen = strlen(vfw);
+	static const char *vf = "video-firmware.";
+	const size_t vflen = strlen(vf);
+
+	for (size_t i = 0; i + mlen < size; i++) {
+		const char *found;
+
+		if (memcmp(data + i, marker, mlen))
+			continue;
+
+		found = data + i + mlen;
+		size -= i + mlen;
+
+		/* vfw => Gen2 */
+		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
+			return true;
+
+		if (size < vflen ||
+		    memcmp(found, vf, vflen))
+			return false;
+
+		found += vflen;
+		size -= vflen;
+
+		/*
+		 * video-firmware.1.x is Gen1.
+		 * video-firmware.2.x and video-firmware.10.x are Gen2.
+		 */
+		return size >= 2 &&
+			(*found >= '2' || (*found == '1' && found[1] != '.'));
+	}
+
+	return false;
+}
+
+static const struct firmware *iris_detect_firmware(struct iris_core *core,
+						   const char **fw_name)
+{
+	const struct iris_firmware_desc *desc;
+	const struct firmware *firmware;
+	bool has_both_gens;
+	int ret;
+
+	*fw_name = NULL;
+	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
+
+	/*
+	 * A platform may support both Gen1 and Gen2 firmware; which one is used
+	 * depends on the firmware image installed on the system, not on the
+	 * hardware. That installed image does not change while the device is
+	 * bound, so detect the generation only once and reuse the chosen
+	 * descriptor on later core bring-ups (e.g. after a system error
+	 * recovery). Besides avoiding the redundant probing, this ensures
+	 * core->iris_firmware_desc and iris_firmware_data are published exactly
+	 * once, before any session exists, so the lockless readers in the ioctl
+	 * paths never observe a reassignment.
+	 */
+	if (core->iris_firmware_desc) {
+		if (ret)
+			*fw_name = core->iris_firmware_desc->fwname;
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+		return ret ? ERR_PTR(ret) : firmware;
+	}
+
+	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
+		core->iris_platform_data->firmware_desc_gen1;
+
+	if (core->iris_platform_data->firmware_desc_gen2)
+		desc = core->iris_platform_data->firmware_desc_gen2;
+	else if (core->iris_platform_data->firmware_desc_gen1)
+		desc = core->iris_platform_data->firmware_desc_gen1;
+	else
+		return ERR_PTR(-EINVAL);
+
+	if (ret) {
+		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
+		*fw_name = desc->fwname;
+		if (has_both_gens)
+			ret = firmware_request_nowarn(&firmware, *fw_name, core->dev);
+		else
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret && has_both_gens) {
+			desc = core->iris_platform_data->firmware_desc_gen1;
+			*fw_name = desc->fwname;
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		}
+		if (ret)
+			return ERR_PTR(ret);
+	} else {
+		/* firmware-name given: load it and detect its generation. */
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret)
+			return ERR_PTR(ret);
+
+		if (has_both_gens &&
+		    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
+			dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
+			desc = core->iris_platform_data->firmware_desc_gen1;
+		}
+	}
+
+	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
+	core->iris_firmware_data = desc->firmware_data;
+	core->iris_firmware_desc = desc;
+
+	return firmware;
+}
+
+static int iris_load_fw_to_memory(struct iris_core *core)
 {
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
 	phys_addr_t mem_phys;
+	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
 	void *mem_virt;
 	int ret;
 
-	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
-		return -EINVAL;
-
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 	if (ret)
 		return ret;
@@ -37,9 +155,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
-	if (ret)
-		return ret;
+	firmware = iris_detect_firmware(core, &fw_name);
+	if (IS_ERR(firmware))
+		return PTR_ERR(firmware);
 
 	fw_size = qcom_mdt_get_size(firmware);
 	if (fw_size < 0 || res_size < (size_t)fw_size) {
@@ -66,18 +184,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
-	const char *fwpath = NULL;
 	int i, ret;
 
-	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
-					    &fwpath);
-	if (ret)
-		fwpath = core->iris_firmware_desc->fwname;
-
-	ret = iris_load_fw_to_memory(core, fwpath);
+	ret = iris_load_fw_to_memory(core);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		dev_err(core->dev, "firmware download failed %d\n", ret);
+		return ret;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -99,7 +211,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..55a4fa356985 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -289,11 +289,7 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	/*
-	 * XXX: replace with gen1 / gen2 pointers once we have platforms
-	 * supporting both firmware kinds.
-	 */
-	const struct iris_firmware_desc *firmware_desc;
+	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..961dce2e6aa9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc5579..74626b35d9cb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
  * - different num_vpp_pipe
  */
 const struct iris_platform_data x1p42100_data = {
-	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a2782..7fe31136df21 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
-	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9b..33edbc5cab8f 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"

-- 
2.47.3


