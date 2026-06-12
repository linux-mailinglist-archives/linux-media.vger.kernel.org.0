Return-Path: <linux-media+bounces-64664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g6whDkHRK2p8FgQAu9opvQ
	(envelope-from <linux-media+bounces-64664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:28:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 858EA67843F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:28:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZIbqGHYm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="VEUtkhS/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64664-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64664-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4795633EE837
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFFF3A6B6A;
	Fri, 12 Jun 2026 09:25:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782CB373C10
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256350; cv=none; b=ujJU1ZHbBdqLsXUDZOImMKfowV6jMH9OyLbjorH2TtK0it+xUItffbWVJf7KHHSqnKyRludAYRWD+dAK/gf0DG6eUv+yMLKzelJKRzRzKlcS/MGb6j0kHDhfqj+0rczHaa8z1GkNDaxbN7HlkEJkqhc6MDk/be0Lnyv4t2xEE5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256350; c=relaxed/simple;
	bh=H0V82aG3dPYbnrAz0FGj59jRwGH9B0JQTcpQnE8Ylck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnqMXti0GZLOkSdeLMrcVbcFu+ULvBrcVY9nZfXUtpIBGrAM4dG4xJnFyW73deA66CkgEKLGCCTfS3LmYA5Ebm68dbKJx3KcLzaKy7DuISgxGg8IwQTRg48Y1HcxwLYZQNRqSOmMwy2PjlN4A53Yk+hrlPbnnfOVLk4+xwHhj/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIbqGHYm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEUtkhS/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39YKG2516164
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWTJE5glnmUAzyAbMWhXl5nquYnqgRSsKh6pLuxFe3Q=; b=ZIbqGHYm2Jb/821a
	/OaqAqV95SoLEDXSd59kyjoZ1KCWB9rZSXVZZfZB5JlJM2Ujm/SKaFQpRAdk2/va
	RQ8ps0ovB1dcJgVQJrXxAM6MBUwdhe2AZyhRQbuNdDZktSTkHFpWd64IaTo6vYcE
	lCXDwnJfZgRilvSc/qFgeEd6wl5OYpYNSpbRRAk1csHxTjMSDBIAReW1c5JrMKic
	eicsXBLMr5iuIe8TzBgu7FLUBXxWGHF+sTt8epx1lJPpmQTOwjS8geYngAvHroZt
	DQXiy4QnYTIBfD3Ssa6qM6yPC2hboL4kTTyC3lTVHmdZgOYHwWam4a2TFcvEyllC
	yx3+3Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72cf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so829418241.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256346; x=1781861146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWTJE5glnmUAzyAbMWhXl5nquYnqgRSsKh6pLuxFe3Q=;
        b=VEUtkhS/eSlHM5RAieBeUejEa/3FTRW8shoRamI53+ui9hsF5BQJtTqZg8x2OrCTAA
         dgTZIMyvXhdioIj017NHPehQeuhZPagYIuYT4uyMtlbI1H2bOSoib3slbnIRbs8mTnk0
         sTqPQDPA4Iwt9ue41w1+ARZMOMLX0lfSilmV6r5G5v8bVFCfe1ulmEloNZR0JBovK+iE
         xUr/tlznxkZBYmHCbU42jrlgCINx0i7D1IV8ENLNne/9Owbh6xys5ipd6FvrSNooderL
         0iBtDuSooB3JccQkEcpclo1MxWfl9UudNd7AE3cdW+lviyUJuUUKtUkuqKMzlY3AUvDO
         9kPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256346; x=1781861146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWTJE5glnmUAzyAbMWhXl5nquYnqgRSsKh6pLuxFe3Q=;
        b=Lv8qmSYJAXYSwmcOAjGwvGIPB4mFL6O6zQ9Hzpb6ui9kUFFbcAMDgClWbpBgFfEmI1
         C/N4Ct5xzBAPmBhvOzXYMtZzv4Wwuyo1GZIa9BWZPW9jAd+n0MXf4E7O1ODxI9bn6LqO
         wopryPDfa2bdtttACZbnJoKijY8p7O4nPWedvNkbbkDODUcpRbV/yRgDclxyUII5TfBu
         VcUOqWshj5YpMmKxz4SNLZ2fjsfo2tSLgBOCmJCZYkajMT69LYRhtWPEPZjA9gWMWpE0
         KY3fyeC8e5GqH7wbXswQ/3c5At0hTV/aDO2+CSfvjah5W4eacYuE9eP8RdIocP5qE2L7
         9t/A==
X-Gm-Message-State: AOJu0YwxJkt7xuZOkB5uCacYK6fLfIryS8mGnmDeAF1z2KKn/jCsi9IW
	tkglPdFRZ6nqjPSy/tIAXnJHFXraiNWFkkfX6Lzs61qXumjksvf/EV0ve50nCCv6EX2iemfazbB
	Az+ldJDAHoIDds81eReYbXjnaPTj84w3LGeoDlHSulHsBmFZIP0t4Tp46FcVG7fUNxg==
X-Gm-Gg: Acq92OHIgiY/o5pvjcrlDHfx5zs5JLp4YZ6bBg6KekwENx8rTbWLjTPaotu+Gp9UbH6
	pV+BwLUVmx2D4S29xbuakrmaaHs4F6wSPCZtET5yvUpkzWbUuf5fd92wLZYRpyB6QvphfprsAVe
	fXTb6gJ5dCVIHy1DYVwPBGFeY/3UYIZagy1r/QVc7RhnDEL8j5/ofKiNXmeyxuPBsgKnCovjzGj
	JMAzNOlvPAIY6aI9BbxLcCJZPPOmBbipnl1iRhMyIOIMXL4q4yQSe+EJyd7CRd8fc4F7FeCgfF3
	Xxw3WrDhxlrQOxmWRg8pcVTc0rA19zYWKanBQxe3OGNWTbeTZXyM+k36eU5/g1Bv1fcb/SPLXWT
	PZjkbpXrbWOI9oK9aurRm69Fwm8ilJPtdNhI27pEEdfI0BlfVpNe7MCCY0KHEDiqgaZg5v+4ExA
	r67EdisczXIyaEhOqsb+6/JQyXHthp3pUlO/U=
X-Received: by 2002:a05:6102:f13:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-71e88b36277mr863733137.12.1781256345691;
        Fri, 12 Jun 2026 02:25:45 -0700 (PDT)
X-Received: by 2002:a05:6102:f13:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-71e88b36277mr863722137.12.1781256345218;
        Fri, 12 Jun 2026 02:25:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:34 +0300
Subject: [PATCH v4 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-2-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4535;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ksWQgJMkKP/JHjPoFVDtiRDL31oOL67/XmVWJa1aDqk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5b2hf53rIt2cUsaVMupq10Plp1+6qG9RW2bzQqzBAOXB
 LEzoVWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZgIuzD7P80UMfPfjSW1C68x
 iNl/zVJ6cKP4qcDaGx2V+xq+vGMpiNeuWnbqtFTU1R+bn/QqdP/3yT1fLbj+XQPL2rWpsXHc2+0
 kJ/XxCswVVlPj+FbhXDPbbf+NVOdE/7xP2dEui7fqlG4L/jFHJH6Kgq9Yzaleifxvl2a4sOUUbd
 vTrWT5ReNMkvI3i/UJ2i++ydxb0inszaLfo/rN9KKr+b0zq16esDv6bvGGzo03pgnNalXPt68yC
 O6dGbK3csZZtpWB7+bunLt47ol1wSdq9EIvZgbcdzdt1uv/kXuW98yvwurpfh9PyNptN3ZhmuqY
 PFPYofgr85ZrJ/XiUxO2SeUbRdkZ/WKrMVXrZJm4/2wTAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UIUJ2T-3-8ZJHbAoxF5pqwNsdEToK6yV
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bd09a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=HWmRtQhKy1KQUjwlQEkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: UIUJ2T-3-8ZJHbAoxF5pqwNsdEToK6yV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX4PFyI6TO4zAZ
 VIRn/XhboaYG14BGr2R9XlPX79FmBQgmUw3PZ0d1Xx4bMfWgTNPEhFABsMFanJJGI9D3kGNJYo5
 kK4pyJKcajkDfe+96MRthZUYthKNED70YUym5u2otVOf4m4tGxD2ZhpvpMHTN65yGLdHHcTduQX
 fra4pUuIC/5YEL/Xzaan+Gmgi4TXijEPmTQ/M61tOgTyx0WiaPC0pdLoLVxHRXKOW6Em7GY+N/T
 Bq3+BpbE2ZmSWzMzKTykrPzsuKyxqeSPLS74OXszjvv1MJCCIwuCwxn2OrpxYEtvvTz5Lezhnw/
 ij2cPhtFw7yy4dxDQ1tu5ZBcg0rwSr7cRu91k/yWzy8E+yw6q+NXA1/8yQGAd6+EPslTCwv0c2Q
 0TJD4p7jyZ3pngx3OkY/JO17kJE42Z0BdfBmnwn5B8neP1Wcsnib8r6NotfBK9MtS4zC4qnhvBG
 q6EbHMQ/VpgNfqk89dA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX1PT9bJfGPjCg
 MpLLDqL7GrEHS7my3jIswLQyBAa3Q/EvPY/UUR0NZ/uUVmGXB54Kii0an4juXZnoC9aMNOl8ODB
 rJMeDFtLB/wZrBkZQdzQ5vz64aUPtog=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64664-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 858EA67843F

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 9 +++++++++
 drivers/media/platform/qcom/iris/iris_venc.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..7da43f312ba9 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -71,6 +72,7 @@ static const u32 iris_vdec_formats_cap[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -82,6 +84,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return false;
@@ -110,6 +115,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -121,6 +127,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..2cafbe9f8abb 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -91,6 +92,7 @@ static const u32 iris_venc_formats_out[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -98,6 +100,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -124,6 +130,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


