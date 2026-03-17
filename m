Return-Path: <linux-media+bounces-56029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PObLAAnuWm1sQEAu9opvQ
	(envelope-from <linux-media+bounces-56029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:03:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA1D2A7738
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24E6E3057EB5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741243A3E68;
	Tue, 17 Mar 2026 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0pXMY+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/5oD17N"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD453A452D
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741628; cv=none; b=AWoYJQDhAcCVnmByrdspXxQ5Pvf07MiTiPxANp2zrw2JJ3/d4lh0wMmP/uH+mEGcmlBZHUJbkJP9jm75Y67FvaGgbXmnPSCkkzL7qkDooN8m6MzkYl53cHxFTcsxXDXtqdzoJBqkaDYzYEWYmoe0mu3Xztsb/szPMBCCa6tZ1gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741628; c=relaxed/simple;
	bh=VAZhdg+zVss/xE+WERUH4w/ELcCaISL+YhNMQXFHIU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SQQUWNRvgxvTHxC+yu2I9fPDX5OgzhTz+QGj8IM331MyBw8P6xCdt+P/IoLLOV+3zxZpPbQpgJ1JMZi+qdnGIqdERC5++EMhUTTIOVr5dmk8tm80QPPMPg3Aiqy3dN8iXyl9d6eeMUM6s+nHJeCWpGBOAoCd4JNCK8aIoGg6d/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0pXMY+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/5oD17N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H90BQl3125150
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2vuUgZ4TxHnG4OMEIKO5YN
	b3ELbxi8ENT9IyImnX120=; b=L0pXMY+R41JyA7hwWVwmDPmELZBSUK6PnTCHi2
	L3/mh774BXy2P2e+HzrQimEQBhfrGATk9JNVURYEV5+Gi5txj3zSxTWrBUash8yH
	sgP9xG59miK78wCnphS+beLEaAdqtJig1VlrvgNVEY43ViOp2vHVymS3bG93Pj+b
	niBWIEqg7b9PeG/mJsbwDf+5b435VYqFcZxbyvchzV+qEiQsYwwU/HZuxeZMB4Xu
	+Mh7zxR8h+wdiddClSFm4sc/0k94p2fOySfa2VZQvXkAR9wbFxcq3PE9Q7K/BiwL
	2g3KtLYGGPAKMXxxjNC/o4nJGHmCqmGl9a8EI8Qi5WBEIjbA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmmm2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:00:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c4e730c2bso2570476d6.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773741623; x=1774346423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2vuUgZ4TxHnG4OMEIKO5YNb3ELbxi8ENT9IyImnX120=;
        b=S/5oD17NlvOue4c0iv6I+8vZubLPKmBzZnSfKDn5r8f5Jx+DofBkW4HTwLM658qvXO
         8nIL5BG7tyTBYGo2p4nO3jsV8qAL0GGNOAJES5zXGu1CXUDuXCZytGuwIdNQb74S51Yj
         5QxAytryvXYMP9627PKskO1otLme0zQMevWqdci+5J03j7llfU7uNEs17Fx9hT5UNlWA
         EoZQek47DtkhA7n/t9L4IS1aHqNuBfsaO1o8FPQOCEp2Z44hYrHTjp7kxqaFYbZM7JK3
         ztFcgEYjtMJ0NVPsPBa7dQMWVyC0gL+9fkkisdf8wm4N7mhmPzkxt/+RFP+eOIjcO673
         nM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773741623; x=1774346423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vuUgZ4TxHnG4OMEIKO5YNb3ELbxi8ENT9IyImnX120=;
        b=fqsOLn0pIEXTaw0MjgNUYpiY5NCKAfXWa1KePjr8lkSBd3pm2TZWYal/2Gw/nE0pYz
         cdOJOptZA4VHgZwDvw5TdtZCwWFC2cyYOP1ukbBN8fe58FPZnMDP8/RxKUzcqjTM/NpJ
         MMVQNkxmv9our/l19LT+Dv+skWpnH0gLP+e2N3WdbKM/zRgKm7crbPn/kpyYMhAB8Eqy
         v3mvSY95PmZ9wqOaoPKkgP9Pj5ETaT0dV+dE787ZkrmMUxH/hwyGkLfrfmZntW+Y5cru
         4CNEXnYrYeQFv5udLnwQ4O3OmEDHwzYiQPfhqgyHmaTRC10BDTESnw/m4XERVTOOfaIG
         pdHw==
X-Forwarded-Encrypted: i=1; AJvYcCWchOCEcV9AX0jhemFp3bqD8aggU14BPyvrhMUO7KSeq/4NgyviHMYCxrmxVcl4pOdSYrJvKBUoqZf+tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn1jaFYKMhlz+FpsQm8UnAJJuZxZmfvgY+pXtb0AVk43c4VHp6
	wNThbi57Sio1kt2dmyUwpE2fUNjmoI+miIOdnB+v3la8ilsEup+5RBhmXgCNi+RwvHGJjD8+vow
	X2NcFbZNeHZ+16piwd+a6nKAW5xK13WxWFclLCBhesgvqNi8qJoJQxw3NqrtWExs02g==
X-Gm-Gg: ATEYQzxfbmMS+A9N/OWYNJk0FYNS3pY6i5MCDM044zKTax3UcvoKFEGZE453CHg8roE
	8FenTgnn1zyQ0tsqpcQNIF1AqNlBY01RNQtWXmRNXuhcP6mXCMESOQToWYFlh49YZN6wd15E3Jg
	ppIduZRuLUqbxIL8gYz9+1EEoxyK18WiAK9bNvJeXwO4lmS0yGpn60XHP9bjvffsOyzbjcDyeZT
	X0Zrvp2urxQETvVMGHSy3n/XorAe2nPlJkCXCVoakp43yKnQpgNxjUiS04rvnznBmotwy5KXC5q
	bmX+c/gz3v/VsB2d1ApuoEIa73gPbovGDvOWrckTSqHzvRa4BvUqO6yZyO9nfqqvN3uQmW/lREZ
	R0AJiS+Uw+tD2LyxiZ45tu9Lphj57ykCR4T1UIRrSUH/mGVTE9W5jBvBVqmN9u0bpBSAcqAT6Zt
	sPsXKTKr7ubQ+b
X-Received: by 2002:a05:6214:27e5:b0:89a:b20:9f4f with SMTP id 6a1803df08f44-89a81dab56dmr196282746d6.29.1773741620019;
        Tue, 17 Mar 2026 03:00:20 -0700 (PDT)
X-Received: by 2002:a05:6214:27e5:b0:89a:b20:9f4f with SMTP id 6a1803df08f44-89a81dab56dmr196280946d6.29.1773741618591;
        Tue, 17 Mar 2026 03:00:18 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a6947c4b8sm137119786d6.20.2026.03.17.03.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:00:17 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v10 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
Date: Tue, 17 Mar 2026 18:00:01 +0800
Message-Id: <20260317-camss_tpg-v10-0-915131315f79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACEmuWkC/3XQ3WoCMRAF4FeRXDeSyZhs4pXvIaUk2awGuq4ma
 2iRfXfHn6JCvRk4w/AxnBMrMadY2HJ2YjnWVNKwowDiY8bC1u02kaeWFkwKqUBKzYPrS/ka9xv
 uJTq0xnutHKP7fY5d+rli60/K21TGIf9e7QqX7U0BWDwpVXPB0bTY2s5HRLsaSpkfju47DH0/p
 8EuWG0ewOsbtSEgBK9QN7gwQr0BzB+gBQA+A4aAzsngwWgnwLwB7APAV8AS4K2wqo1aSeX/AaZ
 bQTkejlTyeG9pms7Wl2WPggEAAA==
X-Change-ID: 20251226-camss_tpg-b23a398bb65a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773741614; l=5022;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=VAZhdg+zVss/xE+WERUH4w/ELcCaISL+YhNMQXFHIU4=;
 b=rnNQchDdK8AQLaRpXeV0tp/ckW5A9mdFawKlnbw6lRC55E9cmbF7SaM9or8jc/k0+2JLkULAF
 +Ta3h6wZK+zCcmztYyK9YNOjbj2ioTWh8wy9/z6bnnQ8NtdhlCJs600
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4OCBTYWx0ZWRfXyKP7ADApWmVO
 kop/hK/rStW/g79OdTUIFIBGPTK8+FWh2Vu1vtJu1LYqOD/cn9ssqmq0FHXnYQc/onOX6fo28lA
 +G8OGXWrxvzucz0Kkkuu8LGeK0NxO9+SDO5Ywr0QmNFUbsEf6BAG7cS2+npA9VpjHoxtO6+J7k7
 cBESm/mG/4ZsZNJD/m+sMAEg8O2BnNEWCkQIuQR1/9+M39vF4XBe0+8oz0HqS5CI+GIgnLwsq0L
 vUtIeOWsGLZohdde7pAdEYgKPHYnfctR7TL3OiEKTN+qdi58wrdV1wa5kX2cVn6a+FQGtlmVp3s
 yjjRnu+od3OMcUlVh4HNHWJxcONFKXtnwHXfmbbbbtkSbBqgBEKtdQufJCg6iCfranJmF9GI2Qj
 asJswx43WWBLN8Z8rC3XtUvSu0VcNBExoJ4sxIFDX9f+dDf8H05Ni4ZW26WUtxqE7T6isj21saU
 XdGQJXDcdWtMJyBHpDA==
X-Proofpoint-GUID: RGLXgVs31o2l22-hBQZHDm4lHaTgr1Cv
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b92638 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=9YuegPnT3h674dkZU1QA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RGLXgVs31o2l22-hBQZHDm4lHaTgr1Cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_FROM(0.00)[bounces-56029-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BA1D2A7738
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds driver changes to bring up the TPG interfaces
in LeMans, Monaco, Hamoa.

Have tested this on LeMans EVK board and qcs8300-ride board and Hamoa
EVK board with 'Test Pattern Generator' and sensor.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY
and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
  --capture=7

Changes in v10:
- Fix the code alignment issue.
- Link to v9: https://lore.kernel.org/r/20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com

Changes in v9:
- Fix typo: rename TPG_GUP_ID to TPG_GRP_ID and CSIPHY_GUP_ID
  to CSIPHY_GRP_ID.
- Replace DATA_TYPE_RAW_*BIT with MIPI_CSI2_DT_RAW* in format table.
- Simplify camss-tpg.c: remove kernel-doc comments, TPG now has only
  one source pad.
- Rename CSI2_RX_CFG0_TPG_NUM_EN/SEL to CSI2_RX_CFG0_TPG_MUX_EN/SEL
  and use if-else with phy_num_sel as they are mutually exclusive.
- Add TPG mode validity check when tpg_linked is true.
- Refactor tpg_stream_on() to use MSM_TPG_ACTIVE_VC/DT constants.
- Make tpg_stream_off() reuse tpg_reset().
- Rename TPG_V2_* macros to TPG_V2_0_* for better readability.
- Add register section comments in camss-tpg-gen1.c to segregate
  global, VC-based and DT-based registers.
- Clean up resource tables: remove vc_cnt, camnoc_rt_axi clock and
  interrupt entries.
- Sort Makefile entries in alphabetical order.
- Link to v8: https://lore.kernel.org/r/20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com

Changes in v8:
- Fix error bit operation. -- Bryan
- Add tpg link check for tpg enable/disable in csid node stream on.
- Link to v7: https://lore.kernel.org/r/20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com

Changes in V7:
- Add TPG support for Hamoa
- Add differentiation of register bitfields based on hardware version number.
- Fix the null pointer issue when TPG clock is 0.
- Correct the clock dependency for TPG.
- Link to V6: https://lore.kernel.org/all/20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com/

Changes in V6:
- Addressed comments from Bryan and Konrad.
- Add exception handling for the streamon format.
- Link to V5: https://lore.kernel.org/all/20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com/

Changes in V5:
- Modify the commit message and change the chip names to LeMans and Monaco.
- Add the header file to resolve the compilation error.
- Remove the definition where tpg_num is 0.
- Link to v4: https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3: https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for multiple targets

 drivers/media/platform/qcom/camss/Makefile         |  12 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  45 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 231 +++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 519 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 118 +++++
 drivers/media/platform/qcom/camss/camss.c          | 172 ++++++-
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 12 files changed, 1109 insertions(+), 25 deletions(-)
---
base-commit: ec4c8f012802e4654892379f627ce7a1b95f8ba7
change-id: 20251226-camss_tpg-b23a398bb65a

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


