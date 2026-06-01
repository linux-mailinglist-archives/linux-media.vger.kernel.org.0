Return-Path: <linux-media+bounces-63240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEhoJAhvHWp/awkAu9opvQ
	(envelope-from <linux-media+bounces-63240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 13:37:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F361F61E67F
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 13:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D00333019063
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 11:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8042DCC1F;
	Mon,  1 Jun 2026 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsZUh8jt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITh9lqgx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079EF32B122
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313508; cv=none; b=R3sRIUIzM3GKKfA5xKYgYGWPGinaksBvmKDigP77zTjld/e134A7yQW6IeQIQHHMufp0GQvQ/qGy2KNbvwHgNISZbv8nIqDkb3xzI+a688ocSvo3jmbOrP0vl/okQkZzLUON8j06lTwH3YvJQUiJRyNrxJhvMsQb8SrT5GpqQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313508; c=relaxed/simple;
	bh=CMCbK4GBOtetUzOVTMPXigvLXYggmTaBv77AMOXmYQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN8CpsZ4fYccsiDMluL151lPGVtu0mFn6HCcK0tiX9KGyPR57+lTjGaHgkqKWhHRTTF5/cpltxofBqKuVyyjgs/Y2ufSYl1zfkqXnU0Z45oUmakbiRuT2wv/5DJy4mr3MVOPAPgpjPqN7mlVnN09uPcd1aRgcHgEGN3qqrupPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsZUh8jt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITh9lqgx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fB8x2740445
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 11:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=; b=JsZUh8jtnEvvs5GW
	jmxTVtxFAf1no+JrbippW/yG5S/T9BCf06BcR6vYLOuYVUCp65jOzR74+Ju3sMBM
	B4/KyB1NXLXfTarY9X7D56ZpeYf7oMgzjT5JRLupYmRp5jUMXB/ybyTERp6h/EGS
	P8xFu9xkGHmoF1tQMbnWBZnjTRMPDNCzSaLPa1RoyZAMSRtEIPU473o8WZgWB89+
	r5HCWy0ecK4xPGwB8eBODTnQLqkRm+1bw0qxALND8Onci0KK6ID8kXwvbaz3HQWN
	qLZz+gV9Y2lYYrcLr5RBo9R1EQd49lDROaVmDHZMgH40tjHC2O8gckT5rtVx9VbJ
	sEnNXQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqgnxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 11:31:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963a95e1250so406128241.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 04:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313505; x=1780918305; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=;
        b=ITh9lqgxbCua27O9/EObQvnsT/zeJ79Zbo1FTPZ2N3uRyCGZPcp01bhQNAToFftEHS
         pUm+3bWFiq8G+GTzJ7RHID1b2wm3/ySlqW30IXitsG3KBfJXPIHGqtFoUriCv2n4CErV
         90QjImFA9akwJgX3NHZA2Pg42JxsPUSpQUu5C+r7jzS85M7QcnhXA3dIeSp9bBcP4J4B
         h4rAZ0colXgYJBYPdldBknPGF3yrE8fXCadwESzUwvsS075M93+HOEDXNqEfuC2vvywV
         kti5GXAz89JH/WFgeaNHjsM08olFC47V2wLw+ZIOIEuO4/qlH8mKxiGe3g+oTg/jiQWo
         Ivuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313505; x=1780918305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=;
        b=mMSQKa9esbI3FaUTPYB8yBw5qk3Vh5yfHr5rhzDohPbsGQonmk65NDu8o+tXYxhJPf
         pestpzp/On9xLvWjBgAN0u8zHqN45CYeKUoHIRF09Om/CZvMqwiAYI+z0YqK5Snw7Bpw
         V2rLYPvinTEfWwkVxddaqIgZv48cUwzNgz2Gz52NA0r7O3jhhOjwRsRdaYshTR2Sbzou
         lW34KgkbFvPaj8dm2sdapRcrgJmcqNVMj7wAthH4+qccgk8LcMdxNWMJb5M3YF21ICGd
         O2dRgdSqbzMZOaxSux2uhHlgJo8jk9LdhqJorlIuvJY0GM2A+NFs2aKhgixH2bf3l/5f
         Rusg==
X-Forwarded-Encrypted: i=1; AFNElJ+30UOgvM2RoOjqUKfkWXdVfeDCn61H3SFD16iLuUnl6z9dwa557Iht4itoASNde9MUAKHPeu/9SxBx1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP15ZyO1GcW+DUctefLOfgVM6F0eqM3Z+6Im+Jn+MlxDEEna0m
	ndKgFmd+r+N//QXnpiQlJLtrWGxzw6fx9uegVBmzFRGRBWDsJFEFopEAM7/q5so5muuHv0PeBND
	VKUkcNE0GPLWMRKj/3nmX1XMWMrL++iVwZ7polGDL7aSym5baRdAEckl+hufGT5eD3Q==
X-Gm-Gg: Acq92OEMdAFIazWunFML0Q5qbfv5WeLDwFpLJqtKZSKwVkE32qL2v8UW9k+TQhSaMI5
	u3IYkM+f9AaPvidIVox7X4HZJIYkiy0b7FLwnYme7EMhQ7p1TA7v4ib10jRdDkSX9rq1VcbiK+S
	xLKjC2x1s0gyCFnFaRNUJHOcs+QIOT9oYKu39eNoCSpku9ZGGOJWL71gn86lZ01s+Y013fxup9g
	pj3bupQxYuMBArccXgJ24qXbkpXOS9AVNKWc5VZ50vK/QhgQcj3kZQJiR2mQ/V8VhuHgPDpu7QK
	1GUU6mt5xUGtLUTTN4KVzYKds/Hiqta0BINsCNEQEbY4/dCzYw6qKkWuEzwUmB5jc7msEKHDZQB
	5wed/HWC6G17gHJYX7fERD5EcE0pxg3bYxy4trXeTpOvZAuuEuT/NAX8UUuK8ALlHuPNziU+Hq5
	u5RqLnkhE+iSYQK0aXziOfU6AgOu285zkq/eTvs905hFxhRQ==
X-Received: by 2002:a05:6122:3207:b0:575:360e:600a with SMTP id 71dfb90a1353d-59bf1268aa5mr4050639e0c.8.1780313505307;
        Mon, 01 Jun 2026 04:31:45 -0700 (PDT)
X-Received: by 2002:a05:6122:3207:b0:575:360e:600a with SMTP id 71dfb90a1353d-59bf1268aa5mr4050555e0c.8.1780313504812;
        Mon, 01 Jun 2026 04:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07c2e0sm1977344e87.32.2026.06.01.04.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:31:43 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:31:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
Message-ID: <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bnHIL-ysJ7aL23Gob9ZEgdFfq666f70V
X-Proofpoint-GUID: bnHIL-ysJ7aL23Gob9ZEgdFfq666f70V
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d6da2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=rVSrNolec8Lwk94r8HgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX3TQ4mQjZHs0p
 QMTRUXIJKwnM8rHEFcabnMxbjauwkKOUAGXUDcKoDgMtd3cqk7uUuo9BXQ1aAz+zsg8CitsJLIZ
 6caxwxhPfZAEYUAWL/DKdIG4FWDxvOCG/mjEfQlepKqLi0IRY5Yp7j/qqWpbX5DrUNPzhIy+c9e
 Zi6QRn0xTjwBwFHpsu+uoD+EoDZvWlNFTpGYIFEheAevTQTxkJDnQYZp2OrYACSHDbyFPOqQHyY
 sRolmd0b4Xj7NkWtqzUa1gbTG49DplvaEuY84V5XmipNw9vviLQhfHu5OSUTO0EFJzFuukmROgL
 UGQjDLTQj7b8zrgR5N4bIvOnb6yje0R8+zHBkzYmMIntFErkZ9RS0G25BRLNoIFYjOgS2/BZYkR
 e8Y3RjXsS3KPpu3/5OxA0lzmjwzayXCoUYOPflCOzhnWueG/zVUJKfXcj/Hq0He+EwePnWM/lrp
 ihZEu6mq9dryr5xz0UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010116
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63240-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: F361F61E67F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 04:39:12PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 29-05-2026 20:20, Bryan O'Donoghue wrote:
> >>           ret = 16;
> >>           break;
> >>
> > 
> > This is a pointless enum add.
> > 
> > NAK.
> 
> You're right. Since Glymur reuses vfe_res_x1e80100 directly, CAMSS_X1E80100
> already covers it. Will drop the redundant CAMSS_GLYMUR enum in v2.

Is it completely compatible? If so, we can drop the driver parts and
make Glymur fallback to Hamoa.

-- 
With best wishes
Dmitry

