Return-Path: <linux-media+bounces-65066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VYumNuDeMWrtrAUAu9opvQ
	(envelope-from <linux-media+bounces-65066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 01:40:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C737695BFA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 01:40:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l2QSqrnl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z9UFwjbn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65066-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65066-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CD9C314B6C5
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 23:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEC8481FC0;
	Tue, 16 Jun 2026 23:40:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475AC3F23C0
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653210; cv=none; b=BvdYss3roY3d3foTXnyGVk99mJzANHOKjbT/vxiH3b3LWQWZ5HqzHNmwnhhLQpYijdXCPHWyqm0LiLpYKWWLu6MX008Wr0wr4KU1bRO5k/oqWCKHJwXG5TN9Po0MfS/LA/2aSBW3ppam2AFnXs44ydCjnayWDOK1sWNcoLtVel8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653210; c=relaxed/simple;
	bh=yNMUWb5Y+60YVxGF7kl63GNYPl2UKKGa3y15L2vP7rA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZNlnwH/G+bHr+jZa0JQeVisprpi/Ex/I7pGBHVvsb5VEita8FgiE897BHCbjo2x8NExWdun8PjIGw5CRajnSDbfK0Mxhhb7RgbDpIlV8jTRCMD8U911AhiCjQt8iM8TiloILFJt6REKGRsqWO2TeNBvgVbRuy1ffT74CkDsi8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2QSqrnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9UFwjbn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLVxKV1816185
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gh9zzMuTowQO7XrJBUk8TB
	IviH5cPM1r8wircBtM+aQ=; b=l2QSqrnlIBHHIV0TYvKRPJUUMWIaPQNy/kersp
	PTLnKT5JLleYWn5fprwkTPShX6CN283/NB8ziZnSYrXk/xBiFq03oQl09os+xa1p
	l730koI48caG8QQxwWXCaPXZN3XGJiYjWcFKnqQ5BExxT2nK0cHfjFCjxDWBv1ie
	DPNzO4qF4nddorsZ9qgGCpFipBqnhbADoLjyBsp1jbJa2nbiA69DUIXNh3kFuzWu
	N3M8PiehasqM4wNle5204wdZuqgtp6UoyLQYHQGdqz6XJBZL3py6K3j24eZZ/olv
	NUaPFhDM5h0Z89/mRd/Tnj/J4sJBjsb89KDE1D4/+ZlyRxVA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbrckj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30715229191so518108eec.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781653208; x=1782258008; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gh9zzMuTowQO7XrJBUk8TBIviH5cPM1r8wircBtM+aQ=;
        b=Z9UFwjbn53z5onIOOvEePpUKwyxVcml19kKKJEK+adQr4JvcyjC1T38RL9ts0sfaAR
         HN1w4bS9dT/NG77b4qRfRDpTbRiOewgDUSAyg3spe5YEnhZxEiH0NlKIEupRExxxUrX+
         e/Qum5b+37Z1Zu4LMesTaCYbS/PAnfQGONdfh2WcbNeNkeS9stNpXAn0dmEyYCU+4I3y
         P1neLoYQVEaA6d51uUEZF9EODuh5FkuWlAySlwldpxm7Hr80DeuZZZp3AVF26bHrl8pJ
         P8psB1o1a/EszHtUlbxj6oRon2FCxm+F5dygyNJnxgzlhPN8LgcPJ5DPy91hulpEAeki
         9Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653208; x=1782258008;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gh9zzMuTowQO7XrJBUk8TBIviH5cPM1r8wircBtM+aQ=;
        b=Q44coyc1AEj0mdTGHb1ObLVWtTjppnRZMSIpJN7kWsGOluKiVdQWYeYZ1DWX1n7Jzi
         lEwVoNbR2ORMURj2Lg5qEulO5b2ZGlEsLIC02IRPbfZDkxNeLmtc12Uf+uEZkdCbw4lZ
         F3GuyuP11neaWtrZxhm0c9FzDB/uOV3L4rnirAG7E3p8wMiSezdpLK9/pT+vmFkcTZiq
         OKu1Pn2GsrpK8VeHet1FjvSWDVQzTSZDacLq+xSb1Ws8N/hjCOWNFMtiO9OZahS6euLb
         KRosi0vu/Qjc8uirzljMm9KnVOaRQYXh0t/goiOpYmNP93kpcp6SPvTyi4f+UlJ/JIqL
         o4ig==
X-Gm-Message-State: AOJu0Yw+swvNxwR/y0icItVfrXzTIwfZEaGC4l5Y48+YLONL4yMPaZE2
	gH8/AbIDmKpkc4UvX8v8t4kYhkTKifZqx3pkWWN5VfgDsSdw2EcPuAj391Cx0f+qakT5ULcqquE
	jNeMtth/ZCPN+IaAFCu4OOGS5xipCc9DNAdzduJ9JAB1A7wIZwIOmKuATPOYckAJZFA==
X-Gm-Gg: AfdE7ckOf4Wg8lotJ5nwFYKDdYcRs3WsakjgxgHT9OCtTxxqABB2EKjS/pXiHVaKZHZ
	IZyBexypnHndJoV4KQjGz0++r2rrFT2HomGdpoGRX69iRbX1QTTRrWMXHIEMmvFA46JHwqrcFE8
	JyCFSdTxaFZb2ChdgHYhdVvH82g4v24u0fVxrM7t/betQNBwguFYXg7Diwe1OCnimH7DJcZ0i+4
	vn6L4zQV0CqcK+XbIkGn/fpYvbPMtNWNLwowMPcPxveh2ja04FfuuLH3FYxwQFdF+9gFpkhUgYj
	vtEl8fkYTvmekURsqi4afMeb7U5zhUppLbkVRUTQuMFRIcOVkmMdlgLolIp8livGOcIXuNP2A3Y
	yl6lZMHYtgSA1gdICZtZ7H9rozohH8N2mJaFA6Ly2vZJQnDVYgXeK6oxdqvhcDcNz5mN3i5PCsQ
	h/9YHHkQ==
X-Received: by 2002:a05:693c:3118:b0:2e5:faa9:ca76 with SMTP id 5a478bee46e88-30bca0ed2d0mr381150eec.7.1781653207560;
        Tue, 16 Jun 2026 16:40:07 -0700 (PDT)
X-Received: by 2002:a05:693c:3118:b0:2e5:faa9:ca76 with SMTP id 5a478bee46e88-30bca0ed2d0mr381143eec.7.1781653207015;
        Tue, 16 Jun 2026 16:40:07 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm2828607eec.22.2026.06.16.16.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:40:06 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH 0/3] Implement Region of Interest(ROI) support
Date: Tue, 16 Jun 2026 16:40:02 -0700
Message-Id: <20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPeMWoC/x3MQQqAIBRF0a3EHyeUlkVbiRCzV30IDYUIor0nD
 c/g3ocSIiPRUDwUcXHi4DPqsiC3W79B8JJNspK60rUW8M7EwAbezgdEs6i+dU3XKwvK0Rmx8v0
 Px+l9Pz8dmyRgAAAA
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781653206; l=4136;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=yNMUWb5Y+60YVxGF7kl63GNYPl2UKKGa3y15L2vP7rA=;
 b=D+ravmlfXpAgpOVhgJHA2Ko1YabJwKfFtOKcP7KtGU9xmyChul2lKuXuQzFzfkNdGhi2v2uS/
 QZf4rCSHsKpCaWx+8BFsO4u5dB+fwFQG6yTKX+uIiyfWOcxYUU1DzIZ
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: YDJTXckt4UQXohr4Y5GOAwDFpLV5WfU3
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a31ded8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Um9VFfwTIzMb-0Dl9GAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX/1bdE2q7yYj/
 p7AAsE9l+xOTvSdIcyzmEBZ2ADRrXZyLAE/GlDEMsSmQZY/vsP99lhxM0UJ+kxzjclNsUlGUrqG
 31dBOtJbbVD0UD+8Ep0xxGiYZCSF3rQ=
X-Proofpoint-ORIG-GUID: YDJTXckt4UQXohr4Y5GOAwDFpLV5WfU3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX0CXi95qVE2X9
 2/ZEg+WkctpSAmWmWPXeQ6JoNUSvQONoADo8ymlUWAKsDWPV/YwadgQ9Ajdyeam7BaoJSabERCx
 /Rz1SKpbP5JlO2VzWo86IgK+qiHoVT820okEF5eizErV2VaVSmKYichx7MgacFNL78vCte4P4R0
 1Y9KHd7uD7Ni48UXt7RgkiPDHUZVCJ18HOeQUlodtB+GI8eHyOC3awgX9fOp116u/gt8UVwoumN
 ct05wTk51MafomTPzNV/gVJJEJSsW0QATIQpm9Cq+XrVHkSatHvDYlB2TJlF4APyrzVYP3H4m0A
 vJc75AfJ1Bj/EGlvW9shyJvzsYeFM8VaeDaCpcQY+f6jnso1nKVudbh17FATlJ/woIQPkWFiDMG
 6cNZyjJsODz5nYDzEVQB/z1IunYjdtYn7WH/SpG+dijMown0/aFxtd5umh+xeDq60+maOui1B93
 5F36kuPPNckRc7FVbCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65066-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C737695BFA

Hi all,

This patch set implements region of interest(ROI) support for
video encoder to be configured as a MB based delta_qp for
the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this. 
Corresponding support is added in iris encoder to implement this
feature.

This submission and design is based on the feedback received
from community for the RFC[1] series posted earlier. 
Initial testing is done by adding support to v4l2-ctl[2] to test this
control setting and its functionality.

[1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com
[2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com

Results:

v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload

v4l2-compliance -d /dev/video1
...
Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10

Validated on SM8550 MTP.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara
<deepa.madivalara@oss.qualcomm.com>

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Deepa Guthyappa Madivalara (3):
      media: uapi: Introduce new control for video encoder ROI
      media: v4l2-core: Add support for video encoder ROI control
      media: iris: Add ROI support framework for iris video encoder

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  14 +++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 101 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 104 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   3 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  16 +++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  62 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  21 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   1 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   3 +
 22 files changed, 409 insertions(+), 6 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


