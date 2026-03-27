Return-Path: <linux-media+bounces-57388-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD1oLH8Rx2ntSQUAu9opvQ
	(envelope-from <linux-media+bounces-57388-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:23:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3D634C432
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2733E3037D78
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE45393DD3;
	Fri, 27 Mar 2026 23:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fR5AAmKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmTbdwrl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57595342526
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774653792; cv=none; b=OxbR7rp6s1ujj8+O4XY5Hymy6y7fOz8VeSwdzYCNGDPMm+8eaV1mv5DQjdplriJmvPMng6th1qXKSdtQbS3ls+mVTLDBurKDFGIO4c2REJTsw0PCueDIDd14lL7qKPblaqJbnkabPtUt17o3/nCDER47Zn+YB/6eutGYYGxcDh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774653792; c=relaxed/simple;
	bh=KKoEVadXmfX+eJOn11MSj9QhT70dAnjq94IVOwZj52g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFZIaQ57jN25g8ewaPrQR+TQP8b/MZsopinAKhLw82rMB3xq5lYRnfShdo/ac5w70gejA3FjDN6hBM7Gej2c6m1/lQb1B+U3kSMlI3Q3vNJ+GXVudxmsU/MtJbAxvMu5CZJ3C1mBwQ00A8so++2Ev6i6oyrFm67Ob7tPBge+lQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fR5AAmKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmTbdwrl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3wfU102812
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VdliwqcRhp5SljuMOcgQ5BLR
	pJRliwtVYafIt3tKDSc=; b=fR5AAmKkwLOClErr9exH1TTRqZ7F8HZ2FK5PpqF4
	bez41oQIRzjiTx4h0pyu+2eS3whyBoqGe0ZfTYFOFTQMaS8b+rXul6RhwHhqkZ5D
	9NVOX+IlW9lQfj+VTDX8CLVsi6EksEZYuhQrnSjkA6t7QJEV14r8dS3iTRvw7lTr
	XOEKkvK55MjlrTYg0TfOpLhJTSO0wX7RGB45/Qlitqr92PJJdukKS4x5lBvODN0H
	5B+UKxHhS7V0TU5tdDwVHWGwZ4rDQ9/4XyqeMMXTEst371q+MNmvOG1IVtgyU/96
	Bf/2NQM1VZETFMywdFNdfvPQLa03HXnzz7mfQXxH7L4pig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn137yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:23:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so29132031cf.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 16:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774653789; x=1775258589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VdliwqcRhp5SljuMOcgQ5BLRpJRliwtVYafIt3tKDSc=;
        b=EmTbdwrl8dTimlpPQGtizrF8l4GLcEfb18LoWlN+ChVxdzEGVuhWzPt901BeVvTNNv
         TewiZo27buCO55pmla/ld96ITxVToAMPdCKf+/j8DuRbYmd/PS6GzWIJ4BXiUFCa3E2S
         pCuBOzMl/gs8UZBA8OJkrFnHuoWFwRuv5wOsiT1QAqe16TpeZqt1hMWmZuheuLZ6ooXW
         IqJXVxfuxazI0V+JcFAglOAtcogPq7MD6m4woqznUYrvS4XPB8kzCRvHbpfgZ7StPlRz
         u1mUJ11Y+wdqksZ406g2gr2mXxqkZ0XiZQxrjpTV4KPTwZneblHxuo+UDf8kv7mD+SnG
         yKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653789; x=1775258589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdliwqcRhp5SljuMOcgQ5BLRpJRliwtVYafIt3tKDSc=;
        b=Lqm4PLv2K6ncIxBpcUM0EUn6Oxe1qiLzYJMlTW/Qyu4/Oi7kCa9cgHf3fkzT6uijxW
         R2KZL6NVj8ksnv93KbX4c2mg7MTNB/lO1IOJIJt6Kteq0jndfBTLS4kOoTkbQoL28A/T
         34c3Xpr8HE4jbu3acGIw9ZG6xR75Q+0cAa2qY2B3gyEmrCVWY/eB5WYOV8fPAviVHTAq
         RKSMEMfNZm6yd7WW+3cuh9QDjqygEjB3OTSOyq3tjtEZDtKxdHrLK/5KBfidzwz5o2hE
         Fr8CLTf+ebHBs/VP7eWH2chl0oRrh/nE+UcHEKChmzEPbKS6wrJiKlD91B1td1wLEjN7
         MQhA==
X-Forwarded-Encrypted: i=1; AJvYcCXvSpol4fZyy3fyAmqct0i5ybhuhM/Wxfme9+8OrcxyhqVVyY2xPt6cXg5zxuSSFKdCDCDJKlGGMmKX0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YymRYfizwZ/YtofmqoL6fZXw6tY1Xulvfb5spSA4xwDk2T6rHxZ
	2leH7uDHEqcFAL1divIBm4YVqSJdGgNnk50wTXda9NFUIxCVsCwhPwuq0YJLoFbnNj4SY8TQ4/e
	QVN0+2biF+PgAll84ES+AZUHmrAFETRqlzpOqMXYpJKidLzQoJomyq53NzztzBuNH7w==
X-Gm-Gg: ATEYQzz9mQCElZBQNk68RSgcvvgmDYptsebgOg9x7Jw5dbQ4bM+hyqVMJUsWIytARf8
	BE2Ak+o4RBkyoDZLynGvJ5PY1juBnTVISTsz+EVzWJHVtL8uH8GNZ050Bgr3CTA6fvGPRWvlSco
	MkhD7GZw0G9tsyPjAFyGR2tYyY98GJeBC0fBcR6bJtV6A+moQKHN8D738QKLIi/P32UuupsEgtt
	nJorw7xCES5YclsL9j2jcna7H/J7GLZTQHQlCYex9VdZgagJQDRWrtww5cANIR2AKwu1asqQT8A
	s0AcMte876kLaShpMlmYC94zRdY3kPaLBG90f8838NyEsaAuy4TDeVwNibemk4ZCPZp0N3Ao1Ax
	+T5G7C/6dsgqNWgwnqDSPQTXnYuZliGgycnYqvKm06nC4uDZcxmcE8Sv3TzYGHsqldo1EtEAHEA
	03Ljykyys4gdbfYv3y56BxHSo+zwo2IecQTac=
X-Received: by 2002:ac8:5f12:0:b0:50b:6a48:78bc with SMTP id d75a77b69052e-50ba38bbf67mr62332671cf.43.1774653788722;
        Fri, 27 Mar 2026 16:23:08 -0700 (PDT)
X-Received: by 2002:ac8:5f12:0:b0:50b:6a48:78bc with SMTP id d75a77b69052e-50ba38bbf67mr62332421cf.43.1774653788222;
        Fri, 27 Mar 2026 16:23:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f429fsm83853e87.2.2026.03.27.16.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:23:07 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:23:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
References: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NCBTYWx0ZWRfX+Yf6Y4ZcHX5i
 1vhH07wu4SE3wjIOkF7etOnzUbcsuIaJRENCYAbFQJa/6sYjM0l94X8bkept0IC4iprxRZTcD8B
 +dhFIkkVKxPcOOvh/YgWqUYVrDvhe7f+u9lIspJ92yhNwFw9BA89/jpVvONgEYfTfZM7rS/OLuE
 UcBIND9+6W0+XcX3ieym5OdqAbv+2F1wWhLX2vWkB0msGERRMPs0D2XPVrQLV45Rlb6LjV/av/i
 9Ke/+HqXhpwWdiVTcyrHf7Vu54JlwrCs44/5ED5foBU8jn4OSuLIvWDkRD+7tTBMaC4NWaprzh7
 4fwKWLxJxTkyUPp74OHURM6dRKWXNt9HaIQa0O8i7L0jeRqBBKMDhA+bZjuTXQx1iUXuOVRA/nw
 oqrJD5exrmZxp/qgzB9yQqG7Vooq2xTSRlp3wKwwPpD7281/hJadg0c+mpXP+8X08dNvB6m3LWz
 aJGvBz1FukTMVbNxz7A==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c7115e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NHJkdllwlKbNI_IFlBcA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: cE3K13yGMR5RxukxdZX5UuKC0UGHm02c
X-Proofpoint-GUID: cE3K13yGMR5RxukxdZX5UuKC0UGHm02c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270164
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
	TAGGED_FROM(0.00)[bounces-57388-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 1D3D634C432
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
> On 3/28/26 00:29, Bryan O'Donoghue wrote:
> > On 27/03/2026 20:51, Dmitry Baryshkov wrote:
> > > > That's just not true. If you read the camx source code you can see
> > > > split/combo mode 2+1 1+1 data/clock mode requires special programming of the
> > > > PHY to support.
> > > This needs to be identified from the data-lanes / clock-lanes topology.
> > > And once you do that, there would be (probably) no difference in the
> > > hardware definition.
> > > 
> > > 
> > > In other words, I'd also ask to drop this mode from the DT. This
> > > infromation can and should be deduced from other, already-defined
> > > properties.
> > 
> > It still needs to be communicated to the PHY from the controller,
> > however that is not a problem I am trying to solve now.
> > 
> > If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
> > 
> > I'll aim for DPHY only and we can come back to this topic when someone
> > actually tries to enable it.
> > 
> 
> DPHY may be the only supported phy type in the driver, it does not matter
> at this point, however it's totally essential to cover the called by you
> 'split mode' right from the beginning in the renewed device tree binding
> descriptions of CAMSS IPs to progress further.

Okay. How would we describe that there are two sensors connected to the
single PHY anyway? How would it be described with the current bindings?

-- 
With best wishes
Dmitry

