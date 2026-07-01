Return-Path: <linux-media+bounces-66151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1f+SCfxbRGr3tQoAu9opvQ
	(envelope-from <linux-media+bounces-66151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 02:14:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C546E8D63
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 02:14:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q+MhbGJn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N8h2a8+H;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66151-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66151-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB070303F830
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 00:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8570135A53;
	Wed,  1 Jul 2026 00:13:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C7D1BF33
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 00:13:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864809; cv=none; b=r7A54UzTo2kQ6kBPjvO0uTyUps7EFcry8g7BkxtsJBbQH+bRhn/XdZFiz/k202+KEfNCSO9USE8i6SNoZ8mIfz0g9yxoaxqgXFq6sffQJZln9xw87/EOQLtWjDMgOd0WbtQS/72Jp48XKkKz2BL0tJk0fPqequR8LqSfA6Hh64c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864809; c=relaxed/simple;
	bh=/6JpH4OnBEls1RVHSF2z4kj2IGNxhSa8ynIqGaPPeZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5xIsLpHKOrNI2j6EGRk0c7wB3JmJNJN4Hpq0pCF/qm3y2g4Q1UpwpjZCjwbr8cSmNT6j8J2qaJAk7itu6OVZkkQf0lf6DZIlT500AXVjIxKWNP3iRCuGfRHqV0xWa3iko54eBRNNykSp0xajcL5vNe/nR5yCvq9QB3wF5fEOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+MhbGJn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8h2a8+H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNLxtl3407764
	for <linux-media@vger.kernel.org>; Wed, 1 Jul 2026 00:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7mFQZmDrGWQuNZVY8aofu8Ojl0UrmCsx15yRNqvhfE=; b=Q+MhbGJnFYZCIazY
	xI2ixCwr126dfJa6olkmOtc8rS1Qc11Ddz4IDneyTfPrHS35ITExg5eWEEWlCth4
	iveHxJBpNvF1k8G3r6K2rAmyGpjn0iBzN7Kt55D1Bun6D+oMlXZNVMv0JTZ0vnre
	Cg3I1yQRULE6M0iycS1NWtrJ1lsQsMoTW4XnsRmnP/pykcMyPeREm0oeFWd+rVa5
	1YWuJfGMEyZN8Fo5+gTiTN21sYej5tSQYsOcB8P0iDgbdxG7B0YgaWm/k7zX2HXO
	9u3eNPtbsvjVgIFbFWSGdONHFq2K4+0QNuG9HDklac2Yan0rpYfkEfvVLYLij0Z6
	QWfGGw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sh6t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 00:13:27 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so34595e0c.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 17:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782864806; x=1783469606; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y7mFQZmDrGWQuNZVY8aofu8Ojl0UrmCsx15yRNqvhfE=;
        b=N8h2a8+Hp3jgWAsIDfzCxEkMJ6OMOjAMc35mfVsKWRIipRr5o0U7hF8YIz0q2yO36w
         y5AJXNAp8ub8sKK+5Wg2VBi0Q1EI25Expej9lF/52NflZJxIdnpui+iUYMs631FR1rfK
         6aJOtvXhT0Wk68lOTitwpTgwkZBTbYUlD65geEvJnmK8GyqpTSsxtCRy4QCRXVDf15he
         kteosDpBITPRB0YtcNsJ4BJUIPx7lbpEwL+7G1xYeQdHmwEsReybt1qT65QD2XpaRonD
         /gsWdFYk8SZQmZwW5ZgM1YlGiNCv5VjQWAT/mPQgMwhmnUgNr1GTyYeLBrv0DynAjLwI
         UBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782864806; x=1783469606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y7mFQZmDrGWQuNZVY8aofu8Ojl0UrmCsx15yRNqvhfE=;
        b=qOtv4mbPQjV17ECtgKFimmvU142KQty9XDAqltQTr1HIhdCRZjcWyBrTExTRB51u6X
         p4wDkcVW84MgBNIYChG4iABbZrxA7CHeT5c8aUfnTaRtgPsTum4xgZ8424STto/RMNWa
         M/34St8RhDx/xuYn+h/Yz00obB1WK5eGjmeXemS+ptlg+DXDQg87GdTIsho3+4kBqN2E
         pVqVKtF2YyFCtnnfcbVaDcbiTw7mCF2CD3DBgkNQzHSBkemo/K1LVbe++lyhMxQsAPWB
         UGQXrhLTQtDUU0Dz3xl9rKhFi5XQL5f0tgVPQ+SVTglGmezWbKJpQTSgf3EBqKIgZddw
         HVsg==
X-Gm-Message-State: AOJu0Yxr73h91+W//VTXA4gyd6Tcw3DV58lgS7QlR5GXUYJk85Twq/cb
	8rFR1sskxy0YGtcAtd6MduIY/bjhCC2MXfHobHtK+m+t19DnZE5rrvjULXl+BeeKOmvnfwMDiZI
	aM6DlMtvGJw896zPJZWaW9mCJdXfVh2RlqQOvQZoUoiBGTb+zwyxk1u+4O5rQIsX0NQ==
X-Gm-Gg: AfdE7cnDD9r4kytX9Gh2Ue2+xKWil6VkYzLU+IUtwIeKe0Ekh7YIBvIOvieerq9dmBp
	xGZcADIkiqaUZgDb71xCU2b2cpqav+U3ykHzbZxECLJcBVaZe1a4YJaOpJTrTNHfpwqXfhHi0ZI
	rCYpjtZlXsOpel2iC7H0YD/CcRVQsGTokq/C4rcGOGpYIbotv76RzPfiaSRB9J5Ps12L4zksMc4
	UhImgKHbi6wfF4hIS2nJiILXAZiI4Q4zQB2ZkAt1tVk3rOj7rBjodjBfl3k7SDWKo+OcH8lGsj3
	XkArK/TdOFqaGATwn01zvROW0b+YxCnaVBFl9XmAkxGGxpdEAKXgY7VR6Mn3Xibdpa1niSuf3ze
	S16OYyiv7vgD5fF/108rC/OUIkilZiPYrV8i38N/t0cGf450KxgDpAGU5P2mKBwBY8Ms1O1eI8T
	YVKZDP4x01rFiA5BVvZWbbHNTV
X-Received: by 2002:a05:6122:8008:b0:5bd:c32e:b6de with SMTP id 71dfb90a1353d-5bdc32eb70bmr1729401e0c.14.1782864806130;
        Tue, 30 Jun 2026 17:13:26 -0700 (PDT)
X-Received: by 2002:a05:6122:8008:b0:5bd:c32e:b6de with SMTP id 71dfb90a1353d-5bdc32eb70bmr1729384e0c.14.1782864805674;
        Tue, 30 Jun 2026 17:13:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4a8a1asm892174e87.68.2026.06.30.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 17:13:24 -0700 (PDT)
Date: Wed, 1 Jul 2026 03:13:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <n5aze3r5qomhuxzmrhiwc3pvlwieske4dlzg644virdrez7xr6@laewnnf7eqbn>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
 <ts6esusuua2khweva6iyfel2yowislwwx6zb2fl2azcefownie@cg7jegn334fj>
 <2a7cd484-ee0f-40bd-bba7-3faa86bb8247@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a7cd484-ee0f-40bd-bba7-3faa86bb8247@oss.qualcomm.com>
X-Proofpoint-GUID: huBH_tZIz1nwYdzqLCkS6a8Ep2R5G9Ij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAwMSBTYWx0ZWRfX442z+6cf6lTG
 31Y1NwqgxWNku52iF661j56PX7XMMDn07GbuiPUhOQULrgQtTho3Zv6tk2oH8/QhbnURBOh6eur
 ZRWX+ceG8nRi1+iZm3OJ6dmxLQg5alz64O3+jz8lXgBipSC0Ia9rRamXq0guhY5BJFGLDDgTaOl
 R576PDOymMeARt4kxmqubP5kd77pA3BQOHY3nmaaJSdEqWWWDBwJzsSJRwq7jtf3qYX0eanRNnK
 CbpWwldRgvv06ASogeoWOycT14i7wuNm+S9paYY9xE+jSiL0oH/dDQi8ejeUBfWL/MhDwx5PGSC
 Fd4SX7zyOpJez2sllWxjyw5ty0IcLHSnCrWZ1SNXqlrhVhlsUay4P5uhlRC5QBdfHYVpS5YzQeY
 lIrBjN+LZlQ1homY7qyeFjsjilgDX6sY2ZoupCFvY4eHR254qNuK21Pys5tpkLJfxVKsUJ4y9V0
 KMUWFMk1zMBRBjaXgCQ==
X-Proofpoint-ORIG-GUID: huBH_tZIz1nwYdzqLCkS6a8Ep2R5G9Ij
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a445ba7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WexuhrTg79PgycqOckwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAwMSBTYWx0ZWRfX41ZfterK31U5
 G7rPlAT58O3GLsixt6W1XdT54hhjYSO7lgx/XrlCGe6GLDuif5IaaN9t8Mq5Y/q0/Gv/2Dp6VBn
 uLvk1j05sWHm+rWirBAzapfJQUCBxhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66151-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0C546E8D63

On Tue, Jun 30, 2026 at 05:14:14PM +0300, Atanas Filipov wrote:
> On 6/30/2026 4:06 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 03:17:50PM +0300, Atanas Filipov wrote:
> > > Add a Qualcomm JPEG encoder driver implemented on top of the
> > > V4L2 mem2mem framework.
> > > 
> > > The driver wires vb2 queue handling, format negotiation, JPEG header
> > > handling, interrupt-driven job completion, and runtime PM/clock/ICC
> > > integration for the standalone JPEG encode hardware block.
> > > 
> > > This series targets SM8250 (Kona) platforms.
> > > 
> > > The jpeg-encoder node is described as a child node of the CAMSS block
> > > and is probed automatically via of_platform_populate() in camss_probe().
> > > 
> > > Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

[...]

> > 
> > > + */
> > > +enum qcom_soc_perf_level {
> > > +	QCOM_SOC_PERF_LOWSVS = 0,
> > > +	QCOM_SOC_PERF_SVS,
> > > +	QCOM_SOC_PERF_SVS_L1,
> > > +	QCOM_SOC_PERF_NOMINAL
> > > +};
> > > +
> > > +/* hardware register field mask identifiers */
> > > +enum qcom_jpeg_mask_id {
> > 
> > Why do you need to keep all of them abstracted? Just use the registers
> > as is, assuming that the registers don't change a lot between platforms.
> > 
> 
> Hi Dmitry,
> 
> Regarding the register abstraction — I'd like to make a case for keeping it.
> 
> The Qualcomm JPEG hardware exists in multiple versions across different
> SoCs. I don't have access to all of them, but Qualcomm tends to reuse and
> recombine IP blocks across platforms, and assuming register-level uniformity
> seems premature.
> 
> Adding a new platform only requires a new ops/mask table — existing ones
> remain untouched. Would you be open to keeping this abstraction as-is?

No. This is like putting the cart in front of the horse. You are
creating an abstraction, while you are not even sure if it is required
or not. Moreover, the difference between different hardware generations
is typically bigger than just registers+offsets. Adding support for
other versions of the core would likely require one to extend the
functions to write different data. So, just having the registers in the
huge table would make little sense.

So, no. Drop these tables, use registers and masks (where required)
directly.


-- 
With best wishes
Dmitry

