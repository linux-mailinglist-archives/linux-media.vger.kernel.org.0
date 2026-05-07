Return-Path: <linux-media+bounces-60740-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E+SK8M6/GmUMwAAu9opvQ
	(envelope-from <linux-media+bounces-60740-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:09:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF534E3E60
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C892D3046FBD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 07:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D84434A77D;
	Thu,  7 May 2026 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5L7aWnp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JD6Hq3Jd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49A34D389
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137705; cv=none; b=MHKrSNSCtjMEwfe/sDiwAlZSTKYmJB2zK0m7LriKbn5n9obN06rTTJMtJdaR3asZJ90zVkhe6GD495y0dmGt4348rJcnG5hoVKzBTR0l0ncNYtk+YQYQa6efOwo5S5nNtrxFGvMDajnmMZTj9DmGJIXdr/cfZSaGqGzrbP+9af4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137705; c=relaxed/simple;
	bh=Sor34At2O10Ybv5ERw/xAkmf4GGFlMQxDcM1Qo22kCg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tbtpNaXOM1ARaMmOp4ZpFIVHc6dg6R8IGsLrMcFh3/Pr7PvQ9xyyyuBNzer4epg+uYlb6hZgXXe/QzVQOaku4MeWkBpRHQRZvCSQYn1lfbDg3w0DL2VnBaEDXngTOS1Y8LAp+EJt8O4ApP/O99catQfTarVV7Ti6rbM0cwh5B10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5L7aWnp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JD6Hq3Jd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475M7Fm3156914
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 07:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0cEFOjs0ikWcbVjcMh5EO2
	YSTb1J8mWaH946tA/UU60=; b=G5L7aWnp85tPJHVce2mYUvDH2Bw6ZFIHSPxsVZ
	q3Z8Oibpo3wx3yKQcmkxsIC0uqDx1CdPzTittMvBxv5846iFab6k7eaiDv07itpD
	V2Ox96MHYT6jSRTdqz7CKUG73zfkHOn3vM6DhAOriyDYcmMr7VFaut0ArA4BzyyH
	2DNEl88YHW9ZZ55VQrwlgaMXkUufi0xVWgy8oEjOcD4BV7YOEakkZoz4A1TZBXrO
	dAAZ7NtWoWP4rQ3QSJ8oFQ+NA2tB+a9gL2vdLomM3WV+VlpanQZjw3uQjWa2pyBo
	eg6wXoxfD6NEli/rBM3otKSayu0b5sHPTkpfYRJQjHhPXj1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf0c1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 07:08:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ff051e189so10487931cf.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 00:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137699; x=1778742499; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cEFOjs0ikWcbVjcMh5EO2YSTb1J8mWaH946tA/UU60=;
        b=JD6Hq3JdvDM7OnS+Dl8We+j1VeMoRVtKqcgAWBKnrBMrsrMRjOeSXRRbXxu13qXF1r
         pnBydmKrxCIISsXpfF1rcrpoX7OcfKTTZksbZtXycKu/sZBu9sJ49VoNHWd3tvsRHx10
         T8Yq2UlzONc+c450tJ7YH8cVXc0JaCauJXVd03teIA/x87KdnqanFz14WunxEtoW408k
         UJpVs1eHolClU0V1qdRZsIx8Sloah9X6OTpoH9odWS9qSmn0pEh0Rd77UEh6mIIzncLJ
         pNMXOarekGtmXbScuA4sipfeKgjAMA3RrXs99WZjXnPVJGvxAPEVyRph6v/iuZfqZyaJ
         i2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137699; x=1778742499;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cEFOjs0ikWcbVjcMh5EO2YSTb1J8mWaH946tA/UU60=;
        b=XGpizcg21B4GL/PdE8RoRNydJ8i+n4GUmlNfLPcwoXwtOavPNrZIFyF334I3uzmJBQ
         Jsdv+mQJj8KgrAgfHp77hFTwzco1hY5VJ7qF5p1HFY5uFv3pn09voAHqPKso54iHzVg6
         o/1499Q3p2yzZnFu2rkOmBOpbushjvSb131vHBd6d2WWLkw5CSaHu6ESZAY3FfOJOl/Q
         IIclflza2SU1+JtwnIaEq2zVRIfVHtXCMb/DX3LXVzJ0hGPKIRESfhGI6UZKc584P3tR
         FxKixiUa4b+QrcTF4q4CvAH1RhD+b8oi8mSAKYoozqZBn39tqnMG9Qx5KXFxiHZnppd9
         daZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oyjxVdALRQPwS0z8bc5sWH7jygKOwmXvcYEmQd2M1Qpul/maml6rQzBipU566QekVvawJsiKiyUvJOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAyg6nRyIYpgwnz1FWLGXkV9/bvlBuQMk3dp7X0a+HGAez16/z
	hX6p+Y7uZ/ZT51L8e5Zd1+aYqknPwxItFicdXXhNwIeJdFKr4pVGDByTsHEjursc5yv8zOToKY5
	iZ2uWd2+bbcXNOEfHa3mffsUmvAxFQ6iyfRJQz+z/8xynkByBUMlmPYoPbk8D5W44rA==
X-Gm-Gg: AeBDieu6YqM0WkLZOS+azNaQGKIM/uatky6tLthMQhNmtBMEcI4hPBASgDO3KCTCVQg
	E0kVVL32c2ksyFialP6/MYz5abNz2TJV0U9j2YCHQX6S9aosUzY2eMtkwT+YLfsY9dx1ZBuA4Fp
	UkVlx91yxkOpAcaw4YBIPVCeEL6Sx3CUw4VttC6GL4v9SJNMixaYrtyyIkuhaCrbiqGNbB598+Q
	stXDfKxKloF8olU1wjH9LMAsoQ3ID4Vt/WhVmZhDHoCnRDRunmVxSK8+vK+WyKHayotxPHiMMSz
	bLUnS4rHuIgmV4lye7VXdSULGQcMwtj5LwK8gtb9G9HrgMD2N+lABwGeSojflN7/Wv1SyZhZo1i
	YZ+4GLgZ8t8dEi1ZKad3xzb4PsJwHVOXa6nSm2ftOG9cXXZmVEWz0z62FaXC6dakjTU2abPLqm/
	vl/llUDaRF3errr/66YwqIFK3/R62ZDp+3xCaCo56DKUkx8A==
X-Received: by 2002:ac8:5783:0:b0:50f:bb77:a085 with SMTP id d75a77b69052e-51461be0cd2mr95776591cf.12.1778137699273;
        Thu, 07 May 2026 00:08:19 -0700 (PDT)
X-Received: by 2002:ac8:5783:0:b0:50f:bb77:a085 with SMTP id d75a77b69052e-51461be0cd2mr95776111cf.12.1778137698715;
        Thu, 07 May 2026 00:08:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] media: iris: bring up driver on SM6115-based platforms
Date: Thu, 07 May 2026 10:08:08 +0300
Message-Id: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFo6/GkC/42SS47CMBBEr4Kynmb8iZ2Y1dxjxKKTtMFDfthOQ
 ELcfUyCWLFgY6mk6tfVJd+yQN5RyHabW+ZpdsENfRL8a5PVR+wPBK5JOhNMaKZYAc67AKHTnCu
 QJRlJpbCS6SxNjJ6suy603/2qw1T9UR0fiKfD03lKa+JqyyoMBPXQdS7uNj1d43eHIZJ/uDsKA
 ZcIu80SQDCzBpipnwKkZSlKKRSDWQEDhkJIrRqpSvUzhLA9T9g+2Nv0vAVKUTxZC9a2boRwcbE
 +rkRh80rXWmojis+Ir46m6lKvEDIokUjJOjefxnreObYY7eA7aDAizJw/cIS6EBWTaD69UrIV5
 6kbIoHtYqpQAgcUGitDhnHG37Jen+CJylOy09A4PMGBegFhGsfBR5hzwMIypSxXaKvdnL+bfpW
 DXrE2AtNClLk2iCqN8Gx/v/8DIW+zkZICAAA=
X-Change-ID: 20260507-iris-sm6115-38e93e82f306
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=14943;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sor34At2O10Ybv5ERw/xAkmf4GGFlMQxDcM1Qo22kCg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DpgQf+/xwMkiz1/qrGYTxxr1/y5sVOpHEJBY
 b5gs9Rav+2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1TGIB/0TMp8HqFbERs2MGaPDlfHSYFMug9pcFAnkH1c/aCDs9Ph0ch1c4DWxM6WLXKjdE58rLel
 vy3Hk7tXYTy1QTNNxMyYWw6k21UGPWjPMQuUg0Jvj2jRtdGfwkcoCoHTxU8ppyk2YYIyFP33uFh
 fSui1lE2si4MBV+6wkNbDQcfVklIa1M92a6VpvNaChKIIJfqxtXO9q5qAvcVH5nkZI5S8Hffqvi
 kmCMKTy6j1v8+BnYEZ6Yg9nXLLwr0EyPaXgG7FgkMDt3BUG2hOZBx9MmlM0954iCzs46R4AxS+N
 H2NrsnXwRb8Ol5kudSYVHyInJZPsrg+3qWmw61K6m4zaCmX/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX1/3nyYp60bwp
 nlT8ccVJI/0OYaRRHjd98AHy2XFKqGzBqYadY2VYHc1jdntTGUmMrhpHMzyn0lLLHnxT8izSb18
 bA9vRFIlC5TW9QaA9zAxnzDvojIvPGSMQ/30H8cm16BLMMFnYm+uH46AZ3PtbtDx76zonPtPSd9
 qHjz38wlrRXlJiplu/cdt1VZKJ6D/+nRyYjB1Z3rRbkXUkhNfr70D+XF0fPE1v1CtejB0S00oEQ
 59DbqZoZzUMuiQ+cKU7WQi1FnwpMYaCnBtVLBAMVmibidBsl2rlLO1gR7kQXEx6s8V+iRZh+Swi
 mzV/KHTa8vTAdsi0t4VMZg4nggkEO2LIE61YioPQLfZZHjUaQLnFJNg7ti8Lk4YpDF3vnmXhIaK
 JAaCORNKBRaYG2YqpBl9Q2hFtHxmUbrnApqq0faCfrW3j1n++Q4TjgJ8OA57P6jiq/SaFoe7zHd
 bCddsZ6ANiykvPsUWGw==
X-Proofpoint-ORIG-GUID: fA-OXDxXH-JkjkIe9a6BriN9jETedwVk
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc3a66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7MBKnE05AAAA:20
 a=EUspDBNiAAAA:8 a=f50eMP2oKi-DyvagtX8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: fA-OXDxXH-JkjkIe9a6BriN9jETedwVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068
X-Rspamd-Queue-Id: 0CF534E3E60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-60740-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SM6115 / SM4250 / QRB4210 platforms use the AR50_LITE IP core as the
video en/decoder (the same as Agatti platform). Extend Iris driver to
support this platform. This has been tested on the Qualcomm RB2 board
with the normal HFI Gen1 firmware. HFI Gen2 firmware for AR50Lt doesn't
work yet on SM6115.

V4L2 compliance for Encoder fails due to firmware / driver error:
 qcom-iris 5a00000.video-codec: session error for command: 3007001, event id:1007, session id:d3b1e000

debian@debian:~$ v4l2-compliance -d /dev/video0
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

debian@debian:~$ v4l2-compliance -d /dev/video1
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 18 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
                fail: v4l2-test-buffers.cpp(3101): thread_dqbuf.done
                fail: v4l2-test-buffers.cpp(3139): testBlockingDQBuf(node, q)
        test blocking wait: FAIL

Total for iris_driver device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0
debian@debian:~$ 

Summary of the main fluster testsuites:

|Test|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2|
|-|-|-|
|TOTAL|77/135|78/135|
|NOT SUPPORTED|0/135|0/135|
|FAIL/ERROR|58/135|57/135|
|TOTAL TIME|217.707s|100.952s|

|Test|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2|
|-|-|-|
|TOTAL|123/147|128/147|
|NOT SUPPORTED|0/147|0/147|
|FAIL/ERROR|24/147|19/147|
|TOTAL TIME|213.377s|173.100s|

|Test|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2|
|-|-|-|
|TOTAL|156/305|112/305|
|NOT SUPPORTED|0/305|0/305|
|FAIL/ERROR|149/305|193/305|
|TOTAL TIME|291.249s|174.203s|

Detailed test results can be seen at [1].

[1] https://github.com/linux-msm/fluster-tests/blob/trunk/iris-sm6115.md

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video GDSC
      media: dt-bindings: qcom,qcm2290-venus: add Venus on SM6115
      arm64: dts: qcom: sm6115: add venus device
      arm64: dts: qcom: qrb4210-rb2: enable venus device

 .../bindings/media/qcom,qcm2290-venus.yaml         |  6 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  6 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 65 ++++++++++++++++++++++
 drivers/clk/qcom/gcc-sm6115.c                      |  1 +
 4 files changed, 77 insertions(+), 1 deletion(-)
---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260507-iris-sm6115-38e93e82f306
prerequisite-message-id: 20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-message-id: 20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-message-id: 20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-message-id: 20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com
prerequisite-patch-id: 34d473ba50399f8cfaf583f4def12de776aad65d
prerequisite-patch-id: 5a6a2b41c9312687512db5d12bac95114b8d8719
prerequisite-patch-id: e6ec4cd9eb5e93f3443f5f496a1b990a95b5d96d
prerequisite-patch-id: 4be4bbb454444d6f314c2b6ad6a73290184e6d57
prerequisite-patch-id: fd9cd7882f2a8f1b6141f48ff5c3da708839d03f
prerequisite-patch-id: 952471fa5477280d399978c05fbc9bfe6d2d33b0
prerequisite-patch-id: 01c5b37358de833f85de1954f770fe0489818a16
prerequisite-patch-id: dd14b47d6cd8ff14d1bc78c187c061f6fe262fda
prerequisite-patch-id: f4eba0865e7f91bce3fb4b2c627ee123980e0ff9
prerequisite-patch-id: 72984784b916e2d94ede8ab7d52cc0dedfa37c41
prerequisite-patch-id: 2fabf4e36b4e4f74b27fe75133ab8ba0ec9b6e3d
prerequisite-message-id: 20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4
prerequisite-change-id: 20260429-kodiak-gen2-support-v4-a7f055f15afb:v4
prerequisite-patch-id: d4f40aee0948578a4195456554ba88c228d5bf7f
prerequisite-patch-id: 38d706b45998b7b5fbf90e27ecf9c856354f5a23
prerequisite-patch-id: 16ea0271e2c2c708c1ad1ba3490f4b05fc04173d
prerequisite-change-id: 20260507-iris-ar50lt-06228469aa5b:v1
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-patch-id: 34d473ba50399f8cfaf583f4def12de776aad65d
prerequisite-patch-id: 5a6a2b41c9312687512db5d12bac95114b8d8719
prerequisite-patch-id: e6ec4cd9eb5e93f3443f5f496a1b990a95b5d96d
prerequisite-patch-id: 4be4bbb454444d6f314c2b6ad6a73290184e6d57
prerequisite-patch-id: fd9cd7882f2a8f1b6141f48ff5c3da708839d03f
prerequisite-patch-id: 952471fa5477280d399978c05fbc9bfe6d2d33b0
prerequisite-patch-id: 01c5b37358de833f85de1954f770fe0489818a16
prerequisite-patch-id: dd14b47d6cd8ff14d1bc78c187c061f6fe262fda
prerequisite-patch-id: f4eba0865e7f91bce3fb4b2c627ee123980e0ff9
prerequisite-patch-id: 72984784b916e2d94ede8ab7d52cc0dedfa37c41
prerequisite-patch-id: 2fabf4e36b4e4f74b27fe75133ab8ba0ec9b6e3d
prerequisite-patch-id: ac7f4d5dfb5cfec475ac4f3dee8f26077b5d1ab6
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4
prerequisite-patch-id: d4f40aee0948578a4195456554ba88c228d5bf7f
prerequisite-patch-id: 38d706b45998b7b5fbf90e27ecf9c856354f5a23
prerequisite-patch-id: 16ea0271e2c2c708c1ad1ba3490f4b05fc04173d
prerequisite-patch-id: 802e2fd82c6cde3f860dff25465ce427a5e372ee
prerequisite-patch-id: 5a801f4a572dd3cac2bbbc2fbbaf34798c7bdf90
prerequisite-patch-id: da49d9e31a33f6508631cb7cabc5eb460c60668b
prerequisite-patch-id: 61316d5846c9aa27a6c4d2fa6462e4f8956f4a92
prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
prerequisite-patch-id: a8a4e7d218a2814ba7b0595adf03e1487e6cbfe8
prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
prerequisite-patch-id: 83ec9808a31cd12904392ee82595ff9e55db0aac
prerequisite-patch-id: 4189f1db8177bbf9672bb99ea35131a7fb0fbc42
prerequisite-patch-id: 31698727bfb6697f8c09f47466582b681018065d
prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
prerequisite-patch-id: dfbcddd8abce8558864de071bf37073e78b1a643
prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
prerequisite-patch-id: b5aee209067d60123300ade2e555975c24adcb51
prerequisite-patch-id: f8b57f5a724b39a5672e1c726fe396a68efb0c7a
prerequisite-patch-id: 38b41114068834c1349b6a2c42c5e393ffe7106c
prerequisite-patch-id: 5ec127361f2601a93dee37a889e51f7701263c56
prerequisite-patch-id: 3be6e30ff0d73ce59ccf492bea75d86bc4cf30eb
prerequisite-patch-id: 956360c70f908756f49cf95b3affd14ce6eb34b4

Best regards,
--  
With best wishes
Dmitry


