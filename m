Return-Path: <linux-media+bounces-64947-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oy69M1+UMGq8UgUAu9opvQ
	(envelope-from <linux-media+bounces-64947-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:10:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C168AD28
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:10:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kVVHKKIB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DDR11j0E;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64947-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64947-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5BB0319D565
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCC91DFFB;
	Tue, 16 Jun 2026 00:05:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B09A27707
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568311; cv=none; b=c0D96KTDT5WETny0DipQEc2KreOUKKZw+BBMyJNzC9z6oHiB+XvsGyAg6ath+bQE43yOX/FMiK42NarX6ScR3GFLJCqiqw1aFuIzzGBWyhuQW+GbI9vxzgG7lWYKn09K7ghBGozidi2HjeaK2uPfwJB+iDB/NCd5zdvI2nFTvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568311; c=relaxed/simple;
	bh=mCQIn5vpu80BJVHa96rLCLr73oxORhR3/iJH4OsVEgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPh4OEgBjpI5iLkIHUYAciYO3TU51Nt3NgJXKcd3V2nlL2C8o7VHhznL3m8BHfoGhPhjDypJy3AAfVbyfmfgua52+t6N7NQMDI8MPo6KUr8sjT4KiNHh0jdm+ZNDsfhvorQa+YwqI+ZckdnQamJ9jEZeUmJgMfprfvcenHE+GtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVVHKKIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDR11j0E; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxJiL781720
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9Vw5jDigYiQesIzmMLfKp1iVpSNlFZ/ib37vSw5XRE=; b=kVVHKKIBlqRiqOI6
	RYRM6WOdsRb/1ZKIMm1dV5AvVm+pqXOSQFbvQbzijXLeNDYw23Ce5Z876HJRCZGQ
	19J8c6Ba/A5kwUrL7vE6234Q2rDExxsQbaDgzqnd7SEKIlN4i2mUqA/snG83ZdEx
	bvWNLV3R0ghn24F3O0jYNtvF19notebyDJhrRQk/BGVjsnAtRpm78zXqQvtuABrR
	MjcIMEFLWBtiaUyGrva2/m0pBzUWAE2lvZjL5GmIlCHrIr6Pv6GJt6KkQ0SdGfmA
	pQwE6QrrN1HKBv9bsS/vUxHZeyzRjwGBh7e6z35JR0zjzXyAPqHb9T9E6exiGicf
	5xrdVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjuqj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9159c4b210aso640360085a.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568309; x=1782173109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9Vw5jDigYiQesIzmMLfKp1iVpSNlFZ/ib37vSw5XRE=;
        b=DDR11j0Eiv9EXyOPe3JZBx10IWyKlFcoTOllXUaV7eX6HGJjUINMU1xkqIIvZL6vwh
         9l6v94XoK35rq1UMc+HkE4NzzDusOHhtI32w5e9fBYKOp6KNUSN0zc8Sn7RxvAeZ7LaS
         RktWYJLr//wkILEw3CNuiQbkBCErEQDrbCqiYeyIxMs8+8hXCTnskDKNfywpSYBMWDOm
         ZN6NwwRXWAHJka87x2izntCmTrxDJU2FEWRvk+ZEMobHGoEimgaGDNtpNBNodwDUc/h0
         Tez0pFIKZ3+70Nqi6xOpxhxgSCys2jrGdef/KEFbT8F2LKHXR4gOdsQhg9zCob8hifu4
         VVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568309; x=1782173109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9Vw5jDigYiQesIzmMLfKp1iVpSNlFZ/ib37vSw5XRE=;
        b=QcoO6o0dTQ9HoDA2IsG4B1Ja4PhlHDO/NbNN8Hi4aQlv0A6pkHwAgHdCEvFpWaO9fd
         Am90xKAB2TKPXAhzaxXzOz5EmUpzhs8bhfbWzcXTYbOpi1I0Q3rA+ygtPRfp68MyQwUR
         N/GwdfGvJmGtOnt+FpR2Qgd1G7AKp/3DPDGxO+q+mGOJgA0zRjmKSce5XXo/cCC2qKWF
         Tb/kbztMUcHvCDxTtFUG2I3AYmpzDg7fAIewXWd5X7eV1j6imNI/y5XlCARVOi9pO5p1
         oouMxwCMmWGIwJGzt+DjAKUjKTQ2j3VS5WTENrxFt++UhGG/XPXbFt5LjGMsvgpn6H35
         DLug==
X-Gm-Message-State: AOJu0Yz9zHw6TTqkcQ5qQOJljI4RbCziSFgPRrD64nu4RzjbHmEHCiGF
	UJuUQqd1EY5XAKb95eT1jm0RD+uzQIE0GcCWiUsKl8ffatLqnuhTIOjoVIRtV2eJBWBnxEUe+yQ
	MoUTVNNj+GP3DPhqVjOdu1/2+bTcqZ9LVwACM0cpZi7uNffK3K6+QS2yvjLwhHuMExA==
X-Gm-Gg: Acq92OE999aGk9JdEY3LcPkNP0wpys1up2z7n5Vjbr7rqlKLp/0DOTDkGtnkmeHUHvN
	YMHgAFpElm2odpEexcf6fciQYqnr5bad3+5a+FKA1Duq9UMvQbQ6BdTHncyyNHAEWehYezhp7q3
	rhhYiX2LLnCjuxWxWKlXU46xY+mCZsjZoEOx4y6ylojdSLC+wlVQuPrNFosLQ2nrbAeMjpSf0VO
	/l5oJaupcNVUsp3N7ROxR2uh8LGgVPYqLVkbnpWoiNt3lpIW35ejHaA2pbjNydHltNl4d1IoQc7
	Z1pfomFMawcVLvNlZfH07ttdO/QRaJSQdfj4zLUfok/zNu2aZ5/Vzmig4JnNIp2lGFA7eSoaYhB
	Tk/SFNKLk0zVwWuEC/BCnuIjQz0FUod+VCIf/GVMVKvpfLHP9XNQOTZqckAX1YJZ1utW7rlTDGX
	SglXDgMapRbFoLTot6bMPn3R2go2vKh4Wfq48=
X-Received: by 2002:a05:620a:3713:b0:914:bfca:7d12 with SMTP id af79cd13be357-91c2c4d3767mr244267185a.5.1781568308597;
        Mon, 15 Jun 2026 17:05:08 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:914:bfca:7d12 with SMTP id af79cd13be357-91c2c4d3767mr244241185a.5.1781568306028;
        Mon, 15 Jun 2026 17:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:34 +0300
Subject: [PATCH v5 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-7-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IXfRr4SN9wgRvhhg/OBkArNivfd6O7byWgxU1yn0ucU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMPmA83bxVL6wf8y1MoufXvyjnlRae/r4G2R
 eFpzI3NoY2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDwAKCRCLPIo+Aiko
 1ZPLB/4iBMSCAfzR3DtxcOgwupMevTdGwco5tBcyuCwNLpwaDxjladnmDoOdPzLlXK5auWCU6M1
 Nw0+NYurohaeytfvLcuDN8Zx0AqYC1gsAEh/ZyD6o+ehLAkkr6kov3Uri+1CbBsLR8V/kx126v/
 pR25PIrt2EmL73evysQLnkBKbD+wCeDnhGIsuVaO2+6DSlj0ap7CNQKEMTPK3ALrZryoWgxEltk
 ndGZteuCpw8fWrWRWyI0DyqvcetPq7rarKuQxy3IFEwGId4KVJrjOKcwLJ8jLdJUU2EmQ8aNJa8
 ip4iL72A0UntcZ9CT46r7emH05MTx6NsP5akSSy/L2Cb6h5a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX8geOQed8AOBu
 GYoIGMUdxdm2yTjne9yp6s7jTgOOgF59tDLkxC69RVYRtwzEG9+KULuYLydYc1GU8IqXwV2MQ6f
 feuwLbN1Flo/tx1ue9ct2yKevYeaTWN47Vy9g3nceQQ3irdcyrcmbp9ZOZEHNodhY2tXBUnQ1eH
 0okBwUKRonLJJsC5g/BUsg6vneZPsasTbR1QyzIqaGnHix8qOrEfcT03rLP7G7dfB3uTWXO9LwY
 3/+NHqhwwJRbcVg1KR0FVhegrTrLHdZ0dG3O0hXU+NxGfjMrEEB4nNcLXGtrD7sPm/QhLSp7WKR
 Ry320VKHc6FkibZU7/YSNBixRyriZLG/7Xlj4akydIUkT10vQeEnjM5iGEAKCgXbwu0WWTtbhhD
 MyeFY/DdWf/8BJChVSZp8LpuOX1zFl3euBdNsVd7svfQQHBFQzdr7BLore7t3bXJnag+CrJmKo7
 cBjxEhd0tH4kOcF7xFQ==
X-Proofpoint-ORIG-GUID: yCw1iCV9hWWIwoNahDl7yBZ4i6rlyaIv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX1x73rJ5IZaLo
 3LfXAQDRoKZ8Wi76DYWagTeEebFt+XNBCcj/IMhzXO9WPEFc1MN35AkbHMcwP5QBC0fhXmQ/GbP
 B0dcn8lt2wcJLB18weZYxrMjXOmrpvo=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a309335 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jsq_lj1EPjN6R-bUmboA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yCw1iCV9hWWIwoNahDl7yBZ4i6rlyaIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64947-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E5C168AD28

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 5 +++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 81fcb2854772..accc1627defd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -316,6 +316,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index eeef453c583f..e2fddc29abc7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 6cde94d86408..73bc80a6de50 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -250,6 +254,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


