Return-Path: <linux-media+bounces-53811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLTCBBubomlI4QQAu9opvQ
	(envelope-from <linux-media+bounces-53811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:36:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C81C11F3
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBD4E3103352
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4A736F43E;
	Sat, 28 Feb 2026 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kltBAFth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeahVZvb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912436D51F
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263890; cv=none; b=XwVK6vb/5rIVuXZje7Vcyj0el6atX3Z4ZjFa+rwmVfzfpKSnnx9K/rtlVZeIj+BExteNM4FhYStxDKykTg8I0AnfgsXsnKrbwdj2GOS+hn7dunywdTXOcdLzpFv5WYo/1pt070wDQkx0Eyu4UebnrUPO6iJxf3cflGOt9PEZRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263890; c=relaxed/simple;
	bh=0hpXyAKupsYx20QK5LU24bxIUf4zGuuCPOC0wLlS610=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbWmfstHGLSiu0J4founDpkXE9jSMB3LP7kyGBW3eXH/Jspl0R2TFpnqpF4+dT7QIPIFgl/sWjhJSk0gDrACC5CmDR0G0lXiAR6T/vF5QsZLgnhmpXcroZrAyPW34v3tQvNpXiAAJuJo+Rr2ZGPmSYTHgbYzm8NkBxFSCpr089g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kltBAFth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeahVZvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6OoX61718750
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fYIdXnJiTNYA86ojQfMfZlVy
	fuRE6VoZ2Cddr4hiJO4=; b=kltBAFthS463PfRaJ+OxjfybWUMpMVn494WMXU11
	dPq5ToUuT1wTqppYoSSLGJmi7sYxmZS+qPwwuNKEmuZPDXkjDa9eBY4aFlJ9oslL
	DTjPhfQjox/5y9N6+4fGZU0OsLF/bWmZbEJCe+uRuxv49ga+G5rZ+jvm/xXk0wh5
	UNIQevBzK1W8+AY8bhK7UjuPVO7JyqI02tpnjFF0VyGk2PnVEnYrxZzGj2uxBRLu
	EHxgUgtY9sSTAzMLR+lv9AeQtf4QZFgLLBo63YL/7jr6fpuB949lf9zcu/rshaPz
	O6QyIRsZNtEUmRlU9/rClUlmusFbepR8iSfg5wDCFgmonA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg70bc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:31:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50340e2b4dfso120805941cf.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 23:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772263887; x=1772868687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYIdXnJiTNYA86ojQfMfZlVyfuRE6VoZ2Cddr4hiJO4=;
        b=FeahVZvbw+jCoMuspqxNf+t7wd/jU7rggF4j2egYtqSQV9ISocryRT/GGiaodlgGDX
         gjirJSYZfiFclr11pPb+UeTqvPXl6+AI0hkJZXyfd1v3Bdc9g4UVRPeLWiDSjzJY6SBr
         qMPdnJrFFhmwSPh6WXQRo1JMpXVsmxEm6Mt9Aplr3ClcxZpRWAzA70RvzVqJQbpqfOK4
         Pbo8or06+zyo32PMjMBrVIeOOc8w63+AuBFQv5ckOzRXlF5/u9GKH2RCr/zFBrhley5G
         V/MiIwOTGVuUDRlVrhHgZLp7jjhaD3D4UMunhM+nRdFtaXvUJ+787y5/f0yOszp/KxCW
         3MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772263887; x=1772868687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYIdXnJiTNYA86ojQfMfZlVyfuRE6VoZ2Cddr4hiJO4=;
        b=K2ka7vdVp7AmPdFzNEHVrgc2az52ik1uazVdOiPWblQ0v5TukobqoxS9Gn4SwTbm6m
         jZ/Paj0yHdVW5SxCCo/pP9PDZpSl2gwmp9cEYE69ueRJTA/0cEla/7o64Kpi01Kwl/9C
         pecWzhG9Y4jOIrnNn0RkU4fpv7BkV9q4hhmSKhmmwFR1Sn9ZJsK8M1avmhgmhYgzg1Ru
         RVyXSueGgOXNgfNbe3y3McTTbM1yD/rTis06LzE8zEScjcnH/wSkXWZqNBnzJfXfGMhX
         YGw/oa6xtJXBz3TbYN375xP4x0XHq/15W9W99pz6kuR5xH8mPCqkphHLJkIiIc9Sk7tA
         BwFw==
X-Forwarded-Encrypted: i=1; AJvYcCWOiRvMfdvYtfsCqWsYWAu7+2pWfnVPLsv2iXVtXNDprm1/585ONhWsNToZF9o5vc9V14ei2F/S7T9PGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13u7veOPySJRumuNpjo3ZyKTZqHKvj/lWCTh+ZZHp9ppTK1Gs
	Cn3vQxDzkCEAmjT15WhcW8cT1iURwXzzSwbM7AHF6HpNhGpqMqYkiRofG5KjLuU8AAU3EaHC/n0
	g6kENpu8W8jaPX1TN5aS98WluA8LSFp6Do6FxKz64Jiw/ZtBdbdZpBBuq2KvO389MPg==
X-Gm-Gg: ATEYQzx9l1ubqiyDEvGqMx7Ha8d+YRL1GLgA4hStYT/n8DDbixxV7TP3LT4kExV+sg0
	ktyuVSqoNWg5Ouw0YsdbpFNNcIBs118mmgOqSqSJbJUYaIY2dSxBHyOQpSXGBPI/EthXGDLbB/Q
	tc49q083yb09TcXKw9p8NUxwMwNrHk4qmqTSNzy3HDH/CTtra5RBdfYI6sfvtOcPwYFjvlS6dRa
	uxIAUP3u48fE7BrIZmUCeNW8za+1ugclAFdIa++a9fbUklLTQZmXztywsRaHAlCQZQLOt/Z64y2
	Ts4oDAcWruwUk9Bgamk/IeTi1JEyuHyt2wMr73Otk/KC/ru8lhB8gfjOVvMHG2SvT7qcw0uAQ2i
	2YjU0Ta2BHzGHTXSS22o8jtxuO1h1KY93VL0DoFE/jlhU5Ji1MGH2p3SfV071Kp3L4vGNqPZFW9
	OQAJ4E9E2FDEFmvfkZbmb3I6PFZ07KcF6CXyE=
X-Received: by 2002:a05:620a:29c1:b0:8cb:55cc:6245 with SMTP id af79cd13be357-8cbc8d6f198mr740531485a.12.1772263887381;
        Fri, 27 Feb 2026 23:31:27 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:8cb:55cc:6245 with SMTP id af79cd13be357-8cbc8d6f198mr740530285a.12.1772263886948;
        Fri, 27 Feb 2026 23:31:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca099sm424138e87.32.2026.02.27.23.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:31:26 -0800 (PST)
Date: Sat, 28 Feb 2026 09:31:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 7/7] media: iris: add platform data for kaanapali
Message-ID: <vxucx72fpppn6ujujht4whfanbv5qs3i24cxo6zgdjvvxaaoty@twwljn4jpoes>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-7-850043ac3933@oss.qualcomm.com>
 <de8879ec-02cb-41d7-a16e-aa6d4aab983d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de8879ec-02cb-41d7-a16e-aa6d4aab983d@kernel.org>
X-Proofpoint-ORIG-GUID: UQp1cy992_rHydPxZvJRSbrBRnQLpQcZ
X-Proofpoint-GUID: UQp1cy992_rHydPxZvJRSbrBRnQLpQcZ
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a299d0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=1ZbspG3SCIlgkd432K8A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA2NyBTYWx0ZWRfX36fgd1BUrlE/
 Oc6XhZvsCFNpWgqffi4FZUM4YQcMX0goYr0YxUn9syUdENPsOMtiXy17WV9htfF5e2rosDf6o7A
 r7ZBoeQJg7QbR97AycHJmfP1T/rGzWMojUk28yv61fliHmKqtrCsqkoobzbrJrAC6sJ1+GEj28t
 SdD0gGeywubKMhX+T92SBggG97F8L1In85ysAE3P8TVo2T0q9+oIKmt4Rd0nWH7iJV4K1742S7g
 pakPE9rPxgZzlA0I8m6W/DJQSUzmQGSJSiFuwx/wjmppwKpp3l4OoqiMwq4Vg4BSHxik2jo9CeB
 seYzA7LOBN949evgtfVM+wdHPSJZcT1NcTxvt9VO6Pl+GjwqZQ79VxjZRN4TBK+NOx9XfaqtbqN
 Ki/e6f65L3w1EkK3ML1b5J871lCJXwB6XNDvtsFSdDf/5/intoOn0xZOEvdpkUr0vojMC3bnOU2
 c4JpwPNPKUFYufF4sZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53811-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 642C81C11F3
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:48:31PM +0100, Krzysztof Kozlowski wrote:
> On 27/02/2026 15:11, Vikash Garodia wrote:
> > +
> > +#include <dt-bindings/media/qcom,iris.h>
> > +
> > +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
> > +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
> > +
> > +static const char *const kaanapali_clk_reset_table[] = {
> > +	"bus0",
> > +	"bus1",
> > +	"core",
> > +	"vcodec0_core",
> > +};
> 
> How many copies do you want of this? Data definition never goes to
> headers. That's standard C rules.

It's not. It's a custom, but not a rule.

-- 
With best wishes
Dmitry

