Return-Path: <linux-media+bounces-61659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNRnMGMDB2qVqgIAu9opvQ
	(envelope-from <linux-media+bounces-61659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:28:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 424A254E71D
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F48B3126134
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA02747798E;
	Fri, 15 May 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNl/4I7i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJu+wPBe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59D35E529
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842615; cv=none; b=qAdtM9hvapZ2Wq+DovTc4YuymB8SQBjc3913+/W0OTsxDlVjA8tw707L6DdzAR05YHKj03Mb3SEW8l4jTxc8RVfBXoNkhIYIoIt7kj+oDrN0xp4WAW5my0bn/BjJrmJs++9++BCwJWh1ejT0hKO7H3sQrZZRnGykwv/p0zUNOqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842615; c=relaxed/simple;
	bh=lMYI5FyYmgTbCsC2Bfihv//19vzaIS2fnHBla3pLIz4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qXxyt7gAhQSxKTTwOSzXHJtKGKFUECEUwmll+JHIP2MfuGh3w1YXQV442PNFGwGrnaf295UNybPWoFYjSnl/e6om/yTGPjfq6+CAoVPtfPCSwGhH6qonRnL2KH0g6SUZjjt93epTO2tNCFMSiFKiket3bi2ffVJ8JO04RqQT8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNl/4I7i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJu+wPBe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4m6DW4020724
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uQNlRCBvNqDh9AuJwhQv41
	PBEzTxbCMCm4B+gGxIjE4=; b=UNl/4I7iiIBGSjY8PsbRKgTqTfiRJAeXAK7QML
	MPygyyJIjueHW4G5XJUGJgjEQlrzY6l3wgVAHn90372AEwccc2SRpTBbUEF0EvGg
	w7mbdhGWmjORMtBDnY/XRZ66pS4DH8ye6lapEo1yanIRqza9eROuIT/smXLirq+M
	uyPCByEIrB6Cg/Dg2Ofpg1mhTr+nnyhxfktliYx/hW/w8d93BkRUneXA8ht3gJ/F
	mLNHWfRI92Iyw5aJrB1vbhuWbTU5DgedxhUNlPtaQVctNs/gOJveA54C60ckzyBY
	PCTcN1k+Uv1kYXCEDvk2Mvs1rmH64pLBZ/GyXDiOKn4g+FlQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtxqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff0bef198so185052281cf.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842612; x=1779447412; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQNlRCBvNqDh9AuJwhQv41PBEzTxbCMCm4B+gGxIjE4=;
        b=eJu+wPBeLhtYIHDJYarx8hEqOl2ir174bKZA90o5MldlHyJn6fZHaqJcMvoMduy2Ew
         IUPA/d7BwSPWmI3sjGm+eIkEskgD6qWfNmxGry1GE/WemwA/QniIzXpyUxONk4J+mwKV
         1tGlZzkIiYbLL/RLRpoLMx8lLuFU4R+wyuncQqIRfDfvmzbtrbgByaDOGiojrundZ3pz
         U/zoE7K8ghkZRPS0fTOG597UhctYj3MLBVd4T55U3J9msSd9MB4P39mSYFXI66ScyVx+
         04hT2Tv/0Wl168uZIei/b5IQ2bKfpHKTrxvQX5c3FtZkG9wCLEiSC9cFuTijwMmPF6jj
         YJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842612; x=1779447412;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQNlRCBvNqDh9AuJwhQv41PBEzTxbCMCm4B+gGxIjE4=;
        b=r7hs3rKlYHXo/sAb6fGGNj9Ag4sAr2+dtPHWOj/wD5ufwm2Pwi7pgReamRVeaBQQ/l
         XEheeBTrz02y+lLW28v/QjRlWI1lDXavWyM2OQO6/RuV1IJasA2xrvbJSYH11T8l4MeJ
         8pK43GeFiVzg3NRXWvd1blouvglMyJxcmdZzggN9p7Bb/6+YG+iSt4aljWHKIdl7AD+z
         Kozv/zeu3hNaQeXOFnmC/gcAO08I56UG7hSBMttLfKZOclFiN9G10Or5WXnkM/AHvPwt
         0V6HnlWFl3ITWZIX0bLv1ei78DG6qwImEqRIjDDl6oaErz0445AYO38CnGqyeR8oapOP
         rHdA==
X-Gm-Message-State: AOJu0Yy3xHq4EriGGP8vmsbxjdtXlXxXeRyOugsCzD7n7mgTwNtwRTJV
	5fNkWOO+0W7lxgctWEWg7+u1v/DsKOs5Lgp8ZSaY2llJd98zH7iLjFeQLB8FxxQeDeE7F2n6b33
	MOVfvnv3pZXkMw585U892KoWyRplNLmKMRyaScZZOF1VF1NcvUBelHMzR0OVqMKjqHA==
X-Gm-Gg: Acq92OGH7WCkyRhooQjDccpj+38ehc4O58QrNjRj1f1cAvC7A4w4Szl4/hM4P/Bv6Cw
	RJepu8poKhz1+tRsif21anMmmOgh+XQeFMADp/m7Z5o9YupvIOiu82D7BQXoM80P4wl7x1ABrrQ
	Zf67t1a36SVxkw32rF/8boEMuSdagNDXBD33cS3KR0hjeMDQQ0Ty/TySGu/gDaDOkMxQsZeA2jg
	H/r1jk2qyCBDheJEV0m5n3qXrqpdakYdYXQQoHynQR8yBSqcyDvGA1wopl0wx021Xf1cRFvmOmb
	PZBgmOzmyyozjNQZcT8gFzwAVYuUrofAZlUAWMXIyap59SIxIgYqce65LCNgG+5J8RIyFMzBxAq
	sekpVplftQxobTc4DBy+On8yd8g7/uiAn7Jr2XyEVI520RGhNp9s1ZCepp+EsH7fkvQfC7BX0Ly
	vpXvJSMgsI9Djg65wCwnZcdCm/LRw0X3VrqZo=
X-Received: by 2002:a05:622a:a6c5:b0:50f:b7f6:d626 with SMTP id d75a77b69052e-5165a219f37mr36640151cf.47.1778842611697;
        Fri, 15 May 2026 03:56:51 -0700 (PDT)
X-Received: by 2002:a05:622a:a6c5:b0:50f:b7f6:d626 with SMTP id d75a77b69052e-5165a219f37mr36639751cf.47.1778842611163;
        Fri, 15 May 2026 03:56:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/6] media: iris: enable SM8350 and SC8280XP support
Date: Fri, 15 May 2026 13:56:34 +0300
Message-Id: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOP7BmoC/33SwU7DMAwG4FepciYjcZo03Yn3QBzSxGWRWLslX
 VU07d1xN9BQobtY+i37u9hnljFFzGxbnFnCMebYdxSqp4L5nevekcdAmYEAIyQIHlPMPHsLVkw
 HbnWQqvFGaGUY7RwStnG6eq9vlHcxD336vPKjnLs/kl5Io+SCg9do6tZhZZqXPufN8eQ+fL/fb
 6iwGRzhIQKEaA0+eIXO1HIFUQ8RRUgAaY10NTqlVpDyjigJS6QkxImywlai8lVYQfQd0X8RTYj
 1HrREqxptVxDzG1FLxBAigpShFkEhmH+Qy+10CY8n+oDhdj/WuIx8HorDtthjiO47DZjyc4fTQ
 JuXL54fKkhDAgAA
X-Change-ID: 20260120-iris-sc8280xp-85d13bc60536
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9006;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lMYI5FyYmgTbCsC2Bfihv//19vzaIS2fnHBla3pLIz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvwN6p76IxbSwDNnNqbxa1U82hvi91bMX+L6
 9TUj/hsO0mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78AAKCRCLPIo+Aiko
 1RdqCACV5F7znITEmpK9aS0hvSA9BSB2fjzz4KQSiMhnYBWsz9WPu0lDthzxiH4nF3aqT+2LvEe
 KthSZtw0G9Gs96GXXmDMoVHptZBtb3HZVpmWXo8XzGUfy0fDrdB3sXewqxY2OE2IX2uvaUTbOtH
 5JSM117BrshZQePZn2WnoT8GCw/GP8SOA03h4MRgY3uqSNqcLxCUBULVIu/I5owYupVrhD4pG9U
 3czmoPP9/cIkJdptpCIvVJi7pPSbQ5U+5TnPgw2cL0p/OfE+UwBqiAAZl4ORb7x3jTpTGRkVxmS
 I5tkNSBU3CufM4jVZy5MTtf4mNky8dC0DAtvpZVcYLZzudPY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ioB4fOUnlnXLqgARirYHNgfkEOcqLdgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfXzfYHzGHDxpAL
 phI39dQMFUSYHYRNVN+tTmsnYc+N+spoF0NphnQATpD4QYY7rOPnRrB+pAFhZa+qDzru+RBcJCd
 Mxqx7wZxkYCF4v4JF6yuAvCbSV+nPa2cs+x7+gyz1/2UrGLQBIUo9HwQMXTIAzQPm3gxUyVnQIv
 FP+t/6VQX9z6nXHG35E9LIzrLd2gAsnYdD34Iz03Qpzl1vldRU8ak+HwyS1B8vRboErxl76SkCt
 2Kayuns6gWFM8/TmmbLUkO6rPCCS8Gd9JYkexiFMdd2kYTvJud7C0qoB1SkpnI5+xdtP3sJDTaX
 0GNyWuTR7ph5od9OsiEVGEYQ8Ip9ZlNMS5oaoYKXe3+r/cKwFF+/MzwecJ9UBjH5T3RKhW6Gd4i
 vyRV2U1ZrOSoVPrpmDu6H1ezIg0bw/hbv59kHT0dDUw8tpbe9jYlZV0bZtlw2i0h5tNfbUDO11X
 tF6SBXVggpmApz1bzzw==
X-Proofpoint-ORIG-GUID: ioB4fOUnlnXLqgARirYHNgfkEOcqLdgY
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06fbf4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lfk3Eeg5VSayILi57ZsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: 424A254E71D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61659-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

In order to enable wider testing of the Iris driver on the HFI Gen1
platforms enable support for Qualcomm SM8350 and SC8280XP platforms.

Note, this has been tested only with the Iris driver. Venus driver fails
to boot the Iris core on SM8350 pointing out the UC_REGION error.

Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
SC8280XP). Please use corresponding firmware, extracted from the Windows
/ Android data.

On SM8350 with the Iris driver:

$ v4l2-compliance
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
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

|TOTALS|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
|-|-|-|-|-|-|-|
|TOTAL|169/316|128/316|154/447|126/447|159/311|229/311|
|TOTAL TIME|242.251s|267.903s|293.458s|261.934s|203.009s|366.936s|
|-|-|-|-|-|-|-|
|Profile|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
|BASELINE|0/0|0/0|3/7|4/7|0/0|0/0|
|CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
|CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
|CONSTRAINED_BASELINE|0/0|0/0|32/33|33/33|0/0|0/0|
|EXTENDED|0/0|0/0|1/6|1/6|0/0|0/0|
|HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
|HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
|HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
|HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
|HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
|MAIN|127/135|126/135|41/90|41/90|0/0|0/0|
|MAIN_10|0/11|0/11|0/0|0/0|0/0|0/0|
|MAIN_STILL_PICTURE|1/1|1/1|0/0|0/0|0/0|0/0|
|-|-|-|-|-|-|-|

Tests failing on SM8350, but passing on SM8250 (note, on SM8350 they
also work with FFmpeg, but fail with Gstreamer).

- AMP_E_Hisilicon_3
- AMP_F_Hisilicon_3
- DELTAQP_A_BRCM_4
- SAODBLK_A_MainConcept_4
- TILES_A_Cisco_2
- VPSSPSPPS_A_MainConcept_1 (this one timeouts with ffmpeg on both
  SM8250 and SM8350 and fails with Gstreamer on SM8350)

- vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
- vp90-2-14-resize-fp-tiles-8-16.webm
- vp90-2-22-svc_1280x720_1.webm (works with ffmpeg, fails with
  Gstreamer)

For SC8280XP (Thinkpad X13s):

|TOTALS|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2|
|-|-|-|-|-|-|-|
|TOTAL|158/311|232/311|93/447|126/447|166/316|133/316|
|TOTAL TIME|85.753s|111.439s|359.253s|65.825s|79.435s|88.543s|
|-|-|-|-|-|-|-|
|Profile|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2|
|BASELINE|0/0|0/0|1/7|4/7|0/0|0/0|
|CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
|CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
|CONSTRAINED_BASELINE|0/0|0/0|7/33|33/33|0/0|0/0|
|EXTENDED|0/0|0/0|0/6|1/6|0/0|0/0|
|HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
|HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
|HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
|HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
|HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
|MAIN|0/0|0/0|20/90|41/90|124/135|131/135|
|MAIN_10|0/0|0/0|0/0|0/0|0/11|0/11|
|MAIN_STILL_PICTURE|0/0|0/0|0/0|0/0|1/1|1/1|
|-|-|-|-|-|-|-|

The results on SC8280XP match the results from SM8250, the only
additional failure is VPSSPSPPS_A_MainConcept_1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- Corrected the node name for memory region reserved for Iris core
  (Sashiko)
- Link to v6: https://patch.msgid.link/20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com

Changes in v6:
- Corrected the indentation in the bindings (Rob)
- Expanded commit message to provide details on SC8280XP failures
  (Vikash)
- Link to v5: https://patch.msgid.link/20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com

Changes in v5:
- Rebaed on the pending next tree.
- Corrected Iris block name (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com

Changes in v4:
- Changed compat strings to use -iris instead of -venus (Konrad,
  Dikshita)
- Dropped separate schema file, switched to SM8250 schema
- Dropped driver bits, it's covered by compatible string now
- Link to v3: https://lore.kernel.org/r/20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com

Changes in v3:
- Add missing header, sorry.
- Link to v2: https://lore.kernel.org/r/20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com

Changes in v2:
- Added missing chunk, including sm8350-videocc.h, lost in rebases.
- Link to v1: https://lore.kernel.org/r/20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      media: dt-bindings: Document SC8280XP/SM8350 Iris
      arm64: dts: qcom: sc8280xp: sort reserved memory regions
      arm64: dts: qcom: sm8350: add Iris device
      arm64: dts: qcom: sm8350-hdk: enable Iris core

Konrad Dybcio (2):
      arm64: dts: qcom: sc8280xp: Add Iris core
      arm64: dts: qcom: sc8280xp-x13s: Enable Iris

 .../bindings/media/qcom,sm8250-venus.yaml          |  12 ++-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 103 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   6 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  81 ++++++++++++++++
 5 files changed, 203 insertions(+), 5 deletions(-)
---
base-commit: 10f943b12e7cb338da00f10e129043ae27b33af4
change-id: 20260120-iris-sc8280xp-85d13bc60536

Best regards,
--  
With best wishes
Dmitry


