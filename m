Return-Path: <linux-media+bounces-58187-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO+cIQsH1WnMzgcAu9opvQ
	(envelope-from <linux-media+bounces-58187-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 15:30:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A003AF26C
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 15:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 670273036104
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 13:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511543B775D;
	Tue,  7 Apr 2026 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtGfXzhP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jerb/1vx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329713B38BD
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568504; cv=pass; b=iiGWLn7yFFDla6favvk77iFhw/a0rm0TZeUwkNCbIQk/VPE2VIeRuww1+e3EyUegikJk60u09fo0kltRzxEGYi3p9Iew1IIAnD1Mr1XnH7x6IQmhtFav58X5i7nas36OVWr9ZKssoKf0l6+rM6noAf8v86MFB7FSDxYgwz/G8d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568504; c=relaxed/simple;
	bh=3pOru3AI31M/7h4/J1wCs9vsJpaSVKgPBYqi+q3nlak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSqjNTk0XwM+eC54TWPf18HfENr5SUJWnFRxTsniEKsuLEfaYgw737QmonKgQ6iISoxZ+qZ3uUtpYWOLuelSiw/gIOtGOohpIPj/YKdpX1GtcP3U/+6T991N+Ynjv0L2O1xGDzI0WghqgqImDldqgKev2J2RV3jbpY5gp1KqHOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtGfXzhP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jerb/1vx; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CL5gR3536841
	for <linux-media@vger.kernel.org>; Tue, 7 Apr 2026 13:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3u3llKzVLDQQ1FlFCEY194yhid55v7vOzxTYrGz6xOU=; b=BtGfXzhPfChAEVCy
	xpiyQDSs/fGZP8cjWz89crppBhT+9xZ5t/LTYmC4ddtYs8xEoJGeh8/UKJmzuJ2j
	jX73Vt8nJ5JEdtWPL0QPiG7ueMw3k7jQetD5WGU1ggIylvdhwxG7f1K+NtY7RtGP
	3itgxU9fZtBkPGBxlZ922aazNS34tjBa8vdvGu+8t07tlTlwxzGioNubVYpYpQP9
	WYZFmordBwNB99tV5yjOa+2IotiWLqi4J1g60UC1YpnC02+QAmUbNhdZtznk4yF8
	omBceh2k+cv673/oRvFZ3BcI8A1uJqx/Cz0SIBFu129cDFTFybBwociSLuLVxd9R
	WDKa2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2vsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 13:28:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89f670976acso142800266d6.0
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 06:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775568502; cv=none;
        d=google.com; s=arc-20240605;
        b=CEkC3E7sOS84RLA1KWrTo73MYUoELG4IH/irzNA2rVN/SgyAIwL1shuospHlRDHR6U
         vcmczl0Tr46aTeCArpGLsLcwGJdTVuIwqAR7Z0yJyAMX27EHOVN+MUa27cYRhg0ZWDgK
         kr7ZzI5yAN0smfOxvLWp3gyZ0R/DjohPj8YJ6maTzOg4nfL46YFeM9qEzZWx5J930tzX
         vIFRbsK7w6pqBi3SdeXIV2qBR6+vfxdysJMwjvs2zIRO538b0t5GIlK8E43Sw7zzGtS7
         J/S3q2axHuMAU+16CxIkb+u2Ww5C+M9h4jYMMDrj6/Co3Ke5V+l42rAb8nMB8dq5RPlh
         wVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3u3llKzVLDQQ1FlFCEY194yhid55v7vOzxTYrGz6xOU=;
        fh=xUbBRnaHdhBChWZ1RgS8ivSX6QVrnhJ8M2agtX8G8zY=;
        b=ZKKJxG+puLzTGDxDCsZ8VaMA7olpa0oEEAqHMaP1hak3TEasTAB9c/vFc7DgGsQoS0
         J2p93mXbU9wFnG5OngcR+izuBYmdatx6vhtwBD2MsScJNCfW7GFM0FllnARkO+AxdcrX
         Qy4KWOki3kTNqopQg9O/XOHUECENqkR1m9A2c4uQYXg0MeO91DQ90aREr1FBgZT2XMJQ
         pn1oS8YWHxm2Hs2scJfe2VAVUT1Z5yHbC6pExuq0rdwB30qQLxU5NEBpBDR7BunKzIIH
         PavXRa1YNR688uJtal4IWYyilTIz3Hsxiktu/YO9FYQLkeCVd5nkyP547TNBXOJUEzPn
         JmLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568502; x=1776173302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u3llKzVLDQQ1FlFCEY194yhid55v7vOzxTYrGz6xOU=;
        b=Jerb/1vxVj9QG4HFakiUyKSqV3ryifUYxTvmog5+bJV+Xq1YBJqZ+bqRr3ZH1xuLhU
         5bDPkJm3d+yK/bzzEbqNvXigo9ZRuhCiKp4OtZ7Qme97CnkGC2deS73o/yeRxf4aIK1f
         zLO+dyC7jMmtOV6FTkvLryq7jwIdRIqnj8MRLWh1LJxay3e28MgP2Var/ouwEFvi/lbI
         DG4pjcay02TaawsEtptsR+iIbXrIgxINjgYUHtZ8STYBsJdpDWbjXPO3iP1mOTg96Sjj
         QCBkOq0HX2PO0k5ODmoq4d2HcBIPH4hSyNaZqbdB9Fmvr+GctqDh2g/foBtsGb7A/bEP
         J2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568502; x=1776173302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3u3llKzVLDQQ1FlFCEY194yhid55v7vOzxTYrGz6xOU=;
        b=VZ2PRDBbRJ0fojQUCjVCFDIHU9JyQh9pY7HqGIjyO9dbKS8iD0uSOewC1SczkTA+UK
         qDPg0rf2qRP3Sh1huHL7f7vMnn3BduGOKFvS9qe0saRvsigQYEhvD+YndfsaMNRIGSrG
         nSDep3y8kgVoXtHe8dfBo9ZxwR1aX8AgS/as5R3EUo3cFDYem0BsoqKcIb13znku01Tu
         QaJKS3RfNOP2WrDJ+OXLDDudHj5tezloxPR9QhgFk5ShLKlT3L2Znmtr86Mxioq+Q3/x
         NZFazTmosMVQhC2dS05+uyEl5kO4LJqkRarqw9RHxEqzrs0LjOfZId88a/fhTKLbiW/0
         M3JA==
X-Forwarded-Encrypted: i=1; AJvYcCXMViICdde8vj+7QEUG5UpjZD/XddLGfibUfYPt1oHYV5DYGinA48RnA7lZs23WSmB2ko0mmPVuzzNF/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw91H8imnhXbYHtoFZ3KqtMrNkXdroGJFFVr+RPc9Ggvv5rHcgY
	G5xoMcS9NmVTBhG6WbrSH0Euejy7X9GaQ2Q71FugjlOk/liIuk3QvVfvIEspv50oC1P7eXRIJMe
	WSLFbKG8GboFt0waJrPXK+y+MOGgxx+GPD2FwnZihsh5hohjYdYNesbHXgAAkTJFKMTrdiSoL6S
	ZAik5wwfC2kP9x5ofc5642V57XbIJqGp9pJYI6Lvhg
X-Gm-Gg: AeBDievQahCRtGx1br2G34q8E4gARdHXoVw75BuRlFdFK9Ilh+myRlZyVM/7jpyNbih
	anV3Z31AwruieuJJxkVzpfkr1HP8zD4amw9WIh4jwukNS8+rgqOkDDuI+4c5Y8NeugygLjpZcS1
	lwKRyJoxFHpnSG342YxadyfGBnqQ8P4Sq+CPFHbRAk5RIOvUC4bnPq/CpHt9guM4igIz3f5/a05
	0jRn/WDmVB3NsJqgDkWIXAubZd7y76D57HztPc=
X-Received: by 2002:a05:6214:260a:b0:89c:e5f0:8f33 with SMTP id 6a1803df08f44-8a7022bbec0mr288401806d6.10.1775568501515;
        Tue, 07 Apr 2026 06:28:21 -0700 (PDT)
X-Received: by 2002:a05:6214:260a:b0:89c:e5f0:8f33 with SMTP id
 6a1803df08f44-8a7022bbec0mr288401066d6.10.1775568500950; Tue, 07 Apr 2026
 06:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org> <20260407-camss-rdi-fix-v3-1-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-1-08f72d1f3442@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:28:08 +0200
X-Gm-Features: AQROBzAyNBpy58RNaEmWDuRNdJwyI4yb41s1_d-Hz7TIYwxCes3dmoGPrtgvyVU
Message-ID: <CAFEp6-0PrSv3YpaMUxhMCYwLenD31jWy4xZ-p4R-sHAT9cYWmw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] media: qcom: camss: Fix RDI streaming for CSID 680
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: yBymQVWsdvHa_XIQAenoqtUcIkqh7lly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfXxwEN6yzLiAEK
 t9AJHPPFcI65NNEkd1q4Yz7ZQw0frwXZCUG3AJJBVAWZJZmwmRZk7+juntUwxdEGVK3Tb+r2zCR
 DVhu06tnMgrvyFSxef9Hofbx61RVV4ttlH5gsSdfeHnWUH4EgA1xlte7vOu6SpXQGP7cvURFoOg
 N3DCGpX/siB1qNWo99h6llScaY5vzDmE0ESt5JEo4Llps3mTmsYhXWiQiGUL/aAA4wJA+v/G8Qq
 L98pIgYxHIR/DhVb8ODCYNlG/qVUy8i+hdz/HoU2eAT4E0gCmoCSk6PekDlFX1SkeNN/GAa7B/S
 /VGVSpqtXIQ0ssbp2PY1Z33rh5lY9fdxjyOdyKK+UIE5oK9NCbOukUG/BNxNDWIkE4DnPsUv5eD
 t0JhMsvZt3UkCdA9p1UJBHWxmjQy9C7gUv24YTidqjEEcKcLv1VdR1t155MHThpk3iA3nqZgd10
 X179oOiEGVdRRUV6HxQ==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d50676 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=x3_dpc_kMFUGcRNcKJYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yBymQVWsdvHa_XIQAenoqtUcIkqh7lly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,mail.gmail.com:server fail,sto.lore.kernel.org:server fail,oss.qualcomm.com:server fail,linaro.org:server fail];
	TAGGED_FROM(0.00)[bounces-58187-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 29A003AF26C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM <bod@kernel.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Fix streaming to RDI1 and RDI2. csid->phy.en_vc contains a bitmask of
> enabled CSID ports not virtual channels.
>
> We cycle through the number of available CSID ports and test this value
> against the vc_en bitmask.
>
> We then use the passed value both as an index to the port configuration
> macros and as a virtual channel index.
>
> This is a very broken pattern. Reviewing the initial introduction of VC
> support it states that you can only map one CSID to one VFE. This is true
> however each CSID has multiple sources which can sink inside of the VFE -
> for example there is a "pixel" path for bayer stats which sources @
> CSID(x):3 and sinks on VFE(x):pix.
>
> That is CSID port # 3 should drive VFE port #3. With our current setup on=
ly
> a sensor which drives virtual channel number #3 could possibly enable tha=
t
> setup.
>
> This is deeply wrong the virtual channel has no relevance to hooking CSID
> to VFE, a fact that is proven after this patch is applied allowing
> RDI0,RDI1 and RDI2 to function with VC0 whereas before only RDI1 worked.
>
> Another way the current model breaks is the DT field. A sensor driving
> different data-types on the same VC would not be able to separate the VC:=
DT
> pair to separate RDI outputs, thus breaking another feature of VCs in the
> MIPI data-stream.
>
> Default the VC back to zero. A follow on series will implement subdev
> streams to actually enable VCs without breaking CSID source to VFE sink.
>
> Fixes: 253314b20408 ("media: qcom: camss: Add CSID 680 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 30 +++++++++++-----=
------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 3ad3a174bcfb8..edf01ba79907d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -219,9 +219,9 @@ static void __csid_configure_top(struct csid_device *=
csid)
>             CSID_TOP_IO_PATH_CFG0(csid->id));
>  }
>
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
>  {
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + vc];
> +       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
>         const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
>                                                                    csid->=
res->formats->nformats,
>                                                                    input_=
format->code);
> @@ -233,28 +233,28 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>                 lane_cnt =3D 4;
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
> +       writel(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(port));
>
>         /*
>          * DT_ID is a two bit bitfield that is concatenated with
>          * the four least significant bits of the five bit VC
>          * bitfield to generate an internal CID value.
>          *
> -        * CSID_RDI_CFG0(vc)
> +        * CSID_RDI_CFG0(port)
>          * DT_ID : 28:27
>          * VC    : 26:22
>          * DT    : 21:16
>          *
>          * CID   : VC 3:0 << 2 | DT_ID 1:0
>          */
> -       dt_id =3D vc & 0x03;
> +       dt_id =3D port & 0x03;
>
>         /* note: for non-RDI path, this should be format->decode_format *=
/
>         val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>         val |=3D format->data_type << RDI_CFG0_DATA_TYPE;
>         val |=3D vc << RDI_CFG0_VIRTUAL_CHANNEL;
>         val |=3D dt_id << RDI_CFG0_DT_ID;
> -       writel(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
>
>         val =3D RDI_CFG1_TIMESTAMP_STB_FRAME;
>         val |=3D RDI_CFG1_BYTE_CNTR_EN;
> @@ -265,23 +265,23 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>         val |=3D RDI_CFG1_CROP_V_EN;
>         val |=3D RDI_CFG1_PACKING_MIPI;
>
> -       writel(val, csid->base + CSID_RDI_CFG1(vc));
> +       writel(val, csid->base + CSID_RDI_CFG1(port));
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
>
>         val =3D 1;
> -       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_CTRL(vc));
> +       writel(val, csid->base + CSID_RDI_CTRL(port));
>
> -       val =3D readl(csid->base + CSID_RDI_CFG0(vc));
> +       val =3D readl(csid->base + CSID_RDI_CFG0(port));
>         if (enable)
>                 val |=3D RDI_CFG0_ENABLE;
>         else
>                 val &=3D ~RDI_CFG0_ENABLE;
> -       writel(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -290,11 +290,11 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
>
>         __csid_configure_top(csid);
>
> -       /* Loop through all enabled VCs and configure stream for each */
> +       /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
>                 if (csid->phy.en_vc & BIT(i)) {
> -                       __csid_configure_rdi_stream(csid, enable, i);
> -                       __csid_configure_rx(csid, &csid->phy, i);
> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
> +                       __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
>
> --
> 2.52.0
>

