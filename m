Return-Path: <linux-media+bounces-55839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF+wCu5ut2m0RAEAu9opvQ
	(envelope-from <linux-media+bounces-55839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:46:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 835DF2943B0
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A06AE30131F3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936E831A06C;
	Mon, 16 Mar 2026 02:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JW4USMHU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGjPWsou"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29763191C8
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773629157; cv=none; b=DPtcdSBLOgemmec8b65NQQPZovd0mf6Vc+NOUGxuLUWkrxanFoLgdyqrpWqEpvnjAO5PW5obSDrl088+6bHAaoF0PIB765Xj7zQ2xYXU5a90ICHAOLLAzvJKaL57sjmUYfUQ0yAzQBoZKPvIRJtrKHIrYtLdpNqEWS0Y05gRMDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773629157; c=relaxed/simple;
	bh=j4O6GfpK3wRh9khIuTXwpzU81N0VQVl9Fzxoq+AV7qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n31VckMl33s5519X1Nyats3W3ybgyloXImAdQP5FixgHFWgS9dKY4tuE6vXZJoofdndBrag1fLdNNzU4vyI+g+h+z6vLRRna6DtAr0hHHAAYuc2xAQ0SBNu2IHZmU4a52rLvtvcExcDiuV6bh5Pw78aHGgvUdqArFEbS77pjinU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JW4USMHU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGjPWsou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FLF2QB4159324
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8QMp6hJBWXNa+7dNP5uMcXtE
	s6BjdPBEVpsBPxW9nRE=; b=JW4USMHUnPTpvTa7BUbSik99GXc+9c4/tZhCqSMZ
	ilv2Rg8B6Rmjx6806EV2BeVtMS15bTiRGBBZNInLsqd7LUqpqqtwvkXan5rU8JwO
	RQ82AxSsQ7/wPRVZEk5yQ8kzFIk6kIfdH6oFgd0nDSmcMD9VH5lYUREJZZcEkO90
	4tRjfSXTQtInTCNNwaXgVH+KHD89mZqQfbagTLrwkOPG1VYhr41BqOv0uMkrWAx7
	H2rjQ8dfNdFsTQ3a1lQcus9bvargngrxkXTBszNXByVUKc7amGRTPI2nx2/aoH/J
	U6VBX4WLbe9PeGb6z96V9xnqYxOLK8hsSIEYu7eBjp288Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027bwxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:45:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd722c1a69so2551724485a.0
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 19:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773629154; x=1774233954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8QMp6hJBWXNa+7dNP5uMcXtEs6BjdPBEVpsBPxW9nRE=;
        b=kGjPWsouuJErZoInBTlqerRWhC36aSXvLCmwUuTHy983iUOY2k18qNJ2FYg5Jb5SFh
         K8mW8RvF4Y+mmVfnk3fm1rvYVPJSjRv3JjyJovH3kXwFfaAC6Vj/zJgMo7JseL7CTpu1
         5vjwH4u/uq74W2tdX32z+KDi+21OmWUAUWhQZZTWTI5W/7slITPO3sqkR4y5W2AbSYPt
         Je4kpIAirxipVb8xQnxbaStfiNInxW8TxqEocDF13Cwt2xgzAUiNGgqG1+RsCpdrwFbb
         LxFpzt5t0bluJKcXbbPCfa5prguwqm7tJ+umSShYzllIQ9Dpj4tRdL5bjVKDICyg8/8M
         We6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773629154; x=1774233954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QMp6hJBWXNa+7dNP5uMcXtEs6BjdPBEVpsBPxW9nRE=;
        b=Dsh03A4a+CHJ3T/b5zFrUbi++01KNNXYEGnEv3RHXJ2MRYZHG2Urrz2eeqXa7s7xKx
         4BkDNEFm4AcEQetiHQ473nIV6WSvgzA54x5FIcbK/JSgXoNiOybOL+PXZbMk+CVDvGiS
         c9ex7Kj+qyLTDiIMVm3nQf0MR8t18GPRQFsn+ipIgtKrLsUyIYwNRYVLQGMNkPXuH6Io
         6t+fE0o5NHjTLYK4nH5YUu9gylGWqYcXmdLLg8/roS7inEq5chH7iBZKGgbhOmdIBnx2
         931YVnsV7uw+mOypQPHrXGBunJLhsVTp5w3wMxVustlbG82wS5dKKE0xik8lMVJZmVbm
         KCuA==
X-Forwarded-Encrypted: i=1; AJvYcCV8yRE2Hr41UmJ7FP4YOIJy6+1qeT2B8Ueog+RqtZXkJAA2sn07a7BqJcGxWa0dfHoTl/jPWvmyZjMiaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAwkDORHpGdi1+SlxUGZvUdc+WMksGTa3H4VflkyuB3M8AE09w
	Z5cfGRLbUClnoOtrVYg6V8YGfLtu++j+Kk4nZRYaxQMcvZ/eaZfRQUBxAZwRr7RewgkYa7oJpFn
	okT4qM2T+GnkwZvAJPck1Z6OnGRX8W550qGqMhiOWuslsNd0jNyZUg+cU+KqvpCeHIg==
X-Gm-Gg: ATEYQzxcDdjF/zbXklIK3SF5GCK7d/2JvXUJzctsjTE30bWpUHa39Cc8Ct4b28duY19
	UGtlAfLZvjjZs3GJQBuZtllRcmWBojvI3rlVFNLNciUwqpiOwtCFusOJt/rXiVl+yEqeovDDdQn
	rTprSBwZu5+WqI0M97tzds5bEL4NUaujfuDZTaNk3dwBU0OmS0lLEoX6JzVH2MIU1blXXtKUuQI
	0UrJ6RRbAf2sxQgKxiqj2TDTGE/kg0RfsKfQ81XcoO0bH0CcwOcId3VH+sIBjHKpxcdBg8xzjEZ
	2f86Qba7ps0gNqzJhH897UOcjxSQsbqipQe9W7mXpvhbVUGMiWiGOzywvqcpHtDydSQCWM/2AvG
	z3umn+SX1UL6ZhzdXG0ImsskoaI2DSUMrF3Y5BuQDGSrz6rSO14BYiUP/05xM/3py5i9ycsbXRX
	L+uttiO6/V/Y/2ZRsilxEXOh04aWulbktEvBs=
X-Received: by 2002:a05:620a:472b:b0:8cd:827a:2ab9 with SMTP id af79cd13be357-8cdb5a5bf8fmr1586622085a.21.1773629154222;
        Sun, 15 Mar 2026 19:45:54 -0700 (PDT)
X-Received: by 2002:a05:620a:472b:b0:8cd:827a:2ab9 with SMTP id af79cd13be357-8cdb5a5bf8fmr1586619885a.21.1773629153782;
        Sun, 15 Mar 2026 19:45:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33bf1sm3158988e87.1.2026.03.15.19.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:45:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:45:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <wjsnwdyoptrfbmdkqlcepzekfbccv6vsfop5wm37m56rtlevfk@jkbievryoo2j>
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <c59f621f-23a0-4c60-b8e3-5a9082c816e2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c59f621f-23a0-4c60-b8e3-5a9082c816e2@linaro.org>
X-Proofpoint-GUID: hUMaR7FtpoCZPNukYhfQiE3Oy02hH3mS
X-Proofpoint-ORIG-GUID: hUMaR7FtpoCZPNukYhfQiE3Oy02hH3mS
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b76ee2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=c7rPNOMjApX9GAaFin8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMCBTYWx0ZWRfXzHfFpXxp4lKn
 lj68l9RNZJTugAiOC3y3BFku6UZL4W2SH3/CBAkL4Yl1FNP2ghmvAWvIaoPPqL5lJpVo+uYuAiI
 dpqFJjfUH+suQKUDZ2EXxzHPTTLN7SxHaM7PHCmQxH0tl8ovcAUrJEFIHreNzkTCkz6lS4OcU3/
 dTqQROrcMSfNG6znZLIlgtcCQ8aLmrGSFKMVBhKLw/70qOdkwiqRdLTcmJY/gJHpwSIblL6y4g4
 vMh3FrJJ4j/N7TozJUpQcVLC/sfRWbC6Irq6FkUnUSGtRasob8kY15Y9CAOoVm9FJCz+Ufoy/yY
 AJT57dKe38SiBj9GB2PGvhGBwPUi0u9WIMUliU56nTflVktT/qUlJtQR9BX4bLgIBGc4Hd0DYTP
 N3rhHPc7A29GLUj3Vj2UladxCVWDWbPx3K0GgYEvFpPjlO5bmRmEpafTmkPexRPo/3V4DQAWcjV
 dyEiYJCBXM2PbdmmgLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160020
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55839-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 835DF2943B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 03:58:14AM +0200, Vladimir Zapolskiy wrote:
> On 3/16/26 01:52, Bryan O'Donoghue wrote:
> > Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> > PHY devices.
> > 
> > The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
> > have their own pinouts on the SoC as well as their own individual voltage
> > rails.
> > 
> > The need to model voltage rails on a per-PHY basis leads us to define
> > CSIPHY devices as individual nodes.
> > 
> > Two nice outcomes in terms of schema and DT arise from this change.
> > 
> > 1. The ability to define on a per-PHY basis voltage rails.
> > 2. The ability to require those voltage.
> > 
> > We have had a complete bodge upstream for this where a single set of
> > voltage rail for all CSIPHYs has been buried inside of CAMSS.
> > 
> > Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
> > CAMSS parlance, the CSIPHY devices should be individually modelled.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++++++++++++++
> >   1 file changed, 133 insertions(+)
> > 
> > +
> > +  vdda-0p8-supply:
> > +    description: Phandle to a 0.8V regulator supply to a PHY.
> 
> On Hamoa the CSIPHY supply voltage is 0.88-0.92, so it is 0p9 rather than 0p8.

What is its name in the schematics or in the datasheet?

> 
> > +
> > +  vdda-1p2-supply:
> > +    description: Phandle to 1.2V regulator supply to a PHY.
> > +
-- 
With best wishes
Dmitry

