Return-Path: <linux-media+bounces-62641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GZAMAK0EGr4cgYAu9opvQ
	(envelope-from <linux-media+bounces-62641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:52:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E05B9AE9
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48D3330298A8
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 19:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A46737DAAC;
	Fri, 22 May 2026 19:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRVzsthD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJXMZTX5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E18A36A02E
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479390; cv=pass; b=CZyHLUrQdazXevJTFwjGz0MMV/BM9YwlRpvWAw3dVAoALZSADzC+b88m1BOPn4LuLdeWxTrgqllVh63l0JANIdWfb8fdX1HTvI1tHFrtTI5iKJxV/ihvPBRjo4NfcgDNWhKylb8t4HGvqLHQnsIiFMwwabeK4vBIRrwjpWC7KVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479390; c=relaxed/simple;
	bh=5AuR6w7uWdbJJhYgvvr/wN4EYYKFg4v+EuygG1xi9jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbgFHtPRcOnNw7jyp1mjBFkifeAJVWik7yWNUjYU1q8uUYxDDfMNYvIdQ7srL2b2KVss0naWzKEcI12YqXDYvL6yoAEf/ghGRs8jxH8xmqoWMCdqFSRA5O4YOWUtoE2nlyMVAelLIaA8x9g1D3mjAJGY3i5Wfx9Q4rm2VA60UTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRVzsthD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJXMZTX5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpeCn2125342
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 19:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AuR6w7uWdbJJhYgvvr/wN4EYYKFg4v+EuygG1xi9jU=; b=BRVzsthDxBpt7hEc
	sbFeWu8oBBvSUSJ0kFnVjsiQKYaZoraxIaWEm+eYVNZ2N8+NDmw9xwuQlYaVW7sa
	M+qcVuvtoxKUw5NeCTnKobeupk238GMnGfejVUDRjjjLzbxjSnTdHBqIXjCd6k8f
	ONLxydKfwuO/cePeMGZ+5Vxj30h1fEU41O4FT1XYNU26wNNi+/bhsNvZN5NhPpFP
	ekcXRyjIz0Hmrefxkp5J9SZpnTByiCHLa80+aqzzlT/k3PQr+C0u2seNZuirvVDL
	zyTRrPIPShaYYFWEpdz0YJjh+mbnwEyRpEAeVqxry1AooPXiWG+m0zgUSi0uEkDw
	IWhgwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard89f22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 19:49:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914bddf7767so125343285a.2
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 12:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779479387; cv=none;
        d=google.com; s=arc-20240605;
        b=CmTN1Wm7GCKs/yFjIM9IX6WxsabLivaXcb2wdffmpXcu9qLLVEqVSMk9ejAQozA3uu
         IH4nntOX9kw3Dp/ZOple3TsdSB6MUHLsRS+qyA0g7R9ob9rcam9ih46n9ve/+eAiy3lr
         AwXztBkl3WIh+IyEfAjXcgvtse3dlnMFPb3kTM47h4AEIxB5fXFrbldvV1+900Nqf4vb
         KAVIHnDtAQEIyjOqOJjp8nEloSBoApPKZhfq4HWPgL+jab+hiAzQt8HeGY91fFjwNKSJ
         o6LFvMh8MAvEwU3EOImkSj23sJcGEhKaQAFHixlW8JV95FPrrVmcc+idqNi2gZY4gSJX
         lcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5AuR6w7uWdbJJhYgvvr/wN4EYYKFg4v+EuygG1xi9jU=;
        fh=CRTYS8n5NpXX+6vz1YJ7mlcWrCSXtdlaxG3K7UxJb8w=;
        b=YkuSklY5XoB8J6JhViD6syKz8wIMaSsquy/Yr4jXzdSj4s1Xwp9UDKr4iKTzK0pXQl
         U8QRqHk8psJrK558l067d+cQ39p58JGZgt8ZgNY0lNKhKOnDtpeVf05qwazurCY7LOYP
         ZxoTPUZoLZXgBGlJKjOAZ2KV3DJScmiWYYRPBXDz0MPRNuaS5Z8oXrc0qKHgxEP/lL2U
         XaMreOmlW/Sx0QvkWCyXuHgWt/p2F5nZWHKtrw0UpGO6kn5zBT2J3Qo4Q+NA7OSzaUA8
         NiFGdQVpmsRlGREXhzwOgvWiTavVuiJDfL5FnuOifOBnC2Cd4bkVJY1J+wbQ7Pk5QW27
         vaJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479387; x=1780084187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AuR6w7uWdbJJhYgvvr/wN4EYYKFg4v+EuygG1xi9jU=;
        b=YJXMZTX5VKvd7B2SFvKPWdt91HKo0CMIs8YQUiIFdU50njXZBKnJAoxa5zJg+4cFwS
         L6v/HgByhBpTO4K5y/hwpxODXTk9TZp3ZhQsG9UZ62YUk51ErVxi1+cL85FMZZ/cW+FI
         PAZemrOgUwvpSw+C4G3RwLg6apXJm7xuJZEN2VHK+/Yws/EGjLYAcYpIO49Lwlu9MY0i
         kGOsv1B2TtWrblZoOIH2+E17JQ21E7qlI6YvfA0bOiC5/X2ggMaztRJrMLJDEmUJNK8g
         gcxipPSANv29BPX6/wTOKYOxMRZ02v1cF0liaAa5AfdCVT0BO7jFIlq033tdtszaUkTz
         xrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479387; x=1780084187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5AuR6w7uWdbJJhYgvvr/wN4EYYKFg4v+EuygG1xi9jU=;
        b=D1q3E7uX6m3QkvK8QnWJhG9J1jiU8k8s3BfuzGfc8cq3KDmYRF1fuXfYYROytdLo64
         VvvoP+GGmllTkpxnCYRaXyj0VtuMjkWFQ51YzxTWmCZL/P5uI7PwA6K+iN/e/wIFAnEU
         szIXBe9oQNzQjdZUEZ7vH25EjppvE/HN+AOPnm1H+aas7F6tNiutHDbuscy54TNiq0Aa
         nOrhi0u5M33t1sWWMw8g+WevyaiN+oL0tzp9/vngvzxOPty0JZTs/Qmzj2cCDMULFnc+
         Ab8K4/k+lJ5+6OUE2XEKM+NLzb2aeOPSf7hHjsl0fH3KKaOYmxQRiG0hNE/2NsDQEFXk
         ly2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8PyFgD0l94i+f7SFOdLSNbOh5IZZdoN/mVZ2GHq6QiujDl7y9ciStRzD43c2WC1TWHisx9tXWeVTwObQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0laQgl6XER1vaoR6Ki+zw9aXut+uJk0orHqsliEVXTars4P25
	wSa0S2D3QSQ6XGHBj1u6ZoWjQInsN0WaVTbW6kjYb5ma2VtVMXbE2pIVp00dINs/5XJY3z+tmgp
	0941h/mAtMnxkXt5UEfdB4OboVexG3v92zFDXm4IMjzZ+LCN48kX6GFM9LMmaQNSYuDouLVQxaZ
	T6KsMBeQ6+p5WuZ7uUq6WZYjWD0ikWjvBg8YZGrsUq5lE6QI0eGmdwqQ==
X-Gm-Gg: Acq92OHGm1YXQKBlyiWBDUZveSg6rRV40+p0k3TNTDlCRZq1smNwsc2E3Yl254PyM6f
	03enCYtG3J2tC3ApSmLGNNHxNfyAKBhMsJ1UKboSwwnVBuGEMSCsAINMgbX5ZmJvukOFSI/m3rC
	oJ7owXTOT480T1s6atjZNaTK7X9zIi1jZ/aiZ/ttE4uvcwShHX4pEPuAspV/doyIqUlPNQkEcsC
	ZGmmsI8B1b/amO5frd261jQMVYNpxgv+fC1YhWRR9iJq5L3WZ5RzGHrHoFYac/BRSB5
X-Received: by 2002:a05:620a:480a:b0:90f:9cde:9781 with SMTP id af79cd13be357-914b4917157mr786258685a.14.1779479387221;
        Fri, 22 May 2026 12:49:47 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:90f:9cde:9781 with SMTP id
 af79cd13be357-914b4917157mr786254085a.14.1779479386628; Fri, 22 May 2026
 12:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
 <20260413201907.GD4034@killaraus.ideasonboard.com> <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
 <20260413211602.GE4034@killaraus.ideasonboard.com> <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com> <20260414074230.GB4061@killaraus.ideasonboard.com>
 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
 <20260414084259.GC4061@killaraus.ideasonboard.com> <afCmQhSbQLDb6gvo@zed>
 <77ea77b9-5503-40b2-882b-e96e30028c43@kernel.org> <1182ce00f1c55cf28e13e6eb4f2e018b52a8f6a8.camel@collabora.com>
In-Reply-To: <1182ce00f1c55cf28e13e6eb4f2e018b52a8f6a8.camel@collabora.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 22 May 2026 21:49:34 +0200
X-Gm-Features: AVHnY4L1UtVpExA63QiqJK8jh6rjpcAOcSTFygDdqUzp361P9RtzIvk2dVSwitA
Message-ID: <CAFEp6-1pA6v7P-ZrOD+iEGfq5Dv0CZ_CLiZ5u35tutQ6zAPqWA@mail.gmail.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Brandon Brnich <b-brnich@ti.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
        Devarsh Thakkar <devarsht@ti.com>,
        Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        "Padhi, Beleswar" <b-padhi@ti.com>,
        "Donadkar, Rishikesh" <r-donadkar@ti.com>,
        Rouven Czerwinski <rouven.czerwinski@linaro.org>,
        Nayden Kanchev <Nayden.Kanchev@arm.com>,
        Konstantin Babin <Konstantin.Babin@arm.com>,
        Anthony McGivern <Anthony.McGivern@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a10b35c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=yv19yPE47UyXIySebVYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: kjdAQMCrPv9XbAuEvMoumavgui8Odym2
X-Proofpoint-GUID: kjdAQMCrPv9XbAuEvMoumavgui8Odym2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5NyBTYWx0ZWRfX6EgHFllxCAEG
 hps1R8yxcdrW4SIFj0lPQgPXDY+PbfBLpP2TJAXEynqqqFGtgWRwh5k/jB2GAlCuvXFMAio7UMc
 h++J1MR1h12ZPQy7jU9BPThfgFf2RUSM4wsYqcKkIrcKBpvHBpSFrLHjgtdQBQLf/FahUHH3KGR
 etXoYJnnACT1A20AwbauUuaGI5E5RBIaCOl8HJyMGFWt5bor/UbXE92QQWGXYjQxh1Ui9iKKLhW
 AOiUXCvsdVSWssPF8PHg/Z2UD+qbG6kmBVLTIVgps/xexSNHYQyQNVdILDABFVXwaSOK0kupoY2
 h6dfb1aFgTS4Xo72PsarYSCMTfpjPugFGiubxTLKDt7atbE+nYGS1Y6wQpmskLeitV2hYb+gVg/
 rXSikXklLet9JSR6S4RghqQtxhsrfzMMWvSm0lbOzM8HsGyWiw23TV6zK8CiyJOyxkinmNT6/UR
 TdPy8hhZsZjihplYjTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220197
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62641-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 396E05B9AE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Folks,

On Tue, Apr 28, 2026 at 7:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le mardi 28 avril 2026 =C3=A0 15:00 +0200, Hans Verkuil a =C3=A9crit :
> > On 4/28/26 14:30, Jacopo Mondi wrote:
> > > Hello
> > >
> > > On Tue, Apr 14, 2026 at 11:42:59AM +0300, Laurent Pinchart wrote:
> > > > On Tue, Apr 14, 2026 at 10:34:13AM +0200, Loic Poulain wrote:
> > > > > On Tue, Apr 14, 2026 at 9:42=E2=80=AFAM Laurent Pinchart wrote:
> > > > > > On Tue, Apr 14, 2026 at 09:20:56AM +0200, Michael Riesch wrote:
> > > > > > > On 4/14/26 08:55, Ricardo Ribalda wrote:
> > > > > > > > On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+cisco@=
kernel.org> wrote:
> > > > > > > > > On 13/04/2026 23:16, Laurent Pinchart wrote:
> > > > > > > > > > On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas Dufre=
sne wrote:
> > > > > > > > > > > Le lundi 13 avril 2026 =C3=A0 23:19 +0300, Laurent Pi=
nchart a =C3=A9crit :
> > > > > > > > > > > > On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poul=
ain wrote:
> > > > > > > > > > > > > Hi Hans,
> > > > > > > > > > > > >
> > > > > > > > > > > > > I would be happy to discuss this if a slot is ava=
ilable:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Title: Generic V4L2 ISP M2M framework
> > > > > > > > > > > > > Presenter: Loic Poulain
> > > > > > > > > > > > > Time estimate: ~20min
> > > > > > > > > > > > > Description: During early development of a Qualco=
mm Offline Image
> > > > > > > > > > > > > Processing Engine (OPE), we relied on the V4L2 me=
mory=E2=80=91to=E2=80=91memory
> > > > > > > > > > > > > (v4l2=E2=80=91m2m) framework, which is widely use=
d and provides solid support
> > > > > > > > > > > > > for buffer management and scheduling. However, ap=
plying it to an ISP
> > > > > > > > > > > > > use case exposes limitations: ISP engines often r=
equire a richer media
> > > > > > > > > > > > > graph, with multiple pads and metadata flows, sim=
ilar to inline ISP
> > > > > > > > > > > > > pipelines (params, stats, outputs). This talk pro=
poses discussing the
> > > > > > > > > > > > > need for and design of a common V4L2 ISP M2M fram=
ework to factor out
> > > > > > > > > > > > > shared functionality across drivers, particularly=
 around buffer/queue
> > > > > > > > > > > > > management and job scheduling.
> > > > > > >
> > > > > > > It seems that we share some pain points.. :-) :-/
> > > > > > >
> > > > > > > Over the last year, some ideas have been brewing in my mind. =
Not
> > > > > > > necessarily *my* ideas, mind you, rather ideas that have been=
 around in
> > > > > > > linux-media for quite a while, actually. What I would like to=
 prepare
> > > > > > > for the Media Summit goes along the same lines.
> > > > > > >
> > > > > > > > > > > > That's well aligned with the v4l2-isp framework tha=
t Jacopo started, and
> > > > > > > > > > > > to the multi-context and media-jobs APIs that we ha=
ve proposed. I
> > > > > > > > > > > > wonder, however, if a short session at the media su=
mmit will be enough,
> > > > > > > > > > > > or if we should try to organize a half day brainsto=
rming workshop at
> > > > > > > > > > > > some point. Depending on when the people interested=
 in this topic plan
> > > > > > > > > > > > to arrive, Monday could be an option.
> > > > > > > > > > >
> > > > > > > > > > > I'm also/still interested in the multi-context for m2=
m decoders that have inline
> > > > > > > > > > > post-processing capabilities (current model forces us=
 to waste a lot of RAM). We
> > > > > > > > > > > just restarted some design discussion with the team, =
with an increased
> > > > > > > > > > > confidence that multi-context is the way. The schedul=
er could come handy in the
> > > > > > > > > > > future if we get to deal with more multi-stage codecs=
 in the future. I'll be in
> > > > > > > > > > > Nice all day Monday.
> > > > > > > > > >
> > > > > > > > > > I will unfortunately be available only until 15:00 on M=
onday, but Jacopo
> > > > > > > > > > should be available through the day. Let's see who woul=
d be interested
> > > > > > > > > > and available, and try to organize something.
> > > > > > > > >
> > > > > > > > > I'm available on Monday as well. I think this is a topic =
that is well suited
> > > > > > > > > to a brainstorm session.
> > > > > > > >
> > > > > > > > I am also available on Monday and would like to attend the =
session.
> > > > > > >
> > > > > > > I'd be interested too. Right now the plan is to arrive on Mon=
day
> > > > > > > afternoon. Depending on what time you agree on it may work ou=
t anyway.
> > > > > > > It would be great to know the exact time this session will st=
art (as I
> > > > > > > might need to adjust my travel arrangements).
> > > > >
> > > > > I can arrive on Monday, with a preference for the afternoon.
> > > > >
> > > > > > We need a volunteer to organize this, as in finding and booking=
 a
> > > > > > meeting space. Note that Monday is a public holiday in France (=
Monday
> > > > > > the 25th of May in particular, not all Mondays).
> > > > > >
> > > > > > If the number of attendees was small I was thinking of hosting =
the event
> > > > > > in the place where the Ideas on Board team will be staying, but=
 it looks
> > > > > > like we're already reaching a fair number of people.
> > > > > >
> > >
> > > Are we still considering this BoF session ?
> > >
> > > We would someone to volunteer organizing this, at @IoB we're quite
> > > full for the week and we might have an hard time organizing this one
> > > on top of the libcamera workshop.
> > >
> > > As Laurent said, that Monday is a public holiday in France, and
> > > getting a room somewhere might be complicated.
> > >
> > > We can host some people in the location where we're having the yearly=
 IoB
> > > get-together, but you should arrange your travel there (35 minutes
> > > from Nice by car).
> > >
> > > If we get a volunteer we can should maybe a dedicated mail thread as =
this one
> > > was about the Media Summit ?
> >
> > If the number of people can be kept low (say <=3D 6), then it shouldn't=
 be a
> > problem to just find a hotel restaurant or similar, close to the place =
of
> > the media summit, and just sit together.
> >
> > Who would be the key people for this? And who are 'nice to have'? :-)
> > I think I probably fit more in the latter category than the first.
>
> I was hoping a small number of people and a simple caf=C3=A9/lobby too. T=
he mass of
> people interested in the reply arrive much later, but I'm there all day, =
and
> would be more then happy to be able to brainstorm the subject a bit, whic=
h is
> easier in small group.

Is this BoF side session still planned? If there=E2=80=99s still interest,
perhaps the easiest option would simply be to meet at the hotel lobby
on Monday morning.

Regards,
Loic

