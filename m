Return-Path: <linux-media+bounces-57827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLzpCaeOzGnXTwYAu9opvQ
	(envelope-from <linux-media+bounces-57827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 05:19:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3E3742CC
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 05:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAA0C3044BB4
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 03:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E363630B2;
	Wed,  1 Apr 2026 03:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mrot/gKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PeK478iG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47C314D37
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 03:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013304; cv=none; b=TAVE4gDw2Sk+HLrfajl5XkDu694LuyOjxSuB+5nHlmVJDszzHSVJufxKw4hLSFLdnHBKuwTCaqQxdGeNOdn9CGwSb4mtZHU49X952SOf6aB02Q2zv/EIQHHKbe240hsCNMFuwHGaTVL5qPr79U4eM3eXIH/pvQ7koWBvfBuotqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013304; c=relaxed/simple;
	bh=L4AEyZloX2qlxChxL8bv7wpI513UPUYwn6panmQkd8w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=msQuDBU4AhY5lV7iCe5u0f+u/+8I1oOHrf32yGeOIJDba5ayjZUh7CrvKl1Dt8dO5OipRug6FuNNM5gxWaI9icH08C8+6x6CFZ0pJX0jjAq6AGlinQYtnZLqCktGWmXviCF3tFZ+wlGzXoECXJCH8CO2QkO4sNenzp8tvREFFc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mrot/gKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PeK478iG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6311PjMx3103850
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 03:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pFGcwrNRPO9fAmmc2QWMfG
	Q+riu0G8OOZZF/90bZk0c=; b=Mrot/gKY8cAI7NwUFlEOrbBl54gKNKF2MyYkK1
	C1ZkEiqDMdWZSD45e7oO2dwnpD9gV5wCJusARtIIxFbuD/T3VS8HBmflpKqShJOM
	+mPTso0xqYzMaD+NhmU+kS/U+volQMWEok/3nFBPBRiJxhKsZghQNj9d0FqnhcTk
	E2RIXTX73+c0rp4q2+X0U3VVPlYD/hicBzGky3Nf2rYNloU+A/sOcX5mblXmf4uv
	Q/4hn22kRTRiJtjrycaj+jTKdphONkF/GX/sEJC7OW8IeStyHbw0uHm6kKRVSzxc
	EZJJxmhkVzsqxCSI9mqMEif/iztiEApJtwKeaGcSm5q5dosQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js225qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:15:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cf084fe58so47010b3a.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 20:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013300; x=1775618100; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFGcwrNRPO9fAmmc2QWMfGQ+riu0G8OOZZF/90bZk0c=;
        b=PeK478iGi92cugHS1Valu2Bjo3Etpqtb8Ay5VynrPn9syaxBu+RkK9vUp/BvwLqDof
         WXQgWVpF7mNz43stFiacwr53mL+8LuJen4erTxwjX0m90q6jvzl3NPXxGwfaKGRqi86a
         Z9vWHQ36vzC7Gh60pS1xZRJ+iqjU+ghpghjx1+Dkf5S4mxTA6NRYkmNZJ3uNNbaoxoB9
         fxc/x0Ia7Q95X6oC1LkBNPXrA9h8D5JXyBIZvBIKWuZZiUbfPGs7V1RzhYl4NJDINCLj
         y3ib0p8IE3Ef+EaRBgf1CG/P5SfKMKm2yTrqnLfj3ZYg8lvkjRXyziq+JGSHThmHPzgD
         95Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013300; x=1775618100;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFGcwrNRPO9fAmmc2QWMfGQ+riu0G8OOZZF/90bZk0c=;
        b=KQEF98aVtbx5Iiz1Ki/KyMePd0UfJSsQT6IFOdGCduMg94Rh1FmN7bZtIuvDwMIxNR
         C7iZEp8mGvALXHgXPx9y1W3Cr74Zm/wZ1P32+CoPmKH5V7kKFlnfmGPi1zcD49pVTPYh
         PFSquvkK3bbAOoXPTINrcDdbioCQ1NcBSfvMKzc2RQ4sk7ytw/h+tTvKVLyVQoOKDAiB
         XB675BvL2XfIzs528uLHGyn6DRfurKzfRdMNWJprXeTBYzV5V80mBVa5rPyJz2AiWSd2
         ap64cQF/ZOUIth5H44wsiEr0dytl1qaH1Rm2suqh4r864f90e8YgjLyp3EPF8H0poS8P
         F/NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDm/3L//FBQxUrR5oyiWc2Jumj5FcihyezImfFFoFkr7V+JPPBsSpEdHsRxTLDbueFy6f3HiDaom1DUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEzHKgqF4Xx9PzAgOIQkHBTNOaO2LsNKXij9rU+8xgQ6dqXXc6
	nRjaqR3tTb+7NckM+STpPgBlTsl4dpos0/Sn6J3qB3rXs3jXpkcDhaU/XifRkmiSvaRc9SiLlRx
	O++OAWYCS2GlRX7PC4irMZYeamC2lXcVGhHzCsBHkLW6y7ChDRx7pmWgzbxJuvSMVSQ==
X-Gm-Gg: ATEYQzx4dczT1hTgnmNq5Ofrh1J2Qv8x8LkBtYlVZgYZGzfuKuN09brMridIeTTAwGY
	O0BORrOcbmSJWVckCcBdMxmyOw/00aZsJDSgcAABpKMLEBL6NU7cgnbb0uwcD4q+5FadJuaHhWb
	4AcsxxhX8vv+C57JGDnWkfGmqrRW31kt6Vxh0cTdPoUA7AKWUiPr0/m9vBEhhfd5ER8SxkkhC+4
	+sFrZ6jwhgtAKUJq1SKnyBXoe6vh2KO9cd2BBZwG9kMe1YjlBhrjOudXhn/pGziG9EEWgvcubM8
	k3Bcq6cChlpumFD0OAV2hk0VNklF7ciQ4ZHqsrZMTX19qoNZQxmv4zkvnhJdr3DHgnfeAyWdjOv
	AryvS15AHpFe7E7Eg/4mLYWXvqCVy58ELpECtwRt+OOhoyvqTYKYM934eWo++xWYF7I1gxUL02J
	Q5UiOQer78B4raePAS6c+t
X-Received: by 2002:a05:6a20:3ca1:b0:398:6461:6884 with SMTP id adf61e73a8af0-39ef6de4cf0mr2018993637.0.1775013299635;
        Tue, 31 Mar 2026 20:14:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca1:b0:398:6461:6884 with SMTP id adf61e73a8af0-39ef6de4cf0mr2018953637.0.1775013299002;
        Tue, 31 Mar 2026 20:14:59 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76ad00a246sm3246584a12.16.2026.03.31.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:14:58 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v6 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Date: Wed, 01 Apr 2026 11:13:42 +0800
Message-Id: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGaNzGkC/43Q0WrDIBQG4FcpXi9Fjx41vdp7jFHUHFdhTVpNw
 0bpu8+0Gx1shdwov8h3fj2zQjlRYZvVmWWaUklDX4N+WrGwc/0bNamrmQEHFAKw8W4MO9imnMq
 W+jB0lOterwbaUz+WRhIGBb6VDpBV5pAppo/riJfXW850PNVJ4+2QeVeoCcN+n8bNSqESJrSm0
 xpbZYT26G0g2wLvMLQWRKuFxMhma5fKOOTPa/tJXLHlRSfR8MaBQBM1BG3b56GU9fHk3ucu67r
 M9b89s9BDcsYSdASO/npz5wnuPetjFrhQXWlENJFAWS4euPLH1VzwJa6sbv1Ni0hRgncPXPXLh
 SWuqi5F54KQwmE0D1y8u8D1AherG71B6mx00uA/7uVy+QIRAb7B0wIAAA==
X-Change-ID: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013294; l=17266;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=L4AEyZloX2qlxChxL8bv7wpI513UPUYwn6panmQkd8w=;
 b=edbJonBqrJN6JESlXsyFyZhnBhH5/vUQ5iDf3KLcuOvQR43zwwkxOpWYP90iSDsguhrHAwPkP
 1EKzsVBC6kGBArmalBXlL6CO5qrWhnNViOkuQSV08QUDGpQ6Wbbw0cV
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: LwKd9t_WLf3X3tXHC2n2UanM3TdxNe0m
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cc8db4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2GNNtLnNkeEL9WC-KFsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyMyBTYWx0ZWRfX7rO9L26fFQix
 q3ZYXGMSZzFmOmIBgp1s9MK2Nlcz5jnLkW6KohPvAQEzQqpgMdjup11Ht6pabhs4j+MzGbI3QiL
 iwAji9qh0GRJqBDkmKFu1loX6NuvAs9LvVfLze5nYXik6KrZ8a2w38EpQO4QID59tX7/4mwMMLT
 b6XyTkkvgxbReaNl/ZOXWm6jvTK06w9tLRtJXH3c679xy4lkjseOCAX5LZkgZ9euZ3kQVSU9jUd
 IKpUzK803T79eNfWN3inOPWlxAzAFHFpq6n2cT7UcLOAwgVCFFSsKXqBdCFXaMbnnc3zfdf2XO0
 24AaRRgR7jMibvhaZXE5sqiA5rNzlNAyZEDYypohjZ3tckin3kAi/6Cv/bamA7MwuQW7HWNUFZf
 Xed3xsUmSuTWN54X+uL3GA2xX7YWdoy5umAWmXNdbzMbbJbJOaeDkJz8V1/oiCW5/ysG7ySetfd
 cKcryyNUcVh96DNLjKg==
X-Proofpoint-GUID: LwKd9t_WLf3X3tXHC2n2UanM3TdxNe0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010023
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-57827-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80A3E3742CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
 video encoding features.

All patches have been tested with v4l2-compliance and v4l2-ctl on
gen1:SM8250, QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.

Commands used for V4l2-ctl validation:

Intra Refresh:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_random.h264 \
--set-ctrl intra_refresh_period_type=0,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_cyclic.h264 \
--set-ctrl intra_refresh_period_type=1,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_random.h265 \
--set-ctrl intra_refresh_period_type=0,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_cyclic.h265 \
--set-ctrl intra_refresh_period_type=1,intra_refresh_period=30

B frames:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/b_frames.h264 \
--set-ctrl video_b_frames=1

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/b_frames.h265 \
--set-ctrl video_b_frames=1

LTR:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ltr.h264 \
--set-ctrl ltr_count=2,frame_ltr_index=1

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ltr.h265 \
--set-ctrl ltr_count=2,frame_ltr_index=1

Hierarchical Coding:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_p_layer1_3M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3,h264_hierarchical_lay_1_bitrate=3000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_p_layer1_6M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3,h264_hierarchical_lay_1_bitrate=6000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_b_layer1_3M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=0,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3,h264_hierarchical_lay_1_bitrate=3000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_b_layer1_6M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=0,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3,h264_hierarchical_lay_1_bitrate=6000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_p.h265 \
--set-ctrl hevc_hierarchical_coding_type=1,hevc_hierarchical_coding_layer=5,hevc_hierarchical_lay_1_bitrate=6000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_b.h265 \
--set-ctrl hevc_hierarchical_coding_type=0,hevc_hierarchical_coding_layer=5,hevc_hierarchical_lay_1_bitrate=3000000

The result of v4l2-compliance on QCS8300:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.18.0
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
        Standard Controls: 52 Private Controls: 0

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

The result of v4l2-compliance on QCS6490:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.18.0
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
        Standard Controls: 33 Private Controls: 0

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v6:
- Rebase.
- Link to v5: https://lore.kernel.org/r/20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com

Changes in v5:
- Fix incorrect logic in max_bitrate assignment.(Vikash)
- Fix incorrect hfi_id for LAYER5_BITRATE_HEVC.(Vikash)
- Add setter for H.264 layer type and layer count.(Vikash)
- Link to v4: https://lore.kernel.org/r/20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com

Changes in v4:
- Fix the bug in the H.264 layer type check.(Dikshita)
- Add streaming check for layer bitrate setting.(Dikshita)
- Tested different hierarchical coding type values.(Dikshita)
- Link to v3: https://lore.kernel.org/r/20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com

Changes in v3:
- Correct the maximum value of IR_PERIOD.(Dikshita)
- Use 'codec' instead of 'standard' in the calculation of COMV size.
(Dikshita)
- Verified these patches on SM8250.(Dikshita)
- Link to v2: https://lore.kernel.org/r/20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com

Changes in v2:
- Add comment for ir_period calculation.(bod,Dikshita)
- Correct the maximum value of IR_PERIOD.(Dikshita)
- Add a patch to optimize the calculation of hdr size.(bod)
- Correct the num_recon calculation.(Dikshita)
- Add a patch to simplify the calculation of COMV size.(Dikshita)
- Catch the result code of session_set_property.(bod)
- Add comment for shift operation in hfi_buffer_get_recon_count.(bod)
- Add support for layer bitrate setting.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com

---
Wangao Wang (6):
      media: qcom: iris: Add intra refresh support for gen1 encoder
      media: qcom: iris: Add Long-Term Reference support for encoder
      media: qcom: iris: Add B frames support for encoder
      media: qcom: iris: Add hierarchical coding support for encoder
      media: qcom: iris: Optimize iris_hfi_gen1_packet_session_set_property
      media: qcom: iris: Simplify COMV size calculation

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 485 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  16 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  98 ++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  49 +++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  18 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 161 ++++++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 226 +++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  65 ++-
 10 files changed, 1112 insertions(+), 41 deletions(-)
---
base-commit: 45417c97d66594716b5b8ce8920d5c982196135f
change-id: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


