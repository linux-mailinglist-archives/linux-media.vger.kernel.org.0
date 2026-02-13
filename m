Return-Path: <linux-media+bounces-52718-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ImLAaMIj2ltHQEAu9opvQ
	(envelope-from <linux-media+bounces-52718-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 12:18:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E12135AA2
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 12:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7A01312460A
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 11:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F8B3559DA;
	Fri, 13 Feb 2026 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIMN/65u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LckMg2+V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42886341
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770980944; cv=none; b=oXAZDmRosQsynRu97ftXWqFVNscygOnjYOSVZbeHwzx3itmJ5x1y3cgxM/khGgHbIUnjW/pcvQyvGLXAebiWnazkZ11ACx3dmyt8HTkCA+NYW6XPgziKj8QjQEOcIPgNtyWlZpovtvxmhFJHV1VB77QJOuVftttOa6srzGjMAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770980944; c=relaxed/simple;
	bh=vUpystO30xCXUPtZuyORQtJgRvn8tqdlvpwqCd9hy1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cme2BlGQ0RQZ85BZ61C5Iob/Qly2hESR8iWVOaEuIvAdYB+ZQPaXCS1omVVCQJ0DLE9FXVucVYbcgVvyHgORB4jIzMmA2MpWDFhTt94y/7jX5xR2s+Q/UPc8fwAZTp45Kq8tMxu2+xlRTGR+Js5R+/pA4xktgROZ0s2msVPEPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIMN/65u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LckMg2+V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7lwLr3424179
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 11:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dsFDdRSQAJzD4i+v72zp9SgRaVwmD1/UaJtWtm25vds=; b=aIMN/65uiz8tCg0l
	kcLpvJJ2p0qL2UNFUibVa2pMDIhJN9DspWAcg/ehqFaOLrk8YrU8biYVXNmYpB6J
	x8V9iNRqlytnRT9POObqn23sRGSa5hg3/nTVuV9SK8ujaKtLyNulTZ/sqRKz29fm
	b+X68fiJrd2qalQhhmecZHG9S1HmPQf0yKd3w1Cx3kPNqfXpXAfSUbxDE6Q/U+T4
	Nf1w36eMuR4bLV0FiCa2N/Kv43WU76gsGMkx581vbE1IhWMrltKyFsEfg2yBeJTe
	TBkM1v0go5XLPGHf7lcOWe8hJ/EiNnC3xHIzSydoRJVtXoIJ8nv8tPEdObWWlKYv
	xDMGEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9yvrrpw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 11:09:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so337349085a.2
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770980940; x=1771585740; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dsFDdRSQAJzD4i+v72zp9SgRaVwmD1/UaJtWtm25vds=;
        b=LckMg2+VoSH6ld1C+oE/kJPTLg0UFGdA39M70iTawgR/rAG6ITC1RM/+lhV4r3f0C4
         Am4JFCIdZDxr7miTEMZUfJCZ/Zou/oj2M2XIWXIBj4vlV550ZJ7Eve1eMx/gG8DQ3e8X
         S6/IU35ojnRwGJgR43ri3Q67rvBpq51v5NXC7yr6NjJg6ax15mKKIyVj452ldtUMZB+V
         dtts+LU6mvjQ578mcLERiq1neFQ/XjpZNbAIHoOw2xor1BdJU+yQ1/FJ3e5owK8zEaBE
         VO8xdC3NFoUzhRtNA5OoEE/wophYY44zFjG/3uH39akhMSigFVnsmX3joyTCEWcgJgMm
         fzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980940; x=1771585740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsFDdRSQAJzD4i+v72zp9SgRaVwmD1/UaJtWtm25vds=;
        b=lvhIvj54ip3xIWE9v4zrYdm7ms6UoL5UyYBqBFSukjA53/J5ifOikQ7u0LdMOi5+KQ
         RPu/fQ6hDQKCnmigvFpORB1S/oJCYYUxjhL6Ck+uLFwqbbdJ46C/8tUwKhVzxPk/kKSO
         2ESlbZjE32hdSPj+Akv06/YNAScsvYVn+BA9S43YBDROccEXsFd+tZxgNBF3NRfQ355m
         kucA6j6pEg0iCF0FKDYLeyt6iUw4lzHuI0pqQKaBiVz9UPoGXGawQ5xzs02qK+PnpG7S
         LP4+RuyzDrDtxJSEcMcIIPHhQuDd0l//XPjhMTaQAfd/6bLKzg4DHgZ+SmkLAJDGzmAO
         Gw9A==
X-Forwarded-Encrypted: i=1; AJvYcCXECnyTCiZyafoNyJMNvysuiQd6rEAPDuy8zjhpCt2iP3Hy00MrikpPKQCIdrsb8TGqxt5m08QhwctbNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLheoKy+y3mljVa9TZtj2scfcdsNlMrp6oSIz7XJo716cnrh7
	FtgM/5LHTRklQOomJ1cx+prENDk7NUg8FJ6Xb5nJPvaAN7Gyh6DXH2+CqqZ/F1TZ2+C6QRDi7NM
	0usUxwwcNBJOBO/CroD2E+E1zGBbM5cLAkG21sps0Xb8MMc/6o8Vhdasf5/zMxjmsaQ==
X-Gm-Gg: AZuq6aKzqASuPhR2cLEC208e9yN6D/+2hLGD1Wvtqkixy6oLC5H3w9FMyVCalsFi6iS
	FDYFT7vaPIhGRD2caYGmDMNlpx6Rz+odJ6r08DPLAXlYNHs6BWopEI348h65lH3XAQ2T9ElY3vn
	3/u331aJiR1JPTcTEXcEk28mjuP67PZVCrkJrBGYk+9TK7rcdui1PY3hkeCIu75mPsdl+ItN5Y7
	Smoz7/lfubBPcqCpO0X5U6tvJtd8uY1bsAF9BYY55gO+9VagqoaUrDxwRdN1znPkZdcf9N/APVp
	RAwJL2kSg/4GJk7g6MqKpoGwEVLu6RuoAi/lbEMXFpzEPb4BF0+yIXOtbsdg/hGtW+rdtks3urX
	6rplwHj8aNf/Pj8x71rifNknaH1wWULkS4lmygEKS2UlpIbTtihysvqKcCcK//MChwo9fJrtzpj
	Lx2dZu6CdWMWw9GvNwFZM3MyFalm5OX+aK4oQ=
X-Received: by 2002:a05:620a:2849:b0:8c7:139a:bf48 with SMTP id af79cd13be357-8cb42412cd2mr135470285a.49.1770980939921;
        Fri, 13 Feb 2026 03:08:59 -0800 (PST)
X-Received: by 2002:a05:620a:2849:b0:8c7:139a:bf48 with SMTP id af79cd13be357-8cb42412cd2mr135467385a.49.1770980939472;
        Fri, 13 Feb 2026 03:08:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f5fsm1507989e87.56.2026.02.13.03.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:08:58 -0800 (PST)
Date: Fri, 13 Feb 2026 13:08:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <ruflywokgeuoahmu5ecabs5bgfixymc6al3okuukb3goddut64@2vs37t7h536h>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <FaJyQ2c9oLW2a2qKHDI_zfRx4G_Ee4rzdjImb7o3bKnZAo7AzRDgokOBewYZCNdqexEEPhB6nmPEjkmS72Kalg==@protonmail.internalid>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <5ec260fd-b8ae-4c54-863f-de9e684bc543@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ec260fd-b8ae-4c54-863f-de9e684bc543@kernel.org>
X-Proofpoint-GUID: XaoxrUZJ50fDXFSKQMwfoiR3PJVjTqfj
X-Proofpoint-ORIG-GUID: XaoxrUZJ50fDXFSKQMwfoiR3PJVjTqfj
X-Authority-Analysis: v=2.4 cv=LNZrgZW9 c=1 sm=1 tr=0 ts=698f064c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QeGKjAVUF6DEba-xYkcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4NSBTYWx0ZWRfXwjIbBuCAZqVz
 fineMEli8mfZe+76Y+vY/b5QvaA2gpAUnf6bXlwJ7EMjsQRqYgSq4aeu7wGk2/mpKOXt0H4nSIl
 U42oJwzKt4c/TlnC1z+WJr5R4Xhjl71NkP8QlMpFUmhwgPpyVUW6ehWtmlpWHqOHbLGa8+48mjD
 E9qvCir85WqwESTSC+dtOERRB+ySUEFbYn21GJbYfKx0eX7tEkmL153vQ4yQNmZiSaXNzUmcOWB
 noZiOnOXEylWkyzZwmyp9GIO5Xr3SeuVHTzhMpvgHOaj1tiOOm9bTOknAn/tPASijzOLzPFxipD
 l6gmtpLaFn1psZc0nXGrJHuiAalguhaPqOSHoVqepsjRpJ2QmeKXDXWtyEdyfQNdLSS+wfp8ynY
 /+uy24nBmjd78qeICqKIHXUO+x6TYVCIgQad83byyC/jC63nmcHXHfAn3lmGdpla6bHE20nFeHf
 rMawtjy7e3aezgIKZ7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52718-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73E12135AA2
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 01:27:15PM +0000, Bryan O'Donoghue wrote:
> On 12/02/2026 13:05, Dikshita Agarwal wrote:
> > 
> > 
> > On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> > > On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
> > > > 
> > > > 
> > > > On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
> > > > > > 
> > > > > > 
> > > > > > On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> > > > > > > On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> > > > > > > > SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
> > > > > > > > use Gen1 by default, but boards that intend to use Gen2 firmware can
> > > > > > > > opt‑in by specifying a Gen2 image through the Device Tree
> > > > > > > > 'firmware-name' property.
> > > > > > > > 
> > > > > > > > Based on this property and the availability of the referenced
> > > > > > > > firmware binary, the driver selects the appropriate HFI generation and
> > > > > > > > updates its platform data accordingly. Boards that do not
> > > > > > > > specify a Gen2 firmware, or where the firmware is not present,
> > > > > > > > automatically fall back to Gen1.
> > > > > > > > 
> > > > > > > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > > > > > ---
> > > 
> > > [...]
> > > 
> > > > > > To avoid accidental matches, I can switch to an exact filename match
> > > > > > instead. That way, only the specific Gen2 image (for example
> > > > > > "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
> > > > > 
> > > > > How do you detect that for the OEM-signed firmware, which can have
> > > > > random name?
> > > > > 
> > > > > > want to use Gen2 can opt in by naming the firmware accordingly.
> > > > 
> > > > I Explored on suggested alternative approaches and seeing some limitation
> > > > with the both of them:
> > > > 
> > > > 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
> > > > It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
> > > > the version string. The issues with this approach :
> > > > 
> > > > - the version string has no explicit marker that identifies Gen1 vs Gen2.
> > > > 
> > > > - This prefix is not a formal ABI, and it is not consistent across SoCs.
> > > > Each SoC family uses different naming patterns in the version string.
> > > > 
> > > > Example : For SC7280 Gen1 we currently see:
> > > > QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
> > > > QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
> > > > 
> > > > So the driver would need SoC‑specific string‑matching rules, which is hard
> > > > to maintain if we are looking for a design to address all available SOCs.
> > > 
> > > The only SoC with such distinction today is kodiak. So we can simply check:
> > > 
> > > if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> > > 	hfi = gen2;
> > 
> > Agree, this works for Kodiak. However, Dmitry was also referring to other
> > SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
> > generic way to handle that check.
> > 
> > Also, please note that the Kodiak Gen1 firmware uses the string
> > video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> > 
> > > 
> > > 
> > > Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
> > > solved for <=8450
> > > 
> > 
> > Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
> > 
> > Thanks,
> > Dikshita
> > 
> > > Konrad
> 
> I really don't see what the problem with Dikshita's proposal here is after
> all she literally controls the firmware name that goes to linux-firmware.
> 
> Presumably you can attest to the naming format you have-sent and will-send
> in future.

Is qcvss8280.mbn using hfigen1 or gen2? Is qcvss8380.mbn using gen1 or
gen2 HFI? I really, really would warn against hardcoding something for
kodiak only, because at a later point there will be a business
requirement and some other platform will be upgraded from gen1 to gen2
in some other way. Also, in many cases, we don't rename the firmware
provided by the vendors (both inside linux-firmware and for the firmware
shipped with the device).

-- 
With best wishes
Dmitry

