Return-Path: <linux-media+bounces-57508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH6kA2gGyWnxtQUAu9opvQ
	(envelope-from <linux-media+bounces-57508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 13:00:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679B351B35
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 13:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EDB330A3A4E
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 10:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F623148C9;
	Sun, 29 Mar 2026 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZtU5N9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMchCMq7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711D73148CF
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781684; cv=none; b=r/c7wRxW77RkD8WrxMH23iMP4psi8XEU2dzasW5hyiQnNKQdz6sAQ5LFUBRA7U5luPQVp/jw0DHInzdeXheNGO7mw4RwGI7vhGUYJTCtiuH9xuV4whP9V2PBdG3WBhbXp8UR5iyhmsjVIv7rwysy4yDq05Ycs+gtEW8K4Q9BioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781684; c=relaxed/simple;
	bh=CowOeEomkcF6Ph/cwykM1M22aW/lBwWVtBHLRKFkSVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfFaFQAS0WWzrA9WO20OvZZgZz4UJ67ymvwKp/FHnI7lsqxdqMHqmCFifjgSMxGTow6ytyz37gMmE9juAGbYD53quqeWemSMNll7mcmccbMAU93hLqjCJQ2lqSBgvB2vgZ6wg2fT6ypFtMUEN/AgMkOONnz3QnoIkceXGagT9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZtU5N9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMchCMq7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi0GY2953488
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 10:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UePRAAybQXDx4YMT9nuMB125
	aVT64hKSuR/Bw8La4Ao=; b=PZtU5N9mYqhmE8EGVCnt5ywvJJ58pDDRHqCdgTjT
	YW9ZKig2z1PN+wKmhMy3k8ylkZrHLToCWOxyWSbZLH1r2+DTzgV4IhF76SRkL0+x
	pj9aDJqi96NaN/pTy8K5Zy7br83XQHN17V2owMJJ68nGCyGNDFF2F5fIZvpGbKT9
	6O+ow57wiJOjXVv51ONw+0O7YNZX6bSlR1dodWCLrOOqgk4prmBGs+AyxSLO8KOk
	2fbwmYOLvLiKcrQqRAC4tiPusXhKFxDCAvf+FZPKyk7u6312QUviTGiK7bcyfAkK
	xZ2gTwLU7BvAeFqCrrt2hZ52wlTtMJ/xVnLQyBj7WBkjVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqegep2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 10:54:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso113070931cf.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781680; x=1775386480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UePRAAybQXDx4YMT9nuMB125aVT64hKSuR/Bw8La4Ao=;
        b=dMchCMq70NBlUCk97GrhDxMbgs3EFRtRkr+NcnEicbS9xkYqJmJU7jh5m90Q8V7gA/
         dJMtiwIZVjL5ioSI+i4wZOcfefs8X00U0DxcYyus+frvkA3DJ/0Hu4AHNiJGb9bPge+X
         TDiFbh6i5S61P/qibVbcLaLpSZ/tFYoPZCvvEVhvC3KIDJ2XVuBMceaCQpJ+YQhF0glm
         zEk1dc8aUfq/ffvVEeYg/jc+cWCwNs5w+oXbWB3IyYmp54LxZc0fOxDm6HJB3BQawrJb
         0fBqIZvLnnCvElgrnP1fzCRlmDQEnGN2tETxo8V+SAA818e5571ThYEgP90HUYeJ9cHh
         o/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781680; x=1775386480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UePRAAybQXDx4YMT9nuMB125aVT64hKSuR/Bw8La4Ao=;
        b=mntogCyu52BNneBN28x19zENJ3Pp0xfP/vcVbhtlDG5c+LsiNBiYBEN8sXdKgoncxe
         z3WCKkWnJqHfTCsBz3r3N5kSgY5NQ9QzIozwjDZ16wA9rWWSCP9sYCDSVR/yp2OFFWhA
         84haa1C+PnuvkIncqsiTVhYjB0qAJu8Oef2cIaCGq5+mqo1DYmBA31jlOLgMaNbaI7Y3
         NyHBK9sETQEX9yJdajaYf+4CphxVImozUHhzXH+PmXDHDRk3MgVaSEFN4Ald1ted+t4n
         Mwymolbo77Kz2mnrg+6HRNn2TonTopRJApXJEAFZGdgXRF4T+0PkA+c2VvHdOqAycdXN
         BCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAfpBf2F9mnvMfH6Hif6+xP7Ti1rUhpwFe5UZc7XnelMz2/ylUJ80QQtP7YfqQqs5hV3KW3B1Kjn+z0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy989nJMEYvcKeH9cMMAKXWkEzfmBuyDJK73YKywM6jOakJwEfE
	h07j3JRQlca+LW0aWzWa/Om9XhynnpdUBmZF/y/Ar3TmEx8UH2Fy1DQbxywDzEj0ctj7BlnLl5C
	ncDo3Tf5IYQtES3qW0Av0nYiVtnKgi3HelQj3ptEk60evwnzMIe3jG9S3ahj8bhPyqw==
X-Gm-Gg: ATEYQzwYEKXYUOnAY2jvVISSFFDkxsW2zyypHE1HIBIKvO597y6jpDMis/kmyczQ+81
	hcx0bEldEe33G/kpxBBd9JqnFC57tM7bHyDWuWxA8blFJFSA2b0hYX0nrdMy0nUdLw+3/Kgt6ov
	xWm3GaB9kRV62bSHfGvcSwR1fmW8UE0W+PUkp/AHO5Vbdhl0mco6a37msH0GNa3z536ZF0A3f/f
	vULGqPKVyEptPgr/9BPH2jY/g5wMQTVvO7rCcImWPMWHVbTe1APJTrfVQLS7+mtummzwew8je8w
	+S1WA1e4nvo/0/0qQXLj9cnZr07ru+2JjtX7AEyebPOCWlC9kQsYxT5YC4JxTE1eEmXydHW9Fb4
	u/wLZyRcun1bPJksVdD7Deg54nnxWKniqPpHl93B0MBXlg+aUdontdD+LReD1b4rMT0trjIG7W7
	+dmkfNAJT0DeuwiBKbbc2rzyqSzAulS+ARxcc=
X-Received: by 2002:a05:622a:64b:b0:50b:49c0:b6f0 with SMTP id d75a77b69052e-50ba39aaf73mr119224251cf.61.1774781680465;
        Sun, 29 Mar 2026 03:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:50b:49c0:b6f0 with SMTP id d75a77b69052e-50ba39aaf73mr119224021cf.61.1774781680010;
        Sun, 29 Mar 2026 03:54:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144f5dbsm981035e87.59.2026.03.29.03.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:54:37 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:54:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
Message-ID: <r767islbwq2a3m6rf4wvl4hxzafdsw74jhev7jjz665kfymn56@vcn4p233n74f>
References: <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
 <vcj9b-49PycEnk8KeGcgXAaN09KfYZnW7g0LayiEPie9p-4krmMDfNO6Nx4DLgwoKHdKJughl7zoxvmKVkqOag==@protonmail.internalid>
 <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
 <0322e0b3-bce8-4415-90b2-d14445986e23@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0322e0b3-bce8-4415-90b2-d14445986e23@kernel.org>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69c904f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Qxd1fPiA_TqsfyApjdEA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -isUom0lthyvxybsD-vjS-gYarNTWDw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfXyJKOsVC9hj6z
 Qp2bnwW0eTMiVB9tUHxRmVwX6ME83mBsWHme3LwOXfftin1yM2iF7G26wiOQuVmdDYYPHyJkeBL
 f7iNYRG8oY+hL8xch5sIjNz92acuJSpvDoSABj9PKjRFxdZ2z6xez5Few2yaeE2Ggb2OWS3jbgX
 Mat0FApAUO/42f2n8BRr6/O3NTZbK4Qm4hun0yM6TferDcsRmmaaVuWSSyQKJURWQkvSjyCKXsW
 D2qRihLcN0VmW3Ks+mX4FDBLPd54V0L9HdMxaE7AbK4SmR2zPTK1A2SysKbbknojz5KkuOpIyrQ
 d9NpIDkJ/p/XSlMb6kDqrCv7Lin9DHbfwK4BaRzk78c+s3RrU4yIdxqVxhfYNqbNw1rmwgYZbAf
 g9pCaAN/+edB/wUPIGORcaImt/rbXekHjCOG+TSRgu+gnGH3J6xT2Xhm7u4slqGKK/TsLb4shc/
 m3VXpMF7HEgARjpuhMg==
X-Proofpoint-ORIG-GUID: -isUom0lthyvxybsD-vjS-gYarNTWDw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57508-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,0.0.0.0:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5679B351B35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:40:51PM +0000, Bryan O'Donoghue wrote:
> On 27/03/2026 23:23, Dmitry Baryshkov wrote:
> > On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
> > > On 3/28/26 00:29, Bryan O'Donoghue wrote:
> > > > On 27/03/2026 20:51, Dmitry Baryshkov wrote:
> > > > > > That's just not true. If you read the camx source code you can see
> > > > > > split/combo mode 2+1 1+1 data/clock mode requires special programming of the
> > > > > > PHY to support.
> > > > > This needs to be identified from the data-lanes / clock-lanes topology.
> > > > > And once you do that, there would be (probably) no difference in the
> > > > > hardware definition.
> > > > > 
> > > > > 
> > > > > In other words, I'd also ask to drop this mode from the DT. This
> > > > > infromation can and should be deduced from other, already-defined
> > > > > properties.
> > > > 
> > > > It still needs to be communicated to the PHY from the controller,
> > > > however that is not a problem I am trying to solve now.
> > > > 
> > > > If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
> > > > 
> > > > I'll aim for DPHY only and we can come back to this topic when someone
> > > > actually tries to enable it.
> > > > 
> > > 
> > > DPHY may be the only supported phy type in the driver, it does not matter
> > > at this point, however it's totally essential to cover the called by you
> > > 'split mode' right from the beginning in the renewed device tree binding
> > > descriptions of CAMSS IPs to progress further.
> > 
> > Okay. How would we describe that there are two sensors connected to the
> > single PHY anyway? How would it be described with the current bindings?
> > 
> > --
> > With best wishes
> > Dmitry
> 
> Assuming you add endpoints to the PHY i.e. that is what Neil appears to be
> asking for and I personally am _fine_ with that, then it should just be
> 
> port@0
> port@1
> 
> if port@1 exists, you know you are in split-phy mode.
> 
> Its actually straight forward enough, really. To be clear though I can write
> that yaml - the _most_ support I'm willing to put into the PHY code is to
> detect the port@1 and say "nope not supported yet", since like CPHY its not.

SGTM. But let's define the schema for those usecases.

> 
> ---
> bod

-- 
With best wishes
Dmitry

