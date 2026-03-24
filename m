Return-Path: <linux-media+bounces-56891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCYTHGq7wmlilAQAu9opvQ
	(envelope-from <linux-media+bounces-56891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:27:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D7319010
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B39D3009F0A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 16:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5253E5EC5;
	Tue, 24 Mar 2026 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf+1OD7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOvENNgn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6404939FCC4
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368996; cv=pass; b=QIu9wVXLasguiA6L+OM7F9bnfu746mrpvWaG+hu83gkSY1huZr4m5C837BXhzrKons41P5usQWkOQ7KW5hOUECBN6n9Tb+sPYqjhOIRy9c5Wzd4KR6pU5zk4+DY8TEewUj1USvKSq+YjZk18XMvaOF1oOW4odEb2DQe2OR8NxNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368996; c=relaxed/simple;
	bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIWqruz23OIN0Dsmc4i761VyL+EUF2paLI0J57LmmR71L5V89BDL7p84Fds0vxcrjq1slUxKySn9AXLXsu4ZGyz94z6HO/An9m1Bq78Z3V92j+KbAiEtMJm60EVgu0Rm4deVK77rAReBft9fZrMhatMhwsnxZdDA125OXZrBW+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sf+1OD7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOvENNgn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ODBZ672371366
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 16:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=; b=Sf+1OD7d2Tp9RKS6
	F2xueAxJawlJ3sO3X96HAzDwTNMTARGUuzZTq5GhmyvvEh/F2rw0Go0t+c7IFCKn
	dThhlVH0MLxq6IuLTANDXEH95InmbIkg36BgtFCQ+HeDxTMPK92VZmdIiAI8NE/t
	VnbsGpmXaBAzlmZbQkySow6i1YSjr4gq3Pi9Z17kUqvSZw3sliCkh7f5LJdx78BD
	Xw7PuZZAl65UT3q4xy7Z3QPASW3QoMQ46VrKH1f185qU5tmfwq05cwAjy2mSBSnf
	Hx94FHHGaCKVyuD6Xu/o1PDKrsSEYiCyd59g9JUJk7PckbbNl5pIz/sn8fhW7oWQ
	rVRb4A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p83215c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 16:16:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c53a0264cso361627186d6.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 09:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774368994; cv=none;
        d=google.com; s=arc-20240605;
        b=Tm9gWwLPUq5gukf8MOGCdMmplr5GgNkw8rYlQzpOuHUqDi6LoNPGvs+J/8wttYpbG2
         p8Koe6Qf1Ocizi6JLRwApmiTxNo5WTO4b9Qz1J97/Q5rLNERRzdJ2xRrxxindsxk3K6D
         9+4JeUh8hhDzQ6NYVmgsiCrn6y8u/zx+VZex+LVqy6d7fFuUt+yJM1TYsFE34+0RC6d+
         2iz52nwrMd3twdxo7uq3GPyClev5YTg/UlnVyo64iKZCQo6gCcNAOtm00T+wGgv9hBZm
         XleM45RjoKvdGguagHh2bboxTxYHC3VvvcIVWF7Krm5y8ZL38aEY/qgBfPIXzgfU5XK4
         cveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        fh=0V966tYKkGTofhW6kdGhdukBUMJC6p6Bs5E3Qpkk9dU=;
        b=HfbyEJQAqvQaGSPUoVm/EcK4ck/N29X3N3nr80hfzyb7QhUE6CoiJzq98MxPpwvNeT
         lOELJzkt0dywOHmS8+bHT7OrrQh8XpJ8PObS1G11+KObW3sNEBGdc7hm9v6Ej0LmgLFN
         TFID3JbjMLGwKIC0Ar9NYujVaE8YySdbMaiSHoG4G8kGgmB+izB/m5w343NrUWpk2FS4
         kVOIS3VcHST4J+CIj1sm5tZFdscP6eaet0AL6DLe0r9WisbFTUec+VC+GwPdl0dHCRF9
         gjoer4ukTNTYMqnEpdlpr7Obbx2bp01EP/2uugruuYsYxCnnQagkBydfzKS4dybVdNHl
         BeEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774368994; x=1774973794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        b=JOvENNgnwtqu5vHjno3XpcWfdwD0PehV5BMnnkzeo/AY6h4JSBiDP/RvybM5vx6XNm
         TPunbZjSykhKyrBAAmd8Fse4HNTbt4KuNLMy1p2BahH97reVLAuv1Vzmjz3Vh/+uXaqj
         4X7g2sX7rOvWlk4EizyUMdd6Nbj+Wa6uXQk2qfsCysad0WpGZYOaA24M4hrUufF8CqIN
         7tQHnJLl0jN/EepCajwn/LTO7Cqf8quIuVxEkx/5Eroeh8y8r9JyrOztaPn1JXa0ZhIW
         oM6jIwNr2fIdBYVGgyODKG/T1KPqrsM5k9prX29wK2FtKdjwvihwgQKg3EJv7n3HiqVi
         PbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368994; x=1774973794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        b=KFEYAAmEVoeQeG74OSnRPBNk9RpDsegsxeCqvwZx2FHmvTHck6GGA+tCIRKLfcnpCW
         P22kz17OI4GkpJ3GCYd/xdXBcPLoWuidXBFfiKGcsuZvapa5Y2ooyC93kTdfFUDvKkZl
         xMpVWa5Q6zUoJfXnr11SsZ0TRmFqFEl/7kQelOHWMYeN0Gig4kOw0jWM1CBxjzQaIr/h
         QauBhu1Pq91VyNhhhohYYl3KvDfEhXgp2p+BNna32MWn5lLYniNXw0y/YVzwexZPw4SV
         IrmRfcEzTnJ/giruaMJnbLjEu1l7BOAOhvf8TcWR/eAKbsLWz1bbnM8I5X5NNYEdA7jt
         +GhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPz7rW+Nt6hWjA8MVPHj+aaWI2Zm3aV/npUY+eyRQGSv1Uw2rGS1bIX0xNNNTn9c0N04kBrX7WH5uEVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKakzC4ruCj8F9KUNdNWC78sHIgjL3vW60+RrUSPcRZpm8NbZq
	MXbFoZMSDIaPwGD5LJfDW0rXi0ussgJeTGd7FcxWn1AaRb67P6NtNUT2+AowZCodixbsP/lLw7u
	nJbCXkkAuzhz9ksDZ0QgwGrrQTcKnEy8gH8fIzFIumL2FiyYReTf4IWRNlxw99TsICzyg1jpB4V
	EjOjIjvDdRyMME8hdInvturV6M7VT6dPyISQ2AVsds
X-Gm-Gg: ATEYQzwsNxkFjve7yARaX/jZIvPyIltXbJSu7xNs6tQCTBMQ+BACFroy3yduDWC7G16
	urvKz/7VRrYGblPUcBa4xFdyeTDK9/cDpGKZ4aLbV3aGV5WRRnb9JaI04Zvjqv82jcb11dCOOuu
	37PKXWFzF75jJr4NoleEs6M4FgIVIPcz1PfUKckSDtcWztRYGX98MGQLDHHhHTjYM1KN7HK/ex5
	EVpVqhV0pyTKLCvqOGNXjifXq+IVRd364fEqHiCEug/xkLAw1DRb5grFTHayeeanmdf
X-Received: by 2002:a05:6214:2f87:b0:89c:5f6e:451a with SMTP id 6a1803df08f44-89cc4a557d0mr3475716d6.21.1774368993407;
        Tue, 24 Mar 2026 09:16:33 -0700 (PDT)
X-Received: by 2002:a05:6214:2f87:b0:89c:5f6e:451a with SMTP id
 6a1803df08f44-89cc4a557d0mr3475306d6.21.1774368992884; Tue, 24 Mar 2026
 09:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com> <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
In-Reply-To: <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:16:21 +0100
X-Gm-Features: AaiRm50CfCX5e406-SjUGjRvLfpq6TLF4DIoGNMk1PfpOJxIRVlPfNKIXGSI09k
Message-ID: <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyNiBTYWx0ZWRfX5d/Pn61OPUFw
 5H/XYDcS8bDW2LPvsmJg5EiDsZEucS8bSOlYz9YG0sVOeF6JgQ0aDOyGE2jjvGOSg6503ycsnLm
 b22pRPRZGb0yyBXcbEoVHNmBGxNV79PN22crbcIVb8PZUnDPNGa3zQXf+XN+xwT0SV8mjLXPkhP
 EGfbnXV42ONuB3N/BRMqRvA/CT04pvnclBnGiLgZWc6XLohZg+z5Dwl165ouylRKBPzeCQw4f4D
 B2FWwGv3yp6cSw8FR6/PdUxeKKDmBPH7epakpx0zE15Jz3wOgFnS6hkCqPOHTUsf+G9XrGSknS6
 9lV8R2sbd8v/C04Mm0pC9GBPGJhhLMy1Jt4R9vNG2aWYmrUsSpIZPKRjO0YYiiEjosgPAgCavUS
 puEG5CSMHB/lUvjMVbnYgVhx+Dleo1548xnGhu9BJkv13kvbGFqUBDQQFcMg/6DpyxqJpm+jLk/
 KHOFS2rDg1JKytq6q0w==
X-Proofpoint-ORIG-GUID: M02G4FIzdvBG1IkX-e5DZ3X5GW5WWvlz
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c2b8e2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=MBiyE5VTy_gmSsX4nV0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: M02G4FIzdvBG1IkX-e5DZ3X5GW5WWvlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56891-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: AF2D7319010
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 1:54=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 23/03/2026 12:58, Loic Poulain wrote:
> > This first version is intentionally minimalistic. It provides a working
> > configuration using a fixed set of static processing parameters, mainly
> > to achieve correct and good-quality debayering.
>
> You need the other 50% of the kernel side - the generation of bayer
> statistics in the IFE, as well as generation of parameters to feed back
> into the OPE - which requires a user-space implementation too, so a lot
> of work there too.
>
> I'd also say when we have an ICP we should be using it via the HFI
> protocol, thus burying all of the IPE/OPE BPS and CDM complexity in the
> firmware.
>
> Understood Agatti has no ICP so you're limited to direct OPE/IFE
> register access here. For HFI capable platforms - the majority - HFI is
> the way to go.

Fully agree, this is exactly the point where we should sync and work
together on a proper solution.

As a follow=E2=80=91up to this RFC, I already have several ongoing pieces t=
hat
aim to generalize the CAMSS ISP support, and I=E2=80=99d very much like to
discuss them with you:

- camss-isp-m2m: Generic M2M scheduling framework handling job dispatch
based on buffer readiness and enabled endpoints (frame input, output,
statistics, parameters).

- camss-isp-pipeline: Helper layer to construct complex media/ISP graphs
from a structural description (endpoints, links, etc.).

- camss-isp-params: Generic helper for handling ISP parameter buffers
(using v4l2-isp-params).

- camss-isp-stats: Generic helper framework for CAMSS statistics devices.

- camss-(isp-)ope: OPE=E2=80=91specific logic only (register configuration,=
 IRQ
handling, parameter=E2=80=91to=E2=80=91register translation).

This approach should significantly reduce the amount of
platform=E2=80=91specific code required for future ISP blocks. It should al=
so
allow you to integrate a camss-isp-hamoa (or similar) backend, or even
a camss-isp-hfi implementation for the M2M functions, without
duplicating the infrastructure.

So yes, let=E2=80=99s sync and agree on a shared/open development model and=
 an
overall direction, possibly even a common tree, to ensure we stay
aligned and can collaborate effectively.

>
> I'll publish an RFC for Hamoa for that soonish so we can make sure both
> coexist.

Ack.

Regards,
Loic

