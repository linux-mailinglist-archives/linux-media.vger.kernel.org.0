Return-Path: <linux-media+bounces-59585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNZTOg6Z7GlRaQAAu9opvQ
	(envelope-from <linux-media+bounces-59585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 12:35:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9AC465EF6
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 12:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9F433013A98
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 10:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B781DC9B3;
	Sat, 25 Apr 2026 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGBFF5tT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWq3GUn4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A5334681
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777113344; cv=pass; b=syn9uI5auIfTR48Oe+QAsFjE167KAFe54YmKWdF09Eni3ytLz0QpaoNIJT5tsspkPH3YxOGaztI7AciIW/ctMnjC3nLjTKkPE/cMCd/jHcFqFkEDB8+ojw2HL8hvptyeWTeWGB4HDCslpqLhA/S1fPe/i2sf/VrKcFKdwWUYjLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777113344; c=relaxed/simple;
	bh=4NBgU5nhiCAulZ8OH3gzj5HZxHYRUI3QHz5iaW52bM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RmRW4Z1exmhhZ5yyi5Q5j5c8mEvH9cTqtI7BIeRV/bdyLMdyaDtAPyM4V7ylOHZO4LQo4q+6NLL7HXnXXeBcANZG5jl4Wc2/GHGsV5lsAGpwH7xZ+EEglAlAPivyxYw0QmL+CkqJK6cnmdP0ATkqd68CfGgzVerq3lpHJTs8Dxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGBFF5tT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWq3GUn4; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4m84c3843970
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 10:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jxCmCQDJ+QKREcMZ2PcVDsOS
	3meXGSX8BjTm2djUMR8=; b=dGBFF5tTpOPFqq2QI4ayNBfnKhRP/k7EDxQIgTYF
	sGqNW5qPUHUXETkyh7iTM5vTeVm9lfUpClEKREr45gJneIbvw4kHmodwjLqqMHe+
	lBBwMGPTQWuzEgmWxoBk9Wi0UE21yKwWY997OZpr3nbrAqm0St4mgvR87fe6WSle
	vITCEfARKXWVSdbl2gUEAEljTKIR0F/ZeBRQ7JWsV+MJXV1I+YQPkAtwgVqWyFuB
	sl3EzPSs+264Drdh8r9xtX2gRqr6IxAuEstVGDGw8IZ6EocBU+dZxYt5DGv2pHrh
	YMbYTmEnSwJ5XvRbZTIKE+EM/htPgfVJF9WxWcBg5GPXuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw98jun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 10:35:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so169271185ad.3
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 03:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777113341; cv=none;
        d=google.com; s=arc-20240605;
        b=ORPey1bJofjf3ImaX2mwKTS3lwwK11FJuUC7wX6bG5bHIWcWF8ph0z9aIKRVJME78h
         9x4nwVmvPALUjIosN5TI2oodeItuXfloSnFeClgA6pMKiWAyTfHmZ0U99aSo6K2h4Zqe
         qFuiZiZuUauotMwuDFOPTbJZptePTGUH9V1hF3n7Fb4c1GCwN95jlUgnnN7hj5q4SKCE
         QwR28YKRlRqZ0ubt9/RnU0+o/BuvTBByr2OUJCLxOnT/tbndEdLKvRNZfhEogoRhT48S
         coRjtevlr3ExOqjXuid77F6j8NlAZoMESR362rVTI0enpLBSQxqAnt+Ap+TWF9hTxO5R
         fFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jxCmCQDJ+QKREcMZ2PcVDsOS3meXGSX8BjTm2djUMR8=;
        fh=J0vmy+1KRNVWGzf2s+jLaxLGqnx4cPUvGfIAlpeweSY=;
        b=I1VF3xQU14S0LV+JFpD4kqxUnKZ1AgTiwNpwIgcj3XHkksB01vbL3DWmZyLkMd6k1d
         mmMwoLdtBv2/0Knx5ebDeOUhAw/4dlBaoEZvOSnoWFH6RPz7PGE75VL0EDU3QYsd0a1T
         e7GZy3sYps/VIKX1CzdL/a3e7pmsmCrZumPmzgCF45LppHwcpHGor0Zp7bNDfN/bb75j
         iFo0vz2AFed4pbKQR32R04tpM7jw7DzESCLE8wieAlQj0UIYGQTxLNnspobBmTRZikjm
         2L4xkN38Zz6W3IULVHIIAXoNyA2yJpYvZ6IiCDOhOPPkDeHu6iD6uDwsQf5MgevayaMM
         Zbsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777113341; x=1777718141; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jxCmCQDJ+QKREcMZ2PcVDsOS3meXGSX8BjTm2djUMR8=;
        b=HWq3GUn4TuFMoLNMD41e7Y4FL0SvAEZ5wJDA0002+frqA5gBaPRd1kIAI7sCaI4gmv
         bhf0Fh4dmHyZSw+7cQBdTGuKGo5CVMCH2Wdy/m8XcV/sYQRHeBA3ep/wqvM8nDbQnowv
         9rp2WZaueU53y716hFduJAbNbLlK8jdaVkbHkGAzPxVExzPO+r+Bw6mnO/oRHm173vYb
         Z8QAZvjtMqcycaKiJi6rfscwyOdyBYEG+lr2101kO0uSZmw812GCZQJqIPcHCs9bhvfI
         BSpyBTT1vtlryW950+b4GgG6/b1q6uXYxudZflqs0qjn2nHJtqsDJDETaF2HNu1eysQd
         HQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777113341; x=1777718141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxCmCQDJ+QKREcMZ2PcVDsOS3meXGSX8BjTm2djUMR8=;
        b=JdVU/RSky4VpNOZKbAIcLrYntD3Bk9QAlz8lIb3DTbkVXifVgCABwzjBl7cg2BFulH
         HoHz83yGan75V4/FrC7h4G6wxvRtkK242XsrvNKPOtuK/DvpunHvyPMsj9PMk0ZxfPf9
         Oolr+d+RDlePJyy5XXAxK8/9y64Qp6P5xi8lUjdzRnLBdm5nmX8ajIww2/mkwZSSZghg
         kpvh2NnmRp3Haionn9mjMT4YQM/EnEyreTwNZWsWBSiF140Sjss8K2qaYguVOeQj9fzx
         BOSJMFRDpStw81/m0XsC8hdKagIZyOql3cO74b9Afifat8bar4cCvWD3Ox4o9WLcIDS6
         U5vA==
X-Forwarded-Encrypted: i=1; AFNElJ9araCCqKc/TfI+MBVxyO2L/ZmLqSauwOA6gvINmkTOl0IBWDNXH/4qO1FnB2tB7fNb3jc1pvG5RMwC7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykr15qxIHc9EZ4/91z2pDa7abLG/IFqCM9MwLyYpc7XSUgRDfu
	SvcR7OFHtuJj3q53sAMSReHKW+Yq2rmXWRg48OMlxOq7iA5uqrT88zktJeASC/ASkeEr7NDC9sY
	JP/7SJ+1WDAVwFWJd10jfBaVetj5JBpMAS/vfbR7TaQ8s+GX6jOY/aaM3NnzHNQVtbg1WvKV1tx
	XfFeXtf595WcnDs3aW8dkzx34JtHJ8pd2Y5rkDR4sl
X-Gm-Gg: AeBDies4lhZEK3YnpfVah5+7PnvjBvegVYGs6ruCvtaYGR+2NgJZve7xO30OW4jV8sS
	XWPC7NPZeg4Ifp8jYW6+YL/rlGU0Gy/jlsUJ4Uca3hcdZDU9dSRIjLHAWuC+t1Viy8/ew3OpWyh
	Pb5so+oZqbEKjO1r94s5cmogrwKPFYcvqk5oEW+4oc3595HOHi4WWsQr8GrYQw3LxaqPCGBpStD
	2k/1mE9+498xOH5g3Q=
X-Received: by 2002:a05:6a20:3ca3:b0:398:77ae:8d8b with SMTP id adf61e73a8af0-3a09d099c4dmr37413519637.10.1777113340997;
        Sat, 25 Apr 2026 03:35:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca3:b0:398:77ae:8d8b with SMTP id
 adf61e73a8af0-3a09d099c4dmr37413465637.10.1777113340418; Sat, 25 Apr 2026
 03:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com> <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com> <2026042422-deem-chemist-8d0f@gregkh>
 <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com> <2026042428-blemish-helpline-7d8d@gregkh>
 <1e039dd5-da3f-19b2-ef98-29e64fdd925d@oss.qualcomm.com> <2026042442-luxurious-antonym-f20c@gregkh>
 <xuitjl6tzfl6nl4ds4vdy3637i5cqtjuqntcpqt5fnkx2ogcws@iapcavrwhyzv> <2026042539-swab-active-21a5@gregkh>
In-Reply-To: <2026042539-swab-active-21a5@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 13:35:28 +0300
X-Gm-Features: AQROBzCbHZ9w70YTtp6TmSB59GwDi5IqmqQ6RzKXe3MebdTi8LTOo1dC7YaDYn8
Message-ID: <CAO9ioeXWM74DEa=SA2vSvN_cmXivDth2VSmv2c1SOWtdL2i=OA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: AxyxaYsYUugZn3qZqeYoffxGUkF61dlO
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ec98fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=ag1SF4gXAAAA:8 a=G4jgJTYFYwyYmvXJBf8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEwNSBTYWx0ZWRfXwy0pV6z5WgVB
 Y03B7/RxPI3L/vwvhDCduALyV+QCAh9fH7HP4lTQvp3GMbJVsYMndYyVJpCOYO4Y6WIfTN+rxKo
 A3NPliS5Z2sIvCU1w0r2aGAmFEDhuBODnXzGNv1rvSNN0B/QJ9hD/bWQ5LecT8Fn/b/6CQ2eS5D
 QWhknbLBAEipEWD/M2380roWkc5hnTsdZut7mxMTzssyMib8waf2nLNYO8KOVtHH6mJkh+Nj9um
 qWas3DhRUf0vV/EkQddVYRGZVXkWOtuibU0nDKKXpFM1CJX7YmgFC7dloVdbhH1MFK6aamt7Gig
 JNAbBqIGvj1iMw/6CAPAad4f3BJbV3IsOIkXUYAe+lzu3xA4LWhxxccI2bAk8BZsPYFXcY6dRPV
 rQARJJWfODZaFavlKw8QhgQ1MAlI1GWCfjHPIy1YhbYDtUArdEUM6kz90aJ68tgsdvWE4gaA7BC
 c/W4QVZVTYBNMnU9SKA==
X-Proofpoint-ORIG-GUID: AxyxaYsYUugZn3qZqeYoffxGUkF61dlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250105
X-Rspamd-Queue-Id: 5C9AC465EF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59585-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]

On Sat, 25 Apr 2026 at 08:42, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 24, 2026 at 07:11:35PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Apr 24, 2026 at 03:34:38PM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Apr 24, 2026 at 06:12:09PM +0530, Vishnu Reddy wrote:
> > > >
> > > > On 4/24/2026 5:25 PM, Greg Kroah-Hartman wrote:
> > > > > On Fri, Apr 24, 2026 at 05:15:02PM +0530, Vishnu Reddy wrote:
> > > > >> On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
> > > > >>> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
> > > > >>>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> > > > >>>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
> > > > >>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > > >>>>>>
> > > > >>>>>> When a driver needs to create virtual device at runtime and map it to
> > > > >>>>>> an IOMMU context for memory isolation, there is no common bus available
> > > > >>>>>> for this purpose. Each driver ends up implementing its own bus type,
> > > > >>>>>> leading to duplicated logic across multiple drivers.
> > > > >>>>>>
> > > > >>>>>> host1x driver implemented its own bus type to attach an IOMMU context to
> > > > >>>>>> a dynamically created device. The Iris VPU driver now has the same
> > > > >>>>>> requirement. Rather than duplicating the same bus logic again, a shared
> > > > >>>>>> bus type is introduced under drivers/base that multiple drivers can use
> > > > >>>>>> directly.
> > > > >>>>>>
> > > > >>>>>> The bus takes care of creating a device and attaching the IOMMU context
> > > > >>>>>> to it based on the client inputs.
> > > > >>>>>>
> > > > >>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > >>>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > > >>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > >>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > >>>>>> ---
> > > > >>>>>>  drivers/base/Kconfig            |  3 ++
> > > > >>>>>>  drivers/base/Makefile           |  1 +
> > > > >>>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
> > > > >>>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
> > > > >>>>>>  4 files changed, 107 insertions(+)
> > > > >>>>> as you can not have a device on multiple busses at the same time, this
> > > > >>>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> > > > >>>>> please add it to the bus that you are wanting it for.  It can't be a
> > > > >>>>> generic bus as that just doesn't work.
> > > > >>>>>
> > > > >>>>> Or what am I missing here?
> > > > >>>>>
> > > > >>>>> And why is DMA somehow "special" here from any other hardware attribute?
> > > > >>>> Let me give brief information which was discussed, in the initial series,
> > > > >>>> the iris VPU used platform bus for dynamically created devices and we got
> > > > >>>> the comment/suggestion from Robin to implement a proper bus_type with a
> > > > >>>> .dma_configure callback.
> > > > >>>>
> > > > >>>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
> > > > >>>>
> > > > >>>> based on the discussion, implemented the dma_context_bus and used for iris
> > > > >>>> VPU devices instead of platform bus.
> > > > >>> Why not make a irus_vpu_bus where you can do what you want?
> > > > >> Initially iris_vpu_bus was introduced, and it was made generic based on the
> > > > >> discussion,
> > > > >>
> > > > >> https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
> > > > > I don't really see that request here, I see a "make this better and more
> > > > > generic for other busses" but that does not mean "dump it into
> > > > > drivers/bus/ for someone else to maintain" :)
> > > > >
> > > > >>>> Here, the device have only one bus (dma_context_bus), not multiple buses.
> > > > >>>>
> > > > >>>> Regarding the "DMA" naming, the core operation of this bus is its
> > > > >>>> .dma_configure callback, which calls of_dma_configure_id() to map the device
> > > > >>>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
> > > > >>>> purpose.
> > > > >>>>
> > > > >>>> I am open to suggestions from you or Robin or anyone else, if there is a
> > > > >>>> better or preferred way to achieve this, I am happy to consider it and
> > > > >>>> rework the implementation accordingly.
> > > > >>> As there is only one user, just make this your own bus please and do all
> > > > >>> of the needed bus operations for your devices there (i.e. don't hang an
> > > > >>> "empty" device off of it.)
> > > > >> The reasoning behind to make it generic was to have more users - host1x,
> > > > >> Iris VPU, QDA on the generic context bus, instead of each of them having
> > > > >> their own. Let me know if you suggest to have the iris_vpu_bus.
> > > > > But you did not add such users here, so how would we know this?
> > > > >
> > > > > And still, I have no idea what this bus really is doing.  Is it dynamic?
> > > > > Is it self-describing?  Why not just use aux-bus?  What is it supposed
> > > > > to be doing and used for?
> > > >
> > > > This bus will allow users to create a dynamic device and map to IOMMU stream
> > > > ID via .dma_configure callback which calls the of_dma_confgure_id() based on
> > > > the user inputs. This bus is under the iommu_buses list to register for bus
> > > > notifier callbacks for iommu_probe_device() and iommu_release_device() during
> > > > add and remove.
> > >
> > > But a device is nothing on its own.  You can not just have a random
> > > 'struct device' hanging out there that does nothing but iommu, right?
> > > It should be doing something else that is very "bus" specific.
> >
> > Unfortunately, it is a pattern of IOMMU-only devices. All the actual
> > programmig is done through IO region associated with the main device,
> > while subdevices are mostly used for DMA buffer allocation.
>
> Great, then you have a "host controller" for the devices, and children
> devices on that bus, with proper drivers binding to them.  Like all
> other normal busses.

I see your point.

>
> Yes, writing a new bus is a bit more pain than it should be, one of
> these days someone will get around to making that simpler...
>
> Along those lines, why aren't these new drivers in rust?  :)

:-D


-- 
With best wishes
Dmitry

