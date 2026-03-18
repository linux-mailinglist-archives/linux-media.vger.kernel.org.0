Return-Path: <linux-media+bounces-56217-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIUsDxvKumm6bwIAu9opvQ
	(envelope-from <linux-media+bounces-56217-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 16:51:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 908562BEA7D
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 16:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 634CF32CDD6E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 15:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24C43E51F7;
	Wed, 18 Mar 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4i2+/sO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZb8XITI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A2D3DBD49
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847683; cv=none; b=qTG9vC+zL8rYeSSdX0z82Cp6Jbcek/0ZYzAAecQE25vSwchHnOBHsv+UVOKXSpM6lNS2KiVgMMDcYpVH7uZ436OSSwtzqoxkfwQD7Tv3uW0nk+FrGIWSI0/Frqp8Ki2VzeHQ7or+0+LlB+GnSRlOFtsKS8vjHKOErF1ZvX1xLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847683; c=relaxed/simple;
	bh=Cr/iDRTobwk2I183E+eXlJd5AIAsZSRE9UXnOhWu7WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr0+goSF81AgG42XQjre+u8vReJEkiU0elBSrqGQ4sxuPsJsGNv8/8PuxSRNEqZMXf3UlbLoDNDSk0hLcUyftHZYneW11w4Sj04tFc4ceOmnG7alhNn7v+jU7fKlofgtBSpJUCuA2GSEIYnX5jdkgomUFsWldK7AASzsd6hrsn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4i2+/sO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZb8XITI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICBjuW909962
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 15:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuJUlH4doDFzglyADiWfRYiggVG3riSGedoZ0slOE9A=; b=b4i2+/sOyneSXzlI
	SbDcJa6JwI9E58qKdPTugdR+7ZzeeozMq7Ot/lLirMtd85bwB6BXjdXOGpYxH6da
	NCThLMvUFOiqPtWqKcENON6oLOvwk0tl7cmau02J6p1U5ORzh9W/7xso6ko+S+nj
	2HauAjkg5TIg9u9WEiDSk8MKoAYG8nX1zO0bwBeJKwcQJTTATQyq7QcYUB9Ehr4t
	G+HA8CLNWLSMCVnxZ9mBpAklJjbRziGbO3ytQgm/Hpf0JmmIuXwiLpJqmtupDB7i
	A+a/2eMd3Zejj9L/NRG5+liW7UPPgYKlaUWy92iGxEwIgR62Xr6/tONozdqti3U5
	koaoKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyuucgqus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 15:27:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937c5b742so231790271cf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773847678; x=1774452478; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuJUlH4doDFzglyADiWfRYiggVG3riSGedoZ0slOE9A=;
        b=aZb8XITI0wEa7aA9ix0sPjd3Oq6eYBRhB7kOr75jMn00aeFPGXq5aMsVTLX4puI9Fh
         h4WYlo+rtNu+wq6efFa/zLCRcO1ciI1mfKGhvvYxqg/dlVRhnU4LdQmpm/a42uwQDDKh
         wLTfL0Ef3IVgtHRK5s/CSA8Pp9M44n69214VADeqhbE0EkQHsxaGyd0JZzLnFO8yrQNT
         hE3FQIviAyG0ZU9uWoCNm9Hq2yZr2jJsZfNz4uphPUHsqvd4lrxye8sjt5sc1B27f0YB
         nb6Z/phnYRX22eKalI+mhgyjS3+1MJTSZDygcYH6qIv3Hx2Ofi0N3eoLbohHrPVS7X7x
         cPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847678; x=1774452478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuJUlH4doDFzglyADiWfRYiggVG3riSGedoZ0slOE9A=;
        b=O9VSyY7bkib/Eo43VbfujNla3m17x8LQH/khi4uMA3OHhUSfHI0z2tQsM7uEO+msRO
         V51P3+3nubRp3HRl2Qyx+ZJ8vgof8Hp76CDAxy9N7wMgL7EnvB40IYKASi3lDKb93MT7
         ftCbtCKQQx3FCs4we1KDfPIF6UfRzbKdEBbP64Cs9dgrUFEWQuS0Fn9d6EzIhVK2ghTU
         YUAonI+A2OJWsZ64G5jXhqoX6icOWp5qlUAL96IPds3lAcwC+wZEyAxZ/2mWevYO+r12
         aQJatfLjDHa2jAQI4rNP0AYU83fpubh9SH1fFGhyny16BoxID4rQdm15ENfXV4pJRAs2
         NxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbAhZncxHGQaJK5j68qmG8XKs+nt4Q03uVFcafO6ySBS1MOelJnrpLArI342gv+liztfenkkIZUSCgRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50VVsv78/zt9KOlUfWRNbIqiYv+otKj+9U6BhY95HNsbrkKEO
	1+dA7dj0eT+mxSRBNGaY3ZRXVM9AsCjTtELbNSDheidknOA6vxVpFdn0v9PNp1Yw7V4D4zoB66j
	NnPzoGuR31QFPhapU+ZJJqqyGo17qUZjgO5DJTXTMAllMmkcabMHgCSHlOwv5AdRq/A==
X-Gm-Gg: ATEYQzw4CRK55uA3V4JJN4MbJUT67yBAPljHM0pGdxSzhBZ+Uw6Te6hzE9ZzmU4sTq2
	UQYz/884dxevdRo5A2rHgV39LZchJJptne1z2bR8WzREpOUGpkg2568zY19GIK8TAQOzTAoJEVB
	LHfYpNk4OLgZSu4H6zDswueAgJpV6lw+bWNCsTnqYdKI43CWv29G2w3qRO8TWBrr+RKccOM9eEm
	Nqx6TV6IGvAWWV7gw1Nxd+tdZCoLKJNLM6qqiWBAibehfoVN2SIYaUVlad7W6b+nWGYOj+8Ook1
	Dq+UhNfa51rujavWSuulyzYdfw/cCceb0UxvFbMVNdvFkssl6t0UoDKRLarx7J+3HoZy9v8ugx7
	M1dhneCWdes3JDw+59icLIQx+oiP3NIhouOcjcJxx2dxcRziutyYtl6hKlC3mGuKZ0PGcC8R6PY
	LshfQ0wj6UL9WGy0G22mLpiAmunDOk+QqjUas=
X-Received: by 2002:ac8:7f41:0:b0:509:1cf9:ea0e with SMTP id d75a77b69052e-50b1485c934mr46201341cf.41.1773847677958;
        Wed, 18 Mar 2026 08:27:57 -0700 (PDT)
X-Received: by 2002:ac8:7f41:0:b0:509:1cf9:ea0e with SMTP id d75a77b69052e-50b1485c934mr46200801cf.41.1773847677443;
        Wed, 18 Mar 2026 08:27:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e195sm603363e87.47.2026.03.18.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:27:56 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:27:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
X-Proofpoint-ORIG-GUID: 7mn_dmK3flLauIsrjUZSk1vhcwVr-d6B
X-Proofpoint-GUID: 7mn_dmK3flLauIsrjUZSk1vhcwVr-d6B
X-Authority-Analysis: v=2.4 cv=U4ifzOru c=1 sm=1 tr=0 ts=69bac47e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=u5M8gfWzTKoBtfYfDKwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX4HvcolDMktx6
 04V5evej3NtJ7HcDOHAnKvvr+K8DckBUF+9DA+70kznq/PzQ+8xLC6FZ7bzFHv7I+r0lu2vutJy
 kZq3F3qSzqGsV6LCk82lcR2e9LjIGj+jRpFn9g1qX0qN/lnhsMS7+uCXUuNwzweooW+muIOhBsP
 /ahwLGls4l7rt1dOvMkmQLi/plGMBmQ0cxpkttQclJyowHQDushkqVYyb5osKd1wAEQRgkjFrEl
 530gR22GESieGsKAn8qGD1U9sNMRXou5WhzJdTW+G4zX/PpoK6REpiVi7LLSoI/bUa0xwEstfBg
 WYSH8nzOdH+2xyLkHsVeKWMAuz8bSGDOrxQH12O+OOZVlY6wxE5LAs76lV+xp1bcr0omnYM0J2D
 iAwfRwGWal0rAY6EZbPvRxlfuqJGBfuZJgV9OHpCwpzU3d1Mcs94PdVNHcZYYOHSXsCFlfRa/57
 UGR2otrP7/LOXh+8e9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132
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
	TAGGED_FROM(0.00)[bounces-56217-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 908562BEA7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:07:39PM +0100, Neil Armstrong wrote:
> On 3/18/26 14:17, Bryan O'Donoghue wrote:
> > On 18/03/2026 10:15, Neil Armstrong wrote:
> > > > +    /*
> > > > +     * phy_configure_opts_mipi_dphy.lanes starts from zero to
> > > > +     * the maximum number of enabled lanes.
> > > > +     *
> > > > +     * TODO: add support for bitmask of enabled lanes and polarities
> > > > +     * of those lanes to the phy_configure_opts_mipi_dphy struct.
> > > > +     * For now take the polarities as zero and the position as fixed
> > > > +     * this is fine as no current upstream implementation maps otherwise.
> > > > +     */
> > > 
> > > This is wrong since you loose the lanes mapping defined in DT, which is still in CAMSS
> > > but is a PHY property. The lanes layout is not a property of the CSI controller,
> > > CSI controller only need to know the lanes count, and not the layout.
> > 
> > Lane layout is a PHY concern but, the PHY API gives us phy_configure_opts_mipi_dphy which should be extended to provide layout and polarity. This would then be of benefit to more than just qcom/camss.
> 
> Why ? the only concern between a controller and a PHY is the lane count to calculate the bandwidth, the actual pin layout is certainly not a controller concern.

I think that the DT should be providing the information about the
connection of the lanes and their number on the board. Then the CSI host
might want to limit this further for whatever reasons. But I don't think
that the properties of the lanes should be configurable between the
controller and the PHY.

> 
> > 
> > Right now none of the CAMSS users for this driver depend on any other mapping and I propose a separate series to fix phy_configure_opts_mipi_dphy rather than introduce data-lanes to DPHY.
> 
> None of the upstream users of camss.
> 
> The problem is even larger, as you replied in [1], the csiphy is still exposed as a media element from the CAMSS driver, this means this driver is not complete,
> it should be a media driver entirely with eventually an internal PHY aux driver, but this would be entirely implementation specific.
> 
> Either the PHY is standalone and the PHY consumer only calls phy_open/init/configure/power_on/power_off/exit, otherwise it's not a fully standaline PHY but a composite device like here.
> 
> I propose that you write a proper media driver for the qcom csiphy, which eventually spins a PHY driver as an aux device.

Why do you want a media driver? Isn't PHY driver enough?

-- 
With best wishes
Dmitry

