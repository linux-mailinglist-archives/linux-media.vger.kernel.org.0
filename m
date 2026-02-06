Return-Path: <linux-media+bounces-52279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPmtHomihWlKEAQAu9opvQ
	(envelope-from <linux-media+bounces-52279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 09:12:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ACBFB4C0
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 09:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF508300CC33
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 08:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35D9329E7D;
	Fri,  6 Feb 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRVRowlz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gl/bUwSH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A88329E76
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365560; cv=none; b=sT7x7P5950fzYy+u5grvJuVeQ1c8v5Js8wMZM4LmtdrxlinCTIvZo9JeAU6Py/oUSCWMTCjxUnL727OPJkK7j7wzEHG/9ojCDI7w4U0jFiGIA0/zrI8CQ3jRg5lcnRwCLK09Ox11V3WZI5irrI870haPQIAzcJj7kQI0Dn2UKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365560; c=relaxed/simple;
	bh=Vnq6pw2BjMdw5D60j/D3wxZnTK8fyniBr8hPrU/AXkQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J1IQUDyRnzyMvll4jLkh/bksQQI3c5Hof8QQi14nGyRUc5HVhTsox11yOniQ/A2caj2/667KFylXEUy1KI2WewjIKoaBwq2BQMsM5wiKHYj9qjS6CxhVuXlhP3Y1xLuaFhXhgi805ZCtExcRvTS/QFIuQgGOVsd/jy3opkdKMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRVRowlz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gl/bUwSH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167Xsch1853178
	for <linux-media@vger.kernel.org>; Fri, 6 Feb 2026 08:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FKlM1xj59h5bt3TE4ezOg8
	8Zz+O06L+Ti0KTvOpupKQ=; b=PRVRowlz5xCpQBlFVvslqfUNahHP9RzZ93Gz48
	FMgK09YfPKJyAlmgpy5GJRV9ns6uMd93+FresjPjKXQfmVRfuC9igqwbTSM/d6IA
	WcrwMKmEeX4hIUaimewEZiWmbYlSduB213pKD4kt/Zv4r6L7c2dgTDEjJKRLjX4r
	IN0ITmmBWF6qhRVb3VKMjzF0COBBdCLkrwfIggpLN610+ABbprEKYDdOawRdWoVj
	8niUFytYpevr7XfpiMaoxC2aIJu7giVkee1wkUEofXbYyUmGQl61biqwmfcjQOj0
	+39QbESrMH2cTYR2JSZ/gQBdFSULMBkDZsL9gdy4dZR104KA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c1483ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 08:12:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8243767ce2aso306499b3a.2
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770365559; x=1770970359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKlM1xj59h5bt3TE4ezOg88Zz+O06L+Ti0KTvOpupKQ=;
        b=Gl/bUwSH6BPdTdKUaCr7FDgp6x89/tEqbDfFOEtxj61mPiPwtviLwfYnehokPiI/eF
         reOY0ktT/EPjT2S2n61+vsGrIFI66c5jRDCSBu+m8BdTgYTiQY8Sb5/idcgfsOErlVdU
         H1DPMeCu+ihR9yBUmszc+ilPm9RWWUgr9pTCqHFIdHHby+TKfzfJ8MuUHZOYMUqh6xVU
         GZ1vxIzyNgRCVqIUGIhJxUchjuzN1PAzoF3rCKq9Kd4+jZHgHVyroJ1bShrngm7EJSoY
         9tmMGPm0pQpdgh7Va0wYnjWCAYP8a+OPFtMbDLE551kw1O6w9+QrbU/72zC8EpMFhSws
         euSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770365559; x=1770970359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKlM1xj59h5bt3TE4ezOg88Zz+O06L+Ti0KTvOpupKQ=;
        b=we5NHcIQ3Y+yS13c9PKbLQmcGb94r7ISDprTrdvALxYgAsrftSsc7WipvUpbw+6F/Z
         JxoiVg/Yyu1DAQD152vsjljVP8W9OnNlSfYSOWSCUrWvH2uLUlWOvX4adJ/jM2Ns7kwq
         ECwnE7Fn2FRJgODWVbSlNN+gaDyJUupyCyQM+Pgigy0rp6b1uFFbvt934kBBUwgKWsP1
         nT1MtAclTjunjVSd49khZ6E5OQ2lzSoSMOXX+VZfxYhGD3ptU7MyNmrwMLqlDHK/NuxE
         Kp8xYXZIVpOmgOQZ6l8bvfyFTWqzNeaoQITet46xkRMZyUq9CwzN01+8lbSwsTCXKxbC
         Qpgw==
X-Forwarded-Encrypted: i=1; AJvYcCW3xEFwM8hidBZwDxhF7EW9bOa3fY4mDe7Ps5zrnMyB8bkQYn434cP0YDUjBgA04unSUTZBqyVWW/WsNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvxDqvpEQfFK5/Dic9ilSYRfZYZeme6OVGm7SitkgIetKpjmSK
	g2IA4y7x85200bK0GOFfWPKjTex/xSQLKnNP1eaVTmND8jrJRMVzfiqQixKVyQmvprIDkpG3YRO
	gsQaZKB/7HhFgZuxKLUCfU3BIXIWFkXnbONE3jKGXR8b8EOslOPWyKHmqlotsX70kRA==
X-Gm-Gg: AZuq6aJ+9H/Y+C0fRp5MhMp9QBprQa+zEQI6xwA6SXKvktBQqyVK6hu7o1D045CGBVu
	kKZQmRT2eaYmZSpm0Nteeyp/a6qa2TO1vEkg9wq8Ui16HwY8Wf5o5l1YRhPPZPnhfPw1PwyLwqK
	8g/wWIGuCPftFmQ6y6XJyo+m6QInq+FG8Ewmoe4PW2D/GJaNofDnMtBWAAXrM9eDrH4uQsViMuI
	uLfM8JRb850SEVXaOLfR/RQCm3p+wnzVodiktjHRbINVdHUsXQRkRglvE62av2sugw1U1SqGiJQ
	mms3qJNCv2daiW9qIDjfFYl3RcqfFbfPf4OZDdKQr9uyLnupRxKy01DQOCmFg8mAk+PQwWGRWES
	2nex5rCkC/v0E6QDWSaSBu0g7QWTmfSTz/Qu4Pv558qCCOa7KwdE7BzyKWTddap5zYlwPwM1WjW
	tDUpbc63ya
X-Received: by 2002:a05:6a00:10c5:b0:81f:42ba:2005 with SMTP id d2e1a72fcca58-8244160948emr1629118b3a.6.1770365558581;
        Fri, 06 Feb 2026 00:12:38 -0800 (PST)
X-Received: by 2002:a05:6a00:10c5:b0:81f:42ba:2005 with SMTP id d2e1a72fcca58-8244160948emr1629101b3a.6.1770365558028;
        Fri, 06 Feb 2026 00:12:38 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm1671866b3a.39.2026.02.06.00.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:12:37 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v5 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Date: Fri, 06 Feb 2026 16:12:09 +0800
Message-Id: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFqihWkC/43O3UrDMBTA8VcZubaj5+Szu/I9REaanNiAa13SF
 WX03U07RUEHvUk4IfzO/8oypUiZHXZXlmiKOQ59GeTDjrnO9i9URV9mhjVKAJRVa0fX4TGmmI/
 Uu8FTKnf56uhE/ZgrTtIJbBtuUbLCvCUK8X1d8fR8mxOdL2XTeHtkrc1UueF0iuNhxwMKEuSdh
 9Y0BpxqhTBkUZlao/LkvdGoG7ZYXczjkD7W+glWbHvoBFVdWQSpg0KnTPM45Lw/X+zr0rIvx5L
 /5emNniSrDaEntPTXW5on/OlEaDa4WFyuIehAKEwNd1z+7aoa6i0uLy40ykhJgWNr77jil4tbX
 FFcCtY64GBl0P+48zx/AmMo0ct7AgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770365554; l=17119;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Vnq6pw2BjMdw5D60j/D3wxZnTK8fyniBr8hPrU/AXkQ=;
 b=gUaDS1/2TU1C91XiVj2RFpipqkgh/AjdC3aRUQFF/2RyPLlDFGbctIl1uUMPreI83b2e3zXcS
 mr714IbKjBuDjg1Yp3u2P8DAg/eEzlTC5D6hMp6rQ8+mc+UmLUvWSrQ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985a277 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2GNNtLnNkeEL9WC-KFsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA1MiBTYWx0ZWRfX5ecAISLIVvc4
 zfz/dj2pHEA8cLweC3YhR5cJ+TlzqMoI5R1E7Oq5Nmmvc3WPXgqR2TwkV1TlAGld08BZP1c54bS
 AC24f084TVq+dSGP9Jx2fnbDnDZNVmomLZ173FSTQ0Ttyye+GnzMv8++v+yh8CzxrIaAB9Q4EbA
 C1B6ciwQIbvPrJMP/0W4js/FmN+QpMmuvN8Ei5J8xUlBD9mxhJsCcBkeesKnYWnThJfKA7pQCcu
 W4Z+hLaR0CSwUwoH3PQvuX4P0aYYkZY+LgihTg5jHOgdYKwAiaOn2Z8ZivrNbhf+eEB1gwQ2wRK
 V6rOpGsYcvrGnhj4VaXhxQMWG76V28qkcCUgLtGVUKve3sTE5mFQsviTgQkV0iA/p4mKyR9daVD
 P9AnoCVj5qK0e9aIlTjMZ1ZYuvIWXJWYOHbNIUbitgsOfApBvrs74ah+1oYIPB072NwlGhCbPmE
 E1a5MC9t8Anj794v4Cw==
X-Proofpoint-ORIG-GUID: OYe-KjUvflOLmmp1bofHWjz3EexRvf5S
X-Proofpoint-GUID: OYe-KjUvflOLmmp1bofHWjz3EexRvf5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060052
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-52279-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1ACBFB4C0
X-Rspamd-Action: no action

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
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


