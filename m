Return-Path: <linux-media+bounces-63588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iLy/F1IhIGo+wgAAu9opvQ
	(envelope-from <linux-media+bounces-63588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 14:42:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F02BA637A48
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 14:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YpMls+1x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QsBTyoKt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63588-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63588-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6558E306667F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 12:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F57747DD69;
	Wed,  3 Jun 2026 12:40:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35F347DD53
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 12:40:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490425; cv=none; b=dUeaaLUOmvFnn/HMjuqMqPwpdnEHf2OCy1tufyUzkhE3fdMM0Be8+IatocmpsO7z17oMc/BEoXJDDugW/fVkvXgMys0QBRU9Hz8JJNggdQGxKTCc1HbND/SydsFH1AOV803PWkhWQYKzO+gY1eRNuizy/KIsrhFCi8zCJwE4YMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490425; c=relaxed/simple;
	bh=3ENO8Cnau9XEGZ/1SR8OWRDCQnePaNfIFs/M5B4ZNgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH/p1JxbisB3MV41VmFjHFlafYiZ1aZdh+ooNI3QkezG7h2NlCiV5fy3Se60OVGgT8s304R0dYoPlntGwXEagJNVIHbvp6JWXvUDN/Ls8YZ6k6fhW8J7TjeEjAKQ/Zvm3wJ+Gw9XbK1JUo61iaErtQ6so587SEIHtXXw0LHpm68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpMls+1x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsBTyoKt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CQt4J873774
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 12:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qkFx9tbUxp1w+RmhJqtjjpX/
	0wc2j7aCCAIDgm73PdU=; b=YpMls+1xXmsWASzVOnwTaqExZvCILBcKM31RlFe6
	zmbEgi/Mldf1iuPrXJy+kW5tYZOvXttzv2MrlP66DHOsRAMngxJwYn3vwZ79K9Lk
	Wh8LAwwPhVaH8ykGFaMu2OG5U1h7a2AI+skcqiJcdlj1GmsGAxvFIx2pkQfMy4Jp
	cNGHgvvTpvrpz2/MWh106M9K8UHz7J8r2/meESi2i8QsfSUK3r7NmzDTknElSl/K
	lwS0BVDcQvP5pLOBp1xHrc7lHsYmO3gnUN9dh46e4FN5fIKRmEY+nr30vexIV+wZ
	Wv7DxcmEPJvddi4Jmaq4aV/sQ4flkCUyil8oxyfctSs+xQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9kf37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 12:40:20 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59eba8fe530so6324796e0c.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780490419; x=1781095219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qkFx9tbUxp1w+RmhJqtjjpX/0wc2j7aCCAIDgm73PdU=;
        b=QsBTyoKtqX8cZsTzv0RZv415bzUd/ezjDTtgGvYIEjJF8DN9FvVqXXMEUd0sorLeM2
         gc+/Nwtqnb20rW7iB8SjMhheD9khY+cRCPiPBa/AQ6hs3Z/Xxacu48pksewZI8eGyysb
         FjSpnSqlNMNHZ0q5390czk55LxbY6vn2ckHfHeXt1xmAlRAHnfib2gLZrlUCo6k5xdiE
         0nT4QHZ0Ssf2GunXAGD7sNG9P7eXHv11cw17FeHPt1j1uEr56Tn7XACl/Yad6fFv63nw
         DnZvjxoo5FPl1YXDupmyXp6CwN8GvKQ1D5pjlntQdLvgALqaFtZ5Or5GhYIbLFHuripm
         GAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490419; x=1781095219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkFx9tbUxp1w+RmhJqtjjpX/0wc2j7aCCAIDgm73PdU=;
        b=d9KZrS9lplhV8cs68wVecVGaZuZUJ5IvGyHDxxO9hfYYQfAjbj+TVJ57g7u+/NNIyf
         hLm6C0Y9IJc4DSBo2XjV7Y7y9GD1h8RvonRSvIBedzFiL2g/StFFA6+h7hKcp+hMsPY5
         l6Sh5ZITF8/UwycRgDy96J4DzqCE+RhKYOaAeJhYufbJCShdb1v1/o3aeHPTciEKq0wm
         Z48fJe65Z+RIbm0Db5Uqs2XiOY8S+RHuzoNcBRQrhV1qNBdfZJatMVvb2S2XfRh2GhwD
         zqy/8Cm6W56FHkl0p1Eiz6Nfx3BkwXwHbCmbr3kRQ20NASeTd2XmDzmCEyDJkEu8YOsk
         6DVg==
X-Forwarded-Encrypted: i=1; AFNElJ8WI5DZ8zU5b7yKoY9XyK11nviqmW7SlIGf7OD7fhMRrNewCYXBLB51Uyhvk4z1ckMguzswbojpaJnXhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwpbj5a3/pXK3cXjt9x/c+UXk6oEDKqGz4/6EkdurppqxnvGGk
	UjHBSnnzVqWq3QLCV1Xlb7jXxybcVcos/kpA9MSSK2w23XSpKpt6Wfx04yccq6V1f1KlAOfpr3y
	tWeYDtmK09MgB528uCR9z75yk9HU45wKhBCZA9vdRZre8dKYNJFfTjGWFBZ1i6RgfjQ==
X-Gm-Gg: Acq92OGvkoWlxYSXa1OIJgns7fPh2OfQIROKH3iNsoTA94QgP1qeHzqw/VOHttcQ1t2
	xwX+4S4f25MiIic+UEph17FwXFrI62WXfvuO2QX5xIrcQG29londCmCtCaEJHDNc7YQIiVUgzoU
	f5PmT1ObpXc+bW8KjwKXZaVKEskF62FuGqgNXcfN+/r2f2w4ggUcwDw7xxVSMFGryI8byNINAzB
	3+YAhwxAVE7xIhZGsBzxzre01Dh7RC60NnUdNVqfRdQD47PSkod1DJ42cmYI5Mo4+zro6iFRNnN
	/LQOlGn/zIqZoKkFKRC9dRKgXCIpBcmufpG6Jvtg+iRKGt8mnrrBs0Rq7UN9PxGydF3+AtYAboM
	zOsfVVQqaL6WEz1kWXF6YjtMEKMH5N8LcMXTR7aI2hnlimqrXBYCcr7SzaRA8XPKU0fZFJtITqv
	yIIii1SLPHjDWTz7sbqG5ffVfwPGNSh7x3DR/NHFNPYuo8yg==
X-Received: by 2002:a05:6123:110:b0:575:178f:62d2 with SMTP id 71dfb90a1353d-5a6e97b1706mr1765037e0c.14.1780490419107;
        Wed, 03 Jun 2026 05:40:19 -0700 (PDT)
X-Received: by 2002:a05:6123:110:b0:575:178f:62d2 with SMTP id 71dfb90a1353d-5a6e97b1706mr1765016e0c.14.1780490418569;
        Wed, 03 Jun 2026 05:40:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b9c4sm625939e87.48.2026.06.03.05.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:40:17 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:40:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
X-Proofpoint-GUID: U-9LdvnOqBolYoJGICN-p6_d0AoQ9g6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyMCBTYWx0ZWRfX23lHCg3lpO6G
 QXiCqwVOxf+lfKcrv56LQeOioeFpnwrRVP69McbIx1etwVgJSiNNJ3AmJUkn8alykxWE1barpQB
 9XV+tdO0FBcxApciJJtwPfv3x/YprM/nrdbIC9PGJQKLGzBbCo+Nh8+gVRPHOUCrh75pHVIQpp4
 LDSzXFoyUQsdaU6AMYYup0xVCLPnRRLiOzNc/vfngj8k7EunGNkrSYL2NsZudtI12GRhununyt/
 J4399LMRrP0i+xl58qtX2Xz3l5pk92KHf2MpV7Y0XPXTh620G+2aLk5ZYWeQ9RYKZMQRV60lo8j
 XpUMsnpyLvQmqoFkMUAlxMc0l46tRY3iT1ZubgJlEqpD0l3fCcYZ8CqdciUkzIRR8G0KjkNp8vy
 JIuhXhuTKrpWy6VoX+X/XI27aBaumJh8GGqHtDt3tREynWihpPElDJ7iCxo1HM8i89nouSoEGf+
 Zb0MzmpdQd1zQ7ed/kA==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a2020b4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=7klWIbz71j6PMBmcNRIA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: U-9LdvnOqBolYoJGICN-p6_d0AoQ9g6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63588-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[i5tsg4uzpuwc:server fail,oss.qualcomm.com:server fail,tor.lore.kernel.org:server fail,vger.kernel.org:server fail,qualcomm.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,i5tsg4uzpuwc:mid,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F02BA637A48

On Wed, Jun 03, 2026 at 01:22:11PM +0100, Bryan O'Donoghue wrote:
> On 03/06/2026 13:10, Dmitry Baryshkov wrote:
> > > Documentation shows clock lane at lane 7.
> > > 
> > > Truthfully it makes no sense that the clock lane would genuinely be locked
> > > to lane 7 but the documentation does seem to suggest it.
> > > 
> > > Yes in fact I agree. clock-lanes can be reintroduced if someone can show
> > > hardware that supports/depends on it.
> > Konrad and I checked, Hamoa supports using other lanes as a clock lane.
> 
> Are you sure about that ?

Yes.

> 
> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
> CLK_LN of some description.

Split configurations explicitly use other lanes for clocks. E.g. check
the RB5 Navigation schematics, CAM0B connector.


-- 
With best wishes
Dmitry

