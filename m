Return-Path: <linux-media+bounces-57680-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GnSFCbKyml3AAYAu9opvQ
	(envelope-from <linux-media+bounces-57680-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:08:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 336A33602D7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C5FB3018F3D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465162F39CE;
	Mon, 30 Mar 2026 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sefp7Lmf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFIm/SBj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D93822BC
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897693; cv=pass; b=jPh/51bsRcwIJOZHePztpvFN/cA9wcUeCMOXcmygHE7u0L7iWSFe+x4UiPQZ71esbtZkOL7ubsVxXHH72AszUzIDkeDfdtmIBlP5NiCjDgxLi914JMS03+j1q4E/BBx+sV88vgHK6RP8oMYv1+0EuuF45IxxdBuL9lHv8t9Xa3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897693; c=relaxed/simple;
	bh=WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWKZCRYxbt2N5M6YIqmZ48EcosoVkfoOktvj1quQE6a/SXZKImCL30noGtQoGLEmeb00SdJ1SEw7ZDlqCBubAb14BjliXBD48gKxyi0BYZZHg5KbDKqnbfFSzzB3moUcmg4Pwq0huEaAN+5OTiWp4ZJTnltw6wkxuj6+u29Rw9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sefp7Lmf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFIm/SBj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIFP89703477
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 19:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=; b=Sefp7Lmf5OaTIcPM
	Cf42n609jgIYdUErNojaWttzVSxaSKUecD6aZ9E6RBsWv0dFuJPHm3f2/Z4/FZmq
	cOEuEKCLasJHMDLLeCwAKIgWRFxyj6Mrf/k7TIa7e2rrfoKhni5aj/HUsSuxPLFo
	eSfrXS+qdBHZPmUfSWO8FW5ivbZooejtKt+jG6CzNn5BzsgS2/wVKZuiwqBAOULJ
	j0PsTngul7ghH5CwFYzF2CBKrL97ynpDfuDSfNEtom/zvbmCGtbZQZAvSlJn2DGb
	weKe357VhpWitEOKevg7ncBszwk8JdHr9fL8Zl8oLMPU1LNV4CbSsB5ULlMJ7LEM
	SZ+lhQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sansjkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 19:08:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cc6879a4bso101627196d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 12:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774897691; cv=none;
        d=google.com; s=arc-20240605;
        b=hAVVxL0JnuFE2Xc76UFpf5fRdwU9bSbk67XZE7rSD1mSfvm1nz8IfWydOrwF2NmZVh
         Qyb8rdLNZkPyPlP0wj6p2O3ZgPe/m+8lQgjtIrSSWDrdev5HPDvb1NpQSqvz+Au1TctP
         qj6vnUrEgC0Mei7bcKKQmddAGaVBBUyN13F4CNGG9Oq6N+AcrtNDKKDrLEM/TB63DGvL
         nxo/vFSXxMmbS5UUVWaAPX6sIl7f/2HhnJsgSWfp7qiqmGSa/s8oVn2VB/LOuU/9CCQp
         +jgvXIw+YEWrYNb8UgIPoy6qCC6eudZFK0XhRj5j5rDiFTZQICUDO6MtLozu+NSdqFeh
         aNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=;
        fh=t6taHljKE7F/DaQC4B/4+/8kiQbVwb4lPKOENC4q/CQ=;
        b=GWAWHDgJJ6mt8TQETnjCepm6w3Hgi0aaCjJcL0GO/xRbkVIxmdJfiPDv7xhiFTm7yx
         vVkAS9MxOfWtH1V+KZQP9zPUu+yk9QKzasnFqYg4N0EUwOhL7+NADx4IX1BD/HoGRl0r
         hcqRsyGeV7g2xhCihfbFynlCB9v/88hKGnvzgKsb3V9PGUaMan9VwgLG4efsftQ3AMuZ
         KkyYMlFGorspL+e0/iUsZGCiW2fFd07pzfi8QP4Ekad9uzm4724YxLEAiO5IPFpfJgR/
         khSdHdvYSiv6HSwzTq9BjofCnWJ8QvRBhFddB0Rb+Cj0bdk7cWQTmiuxuOWouytNTNnH
         hkDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774897691; x=1775502491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=;
        b=FFIm/SBj463XvSb03n6ThnHgDSB+UJtQLU7ge0/Idt9ui3c5/D9VcExttMeBlX4k4X
         LZ9VX3AZ5iTbbtnTPbR6ROBUHz11MEacqOnBXLuABnukHFsUWmDp6ecNc6gjzyNJ1lPn
         PlEMkiYYGn5Q4SFrejU6+klAfHi+cMX/asYBGnS0YrlgS566IdX9V5QDxTDp5iOuJXB5
         LVlIJDtQ2Mk1a5Di3B2Km2rGw+k1240m6yAYu4ZRSMSM1UQzZZaZMmqZi/LZYWKpcwVb
         lZ76J+as9UYxfvlekrFj5CoQ4KGtankJe2BZpq5+A5XPnXBgAVUL9Iyq/LJHmvtPPTrp
         Dzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897691; x=1775502491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=;
        b=BXhRNZuTXT4oqmigJxztOUsv2sedNK4Wm8rqu3lq43RMfT/diReq0TowhK4hDIJ2hB
         JZXIa6OtrvWn713hppVZETK/YMSU9/SgFyIDUB1OzMkfXsbOvsM6aAN183mG+avkqabk
         n6HxvyN1tSrF7HTdnfFY+q0JKbkCB4eUDhpTocMk8VuRu8Pub2Dwe0+f5jFuq2+HeO4v
         nHiGvqcJjN/6YVtn35vkyn/hiJEeO7qw67jPN0MDkQeSDkzv1qv4f3AEOExPoDX3l/yN
         CIE5k+AXZaGY/Vmq8B9xZkkZFbYRLe84dpOR+bHAGfuu45RDKt4p8mWrNUvZ4lI3wa5Q
         Bq1w==
X-Forwarded-Encrypted: i=1; AJvYcCXuPW1bcQ4FlHmsxQFBe4TOz1JB1j1ewNr+wGRWRIZaxgFmI00mDjjHzBGkQgZcCT7h4lAPMULyLcvApg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkfyAK9ZPQOomJt46yV+LFssHbANOJ7PecIry2niLAOlZQ1eKX
	b6M5Py8yuHTYp8TXby7KZZLCDP4zNgAsRPNVql+lf/qD9GOLXs4KUiC9oza8Z3GEgJmGquuodpi
	xzVkPyEZgoTH1llHojAqZya7SxpAz62KAt6mbR9wmtmdYQpOIzygw+BDu1zn9Omni0ESq8uldX7
	BEgy2ju/JOKoQE0gyv0qAogPf7OgXr6W3dGDKt/T0ke9C8ZCTWNYc=
X-Gm-Gg: ATEYQzyZsvd+xcNOS524UP9oHvbfEm6aT4okBTSzd7Ui31gWwtrgB3vIe0flkiHQ65N
	um3xQmisZZdW51KOEPpF/Qtj2Zftnj2IQlgwAEsp3cPgIcnHcvCHqIWYxW9t6uwxWB6A+t2xzsp
	+z4JbkEPMYrWWxPif0K/7V5Q/1JZRDwMyqcRTexJtsTURZ+hzyPN39faZR2CoBWrxwOmjDYkMFh
	dXr0JaRbT1ysC4b88pmqDFBLhPx5CltxjTiMak=
X-Received: by 2002:a05:6214:c68:b0:89c:c713:ae57 with SMTP id 6a1803df08f44-8a2cada9910mr11741046d6.19.1774897690564;
        Mon, 30 Mar 2026 12:08:10 -0700 (PDT)
X-Received: by 2002:a05:6214:c68:b0:89c:c713:ae57 with SMTP id
 6a1803df08f44-8a2cada9910mr11740456d6.19.1774897690136; Mon, 30 Mar 2026
 12:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com> <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org> <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com> <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com> <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <0RTUgDf1wbD0phPk8qAcojZovgMA_68R84FRaL_BHfjzupSA6c_8S5ogVerViYPFNJtvup9sOvL_uPx2t6-KCg==@protonmail.internalid>
 <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com> <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
In-Reply-To: <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 21:07:59 +0200
X-Gm-Features: AQROBzC_trjVaBbw7u7zPM6ws-nlj7qufCuwQcc2aQbNzm3OyUyactYWHLKeTr4
Message-ID: <CAFEp6-2EjvEogSdVNCEY-XwgYe7Bg_2d1me2EWhzDp8Cr=ZeLg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: johannes.goede@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: TYkl6NAKPN3DcVUC8F-oKvIpu5fBh0aT
X-Proofpoint-ORIG-GUID: TYkl6NAKPN3DcVUC8F-oKvIpu5fBh0aT
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69caca1b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DLSMq9AfYi4D_SC6SxMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OSBTYWx0ZWRfX8g6mZildOL/L
 8TlgjX4E0wrUpQwXpJNzELFLGNGCVyEKrIXpyAVA0JUsbF3NpB8wfZk4yyjq05NRdNK3RlcAc0n
 cdQOHAXNPwTYHqTSbLlUAG21kwXtc43XQy/YBLjTpZWK0OjEAn1QK6JdHYAyPM8kP972oCjC4vL
 tRxgT4pJlOwtVON87gojqWjhK6OSTSyqt0hGMEi6Cdhixh+X2M1qFsZiZgueLrPJpDvlCO3oCim
 R3Y6cpNB1hQYY2O7wovNfHqA5WRAyRRS4palPtGJCRUYijebhrDXAAWj43qjiVY7tYVezJS1m9d
 aiOf20kkZZPv3JXhX2Wax/HRb4GhV0Stt2eRerLOIuMDuyAT1zlsj4dOjmaH+V8W407xJMkcZyf
 mqmvIlghTsIZNkphTb9Y4xOs/59HzzeVko2Ukm4cuaLYzWKJNkBJetRcDu83kAGIEFHIrWY8Ekh
 C42g26jXPp8zTYW1GtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300159
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57680-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 336A33602D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 4:33=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 30/03/2026 15:27, johannes.goede@oss.qualcomm.com wrote:
> >> That's another reason I bring up CDM again and again. We probably don'=
t want to fix to the wrong format for OPE, introduce the CDM and then find =
we have to map from one format to another for large and complex data over a=
nd over again for each frame or every N frames.
> > CDM is a much lower-level API then what is expected from
> > a media-controller centric V4L2 driver. Basically the OPE
> > driver will export:
>
> My concern is about wrappering one thing inside of another thing and
> then stuffing it again back into CDM and doing the same on the way out.

I think there will always be some level of copying involved. That
said, we can pre=E2=80=91build the CDM sequence in the drivers and only upd=
ate
the variable values, which should avoid significant overhead.

If we start handling CDM formats directly on the user side, it would
require exposing a lot of low=E2=80=91level knowledge there (such as regist=
er
layouts and offsets), and that would diverge from how other ISP
implementations are structured. I=E2=80=99m concerned this would increase
complexity and reduce portability.

> There are already 50 MMIO writes in the OPE ISR, I don't believe it is
> sustainable to keep adding MMIO into that.

Yes, I understand the concern. From our testing so far, however, this
has not shown to be an issue. In addition, a full reconfiguration
would only happen in specific cases, such as on explicit full
configuration changes or during context switching. We can certainly
look at implementing CDM, but at this stage it didn't seem to bring
significant benefits, so I prefered to focus on other functional
aspects, and revisit CDM once there is a clearer need, measurable
gain, or if it becomes part of the uAPI as discussed here.

> I'm aware of a project in qcom that did something with making the CDM
> format in libcamera and handed that off to kernel, recommend looking
> into that.

I will, thanks, I'm however, concerned about how acceptable this
approach would be to the wider community and to the maintainers.

Regards,
Loic

