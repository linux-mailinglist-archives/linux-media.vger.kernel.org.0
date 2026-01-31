Return-Path: <linux-media+bounces-51889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPZ0O6sKfmkrVAIAu9opvQ
	(envelope-from <linux-media+bounces-51889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 14:59:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E3C21CF
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 14:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F10D1300362E
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B2E355046;
	Sat, 31 Jan 2026 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qf2iQrEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9Zq6Uso"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B47C3542EE
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867938; cv=none; b=lY+GR2j7rMcu62fP759PlzmOzFE2JJUrsAvVv0OBuX6PaNyuv5mM+EyKxk1tkm4d27xFTEBmo5cpO0IV5PJE31EcWydPR2chFTCdl18EB8AOsIBiNd/wWoNaYmeJ0cpGTwmgnIQP+OblXU1LVNO+k/tXUI3+zwQ7aAe0xFRjnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867938; c=relaxed/simple;
	bh=IbBe+qPzL/JW2ROcb8V9haTlv7c+yK1yAHzmxUuMoI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=luXWcvXsVyHqLdpGojlJXuzpUfukv49nTkX8FgXRbdcGPB7/2JTbo0Bw5+F0TwuRwcEahYQzRkKLeSgK4dxzvcXIggapi+BXTcznYMcOHw+hhMqTn9+9S7/coh55boyHBOy9EGDtqGXBz/7ezH+Femq3X9V9xJEZgree6y7o9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qf2iQrEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9Zq6Uso; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4VRgW867194
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gWzTVG2Er8cPlMebJz+BOz
	AjlmkSqf6/LYTyc/ntxAU=; b=Qf2iQrEd4mrOKFos1zXVQynr7PZkoZTJWVo3U/
	DqgGi0enc5CIHKFNyqLT9faCGx47pHnmlYaKH+RX4tKQFqE+An7Sj0eBE7aIDAbk
	wuQBbAm/bgdl2TXt11HHA4Z2gNKPOlLcvXMr8g3MXwaCEfNh/42ywpQhfKJHLV8i
	/+M5Z1gT+N04mi49QGA4MOWjN3DYL9uJ+r/qMGtmbe8V8Kl8KrkzoS+2KDJRepCQ
	WNk1ZgQSj88Lod55OOK0yiUNsRELbcwUj/ptPBiKFwGQOxLsKyZD1eWl3tLxi/q6
	nCcIUaXJRGBAzyzmnyiiJHZaT7HidVoo/LWGmr7ntGLC3dnQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1asdrvej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5f541c55778so2964511137.3
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 05:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769867934; x=1770472734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWzTVG2Er8cPlMebJz+BOzAjlmkSqf6/LYTyc/ntxAU=;
        b=I9Zq6Usog5Y7siOmM81g7fIHHlqhciNQTnvcxg02jSUxQLY507ELBRQ4dr02a/eeUg
         MjWniIHQfVQFi/Zm3fMBnffXN+p3NCliCPnsaDixho8f7kZh0N5l+mzS7ML9HjMcnCKy
         jAPooOkDG16O1GEuwFBvL5pXbhWsdQg3uGZYeev982BWTB6fnkECtNQTNvaFtt5SCMn+
         VVZ0GOunot0GHN1m1TKMM2p8HZ0PYNm69L4lLYLWSQJ7WTesTbhaBqem87J73q9gJLFd
         vLUcvuSlyqwdALUvOBPl5NE8CUTdcn+oXOmd9uIMSwZtl5s4pRbdqHNYu7olxxwfkKKE
         LAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867934; x=1770472734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWzTVG2Er8cPlMebJz+BOzAjlmkSqf6/LYTyc/ntxAU=;
        b=WvXVIqYVf631fMILyPLu5Xt/rBKLfyQ+Omh44ck5h5LmyqQ6KNmFdeyIJLtD4yTxtB
         TpNTFHSqX2ezNwUB/+6FfNJpQz/+f+DipIB4OXol8ICKdtmvYl91hgGB5ukte6o8AzLm
         WZkWSrffRimPh6L02d1IuXkXI5G0UBogLq7vf/8RL49eFRi0Zj259IQ0929JGsgEnDUv
         niaktCbc2G8dyzVBFQO4q4gTOCN/cWDRVegCxbCDhFqWlb100QKxIIORQxMHcB+Oa9+8
         47i4k5D2VlJqd4NtjSxabpXsd+iBWU3MGYP6jQUg0Q7q1klqYIe+ux/kKZWfnxIOhAA8
         O1/Q==
X-Gm-Message-State: AOJu0YyLczQx/mBjfWLr13jWV3HqtwJWjTy27KfJin4oLu20EIjA7N4Y
	+Vm5xLf6eQapHSNKyiQ5FhmuQgPC8MAA7JeL+fZs7NIY8AKu5srgTbdWzVITBaXNVMY5IbbJV0B
	IiZ9W9B85GSzS9mSjK0cMcm049z1zBh+FiF0ikHYYWtkShqOPAKO6vX6VlgZyDNRZd3oPsKgvAA
	==
X-Gm-Gg: AZuq6aLVBCu/eBf6OLIYtUMmiixPoDEXxsL7BdRq+oda1o3B6UQ/6avG2o3XIyswgL9
	qEjCurqlI0S45NLTwJgd7e2ZYjAb+5/eZW1x1UvlgfAlX7T4osO9NvsHRnHFusxubA0RvV2ZxT+
	AO1LuTwQHdHFyoZSoSo5kqFt/95q1xqPCLsgR1lMikK83BfilxVOe0AWyfZRjKo6GnabI4fWx4a
	ouGpTJjrGvL5avirVUtbtA/YdQS6iMrw+VjaTHEzmFgHZ1jp3Cw13p4pjkoiFksPsoEymR9qdv8
	gIwrPkL771OHI4YoFYwkgEcJIdvt9scNKZ9KO5jgjgKIEiXAoddPfuG6x7YQehxHQlZg74Zh8+2
	IJuDhpQZEfyGXq1eA7Asb54c8CW7x4gHOOXToyhf3sySl3rW9OGsGDV7c/mbaHZiXKelcKfA5TS
	nRlisG1NrdyOKznNkK0KsBVgk=
X-Received: by 2002:a05:6102:2920:b0:5f5:2e63:f571 with SMTP id ada2fe7eead31-5f8e24e04f3mr1975532137.19.1769867933901;
        Sat, 31 Jan 2026 05:58:53 -0800 (PST)
X-Received: by 2002:a05:6102:2920:b0:5f5:2e63:f571 with SMTP id ada2fe7eead31-5f8e24e04f3mr1975524137.19.1769867933385;
        Sat, 31 Jan 2026 05:58:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2373021e87.61.2026.01.31.05.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:58:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/5] media: qcom: flip the switch between Venus and Iris
 drivers
Date: Sat, 31 Jan 2026 15:58:49 +0200
Message-Id: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJkKfmkC/4XQwW7CMAwG4Fepcp5Zk7Qp4cR7TByS4qyWaAtx2
 oEQ774UNGmHVbtE+iP7s/TfBWMkZLEr7iLiTEzjkEP1Voi2c8MnAh1zFqpUtZTSwozDxECRGMK
 JzsBflNoOjrV1OvjWuMqLvHyOGOj6hD8OOXfEaYy3551ZLr//krMECdtaaWODMajNfmTeXCZ3a
 se+3+RHLPKsfjRTSmVWNQUl+BJdWaNstHUrmv6tNauazloTdGO2NlRe2z+0x6uGiJcp15peXQj
 vGGEZorQrBrym995xwpjnH99EsESgjgEAAA==
X-Change-ID: 20251119-venus-iris-flip-switch-d59a3fbc6a4b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13797;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IbBe+qPzL/JW2ROcb8V9haTlv7c+yK1yAHzmxUuMoI4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfgqbLiPmmBKGRK2U4qZWY12ph+L7MKr+uzO1t
 tr0fXNQn6KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX4KmwAKCRCLPIo+Aiko
 1YNPCACAlK/+nkOO500FTZiunhnM+iEnzQp7JRXQ93t5FnM4ZstCZaHKIAvX0o3+oba9dhSQJo6
 eM9tfB7eqmetWUhc1TWUu0bygcpstIDly5l43rLCq+/t4vo/4Y9vMyZnL+y7SycHDa3X9iATyez
 waFKcj/cSqbsfOqSHYkcjN+c2O0R1/9czVlG6ui4r9xLUdJDYfmpFNxNFkNiQMK8NBOR5Y3T3FU
 b68b7E71q4WZon4PbmNlDnyCAeV6RKNoe3K+0FnwjrnwhJfJVaLZnRmv1yhTmgbuY+s1YOFXehN
 pcUajVAGF8VC8p99eCUhIesUbAUbD5ArTFwu3zxvjqasBOg5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDExNyBTYWx0ZWRfXy8eMKa28uSH1
 3TebayxqL1XqaqrTbyBbnB/acRm1JZldpwJzEqsukcCeG6i22DOb/gcbO/pp1GCBqzcUZ7v3fCT
 58ODHdeKtM4J7hJbz39zfBy8nGN0rMwKBgi4HQFbeaktYrAFi8u79O3lPHoOgTufKXNLDgA54JJ
 gLd2CYJFNwrQUSKFxHnwtt/cj4IXsV37otEPU1zyBBil6nYCkF4vlN5+EKtcT5r+wF4GW3gtmQb
 MorRyxwAWoSOXstj2KgkziKVdda74i/m9sPuAcfIKoh47jPWGv2r7MMDhdgUgyCXEuHh/OI+pRg
 mnv1lq8vEc0V5anVKSbA2USPbvr5PwfBWkEvXwjSa0hbubfCv7frh/b/mRJt04PA2tcceTADLlP
 ELIC9Co3+a/kCSmYllcDDtk2Iz2kbTZuygZmhMnsGNktg8SAMcXVlL9thcgQ+Na0AbaCr/PUaWw
 2IYtWJOi3qJv28cE1ow==
X-Proofpoint-GUID: oxYlCBxhDXeUG4B7k62ZjBLlgTF9E_uU
X-Proofpoint-ORIG-GUID: oxYlCBxhDXeUG4B7k62ZjBLlgTF9E_uU
X-Authority-Analysis: v=2.4 cv=LNNrgZW9 c=1 sm=1 tr=0 ts=697e0a9f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dCW-8o_xTGPffEoVNk8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-51889-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[out-h265.md:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,out-vp9.md:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D75E3C21CF
X-Rspamd-Action: no action

As the Venus and Iris drivers are close to the "feature parity" for the
common platforms (SC7280, SM8250), in order to get more attention to
squashing bugs from the Iris driver, flip the switch and default to the
Iris driver if both are enabled. The Iris driver has several
regressions, but hopefully they can be fixed through the development
cycle by the respective team. Also it is better to fail the test than
crash the device (which Venus driver does a lot).

Note: then intention is to land this in 6.21, which might let us to
drop those platforms from the Venus driver in 6.22+.

Testing methodology: fluster test-suite, single-threaded mode, SM8250
device (RB5).

$ ./fluster.py r -j 1 -d  GStreamer-H.264-V4L2-Gst1.0 -s -so out-h264.md -ts JVT-AVC_V1
$ ./fluster.py r -j 1 -d  GStreamer-H.265-V4L2-Gst1.0 -s -so out-h265.md -ts JCT-VC-HEVC_V1
$ ./fluster.py r -j 1 -d  GStreamer-VP9-V4L2-Gst1.0 -s -so out-vp9.md

For H.264:

Only the main set was used on both platforms

On Venus pass 126/135
On Iris  pass 78/135

- Fail on Iris, but pass on Venus:
  cabac_mot_fld0_full, cabac_mot_mbaff0_full, cabac_mot_picaff0_full,
  CAFI1_SVA_C, CAMA1_Sony_C, cama1_vtc_c, cama2_vtc_b, cama3_vtc_b,
  CAMACI3_Sony_C, CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30,
  CAMP_MOT_MBAFF_L31, CANLMA2_Sony_C, CANLMA3_Sony_C,
  cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
  cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
  CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMAPAQP3_Sony_E,
  CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
  CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, FI1_Sony_E,
  MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B, Sharp_MP_Field_3_B,
  Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r

- Fail on Venus, but pass on Iris:
  BA3_SVA_C

For Venus several tests crash the firmware or crash the device,
so test-suite was executed with extra:

-sv CABREF3_Sand_D CAMANL1_TOSHIBA_B CAMA1_TOSHIBA_B \
  CAMA3_Sand_E CAMANL2_TOSHIBA_B CAMANL3_Sand_E CAPA1_TOSHIBA_B \
  CAPAMA3_Sand_F CVMA1_TOSHIBA_B CVMANL1_TOSHIBA_B CVMANL2_TOSHIBA_B \
  CVPA1_TOSHIBA_B

For H.265:

Only the main set was used on both platforms

On Venus pass 135/147
On Iris  pass 133/147

- Fail on Iris, but pass on Venus:
  INITQP_B_Main10_Sony_1, WP_A_MAIN10_Toshiba_3,
  WPP_A_ericsson_MAIN10_2, WPP_B_ericsson_MAIN10_2,
  WPP_C_ericsson_MAIN10_2, WPP_E_ericsson_MAIN10_2,
  WPP_F_ericsson_MAIN10_2

- Fail on Venus, but pass on Iris:
  ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3, ipcm_E_NEC_2,
  IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1

For VP9 codec:

On Venus pass 174/311
On Iris  pass 232/311

- Fail on Venus, but pass on Iris:
  vp90-2-05-resize.ivf, vp90-2-14-resize-10frames-fp-tiles-1-2-4-8,
  vp90-2-14-resize-10frames-fp-tiles-1-2,
  vp90-2-14-resize-10frames-fp-tiles-1-4,
  vp90-2-14-resize-10frames-fp-tiles-1-8,
  vp90-2-14-resize-10frames-fp-tiles-2-1,
  vp90-2-14-resize-10frames-fp-tiles-2-4,
  vp90-2-14-resize-10frames-fp-tiles-2-8,
  vp90-2-14-resize-10frames-fp-tiles-4-1,
  vp90-2-14-resize-10frames-fp-tiles-4-2,
  vp90-2-14-resize-10frames-fp-tiles-4-8,
  vp90-2-14-resize-10frames-fp-tiles-8-1,
  vp90-2-14-resize-10frames-fp-tiles-8-2,
  vp90-2-14-resize-10frames-fp-tiles-8-4-2-1,
  vp90-2-14-resize-10frames-fp-tiles-8-4, vp90-2-14-resize-fp-tiles-1-16,
  vp90-2-14-resize-fp-tiles-1-2-4-8-16, vp90-2-14-resize-fp-tiles-1-2,
  vp90-2-14-resize-fp-tiles-1-4, vp90-2-14-resize-fp-tiles-16-1,
  vp90-2-14-resize-fp-tiles-16-2, vp90-2-14-resize-fp-tiles-16-4,
  vp90-2-14-resize-fp-tiles-16-8-4-2-1, vp90-2-14-resize-fp-tiles-16-8,
  vp90-2-14-resize-fp-tiles-1-8, vp90-2-14-resize-fp-tiles-2-16,
  vp90-2-14-resize-fp-tiles-2-1, vp90-2-14-resize-fp-tiles-2-4,
  vp90-2-14-resize-fp-tiles-2-8, vp90-2-14-resize-fp-tiles-4-16,
  vp90-2-14-resize-fp-tiles-4-1, vp90-2-14-resize-fp-tiles-4-2,
  vp90-2-14-resize-fp-tiles-4-8, vp90-2-14-resize-fp-tiles-8-16,
  vp90-2-14-resize-fp-tiles-8-1, vp90-2-14-resize-fp-tiles-8-2,
  vp90-2-14-resize-fp-tiles-8-4, vp90-2-15-segkey,
  vp90-2-21-resize_inter_1280x720_5_1-2, vp90-2-21-resize_inter_1280x720_5_3-4,
  vp90-2-21-resize_inter_1280x720_7_1-2, vp90-2-21-resize_inter_1280x720_7_3-4,
  vp90-2-21-resize_inter_1920x1080_5_1-2,
  vp90-2-21-resize_inter_1920x1080_5_3-4,
  vp90-2-21-resize_inter_1920x1080_7_1-2,
  vp90-2-21-resize_inter_1920x1080_7_3-4,
  vp90-2-21-resize_inter_320x180_5_3-4, vp90-2-21-resize_inter_320x180_7_3-4,
  vp90-2-21-resize_inter_320x240_5_3-4, vp90-2-21-resize_inter_320x240_7_3-4,
  vp90-2-21-resize_inter_640x360_5_1-2, vp90-2-21-resize_inter_640x360_5_3-4,
  vp90-2-21-resize_inter_640x360_7_1-2, vp90-2-21-resize_inter_640x360_7_3-4,
  vp90-2-21-resize_inter_640x480_5_1-2, vp90-2-21-resize_inter_640x480_5_3-4,
  vp90-2-21-resize_inter_640x480_7_1-2, vp90-2-21-resize_inter_640x480_7_3-4

$ v4l2-compliance -d /dev/video0
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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

$ v4l2-compliance -d /dev/video1
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

For SC7280, the results match the SM8250 ones.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Fixed building (Dikshita)
- Changed H265D_MAX_SLICE to have the same value as in Venus, fixing
  H.265 decoding on SC7280
- Link to v3: https://lore.kernel.org/r/20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com

Changes in v3:
- Dropped dependency on the sc8280xp patchset, this will probably go in
  earlier.
- Updated commit messages for DT bindings (Konrad)
- Link to v2: https://lore.kernel.org/r/20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com

Changes in v2:
- Sorted out SC7280 Chromebook bindings (Stephan)
- Dropped most of ifdef from venus (Vikash, Konrad)
- Added testign results to the cover letter.
- Link to v1: https://lore.kernel.org/r/20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com

---
Dmitry Baryshkov (5):
      arm64: dts: qcom: sc7280-chrome-common: disable Venus
      media: dt-bindings: qcom,sc7280-venus: drop non-PAS support
      media: dt-bindings: qcom-sc7180-venus: move video-firmware here
      media: qcom: iris: increase H265D_MAX_SLICE to fix H.265 decoding on SC7280
      media: qcom: venus: flip the venus/iris switch

 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,sc7280-venus.yaml      | 10 ++--------
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi        | 11 -----------
 drivers/media/platform/qcom/iris/Makefile                 |  5 +----
 drivers/media/platform/qcom/iris/iris_probe.c             |  2 --
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h        |  2 +-
 drivers/media/platform/qcom/venus/core.c                  |  6 ++++++
 drivers/media/platform/qcom/venus/core.h                  | 11 +++++++++++
 9 files changed, 36 insertions(+), 41 deletions(-)
---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b

Best regards,
-- 
With best wishes
Dmitry


