Return-Path: <linux-media+bounces-66707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D7ZGKM1aS2q/PwEAu9opvQ
	(envelope-from <linux-media+bounces-66707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:35:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B8670D9C4
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:35:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DKyyUa8F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L2g+SA3R;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66707-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66707-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CC3530E080A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7EE3F0750;
	Mon,  6 Jul 2026 07:12:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B9D3E7BA4
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 07:11:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321913; cv=none; b=Gs6fW6xMzxKiWycBJ4Kis9wJtajRaVM/C0J9bTqElSU20WPZVlHYJdKc2ceLSuJ3JalhWu8bKfnSr6PO/ie0HZKnDDqOY5N65x2naU+5QgUr25LWwk//yjdepLw2dIZ5VJQN0Emkf+wNTHynyFPqyRr4M52Hdua/NLAOT4ulyX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321913; c=relaxed/simple;
	bh=5u9stqC0KF3uYSx7HJ8fkCoL49Xcw7bLd/d4Npe/jYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0NgrCFJsPMyn1eifovyOKBfvmIWHu4A03sP03Ax/drwSbsEGDyJpGTCuZu7GZg837spWjyqb5RRPx6SGWM6t1Znrv6Z6OA51T128dVTWDtbvRlm0VkdqQwo0jpenVhK2rYq2YyXBWilzhaT8Yx3wAXyi6HD41o8JeSf9rer43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKyyUa8F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2g+SA3R; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66678F9d3976365
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 07:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0KxipLgGa8sY5GQKtpRGmvNmTv2ldkKF3pFetpcdiM=; b=DKyyUa8FeeyGDxrw
	nRmKIGXjFZg/l1Puh7gRejtyHHzbfmopCOMaPbgrbq3ejIHJ2KFuDic0NrMZFl7F
	mIPqFDB104EWxqoPZX8knCBrlslWVsOYclA1sY1mBQvmuzRSrnwAoCKZ4Un8ltJW
	KGp+tUmOW1HQO+9JnfNmdabUuf2EJclBczUMo5bxb777A/JCXXqHFR3ICGOanumV
	u9iQiC1RhI3yYq5dW5Vg9EnTQyEVnHDQlwO5s9Z/5Bp9kahUysEatED1E3uahmaK
	vE4s7bieQNqwgu20Td2/gB9vIDiOVNj/oNr+FyJqnuKGKl1Sv149MtjygXQD10JI
	0mAQ8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7g0b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:11:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso57388251cf.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321893; x=1783926693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0KxipLgGa8sY5GQKtpRGmvNmTv2ldkKF3pFetpcdiM=;
        b=L2g+SA3RN+z3MSqi19y33U8xSsL9WTmlCOn8YJ/HrInIL/OwUod7rAZQqDlevqcoAJ
         GTWhB0zplpg+HsxWbMbfwCgMb1cNm9zB7E/Gkf7aYN5nReW4NWpBPQwxA9AAv0uVKvDm
         X5uZz9SlfWK3uq85sbI6ev5rNTQHznPoxtabVEVniIUGosCiCTnIJI24Ev55Pu3o+11g
         TQ3kkbOWe3afPvEWacTm+uGbM7ZPq3nGCpWWSvDJ4JUPrO/AmZFrZxNTdIn7pAcXhxyT
         ompeBvFdsTLdi2oZt9IWbe8EL24DSrbz9sGrMGgVl5deBaMeah4SWXgy1y+7xpfdQxu7
         nPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321893; x=1783926693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h0KxipLgGa8sY5GQKtpRGmvNmTv2ldkKF3pFetpcdiM=;
        b=KWkgWjjIXNeA4fzA3z9PIzwRRD/8pe00suLYb5vY/g/CXyEEh14SFW7e0u+ANYCHeZ
         t8q9vKWgQ/RqtPx6Y5M/2+NBXCBSpEcbPM6bZGR5aqZvkYFaBbefzcaKz/dfOjuED7rw
         EWH9EUHHxohnOqg0SsLDHjf5502uxkxT5+x4kWnaDTyNNZ6J8jhYS7e3ZtO4khmumTML
         I+m9/Mzb+fwfSfakCp2fg8p829zfKjlLAq3c7uP5ndFW7AUKnMs4v0ASFzCrGikC6a8t
         XV7F/XD4lndVzakxLKq+fUVY4JzW5LlaW0kAASaQVgOkWqJ2iEhQxRrY8odAggVxDmfC
         0WMA==
X-Gm-Message-State: AOJu0YzhVfASBTv7V3ecPJtljtUyOSe5Lwe2IR4RvmNzY765zzNg/sNC
	1HlB/+CA1MCz+89XfkqAriSl3evm4Tb6SBh1MlzvRo1NGFuJzpYNaDnVnHVSUU2x5K6kpDa9zvE
	dxx9nEI5ps3wBylWnSi9mB6yCoyV4oT599hX3wPKc5w8I3GKAzxVAWvZ/uRJ4i62EXahjG/1nAK
	hh
X-Gm-Gg: AfdE7cmY0hghklgDbn1pJMuvDiclHEpCFFJJW+wUW80lBVoUnhU2DoDlcKdnIAf/Vhj
	6EYWPunjm9Bk3aMruhaTKV7GDqaJQzVXAxEYTVGx3egiDEWE3cYeFF6Afs0ZBZ9+wiOV0mzuoVL
	tdMb58FwvouzHLbpsObvpaVsRGWH2ZsruTDBd5ZVkAEphlcB+bGZkJ5WB+XKClpvnCVmuWivHvJ
	GF74Yp8Qsg42CbW7q07DBkmb7T1csAGq5aS4p0NlxrU3QSa7oamQMVYZ4fc0Mli1quOw9E5qOo4
	khk8ZZvYDjttYYXkvcaatOXdcv5yG7P/sQhs5xSk/vYKWY/YL0lyOv7LPhqb4icrw3b8PVmvDGb
	JleSQeYpuGpkcZ5HtDCKhzNgXGCDEVO85mEM=
X-Received: by 2002:a05:620a:2a01:b0:92b:6805:918a with SMTP id af79cd13be357-92e9a52511cmr1407506885a.66.1783321890488;
        Mon, 06 Jul 2026 00:11:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2a01:b0:92b:6805:918a with SMTP id af79cd13be357-92e9a52511cmr1407496285a.66.1783321888164;
        Mon, 06 Jul 2026 00:11:28 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:25 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Date: Mon,  6 Jul 2026 10:11:13 +0300
Message-Id: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX8q9EL5zrDypK
 +yA6UXjxP9g/NZQF/RwYFkXDPLSLfUkoFrBOIvfWCkuypW/NFQNGudUYXOnmwtn1psQdZvCFGsk
 Me+alm84Ym/eCKdIcfb4CuoUBThghdmFo9gvepMiUEEW99b+4kjA1RTrRHo9cCgqBU2/jPuURWv
 lKe1YUbCNObdqNBy2dSKfGWWK6A5SIPsWlhlgRzxxrmuBKsQrNalPylMKZ3Po4RW9x9q74qUqlL
 4yGnHMS5FtXPS3kX7X4tBZQD/0EMCuNweHK8V3bMnB3oBTVmceXcyPOn7kR4Q13aHIY5ruatGru
 wP2vpby2xuAsGKqM5GLKuqWAb5UnL840txr53loaBtggXoNxAuQ3k/AjH6TwutHJ0yyL/oarZPN
 U9CB2ZiNm96xaE7QS1qiNVuqumJkAHH13JXZQ1JLQvcMa8YfH++0NT6hbPhIAb+7lHdM18VDH0i
 1Xw3MCtbVAHfcOXtd9w==
X-Proofpoint-ORIG-GUID: ECxaHUXLb4t4aVpLpPG0qJumMGbX-mBc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX4yb5UMTko1aq
 GehlplUmHeFmLZevmcldQfDmUzolJkqzYhPw7hyf+kcAQAeYEQ+aSzcRzuICokIYXZXiCufeMx1
 HgLW5Dt1MwEkk9F6xxBpeUIhKIsh5Oo=
X-Proofpoint-GUID: ECxaHUXLb4t4aVpLpPG0qJumMGbX-mBc
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b5525 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=SSmOFEACAAAA:8 a=EUspDBNiAAAA:8 a=zojmOFSC_1GoH6_D6NIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66707-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19B8670D9C4

Add a Qualcomm JPEG encoder driver implemented on top of the
V4L2 mem2mem framework.

The driver wires vb2 queue handling, format negotiation, JPEG header
handling, interrupt-driven job completion, and runtime PM/clock/ICC
integration for the standalone JPEG encode hardware block.

This series targets SM8250 (Kona) platforms.

The jpeg-encoder node is described as a child node of the CAMSS block
and is probed automatically via of_platform_populate() in camss_probe().

Usage examples:

- Check of related video node: v4l2-ctl --list-devices
  The expected result:
   qcom-jpeg-enc (platform:qcom-jpeg-enc):
        /dev/videoX

V4L2 Examples:

v4l2-ctl -d /dev/video14 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
--stream-mmap --stream-out-mmap

v4l2-ctl -d /dev/video14 \
-c compression_quality=100 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
--stream-mmap --stream-out-mmap \
--stream-count=100

v4l2-ctl -d /dev/video14 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
--stream-mmap --stream-out-mmap \
--set-ctrl=perf_level_auto=1 \
--set-ctrl=fps_target=30 \
--stream-count=100

v4l2-ctl -d /dev/video14 \
--set-fmt-video-out=width=8192,height=8192,pixelformat=NM12 \
--stream-mmap --stream-out-mmap \
--stream-count=1 \
--stream-to=8192x8192_NM12.jpg

v4l2-ctl -d /dev/video14 \
--set-fmt-video-out=width=8192,height=8192,pixelformat=GREY \
--stream-mmap --stream-out-mmap \
--stream-count=1 \
--stream-to=OUT_8192x8192.jpg

v4l2-ctl -d /dev/video14 \
-c compression_quality=100 \
--set-fmt-video-out=width=1920,height=1088,pixelformat=NM12 \
--stream-mmap=4 --stream-out-mmap=4 \
--stream-count=100 \
--stream-out-pattern=21 \
--stream-to=OUT_1920x1088_100F.mjpg

GStreamer examples:

gst-launch-1.0 videotestsrc \
is-live=false pattern=ball num-buffers=50 ! \
video/x-raw,format=NV12,width=1920,height=1080 ! \
videoscale ! videoconvert ! \
video/x-raw,format=NV12,width=1920,height=1088 ! \
v4l2jpegenc ! \
fakesink sync=false

gst-launch-1.0 videotestsrc is-live=true pattern=smpte ! \
video/x-raw,format=NV12,width=1920,height=1088 ! \
v4l2jpegenc extra-controls="controls,compression_quality=85" ! \
fpsdisplaysink -v sync=false

Performance measurements on SM8250
(NV12, quality=100, GStreamer v4l2jpegenc vs jpegenc):

+------------+-----------------------------+-------------------+
| Resolution |    HW v4l2jpegenc (q100)    | SW jpegenc (q100) |
|            | Execution | avrFPS | maxFPS | Execution |  FPS  |
+------------+-----------+--------+--------+-----------+-------+
|   512x512  | 2.2332    | 1139.1 | 1195.4 | 7.1055    | 358.0 |
|  1280x720  | 1.7300    |  418.5 |  457.2 | 5.0585    | 143.1 |
| 1024x1024  | 1.6991    |  374.3 |  397.4 | 4.7304    | 134.4 |
| 1920x1088  | 1.6596    |  192.8 |  193.8 | 3.7913    |  84.4 |
| 2048x2048  | 1.7277    |   92.0 |   91.6 | 3.6343    |  43.7 |
| 4096x4096  | 1.5887    |   25.2 |   25.3 | 4.2163    |   9.5 |
| 8192x8192  | 1.3104    |    7.6 |    8.0 | 2.9987    |   3.3 |
+------------+-----------+--------+--------+-----------+-------+

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     |  143 +-
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   15 +
 drivers/media/platform/qcom/jpeg/Makefile     |    9 +
 .../media/platform/qcom/jpeg/qcom_jenc_defs.h |   37 +
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  314 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  109 ++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  331 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1625 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   15 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   19 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  410 +++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1154 ++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   23 +
 include/media/jpeg.h                          |   33 +
 include/uapi/linux/v4l2-controls.h            |   21 +
 19 files changed, 4357 insertions(+), 74 deletions(-)
 create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
 create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
index e4c16388ef07..53e83ebe4699 100644
--- a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -72,80 +72,75 @@ examples:
     #include <dt-bindings/interconnect/qcom,sm8250.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    jpeg-encoder@ac53000 {
-        compatible = "qcom,sm8250-jenc";
-        reg = <0xac53000 0x1000>;
-
-        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
-
-        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
-                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
-                 <&camcc CAM_CC_CORE_AHB_CLK>,
-                 <&camcc CAM_CC_CPAS_AHB_CLK>,
-                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
-                 <&camcc CAM_CC_JPEG_CLK>;
-        clock-names = "hf_axi",
-                      "sf_axi",
-                      "core_ahb",
-                      "cpas_ahb",
-                      "cnoc_axi",
-                      "jpeg";
-
-        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
-                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
-                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
-                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
-                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
-                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
-        interconnect-names = "cpu-cfg",
-                             "hf-mnoc",
-                             "sf-mnoc";
-
-        iommus = <&apps_smmu 0x2040 0x400>;
-
-        operating-points-v2 = <&jpeg_opp_table>;
-
-        jpeg_opp_table: opp-table {
-            compatible = "operating-points-v2";
-
-            opp-100000000 {
-                opp-hz = /bits/ 64 <400000000>,
-                         /bits/ 64 <100000000>;
-                opp-peak-kBps = <76800 104166 104166>;
-                opp-avg-kBps = <38400 33569 33569>;
-                required-opps = <&rpmhpd_opp_min_svs>;
-            };
-
-            opp-200000000 {
-                opp-hz = /bits/ 64 <400000000>,
-                         /bits/ 64 <200000000>;
-                opp-peak-kBps = <76800 208333 208333>;
-                opp-avg-kBps = <38400 67138 67138>;
-                required-opps = <&rpmhpd_opp_low_svs>;
-            };
-
-            opp-400000000 {
-                opp-hz = /bits/ 64 <400000000>,
-                         /bits/ 64 <400000000>;
-                opp-peak-kBps = <76800 416666 416666>;
-                opp-avg-kBps = <38400 134277 134277>;
-                required-opps = <&rpmhpd_opp_svs>;
-            };
-
-            opp-480000000 {
-                opp-hz = /bits/ 64 <400000000>,
-                         /bits/ 64 <480000000>;
-                opp-peak-kBps = <76800 500000 500000>;
-                opp-avg-kBps = <38400 161132 161132>;
-                required-opps = <&rpmhpd_opp_svs_l1>;
-            };
-
-            opp-600000000 {
-                opp-hz = /bits/ 64 <400000000>,
-                         /bits/ 64 <600000000>;
-                opp-peak-kBps = <76800 625000 625000>;
-                opp-avg-kBps = <38400 201416 201416>;
-                required-opps = <&rpmhpd_opp_nom>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        jpeg-encoder@ac53000 {
+            compatible = "qcom,sm8250-jenc";
+            reg = <0 0x0ac53000 0 0x1000>;
+
+            interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+            clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_JPEG_CLK>;
+            clock-names = "hf_axi",
+                          "sf_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cnoc_axi",
+                          "jpeg";
+
+            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "cpu-cfg",
+                                 "hf-mnoc",
+                                 "sf-mnoc";
+
+            iommus = <&apps_smmu 0x2040 0x400>;
+
+            operating-points-v2 = <&jpeg_opp_table>;
+
+            jpeg_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-100000000 {
+                    opp-hz = /bits/ 64 <400000000>,
+                             /bits/ 64 <100000000>;
+                    required-opps = <&rpmhpd_opp_min_svs>;
+                };
+
+                opp-200000000 {
+                    opp-hz = /bits/ 64 <400000000>,
+                             /bits/ 64 <200000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-400000000 {
+                    opp-hz = /bits/ 64 <400000000>,
+                             /bits/ 64 <400000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-480000000 {
+                    opp-hz = /bits/ 64 <400000000>,
+                             /bits/ 64 <480000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <400000000>,
+                             /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
             };
         };
     };
diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
index 4f4d3a68e6e5..f33d53a754a0 100644
--- a/drivers/media/platform/qcom/Kconfig
+++ b/drivers/media/platform/qcom/Kconfig
@@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
 source "drivers/media/platform/qcom/camss/Kconfig"
 source "drivers/media/platform/qcom/iris/Kconfig"
 source "drivers/media/platform/qcom/venus/Kconfig"
+source "drivers/media/platform/qcom/jpeg/Kconfig"
diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
index ea2221a202c0..011b5d237193 100644
--- a/drivers/media/platform/qcom/Makefile
+++ b/drivers/media/platform/qcom/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += camss/
 obj-y += iris/
+obj-y += jpeg/
 obj-y += venus/
diff --git a/drivers/media/platform/qcom/jpeg/Kconfig b/drivers/media/platform/qcom/jpeg/Kconfig
new file mode 100644
index 000000000000..d1949d277d2b
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_QCOM_JENC
+	tristate "Qualcomm V4L2 JPEG Encoder driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	depends on VIDEO_DEV
+	select VIDEOBUF2_DMA_SG
+	select V4L2_JPEG_HELPER
+	select V4L2_MEM2MEM_DEV
+	help
+	  V4L2 mem2mem driver for the Qualcomm JPEG encoder hardware
+	  found in Snapdragon SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qcom-jenc.
diff --git a/drivers/media/platform/qcom/jpeg/Makefile b/drivers/media/platform/qcom/jpeg/Makefile
new file mode 100644
index 000000000000..310f6c3c1f19
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_VIDEO_QCOM_JENC) += qcom-jenc.o
+
+qcom-jenc-objs += \
+	qcom_jenc_dev.o \
+	qcom_jenc_v4l2.o \
+	qcom_jenc_ops.o \
+	qcom_jenc_res.o \
+	qcom_jenc_hdr.o
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
new file mode 100644
index 000000000000..2ab29bfb9b88
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_DEFS_H
+#define QCOM_JENC_DEFS_H
+
+#include <linux/types.h>
+#include <uapi/linux/v4l2-controls.h>
+
+/* Offline JPEG encoder constraints */
+#define QCOM_JPEG_HW_MAX_WIDTH	8192
+#define QCOM_JPEG_HW_MAX_HEIGHT	8192
+#define QCOM_JPEG_HW_MIN_WIDTH	256
+#define QCOM_JPEG_HW_MIN_HEIGHT	256
+
+#define QCOM_JPEG_HW_DEF_HSTEP	16
+#define QCOM_JPEG_HW_DEF_VSTEP	16
+
+#define QCOM_JPEG_HW_DEF_WIDTH	1920
+#define QCOM_JPEG_HW_DEF_HEIGHT	1088
+
+#define QCOM_JPEG_MAX_PLANES	3
+
+#define QCOM_JPEG_QUALITY_MIN	1
+#define QCOM_JPEG_QUALITY_DEF	98
+#define QCOM_JPEG_QUALITY_MAX	100
+#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
+#define QCOM_JPEG_QUALITY_UNT	1
+
+#define QCOM_JPEG_FPS_MIN	1
+#define QCOM_JPEG_FPS_MAX	240
+#define QCOM_JPEG_FPS_DEF	30
+#define QCOM_JPEG_FPS_UNT	1
+
+#endif /* QCOM_JENC_DEFS_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
new file mode 100644
index 000000000000..ddfa84838b6b
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include <media/v4l2-mem2mem.h>
+
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_ops.h"
+#include "qcom_jenc_res.h"
+#include "qcom_jenc_v4l2.h"
+
+enum jpeg_opp_clks_id {
+	JPEG_OPP_CNOC_IDX = 0,
+	JPEG_OPP_CORE_IDX
+};
+
+static const char * const opp_clk_names[] = {
+	[JPEG_OPP_CNOC_IDX] = "cnoc_axi",
+	[JPEG_OPP_CORE_IDX] = "jpeg",
+	NULL,
+};
+
+static struct dev_pm_opp_config opp_config = {
+	.clk_names = opp_clk_names,
+	.config_clks = dev_pm_opp_config_clks_simple,
+};
+
+static int qcom_jpeg_opp_init(struct qcom_jenc_dev *jenc)
+{
+	struct dev_pm_opp *opp;
+	int rc;
+
+	rc = devm_pm_opp_set_config(jenc->dev, &opp_config);
+	if (rc)
+		return rc;
+
+	rc = devm_pm_opp_of_add_table(jenc->dev);
+	if (rc && rc != -ENODEV)
+		return rc;
+
+	/* initialize the maximum available frequency for the JPEG core */
+	jenc->max_freq = ULONG_MAX;
+	opp = dev_pm_opp_find_freq_floor_indexed(jenc->dev, &jenc->max_freq, JPEG_OPP_CORE_IDX);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	dev_pm_opp_put(opp);
+
+	/* initialize the default optimized frequency for the JPEG core */
+	jenc->opt_freq = jenc->max_freq;
+
+	dev_dbg(jenc->dev, "JPEG max clocks is: %lu\n", jenc->max_freq);
+
+	return 0;
+}
+
+static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
+{
+	jenc->num_clks = devm_clk_bulk_get_all(jenc->dev, &jenc->clks);
+	if (jenc->num_clks < 0)
+		return jenc->num_clks;
+
+	return 0;
+}
+
+static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
+{
+	struct dev_pm_opp *opp;
+	int rc;
+
+	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
+	if (rc)
+		return rc;
+
+	/* setup the OPP according to the calculated optimal frequency */
+	opp = dev_pm_opp_find_freq_ceil_indexed(jenc->dev, &jenc->opt_freq, JPEG_OPP_CORE_IDX);
+	if (IS_ERR(opp)) {
+		rc = PTR_ERR(opp);
+		goto err_clk_disable;
+	}
+
+	rc = dev_pm_opp_set_opp(jenc->dev, opp);
+	if (rc)
+		goto err_dev_pm_opp;
+
+	dev_dbg(jenc->dev, "selected OPP clocks cnoc=%lu, core=%lu\n",
+		dev_pm_opp_get_freq_indexed(opp, JPEG_OPP_CNOC_IDX),
+		dev_pm_opp_get_freq_indexed(opp, JPEG_OPP_CORE_IDX));
+
+	dev_pm_opp_put(opp);
+
+	return 0;
+
+err_dev_pm_opp:
+	dev_pm_opp_put(opp);
+err_clk_disable:
+	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
+
+	return rc;
+}
+
+static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
+{
+	dev_pm_opp_set_opp(jenc->dev, NULL);
+	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
+	jenc->opt_freq = jenc->max_freq;
+}
+
+/* qcom_jpeg_camss_get - resume the parent CAMSS device */
+static int qcom_jpeg_camss_get(struct qcom_jenc_dev *jenc)
+{
+	return pm_runtime_resume_and_get(jenc->camss_dev);
+}
+
+/* qcom_jpeg_camss_put - release the parent CAMSS device */
+static void qcom_jpeg_camss_put(struct qcom_jenc_dev *jenc)
+{
+	pm_runtime_put_sync(jenc->camss_dev);
+}
+
+static int qcom_jpeg_pm_suspend(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+
+	qcom_jpeg_clk_off(jenc);
+	qcom_jpeg_camss_put(jenc);
+
+	return 0;
+}
+
+static int qcom_jpeg_pm_resume(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+	int rc;
+
+	rc = qcom_jpeg_camss_get(jenc);
+	if (rc)
+		return rc;
+
+	rc = qcom_jpeg_clk_on(jenc);
+	if (rc) {
+		qcom_jpeg_camss_put(jenc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int qcom_jpeg_pm_system_suspend(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+	int rc;
+
+	v4l2_m2m_suspend(jenc->m2m_dev);
+
+	rc = pm_runtime_force_suspend(dev);
+	if (rc)
+		v4l2_m2m_resume(jenc->m2m_dev);
+
+	return rc;
+}
+
+static int qcom_jpeg_pm_system_resume(struct device *dev)
+{
+	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_resume(dev);
+	if (rc)
+		return rc;
+
+	v4l2_m2m_resume(jenc->m2m_dev);
+
+	return 0;
+}
+
+static _DEFINE_DEV_PM_OPS(qcom_jpeg_pm_ops,
+			  qcom_jpeg_pm_system_suspend, qcom_jpeg_pm_system_resume,
+			  qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL);
+
+static int qcom_jpeg_probe(struct platform_device *pdev)
+{
+	const struct qcom_dev_resources *res;
+	struct qcom_jenc_dev *jenc;
+	int rc;
+
+	jenc = devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
+	if (!jenc)
+		return -ENOMEM;
+
+	jenc->dev = &pdev->dev;
+	jenc->camss_dev = pdev->dev.parent;
+	platform_set_drvdata(pdev, jenc);
+	rc = devm_mutex_init(&pdev->dev, &jenc->dev_mutex);
+	if (rc)
+		goto err_free_jenc;
+	spin_lock_init(&jenc->hw_lock);
+	init_completion(&jenc->reset_complete);
+	init_completion(&jenc->stop_complete);
+
+	res = device_get_match_data(jenc->dev);
+	if (!res) {
+		rc = dev_err_probe(jenc->dev, -ENODEV, "unsupported SoC\n");
+		goto err_free_jenc;
+	}
+	jenc->res = res;
+
+	if (!jenc->res->hw_ops) {
+		rc = dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
+		goto err_free_jenc;
+	}
+
+	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
+		goto err_free_jenc;
+	}
+
+	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(jenc->jpeg_base)) {
+		rc = dev_err_probe(jenc->dev, PTR_ERR(jenc->jpeg_base),
+				   "failed to map JPEG resource\n");
+		goto err_free_jenc;
+	}
+
+	rc = qcom_jpeg_opp_init(jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to init OPP\n");
+		goto err_free_jenc;
+	}
+
+	rc = qcom_jpeg_clk_init(jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to init clocks\n");
+		goto err_free_jenc;
+	}
+
+	jenc->irq = platform_get_irq(pdev, 0);
+	if (jenc->irq < 0) {
+		rc = dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
+		goto err_free_jenc;
+	}
+
+	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
+				       jenc->res->hw_ops->hw_irq_top,
+				       jenc->res->hw_ops->hw_irq_bot,
+				       IRQF_ONESHOT | IRQF_NO_AUTOEN, dev_name(jenc->dev), jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
+		goto err_free_jenc;
+	}
+
+	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to register V4L2 device\n");
+		goto err_free_jenc;
+	}
+
+	rc = devm_add_action_or_reset(jenc->dev,
+				      (void (*)(void *))v4l2_device_unregister,
+				      &jenc->v4l2_dev);
+	if (rc)
+		goto err_free_jenc;
+
+	rc = devm_pm_runtime_enable(jenc->dev);
+	if (rc)
+		goto err_free_jenc;
+
+	rc = qcom_jpeg_v4l2_register(jenc);
+	if (rc) {
+		dev_err_probe(jenc->dev, rc, "failed to register video device\n");
+		goto err_free_jenc;
+	}
+
+	dev_dbg(jenc->dev, "Qualcomm JPEG encoder registered\n");
+
+	return 0;
+
+err_free_jenc:
+	return rc;
+}
+
+static const struct of_device_id qcom_jpeg_of_match[] = {
+	{
+		.compatible	= "qcom,sm8250-jenc",
+		.data		= &qcom_t165_t480_jpeg_drvdata
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_jpeg_of_match);
+
+static struct platform_driver qcom_jpeg_platform_driver = {
+	.probe  = qcom_jpeg_probe,
+	.driver = {
+		.name = QCOM_JPEG_ENC_NAME,
+		.of_match_table = qcom_jpeg_of_match,
+		.pm             = pm_ptr(&qcom_jpeg_pm_ops),
+	},
+};
+
+module_platform_driver(qcom_jpeg_platform_driver);
+
+MODULE_DESCRIPTION("QCOM JPEG mem2mem V4L2 encoder");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
new file mode 100644
index 000000000000..1b5dff346fb9
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_DEV_H
+#define QCOM_JENC_DEV_H
+
+#include <linux/device.h>
+#include <linux/irqreturn.h>
+#include <linux/mutex.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "qcom_jenc_defs.h"
+#include "qcom_jenc_hdr.h"
+#include "qcom_jenc_res.h"
+
+#define QCOM_JPEG_ENC_NAME "qcom-jpeg-enc"
+
+#define TYPE2QID(t) \
+	(V4L2_TYPE_IS_OUTPUT(t) ? JENC_SRC_QUEUE : JENC_DST_QUEUE)
+
+enum qcom_enc_qid {
+	JENC_SRC_QUEUE = 0,
+	JENC_DST_QUEUE,
+	JENC_QUEUE_MAX
+};
+
+struct jenc_enc_format {
+	u32 type;
+	u32 fourcc;
+};
+
+struct qcom_jpeg_buff {
+	struct {
+		struct sg_table		*sgt;
+		dma_addr_t		dma;
+		unsigned long		size;
+
+	} plns[QCOM_JPEG_MAX_PLANES];
+};
+
+struct qcom_jenc_queue {
+	struct v4l2_pix_format_mplane	vf;
+	u32				sequence;
+	struct qcom_jpeg_buff		buff[VB2_MAX_FRAME];
+	int				buff_id;
+};
+
+struct qcom_jenc_dev {
+	struct device			*dev;
+	struct device			*camss_dev;
+	struct v4l2_device		v4l2_dev;
+	struct v4l2_m2m_dev		*m2m_dev;
+	struct video_device		*vdev;
+	const struct qcom_dev_resources	*res;
+	int				irq;
+	void __iomem			*jpeg_base;
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+	unsigned long			max_freq;
+	unsigned long			opt_freq;
+	/* device mutex lock */
+	struct mutex			dev_mutex;
+	atomic_t			ref_count;
+	struct completion		reset_complete;
+	struct completion		stop_complete;
+	/* encoder hardware lock */
+	spinlock_t			hw_lock;
+	struct jenc_context		*actx;
+
+	u32				pending_irq_status;
+
+	void (*enc_hw_irq_cb)
+		(void *data, enum vb2_buffer_state ev, size_t out_size);
+};
+
+struct jenc_context {
+	struct device		 *dev;
+	struct qcom_jenc_dev	 *jenc;
+	struct v4l2_fh		 fh;
+
+	/* quality update lock */
+	struct mutex		 quality_mutex;
+	struct v4l2_ctrl	 *quality_ctl;
+	u32			 quality_requested;
+	u32			 quality_programmed;
+	struct v4l2_ctrl	 *perf_level_auto_ctl;
+	struct v4l2_ctrl	 *fps_target_ctl;
+	struct v4l2_ctrl_handler ctrl_hdl;
+
+	/* session context lock */
+	struct mutex		 ctx_lock;
+
+	bool			 is_stopping;
+	bool			 hw_acquired;
+
+	struct qcom_jenc_queue	bufq[JENC_QUEUE_MAX];
+	struct qcom_jenc_header	hdr_cache;
+
+	struct work_struct finish_work;
+	struct work_struct stop_work;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
new file mode 100644
index 000000000000..c9959518c64d
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/errno.h>
+#include <linux/string.h>
+
+#include <media/jpeg.h>
+#include <media/v4l2-jpeg.h>
+
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_hdr.h"
+
+/*
+ * The elements defined in this header are specified
+ * in the ITU-T T.81 / JPEG specification.
+ *
+ * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+
+#define JFIF_HEADER_WIDTH_OFFS		0x07
+#define JFIF_HEADER_HEIGHT_OFFS		0x05
+
+#define JFIF_APP0_LENGTH_HI		0x00
+#define JFIF_APP0_LENGTH_LO		0x10
+#define JFIF_IDENT_TERM		0x00
+#define JFIF_VERSION_MAJOR		0x01
+#define JFIF_VERSION_MINOR		0x01
+#define JFIF_DENSITY_HI			0x00
+#define JFIF_DENSITY_LO			0x01
+#define JFIF_THUMBNAIL_SIZE		0x00
+
+#define JPEG_SEG_LEN_HI			0x00
+#define JPEG_LEN_DQT_LUMA_LO		0x43
+#define JPEG_LEN_DQT_CHROMA_LO		0x43
+#define JPEG_LEN_SOF0_MONO_LO		0x0b
+#define JPEG_LEN_SOF0_COLOR_LO		0x11
+#define JPEG_LEN_DHT_MONO_LO		0xd2
+#define JPEG_LEN_DHT_COLOR_HI		0x01
+#define JPEG_LEN_DHT_COLOR_LO		0xa2
+#define JPEG_LEN_SOS_MONO_LO		0x08
+#define JPEG_LEN_SOS_COLOR_LO		0x0c
+
+struct jpeg_header_buf {
+	u8  *ptr;
+	u32 size;
+	u32 pos;
+};
+
+static const struct jpeg_soi_app0 soi_app0 = {
+	.soi		= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOI },
+	.app0_marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_APP0 },
+	.app0_length	= { JFIF_APP0_LENGTH_HI, JFIF_APP0_LENGTH_LO },
+	.jfif_id	= { 'J', 'F', 'I', 'F', JFIF_IDENT_TERM },
+	.version	= { JFIF_VERSION_MAJOR, JFIF_VERSION_MINOR },
+	.units		= 0x00,
+	.density_x	= { JFIF_DENSITY_HI, JFIF_DENSITY_LO },
+	.density_y	= { JFIF_DENSITY_HI, JFIF_DENSITY_LO },
+	.thumb_x	= JFIF_THUMBNAIL_SIZE,
+	.thumb_y	= JFIF_THUMBNAIL_SIZE,
+};
+
+static const struct jpeg_record_hdr dqt_luma_hdr = {
+	.marker = { JPEG_MARKER_PREFIX, JPEG_MARKER_DQT },
+	.length = { JPEG_SEG_LEN_HI, JPEG_LEN_DQT_LUMA_LO }
+};
+
+static const struct jpeg_record_hdr dqt_chroma_hdr = {
+	.marker = { JPEG_MARKER_PREFIX, JPEG_MARKER_DQT },
+	.length = { JPEG_SEG_LEN_HI, JPEG_LEN_DQT_CHROMA_LO }
+};
+
+/* Luminance quantization table */
+static const struct jpeg_dqt_header dqt_luma_data = {
+	.index = 0x00,
+};
+
+/* Chrominance quantization table */
+static const struct jpeg_dqt_header dqt_chroma_data = {
+	.index = 0x01,
+};
+
+static const struct jpeg_record_hdr  sof0_mono_hdr = {
+	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOF0 },
+	.length	= { JPEG_SEG_LEN_HI, JPEG_LEN_SOF0_MONO_LO },
+};
+
+static const struct jpeg_sof0_mono sof0_mono_data = {
+	.precision	= JPEG_SAMPLE_PRECISION_BITS,
+	.height		= { 0x00, 0x00 },
+	.width		= { 0x00, 0x00 },
+	.components	= JPEG_COMP_MONO,
+	.y_id		= 1,
+	.y_sampling	= JPEG_SAMPLING_H1V1,
+	.y_qtable	= JPEG_QTABLE_LUMA,
+};
+
+static const struct jpeg_record_hdr  sof0_color_hdr = {
+	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOF0 },
+	.length	= { JPEG_SEG_LEN_HI, JPEG_LEN_SOF0_COLOR_LO },
+};
+
+static const struct jpeg_sof0_color sof0_color_data = {
+	.precision	= JPEG_SAMPLE_PRECISION_BITS,
+	.height		= { 0x00, 0x00 },
+	.width		= { 0x00, 0x00 },
+	.components	= JPEG_COMP_COLOR,
+	.y_id		= 1,
+	.y_sampling	= JPEG_SAMPLING_H2V2,
+	.y_qtable	= JPEG_QTABLE_LUMA,
+	.cb_id		= 2,
+	.cb_sampling	= JPEG_SAMPLING_H1V1,
+	.cb_qtable	= JPEG_QTABLE_CHROMA,
+	.cr_id		= 3,
+	.cr_sampling	= JPEG_SAMPLING_H1V1,
+	.cr_qtable	= JPEG_QTABLE_CHROMA,
+};
+
+static const struct jpeg_record_hdr coeff_mono_hdr = {
+	.marker = { JPEG_MARKER_PREFIX, JPEG_MARKER_DHT },
+	.length = { JPEG_SEG_LEN_HI, JPEG_LEN_DHT_MONO_LO },
+};
+
+static const struct jpeg_record_hdr coeff_color_hdr = {
+	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_DHT },
+	.length	= { JPEG_LEN_DHT_COLOR_HI, JPEG_LEN_DHT_COLOR_LO },
+};
+
+static const struct jpeg_record_hdr sos_mono_hdr = {
+	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOS },
+	.length	= { JPEG_SEG_LEN_HI, JPEG_LEN_SOS_MONO_LO },
+};
+
+static const struct jpeg_sos_mono sos_mono_data = {
+	.components	= JPEG_COMP_MONO,
+	.y_id		= 1,
+	.y_tables	= JPEG_TABLE_SEL_LUMA,
+	.spectral	= { JPEG_SPECTRAL_START, JPEG_SPECTRAL_END },
+	.approx		= JPEG_APPROX_HIGH_LOW,
+};
+
+static const struct jpeg_record_hdr sos_color_hdr = {
+	.marker	= { JPEG_MARKER_PREFIX, JPEG_MARKER_SOS },
+	.length	= { JPEG_SEG_LEN_HI, JPEG_LEN_SOS_COLOR_LO },
+};
+
+static const struct jpeg_sos_color sos_color_data = {
+	.components	= JPEG_COMP_COLOR,
+	.y_id		= 1,
+	.y_tables	= JPEG_TABLE_SEL_LUMA,
+	.cb_id		= 2,
+	.cb_tables	= JPEG_TABLE_SEL_CHROMA,
+	.cr_id		= 3,
+	.cr_tables	= JPEG_TABLE_SEL_CHROMA,
+	.spectral	= { JPEG_SPECTRAL_START, JPEG_SPECTRAL_END },
+	.approx		= JPEG_APPROX_HIGH_LOW,
+};
+
+static inline int jb_put_mem(struct jpeg_header_buf *hdr, const void *src, u32 len)
+{
+	if (len > hdr->size - hdr->pos)
+		return -ENOSPC;
+
+	memcpy(hdr->ptr + hdr->pos, src, len);
+	hdr->pos += len;
+
+	return 0;
+}
+
+static int jb_put_dht(struct jpeg_header_buf *hdr, u8 index, const u8 *table, u32 len)
+{
+	u8 data[1 + V4L2_JPEG_REF_HT_AC_LEN];
+
+	if (len > V4L2_JPEG_REF_HT_AC_LEN)
+		return -EINVAL;
+
+	data[0] = index;
+	memcpy(&data[1], table, len);
+
+	return jb_put_mem(hdr, data, len + 1);
+}
+
+static inline void patch_u16be(u8 *buf, u32 off, u16 v)
+{
+	buf[off]	= (v >> 8) & 0xff;
+	buf[off + 1]	=  v & 0xff;
+}
+
+int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc)
+{
+	int rc;
+	struct jpeg_header_buf hdr = {
+		.ptr = c->data,
+		.size = sizeof(c->data),
+		.pos = 0,
+	};
+
+	c->sof_offset	= 0;
+	c->dqt_luma_offs = 0;
+	c->dqt_chroma_offs = 0;
+
+	rc = jb_put_mem(&hdr, &soi_app0, sizeof(soi_app0));
+	if (rc)
+		return rc;
+
+	/* luma DQT is always present */
+	rc = jb_put_mem(&hdr, &dqt_luma_hdr, sizeof(dqt_luma_hdr));
+	if (rc)
+		return rc;
+
+	c->dqt_luma_offs = hdr.pos;
+	rc = jb_put_mem(&hdr, &dqt_luma_data, sizeof(dqt_luma_data));
+	if (rc)
+		return rc;
+
+	/* chroma DQT only for color images */
+	if (fourcc != V4L2_PIX_FMT_GREY) {
+		rc = jb_put_mem(&hdr, &dqt_chroma_hdr, sizeof(dqt_chroma_hdr));
+		if (rc)
+			return rc;
+
+		c->dqt_chroma_offs = hdr.pos;
+		rc = jb_put_mem(&hdr, &dqt_chroma_data, sizeof(dqt_chroma_data));
+		if (rc)
+			return rc;
+	}
+
+	/* store the offset of the SOF record for later use */
+	c->sof_offset = hdr.pos;
+
+	if (fourcc != V4L2_PIX_FMT_GREY) {
+		rc = jb_put_mem(&hdr, &sof0_color_hdr, sizeof(sof0_color_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&hdr, &sof0_color_data, sizeof(sof0_color_data));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&hdr, &coeff_color_hdr, sizeof(coeff_color_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_dht(&hdr, JPEG_DC_HT_INDEX_LUMA,
+				v4l2_jpeg_ref_table_luma_dc_ht,
+				ARRAY_SIZE(v4l2_jpeg_ref_table_luma_dc_ht));
+		if (rc)
+			return rc;
+		rc = jb_put_dht(&hdr, JPEG_AC_HT_INDEX_LUMA,
+				v4l2_jpeg_ref_table_luma_ac_ht,
+				ARRAY_SIZE(v4l2_jpeg_ref_table_luma_ac_ht));
+		if (rc)
+			return rc;
+		rc = jb_put_dht(&hdr, JPEG_DC_HT_INDEX_CHROMA,
+				v4l2_jpeg_ref_table_chroma_dc_ht,
+				ARRAY_SIZE(v4l2_jpeg_ref_table_chroma_dc_ht));
+		if (rc)
+			return rc;
+		rc = jb_put_dht(&hdr, JPEG_AC_HT_INDEX_CHROMA,
+				v4l2_jpeg_ref_table_chroma_ac_ht,
+				ARRAY_SIZE(v4l2_jpeg_ref_table_chroma_ac_ht));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&hdr, &sos_color_hdr, sizeof(sos_color_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&hdr, &sos_color_data, sizeof(sos_color_data));
+		if (rc)
+			return rc;
+	} else {
+		rc = jb_put_mem(&hdr, &sof0_mono_hdr, sizeof(sof0_mono_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&hdr, &sof0_mono_data, sizeof(sof0_mono_data));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&hdr, &coeff_mono_hdr, sizeof(coeff_mono_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_dht(&hdr, JPEG_DC_HT_INDEX_LUMA,
+				v4l2_jpeg_ref_table_luma_dc_ht,
+				ARRAY_SIZE(v4l2_jpeg_ref_table_luma_dc_ht));
+		if (rc)
+			return rc;
+		rc = jb_put_dht(&hdr, JPEG_AC_HT_INDEX_LUMA,
+				v4l2_jpeg_ref_table_luma_ac_ht,
+				ARRAY_SIZE(v4l2_jpeg_ref_table_luma_ac_ht));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&hdr, &sos_mono_hdr, sizeof(sos_mono_hdr));
+		if (rc)
+			return rc;
+		rc = jb_put_mem(&hdr, &sos_mono_data, sizeof(sos_mono_data));
+		if (rc)
+			return rc;
+	}
+
+	c->size = hdr.pos;
+
+	return 0;
+}
+
+void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst)
+{
+	/* Propagate DQT tables into the JPEG header */
+	if (c->dqt_luma_offs) {
+		u32 luma_offs = c->dqt_luma_offs + sizeof(dqt_luma_data.index);
+
+		memcpy(dst + luma_offs, &c->data[luma_offs], sizeof(dqt_luma_data.value));
+	}
+
+	if (c->dqt_chroma_offs) {
+		u32 chroma_offs = c->dqt_chroma_offs + sizeof(dqt_chroma_data.index);
+
+		memcpy(dst + chroma_offs, &c->data[chroma_offs], sizeof(dqt_chroma_data.value));
+	}
+}
+
+u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u32 dst_size, u16 width,
+			  u16 height)
+{
+	/* Copy JFIF into JPEG header and update actual image size */
+	if (dst_size < c->size)
+		return 0;
+
+	memcpy(dst, c->data, c->size);
+
+	/* Update output image size */
+	patch_u16be(dst, c->sof_offset + JFIF_HEADER_WIDTH_OFFS, width);
+	patch_u16be(dst, c->sof_offset + JFIF_HEADER_HEIGHT_OFFS, height);
+
+	return c->size;
+}
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
new file mode 100644
index 000000000000..db1e5298e51f
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_HDR_H
+#define QCOM_JENC_HDR_H
+
+#include <linux/types.h>
+
+#include <media/v4l2-jpeg.h>
+
+#include "qcom_jenc_defs.h"
+
+#define JPEG_HEADER_MAX	1024
+
+struct qcom_jenc_header {
+	u8  data[JPEG_HEADER_MAX];
+	u32 size;
+	u32 sof_offset;
+	u32 dqt_luma_offs;
+	u32 dqt_chroma_offs;
+};
+
+struct jpeg_record_hdr {
+	u8 marker[2];
+	u8 length[2];
+} __packed;
+
+struct jpeg_dqt_header {
+	u8 index;
+	u8 value[V4L2_JPEG_PIXELS_IN_BLOCK];
+} __packed;
+
+struct jpeg_soi_app0 {
+	u8 soi[2];
+	u8 app0_marker[2];
+	u8 app0_length[2];
+	u8 jfif_id[5];
+	u8 version[2];
+	u8 units;
+	u8 density_x[2];
+	u8 density_y[2];
+	u8 thumb_x;
+	u8 thumb_y;
+} __packed;
+
+struct jpeg_sof0_mono {
+	u8 precision;
+	u8 height[2];
+	u8 width[2];
+	u8 components;
+
+	u8 y_id;
+	u8 y_sampling;
+	u8 y_qtable;
+} __packed;
+
+struct jpeg_sof0_color {
+	u8 precision;
+	u8 height[2];
+	u8 width[2];
+	u8 components;
+
+	u8 y_id;
+	u8 y_sampling;
+	u8 y_qtable;
+
+	u8 cb_id;
+	u8 cb_sampling;
+	u8 cb_qtable;
+
+	u8 cr_id;
+	u8 cr_sampling;
+	u8 cr_qtable;
+} __packed;
+
+struct jpeg_sos_hdr {
+	u8 sos_marker[2];
+	u8 sos_length[2];
+	u8 components;
+} __packed;
+
+struct jpeg_sos_mono {
+	u8 components;
+
+	u8 y_id;
+	u8 y_tables;
+
+	u8 spectral[2];
+	u8 approx;
+} __packed;
+
+struct jpeg_sos_color {
+	u8 components;
+
+	u8 y_id;
+	u8 y_tables;
+
+	u8 cb_id;
+	u8 cb_tables;
+
+	u8 cr_id;
+	u8 cr_tables;
+
+	u8 spectral[2];
+	u8 approx;
+} __packed;
+
+struct jenc_context;
+
+int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc);
+
+void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst);
+
+u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u32 dst_size, u16 width,
+			  u16 height);
+
+#endif /* QCOM_JENC_HDR_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
new file mode 100644
index 000000000000..1f9841d27974
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
@@ -0,0 +1,1625 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/math64.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/scatterlist.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "qcom_jenc_defs.h"
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_ops.h"
+#include "qcom_jenc_v420_hw_info.h"
+
+/* Per-plane register offset lookup arrays (indexed by plane number 0..2) */
+static const u32 jpeg_v420_fe_pntr[] = {
+	JPEG_V420_REG_FE_PNTR_0,
+	JPEG_V420_REG_FE_PNTR_1,
+	JPEG_V420_REG_FE_PNTR_2,
+};
+
+static const u32 jpeg_v420_fe_offs[] = {
+	JPEG_V420_REG_FE_OFFS_0,
+	JPEG_V420_REG_FE_OFFS_1,
+	JPEG_V420_REG_FE_OFFS_2,
+};
+
+static const u32 jpeg_v420_fe_bsize[] = {
+	JPEG_V420_REG_FE_BSIZE_0,
+	JPEG_V420_REG_FE_BSIZE_1,
+	JPEG_V420_REG_FE_BSIZE_2,
+};
+
+static const u32 jpeg_v420_fe_stride[] = {
+	JPEG_V420_REG_FE_STRIDE_0,
+	JPEG_V420_REG_FE_STRIDE_1,
+	JPEG_V420_REG_FE_STRIDE_2,
+};
+
+static const u32 jpeg_v420_fe_hinit[] = {
+	JPEG_V420_REG_FE_HINIT_0,
+	JPEG_V420_REG_FE_HINIT_1,
+	JPEG_V420_REG_FE_HINIT_2,
+};
+
+static const u32 jpeg_v420_fe_vinit[] = {
+	JPEG_V420_REG_FE_VINIT_0,
+	JPEG_V420_REG_FE_VINIT_1,
+	JPEG_V420_REG_FE_VINIT_2,
+};
+
+static const u32 jpeg_v420_we_pntr[] = {
+	JPEG_V420_REG_WE_PNTR_0,
+	JPEG_V420_REG_WE_PNTR_1,
+	JPEG_V420_REG_WE_PNTR_2,
+};
+
+static const u32 jpeg_v420_we_stride[] = {
+	JPEG_V420_REG_WE_STRIDE_0,
+	JPEG_V420_REG_WE_STRIDE_1,
+	JPEG_V420_REG_WE_STRIDE_2,
+};
+
+static const u32 jpeg_v420_we_hinit[] = {
+	JPEG_V420_REG_WE_HINIT_0,
+	JPEG_V420_REG_WE_HINIT_1,
+	JPEG_V420_REG_WE_HINIT_2,
+};
+
+static const u32 jpeg_v420_we_hstep[] = {
+	JPEG_V420_REG_WE_HSTEP_0,
+	JPEG_V420_REG_WE_HSTEP_1,
+	JPEG_V420_REG_WE_HSTEP_2,
+};
+
+static const u32 jpeg_v420_we_vinit[] = {
+	JPEG_V420_REG_WE_VINIT_0,
+	JPEG_V420_REG_WE_VINIT_1,
+	JPEG_V420_REG_WE_VINIT_2,
+};
+
+static const u32 jpeg_v420_we_vstep[] = {
+	JPEG_V420_REG_WE_VSTEP_0,
+	JPEG_V420_REG_WE_VSTEP_1,
+	JPEG_V420_REG_WE_VSTEP_2,
+};
+
+static const u32 jpeg_v420_scale_hstep[] = {
+	JPEG_V420_REG_SCALE_HSTEP_0,
+	JPEG_V420_REG_SCALE_HSTEP_1,
+	JPEG_V420_REG_SCALE_HSTEP_2,
+};
+
+static const u32 jpeg_v420_scale_vstep[] = {
+	JPEG_V420_REG_SCALE_VSTEP_0,
+	JPEG_V420_REG_SCALE_VSTEP_1,
+	JPEG_V420_REG_SCALE_VSTEP_2,
+};
+
+static const u32 jpeg_v420_scale_out_cfg[] = {
+	JPEG_V420_REG_SCALE_OUT_CFG_0,
+	JPEG_V420_REG_SCALE_OUT_CFG_1,
+	JPEG_V420_REG_SCALE_OUT_CFG_2,
+};
+
+#define JPEG_RESET_TIMEOUT_MS	300
+#define JPEG_STOP_TIMEOUT_MS	200
+
+#define JPEG_DQT_SHIFT		20
+
+#define JPEG_MCU_BLOCK_8	8
+#define JPEG_MCU_BLOCK_16	16
+#define JPEG_MCU_BLOCK_128	128
+#define JPEG_MCU_BLOCK_256	256
+
+#define JPEG_DEFAULT_SCALE_STEP	0x200000
+
+#define JPEG_CLR_U32	(0U)
+#define JPEG_SET_U32	(~0U)
+
+/*
+ *  JPEG | V4L2
+ *  ---- | -------
+ *  H1V1 | GREY
+ *  H1V2 | YUV422M
+ *  H2V1 | NV16M
+ *  H2V2 | NV12M
+ */
+enum qcom_jpeg_encode_fmt {
+	JPEG_ENCODE_H1V1 = 0,
+	JPEG_ENCODE_H1V2,
+	JPEG_ENCODE_H2V1,
+	JPEG_ENCODE_H2V2,
+	JPEG_ENCODE_MONO,
+};
+
+enum qcom_jpeg_memory_fmt {
+	JPEG_MEM_FMT_PLANAR	 = 0x0,
+	JPEG_MEM_FMT_PPLANAR	 = 0x1,
+	JPEG_MEM_FMT_MONO	 = 0x2,
+	JPEG_MEM_FMT_COEFFICIENT = 0x3
+};
+
+enum jpeg_mal_bounds {
+	JPEG_CFG_MAL_BOUND_32_BYTES	= 0x0,
+	JPEG_CFG_MAL_BOUND_64_BYTES	= 0x1,
+	JPEG_CFG_MAL_BOUND_128_BYTES	= 0x2,
+	JPEG_CFG_MAL_BOUND_256_BYTES	= 0x3,
+	JPEG_CFG_MAL_BOUND_512_BYTES	= 0x4,
+	JPEG_CFG_MAL_BOUND_1K_BYTES	= 0x5,
+	JPEG_CFG_MAL_BOUND_2K_BYTES	= 0x6,
+	JPEG_CFG_MAL_BOUND_4K_BYTES	= 0x7
+};
+
+struct qcom_jpeg_scale_blocks {
+	u8 w_block[QCOM_JPEG_MAX_PLANES];
+	u8 h_block[QCOM_JPEG_MAX_PLANES];
+};
+
+struct qcom_jpeg_mal_boundary {
+	u32 bytes;
+	int boundary;
+};
+
+struct qcom_jpeg_formats {
+	enum qcom_jpeg_encode_fmt encode;
+	enum qcom_jpeg_memory_fmt memory;
+	u32 fourcc;
+};
+
+/*
+ * Luminance quantization table defined by CCITT T.81.
+ * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+static const u8 t81k1_dct_luma_table[V4L2_JPEG_PIXELS_IN_BLOCK] = {
+	16,  11,  10,  16,  24,  40,  51,  61,
+	12,  12,  14,  19,  26,  58,  60,  55,
+	14,  13,  16,  24,  40,  57,  69,  56,
+	14,  17,  22,  29,  51,  87,  80,  62,
+	18,  22,  37,  56,  68, 109, 103,  77,
+	24,  35,  55,  64,  81, 104, 113,  92,
+	49,  64,  78,  87, 103, 121, 120, 101,
+	72,  92,  95,  98, 112, 100, 103,  99
+};
+
+/*
+ * Chrominance quantization table defined by CCITT T.81.
+ * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+static const u8 t81k2_dct_chroma_table[V4L2_JPEG_PIXELS_IN_BLOCK] = {
+	17,  18,  24,  47,  99,  99,  99,  99,
+	18,  21,  26,  66,  99,  99,  99,  99,
+	24,  26,  56,  99,  99,  99,  99,  99,
+	47,  66,  99,  99,  99,  99,  99,  99,
+	99,  99,  99,  99,  99,  99,  99,  99,
+	99,  99,  99,  99,  99,  99,  99,  99,
+	99,  99,  99,  99,  99,  99,  99,  99,
+	99,  99,  99,  99,  99,  99,  99,  99
+};
+
+/*
+ * Zig-zag scan order for quantized DCT coefficients
+ * as defined by CCITT T.81.
+ * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+static const u8 t81a6_dct_zig_zag_table[] = {
+	 0,  1,  5,  6, 14, 15, 27, 28,
+	 2,  4,  7, 13, 16, 26, 29, 42,
+	 3,  8, 12, 17, 25, 30, 41, 43,
+	 9, 11, 18, 24, 31, 40, 44, 53,
+	10, 19, 23, 32, 39, 45, 52, 54,
+	20, 22, 33, 38, 46, 51, 55, 60,
+	21, 34, 37, 47, 50, 56, 59, 61,
+	35, 36, 48, 49, 57, 58, 62, 63
+};
+
+static const struct qcom_jpeg_formats jpeg_encode_fmt[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.encode = JPEG_ENCODE_MONO,
+		.memory = JPEG_MEM_FMT_MONO
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_JPEG,
+		.encode = JPEG_ENCODE_H1V1,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUV422M,
+		.encode = JPEG_ENCODE_H1V2,
+		.memory = JPEG_MEM_FMT_PLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVU422M,
+		.encode = JPEG_ENCODE_H1V2,
+		.memory = JPEG_MEM_FMT_PLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16M,
+		.encode = JPEG_ENCODE_H2V1,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61M,
+		.encode = JPEG_ENCODE_H2V1,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.encode = JPEG_ENCODE_H2V2,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.encode = JPEG_ENCODE_H2V2,
+		.memory = JPEG_MEM_FMT_PPLANAR
+	}
+};
+
+static const struct qcom_jpeg_mal_boundary jpeg_mal_bounds[] = {
+	{ .bytes =   32, .boundary = JPEG_CFG_MAL_BOUND_32_BYTES  },
+	{ .bytes =   64, .boundary = JPEG_CFG_MAL_BOUND_64_BYTES  },
+	{ .bytes =  128, .boundary = JPEG_CFG_MAL_BOUND_128_BYTES },
+	{ .bytes =  256, .boundary = JPEG_CFG_MAL_BOUND_256_BYTES },
+	{ .bytes =  512, .boundary = JPEG_CFG_MAL_BOUND_512_BYTES },
+	{ .bytes = 1024, .boundary = JPEG_CFG_MAL_BOUND_1K_BYTES  },
+	{ .bytes = 2048, .boundary = JPEG_CFG_MAL_BOUND_2K_BYTES  },
+	{ .bytes = 4096, .boundary = JPEG_CFG_MAL_BOUND_4K_BYTES  }
+};
+
+static const struct qcom_jpeg_scale_blocks jpeg_mcu_blocks[] = {
+	[JPEG_ENCODE_H1V1] = {
+		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_H1V2] = {
+		.w_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
+		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_H2V1] = {
+		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8  },
+	},
+	[JPEG_ENCODE_H2V2] = {
+		.w_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 },
+	},
+	[JPEG_ENCODE_MONO] = {
+		.w_block = { JPEG_MCU_BLOCK_8 },
+		.h_block = { JPEG_MCU_BLOCK_8 }
+	},
+};
+
+static inline int jpeg_get_memory_fmt(u32 fourcc)
+{
+	u32 fi;
+
+	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
+		if (jpeg_encode_fmt[fi].fourcc == fourcc)
+			return jpeg_encode_fmt[fi].memory;
+	}
+
+	return -EINVAL;
+}
+
+static inline int jpeg_get_encode_fmt(u32 fourcc)
+{
+	u32 fi;
+
+	for (fi = 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
+		if (jpeg_encode_fmt[fi].fourcc == fourcc)
+			return jpeg_encode_fmt[fi].encode;
+	}
+
+	return -EINVAL;
+}
+
+static inline int jpeg_get_mal_boundary(u32 width, const struct qcom_jpeg_mal_boundary *table,
+					u32 count)
+{
+	u32 bi;
+
+	for (bi = 0; bi < count; bi++) {
+		if (table[bi].bytes > width)
+			break;
+	}
+
+	if (!bi)
+		return table[0].boundary;
+
+	if (bi >= count)
+		return table[count - 1].boundary;
+
+	return table[bi - 1].boundary;
+}
+
+static inline int jpeg_get_mcu_geometry(enum qcom_jpeg_encode_fmt fmt, u32 width, u32 height,
+					u32 *blk_w, u32 *blk_h, u32 *mcu_cols, u32 *mcu_rows)
+{
+	const struct qcom_jpeg_scale_blocks *blks;
+	u32 bw = 0, bh = 0;
+	u8 pln;
+
+	blks = &jpeg_mcu_blocks[fmt];
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		bw = max(bw, blks->w_block[pln]);
+		bh = max(bh, blks->h_block[pln]);
+	}
+
+	if (!bw || !bh)
+		return -EINVAL;
+
+	if (blk_w)
+		*blk_w = bw;
+	if (blk_h)
+		*blk_h = bh;
+
+	if (mcu_cols)
+		*mcu_cols = ALIGN(width, bw) / bw;
+
+	if (mcu_rows)
+		*mcu_rows = ALIGN(height, bh) / bh;
+
+	return 0;
+}
+
+static inline u32 jpeg_io_read(struct qcom_jenc_dev *jenc, u32 offset)
+{
+	return readl(jenc->jpeg_base + offset);
+}
+
+static inline void jpeg_io_write(struct qcom_jenc_dev *jenc, u32 offset, u32 value)
+{
+	writel(value, jenc->jpeg_base + offset);
+}
+
+/*
+ * Runtime bitfield helpers (for non-constant masks).
+ *
+ * Requirements:
+ *  - mask must be non-zero
+ *  - mask must be contiguous (e.g. 0x7u << n)
+ */
+
+static inline u32 jpeg_bits_get(u32 mask, u32 val)
+{
+	/* __ffs(0) is undefined; fail-safe on invalid masks. */
+	if (WARN_ON_ONCE(!mask))
+		return 0;
+
+	return (val & mask) >> __ffs(mask);
+}
+
+static inline u32 jpeg_bits_set(u32 mask, u32 val)
+{
+	/* __ffs(0) is undefined; fail-safe on invalid masks. */
+	if (WARN_ON_ONCE(!mask))
+		return 0;
+
+	return (val << __ffs(mask)) & mask;
+}
+
+static inline u32 jpeg_rd_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask)
+{
+	u32 reg = jpeg_io_read(jenc, offs);
+
+	return jpeg_bits_get(mask, reg);
+}
+
+/*
+ * Read-modify-write (for R/W registers)
+ */
+static inline void jpeg_rw_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask, u32 val)
+{
+	u32 reg = jpeg_io_read(jenc, offs);
+
+	reg &= ~mask;
+	reg |= jpeg_bits_set(mask, val);
+
+	jpeg_io_write(jenc, offs, reg);
+}
+
+/*
+ * Write-only variant (for write only registers)
+ */
+static inline void jpeg_wo_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask, u32 val)
+{
+	jpeg_io_write(jenc, offs, jpeg_bits_set(mask, val));
+}
+
+static u8 jpeg_calculate_dqt(struct jenc_context *ectx, u8 dqt_value)
+{
+	u8 calc_val;
+	u64 ratio;
+
+	ratio = (QCOM_JPEG_QUALITY_MAX - ectx->quality_requested) << JPEG_DQT_SHIFT;
+	ratio = max_t(u64, 1, ratio);
+	do_div(ratio, QCOM_JPEG_QUALITY_MID);
+
+	calc_val = DIV64_U64_ROUND_CLOSEST(ratio * dqt_value, 1LU << JPEG_DQT_SHIFT);
+
+	return max_t(u8, 1, calc_val);
+}
+
+/*
+ * jpeg_update_dqt_cache - compute scaled DQT coefficients and store them in
+ * the software JPEG header cache (hdr_cache).  Safe to call from buf_prepare
+ * before the hardware is powered on; no MMIO access is performed here.
+ */
+static void jpeg_update_dqt_cache(struct jenc_context *ectx)
+{
+	u8 *base;
+	u8 dqt_val, idx;
+	int i;
+
+	/* Luma DQT cache update */
+	if (ectx->hdr_cache.dqt_luma_offs) {
+		base = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_luma_offs + 1];
+		for (i = 0; i < ARRAY_SIZE(t81k1_dct_luma_table); i++) {
+			dqt_val = jpeg_calculate_dqt(ectx, t81k1_dct_luma_table[i]);
+			idx = t81a6_dct_zig_zag_table[i];
+			base[idx] = dqt_val;
+		}
+	}
+
+	/* Chroma DQT cache update */
+	if (ectx->hdr_cache.dqt_chroma_offs) {
+		base = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_chroma_offs + 1];
+		for (i = 0; i < ARRAY_SIZE(t81k2_dct_chroma_table); i++) {
+			dqt_val = jpeg_calculate_dqt(ectx, t81k2_dct_chroma_table[i]);
+			idx = t81a6_dct_zig_zag_table[i];
+			base[idx] = dqt_val;
+		}
+	}
+}
+
+/*
+ * jpeg_upload_dmi_table - write the scaled DQT coefficients to the hardware
+ * DMI registers.  Must only be called from the job execution path where
+ * runtime PM has already been acquired (pm_runtime_resume_and_get).
+ *
+ * Reads precomputed values from hdr_cache (populated by jpeg_update_dqt_cache)
+ * to avoid redundant per-coefficient recalculation on the hot encode path.
+ */
+static void jpeg_upload_dmi_table(struct jenc_context *ectx)
+{
+	const u8 *luma_qt = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_luma_offs + 1];
+	u32 pcfg = JPEG_DMI_ENABLE_UPLOAD;
+	u32 addr = 0x00000000;
+	u32 reg_val;
+	int i;
+
+	/* DMI upload start sequence */
+	jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_ADDR, addr);
+	jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_CFG, pcfg);
+
+	/* DMI Luma upload - values are stored in zigzag order in hdr_cache */
+	for (i = 0; i < ARRAY_SIZE(t81k1_dct_luma_table); i++) {
+		reg_val = div_u64(U16_MAX + 1U, luma_qt[i]);
+		reg_val = clamp_t(u32, reg_val, 0, U16_MAX);
+		jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_DATA, reg_val);
+	}
+
+	/* DMI Chroma upload - only present for color formats */
+	if (ectx->hdr_cache.dqt_chroma_offs) {
+		const u8 *chroma_qt = &ectx->hdr_cache.data[ectx->hdr_cache.dqt_chroma_offs + 1];
+
+		for (i = 0; i < ARRAY_SIZE(t81k2_dct_chroma_table); i++) {
+			reg_val = div_u64(U16_MAX + 1U, chroma_qt[i]);
+			reg_val = clamp_t(u32, reg_val, 0, U16_MAX);
+			jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_DATA, reg_val);
+		}
+	}
+
+	/* DMI upload end sequence */
+	jpeg_io_write(ectx->jenc, JPEG_V420_REG_DMI_CFG, addr);
+
+	ectx->quality_programmed = ectx->quality_requested;
+
+	dev_dbg(ectx->dev, "quality_programmed=%d\n", ectx->quality_programmed);
+}
+
+static void jpeg_sync_sg(struct device *dev,
+			 struct qcom_jpeg_buff *frame,
+			 enum dma_data_direction direction, bool for_device)
+{
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		struct sg_table *sgt = frame->plns[pln].sgt;
+
+		if (!frame->plns[pln].dma || !sgt)
+			break;
+
+		if (for_device)
+			dma_sync_sgtable_for_device(dev, sgt, direction);
+		else
+			dma_sync_sgtable_for_cpu(dev, sgt, direction);
+	}
+}
+
+static int jpeg_init(struct qcom_jenc_dev *jenc)
+{
+	unsigned long rtime;
+	u32 hw_ver;
+
+	if (WARN_ON_ONCE(!jenc || !jenc->dev || !jenc->jpeg_base))
+		return -EINVAL;
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
+
+	reinit_completion(&jenc->reset_complete);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_INT_MASK,
+		     JPEG_V420_IRQ_STATUS_RESET_ACK_MSK, JPEG_SET_U32);
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_RESET_CMD,
+		     JPEG_V420_RST_CMD_FE_RESET_MSK			|
+		     JPEG_V420_RST_CMD_WE_RESET_MSK			|
+		     JPEG_V420_RST_CMD_ENCODER_RESET_MSK		|
+		     JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK	|
+		     JPEG_V420_RST_CMD_SCALE_RESET_MSK			|
+		     JPEG_V420_RST_CMD_REGISTER_RESET_MSK		|
+		     JPEG_V420_RST_CMD_MISR_RESET_MSK			|
+		     JPEG_V420_RST_CMD_CORE_RESET_MSK			|
+		     JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET_MSK,
+		     JPEG_SET_U32);
+
+	rtime = wait_for_completion_timeout(&jenc->reset_complete,
+					    msecs_to_jiffies(JPEG_RESET_TIMEOUT_MS));
+	if (!rtime) {
+		dev_err(jenc->dev, "encoder HW reset timeout\n");
+		return -ETIME;
+	}
+
+	hw_ver = jpeg_io_read(jenc, JPEG_V420_REG_HW_VERSION);
+	dev_dbg(jenc->dev, "JPEG HW encoder version %d.%d.%d\n",
+		jpeg_bits_get(JPEG_V420_HW_VER_MAJOR_MSK, hw_ver),
+		jpeg_bits_get(JPEG_V420_HW_VER_MINOR_MSK, hw_ver),
+		jpeg_bits_get(JPEG_V420_HW_VER_STEP_MSK, hw_ver));
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_RD_PLN0_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_RD_PLN1_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_RD_PLN2_QUEUE_MSK, JPEG_SET_U32);
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_RD_PLN0_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_RD_PLN1_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_RD_PLN2_QUEUE_MSK, JPEG_CLR_U32);
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_WR_PLN0_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_WR_PLN1_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_WR_PLN2_QUEUE_MSK, JPEG_SET_U32);
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_WR_PLN0_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_WR_PLN1_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_WR_PLN2_QUEUE_MSK, JPEG_CLR_U32);
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
+	jpeg_wo_bits(jenc, JPEG_V420_REG_INT_MASK, JPEG_V420_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
+
+	return 0;
+}
+
+static int jpeg_exec(struct qcom_jenc_dev *jenc)
+{
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_HW_START_MSK, 1);
+
+	return 0;
+}
+
+static void jpeg_stop(struct qcom_jenc_dev *jenc)
+{
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_HW_START_MSK, 0);
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_RD_PLN0_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_RD_PLN1_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_RD_PLN2_QUEUE_MSK, JPEG_SET_U32);
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_RD_PLN0_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_RD_PLN1_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_RD_PLN2_QUEUE_MSK, JPEG_CLR_U32);
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_WR_PLN0_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_WR_PLN1_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_WR_PLN2_QUEUE_MSK, JPEG_SET_U32);
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_CLR_WR_PLN0_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_WR_PLN1_QUEUE_MSK |
+		     JPEG_V420_CMD_CLR_WR_PLN2_QUEUE_MSK, JPEG_CLR_U32);
+}
+
+static int jpeg_deinit(struct qcom_jenc_dev *jenc)
+{
+	unsigned long rtime;
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
+
+	reinit_completion(&jenc->stop_complete);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_INT_MASK, JPEG_V420_IRQ_STATUS_STOP_ACK_MSK, JPEG_SET_U32);
+
+	jpeg_wo_bits(jenc, JPEG_V420_REG_HW_CMD, JPEG_V420_CMD_HW_STOP_MSK, 1);
+
+	rtime = wait_for_completion_timeout(&jenc->stop_complete,
+					    msecs_to_jiffies(JPEG_STOP_TIMEOUT_MS));
+	jpeg_wo_bits(jenc, JPEG_V420_REG_INT_MASK, JPEG_V420_IRQ_STATUS_ALL_BITS, JPEG_CLR_U32);
+	jpeg_wo_bits(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS, JPEG_SET_U32);
+
+	if (!rtime) {
+		dev_err(jenc->dev, "encoder HW stop timeout\n");
+		return -ETIME;
+	}
+
+	return 0;
+}
+
+static int jpeg_apply_fe_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
+			      struct vb2_buffer *vb)
+{
+	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
+	struct v4l2_pix_format_mplane *fmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	unsigned long flags;
+	u8 pln;
+
+	jpeg_sync_sg(jenc->dev, frame, DMA_TO_DEVICE, true);
+
+	for (pln = 0; pln < fmt->num_planes; pln++) {
+		if (!frame->plns[pln].sgt || !frame->plns[pln].sgt->sgl)
+			break;
+
+		jpeg_io_write(jenc, jpeg_v420_fe_pntr[pln], frame->plns[pln].dma);
+		jpeg_io_write(jenc, jpeg_v420_fe_offs[pln], 0);
+
+		dev_dbg(jenc->dev, "FE pln=%d addr=%pad idx:%d\n",
+			pln, &frame->plns[pln].dma, vb->index);
+	}
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	q->buff_id = vb->index;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	return 0;
+}
+
+static int jpeg_store_fe_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
+	struct qcom_jpeg_buff *buff = &q->buff[vb2->index];
+	u8 pln;
+
+	for (pln = 0; pln < q->vf.num_planes; pln++) {
+		buff->plns[pln].sgt = vb2_dma_sg_plane_desc(vb2, pln);
+		if (!buff->plns[pln].sgt || !buff->plns[pln].sgt->sgl)
+			return -EINVAL;
+
+		buff->plns[pln].dma = sg_dma_address(buff->plns[pln].sgt->sgl);
+		if (!buff->plns[pln].dma)
+			return -EINVAL;
+
+		buff->plns[pln].size = vb2_plane_size(vb2, pln);
+		if (!buff->plns[pln].size)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int jpeg_setup_fe_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *sfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_fe_bsize[pln],
+			     JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK, 0);
+		jpeg_rw_bits(jenc, jpeg_v420_fe_bsize[pln],
+			     JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK, 0);
+		jpeg_rw_bits(jenc, jpeg_v420_fe_stride[pln], JPEG_V420_PLN_RD_STRIDE_STRIDE_MSK, 0);
+	}
+
+	for (pln = 0; pln < sfmt->num_planes; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_fe_bsize[pln], JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK,
+			     sfmt->width  - 1);
+		jpeg_rw_bits(jenc, jpeg_v420_fe_bsize[pln], JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK,
+			     sfmt->height  - 1);
+		jpeg_rw_bits(jenc, jpeg_v420_fe_stride[pln], JPEG_V420_PLN_RD_STRIDE_STRIDE_MSK,
+			     sfmt->plane_fmt[pln].bytesperline);
+
+		dev_dbg(ectx->dev, "FE pln=%d width=%d height=%d stride=%d\n",
+			pln,
+			jpeg_rd_bits(jenc, jpeg_v420_fe_bsize[pln],
+				     JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK),
+			jpeg_rd_bits(jenc, jpeg_v420_fe_bsize[pln],
+				     JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK),
+			jpeg_rd_bits(jenc, jpeg_v420_fe_stride[pln],
+				     JPEG_V420_PLN_RD_STRIDE_STRIDE_MSK));
+	}
+
+	return 0;
+}
+
+static int jpeg_setup_fe_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_io_write(jenc, jpeg_v420_fe_hinit[pln], 0);
+
+	return 0;
+}
+
+static int jpeg_setup_fe_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_io_write(jenc, jpeg_v420_fe_vinit[pln], 0);
+
+	return 0;
+}
+
+static int jpeg_setup_fe_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *sfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 expected_planes, pln;
+	int rval;
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MAL_EN_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_BOTTOM_VPAD_EN_MSK, 1);
+
+	rval = jpeg_get_memory_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid memory format for v4l2 format: %p4cc\n",
+			&sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	switch (rval) {
+	case JPEG_MEM_FMT_MONO:
+		expected_planes = 1;
+		break;
+	case JPEG_MEM_FMT_PPLANAR:
+		expected_planes = 2;
+		break;
+	case JPEG_MEM_FMT_PLANAR:
+		expected_planes = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (sfmt->num_planes != expected_planes) {
+		dev_err(ectx->dev, "plane mismatch fmt=%u expected=%u got=%u\n",
+			rval, expected_planes, sfmt->num_planes);
+		return -EINVAL;
+	}
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MEMORY_FORMAT_MSK, rval);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_PLN0_EN_MSK, 0);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_PLN1_EN_MSK, 0);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_PLN2_EN_MSK, 0);
+
+	/* Scaling is not supported; always configure for 1:1 */
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_SIXTEEN_MCU_EN_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MCUS_PER_BLOCK_MSK, 0);
+
+	dev_dbg(ectx->dev, "sixteen MCU enabled=%d, %d MCU per blocks\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_SIXTEEN_MCU_EN_MSK),
+		jpeg_rd_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MCUS_PER_BLOCK_MSK));
+
+	rval = jpeg_get_mal_boundary(sfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
+	if (rval < 0) {
+		dev_err(ectx->dev, "failed to get FE mal boundary width=%u\n",
+			sfmt->width);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MAL_BOUNDARY_MSK, rval);
+
+	dev_dbg(ectx->dev, "optimal FE mal boundary=%d\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_MAL_BOUNDARY_MSK));
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
+			&sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	switch (rval) {
+	case JPEG_ENCODE_MONO:
+	case JPEG_ENCODE_H1V1:
+	case JPEG_ENCODE_H2V1:
+		jpeg_rw_bits(jenc, JPEG_V420_REG_FE_VBPAD_CFG, JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK,
+			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_8));
+		break;
+	case JPEG_ENCODE_H1V2:
+	case JPEG_ENCODE_H2V2:
+		jpeg_rw_bits(jenc, JPEG_V420_REG_FE_VBPAD_CFG, JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK,
+			     DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_16));
+		break;
+	default:
+		dev_err(ectx->dev, "unsupported encode format: %d\n", rval);
+		return -EINVAL;
+	}
+
+	dev_dbg(ectx->dev, "FE vpad config=%d\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_FE_VBPAD_CFG,
+			     JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK));
+
+	if (sfmt->pixelformat == V4L2_PIX_FMT_NV21M || sfmt->pixelformat == V4L2_PIX_FMT_NV61M)
+		jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_CBCR_ORDER_MSK, 1);
+	else
+		jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG, JPEG_V420_FE_CFG_CBCR_ORDER_MSK, 0);
+
+	for (pln = 0; pln < sfmt->num_planes; pln++) {
+		if (sfmt->width && sfmt->height) {
+			switch (pln) {
+			case 0:
+				jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG,
+					     JPEG_V420_FE_CFG_PLN0_EN_MSK, 1);
+				break;
+			case 1:
+				jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG,
+					     JPEG_V420_FE_CFG_PLN1_EN_MSK, 1);
+				break;
+			case 2:
+				jpeg_rw_bits(jenc, JPEG_V420_REG_FE_CFG,
+					     JPEG_V420_FE_CFG_PLN2_EN_MSK, 1);
+				break;
+			}
+		}
+	}
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_FE_ENABLE_MSK, 1);
+
+	return 0;
+}
+
+static int jpeg_setup_fe(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	int rc;
+
+	rc = jpeg_setup_fe_size(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_fe_hinit(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_fe_vinit(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_fe_params(ectx, q);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int jpeg_ensure_header_cache(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	int rc;
+
+	if (ectx->hdr_cache.size)
+		return 0;
+
+	rc = qcom_jenc_header_init(&ectx->hdr_cache, sq->vf.pixelformat);
+	if (rc) {
+		dev_err(ectx->dev, "JFIF header lazy init failed\n");
+		return rc;
+	}
+
+	return 0;
+}
+
+static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_jenc_queue *q,
+			      struct vb2_buffer *vb)
+{
+	struct qcom_jpeg_buff *frame = &q->buff[vb->index];
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	void *mptr = vb2_plane_vaddr(vb, 0);
+	dma_addr_t dma = frame->plns[0].dma;
+	unsigned long flags;
+	size_t header_size;
+	int rc;
+	u8 pln = 0;
+
+	if (WARN_ON_ONCE(!dma))
+		return -EPERM;
+
+	if (WARN_ON_ONCE(!mptr))
+		return -EPERM;
+
+	rc = jpeg_ensure_header_cache(ectx);
+	if (rc)
+		return rc;
+
+	/* Update DQT cache if quality changed, then upload to HW DMI. */
+	mutex_lock(&ectx->quality_mutex);
+	if (!ectx->hdr_cache.size || ectx->quality_programmed != ectx->quality_requested)
+		jpeg_update_dqt_cache(ectx);
+	jpeg_upload_dmi_table(ectx);
+	mutex_unlock(&ectx->quality_mutex);
+
+	/*
+	 * Invalidate stale CPU cache lines before writing the JPEG header
+	 * with the CPU into the destination buffer.
+	 */
+	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, false);
+
+	header_size = min_t(size_t, vb->planes[0].length, ectx->hdr_cache.size);
+	header_size = qcom_jenc_header_emit(&ectx->hdr_cache, mptr,
+					    (u32)header_size, (u16)q->vf.width,
+					    (u16)q->vf.height);
+
+	dma += header_size;
+	qcom_jenc_dqts_emit(&ectx->hdr_cache, mptr);
+
+	/*
+	 * Flush CPU writes to the header before handing the buffer to the
+	 * hardware DMA engine.
+	 */
+	jpeg_sync_sg(jenc->dev, frame, DMA_BIDIRECTIONAL, true);
+
+	jpeg_io_write(jenc, jpeg_v420_we_pntr[pln], dma);
+
+	dev_dbg(jenc->dev, "WE pln=%d addr=%pad idx:%d\n",
+		pln, &dma, vb->index);
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	q->buff_id = vb->index;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	return 0;
+}
+
+static int jpeg_store_we_next(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb2->type)];
+	struct qcom_jpeg_buff *frame = &q->buff[vb2->index];
+	struct sg_table *sgt;
+	dma_addr_t dma;
+
+	sgt = vb2_dma_sg_plane_desc(vb2, 0);
+	if (!sgt || !sgt->sgl)
+		return -EINVAL;
+
+	dma = sg_dma_address(sgt->sgl);
+	if (!dma)
+		return -EINVAL;
+
+	if (!vb2_plane_vaddr(vb2, 0))
+		return -EINVAL;
+
+	frame->plns[0].sgt = sgt;
+	frame->plns[0].dma = dma;
+	frame->plns[0].size = vb2_plane_size(vb2, 0);
+
+	return 0;
+}
+
+static int jpeg_setup_we_size(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
+		jpeg_rw_bits(jenc, jpeg_v420_we_stride[pln], JPEG_V420_PLN_WR_STRIDE_STRIDE_MSK, 0);
+
+	jpeg_io_write(jenc, JPEG_V420_REG_WE_BSIZE_0, dfmt->plane_fmt[0].sizeimage);
+
+	dev_dbg(ectx->dev, "WE size=%u\n", dfmt->plane_fmt[0].sizeimage);
+
+	return 0;
+}
+
+static int jpeg_setup_we_hinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	if (!dfmt->width) {
+		dev_err(ectx->dev, "invalid destination width=%d\n", dfmt->width);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_we_hinit[pln], JPEG_V420_PLN_WR_HINIT_INTEGER_MSK, 0);
+		jpeg_rw_bits(jenc, jpeg_v420_we_hstep[pln], JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK, 0);
+	}
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_HSTEP_0,
+		     JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK, dfmt->width);
+
+	dev_dbg(ectx->dev, "WE hstep=%u\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_WE_HSTEP_0, JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK));
+
+	return 0;
+}
+
+static int jpeg_setup_we_vinit(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u8 pln;
+
+	if (!dfmt->height) {
+		dev_err(ectx->dev, "invalid destination height=%d\n", dfmt->height);
+		return -EINVAL;
+	}
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_we_vinit[pln], JPEG_V420_PLN_WR_VINIT_INTEGER_MSK, 0);
+		jpeg_rw_bits(jenc, jpeg_v420_we_vstep[pln], JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK, 0);
+	}
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_VSTEP_0,
+		     JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK, dfmt->height);
+
+	dev_dbg(ectx->dev, "WE vstep=%u\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_WE_VSTEP_0, JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK));
+
+	return 0;
+}
+
+static int jpeg_setup_we_params(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	struct v4l2_pix_format_mplane *dfmt = &q->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
+	int rval;
+
+	rval = jpeg_get_memory_fmt(dfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid memory format for v4l2 format: %p4cc\n",
+			&dfmt->pixelformat);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_MEMORY_FORMAT_MSK, rval);
+
+	rval = jpeg_get_mal_boundary(dfmt->width, jpeg_mal_bounds, ARRAY_SIZE(jpeg_mal_bounds));
+	if (rval < 0) {
+		dev_err(ectx->dev, "failed to get WE mal boundary width=%u\n",
+			dfmt->width);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_MAL_BOUNDARY_MSK, rval);
+
+	dev_dbg(ectx->dev, "optimal WE mal boundary=%d\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_MAL_BOUNDARY_MSK));
+
+	rval = jpeg_get_encode_fmt(dfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
+			&dfmt->pixelformat);
+		return rval;
+	}
+
+	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
+				     &mcu_cols, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
+			mcu_cols, mcu_rows);
+		return rval;
+	}
+
+	dev_dbg(ectx->dev, "WE blk_w=%u blk_h=%u cols=%u rows=%u\n",
+		blk_w, blk_h, mcu_cols, mcu_rows);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_BLOCKS_0,
+		     JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK, mcu_rows - 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_BLOCKS_0,
+		     JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK, mcu_cols - 1);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_CBCR_ORDER_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_MAL_EN_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_POP_BUFF_ON_EOS_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_WE_CFG, JPEG_V420_WE_CFG_PLN0_EN_MSK, 1);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_MODE_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_WE_ENABLE_MSK, 1);
+
+	return 0;
+}
+
+static int jpeg_setup_we(struct jenc_context *ectx, struct qcom_jenc_queue *q)
+{
+	int rc;
+
+	rc = jpeg_setup_we_size(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_we_hinit(ectx, q);
+	if (rc)
+		return rc;
+
+	rc = jpeg_setup_we_vinit(ectx, q);
+	if (rc)
+		return rc;
+
+	return jpeg_setup_we_params(ectx, q);
+}
+
+static int jpeg_setup_scale(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
+	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
+	struct v4l2_pix_format_mplane *dfmt = &dq->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
+	int rval;
+	u8 pln;
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_SCALE_RESET_MSK, 1);
+
+	/* explicit no scaling */
+	jpeg_rw_bits(jenc, JPEG_V420_REG_SCALE_CFG, JPEG_V420_SCALE_CFG_HSCALE_ENABLE_MSK, 0);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_SCALE_CFG, JPEG_V420_SCALE_CFG_VSCALE_ENABLE_MSK, 0);
+
+	for (pln = 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
+		jpeg_io_write(jenc, jpeg_v420_scale_hstep[pln], JPEG_DEFAULT_SCALE_STEP);
+		jpeg_io_write(jenc, jpeg_v420_scale_vstep[pln], JPEG_DEFAULT_SCALE_STEP);
+	}
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
+			&sfmt->pixelformat);
+		return -EINVAL;
+	}
+
+	rval = jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_w, &blk_h,
+				     &mcu_cols, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid MCU geometry blk_w=%d blk_h=%d\n",
+			blk_w, blk_h);
+		return -EINVAL;
+	}
+
+	dev_dbg(ectx->dev, "scale blk_w=%u blk_h=%u cols=%u rows=%u\n",
+		blk_w, blk_h, mcu_cols, mcu_rows);
+
+	for (pln = 0; pln < sq->vf.num_planes; pln++) {
+		jpeg_rw_bits(jenc, jpeg_v420_scale_out_cfg[pln],
+			     JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_MSK, blk_w - 1);
+		jpeg_rw_bits(jenc, jpeg_v420_scale_out_cfg[pln],
+			     JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK, blk_h - 1);
+	}
+
+	dev_dbg(ectx->dev, "scale src=%ux%u dst=%ux%u enable=%d/%d\n",
+		sfmt->width, sfmt->height, dfmt->width, dfmt->height,
+		jpeg_rd_bits(jenc, JPEG_V420_REG_SCALE_CFG, JPEG_V420_SCALE_CFG_HSCALE_ENABLE_MSK),
+		jpeg_rd_bits(jenc, JPEG_V420_REG_SCALE_CFG, JPEG_V420_SCALE_CFG_VSCALE_ENABLE_MSK));
+
+	/* Disabled, but must be configured */
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_SCALE_ENABLE_MSK, 0);
+
+	return 0;
+}
+
+static int jpeg_setup_encode(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct v4l2_pix_format_mplane *sfmt = &sq->vf;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u32 blk_w = 0, blk_h = 0, mcu_cols = 0, mcu_rows = 0;
+	int rval;
+
+	if (!sfmt->width || !sfmt->height)
+		return -EINVAL;
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_ENCODER_RESET_MSK, 1);
+
+	rval = jpeg_get_encode_fmt(sfmt->pixelformat);
+	if (rval < 0) {
+		dev_err(ectx->dev, "unsupported encode format %p4cc\n",
+			&sfmt->pixelformat);
+		return -EINVAL;
+	}
+	jpeg_rw_bits(jenc, JPEG_V420_REG_ENC_CFG, JPEG_V420_ENC_CFG_IMAGE_FORMAT_MSK, rval);
+
+	rval = jpeg_get_mcu_geometry(rval, sfmt->width, sfmt->height, &blk_w, &blk_h,
+				     &mcu_cols, &mcu_rows);
+	if (rval < 0) {
+		dev_err(ectx->dev, "invalid MCU geometry mcu_cols=%d mcu_rows=%d\n",
+			mcu_cols, mcu_rows);
+		return -EINVAL;
+	}
+
+	dev_dbg(ectx->dev, "encode blk_w=%u blk_h=%u cols=%u rows=%u\n",
+		blk_w, blk_h, mcu_cols, mcu_rows);
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_ENC_IMG_SIZE,
+		     JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK, mcu_cols - 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_ENC_IMG_SIZE,
+		     JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK, mcu_rows - 1);
+
+	dev_dbg(ectx->dev, "encode width=%d height=%d\n",
+		jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_IMG_SIZE,
+			     JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK),
+		jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_IMG_SIZE,
+			     JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK));
+
+	jpeg_rw_bits(jenc, JPEG_V420_REG_ENC_CFG, JPEG_V420_ENC_CFG_APPLY_EOI_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_CORE_CFG, JPEG_V420_CORE_CFG_ENC_ENABLE_MSK, 1);
+
+	return 0;
+}
+
+static irqreturn_t op_jpeg_irq_bot(int irq, void *data)
+{
+	struct qcom_jenc_dev *jenc = data;
+	unsigned long flags;
+	u32 irq_status;
+	u32 irq_mask;
+
+	irq_status = READ_ONCE(jenc->pending_irq_status);
+
+	irq_mask = JPEG_V420_IRQ_STATUS_SESSION_DONE_MSK;
+	if (jpeg_bits_get(irq_mask, irq_status)) {
+		struct jenc_context *ctx;
+
+		spin_lock_irqsave(&jenc->hw_lock, flags);
+		ctx = jenc->actx;
+		jenc->actx = NULL;
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+		if (ctx && ctx->bufq[JENC_DST_QUEUE].buff_id >= 0) {
+			struct qcom_jenc_queue *dq = &ctx->bufq[JENC_DST_QUEUE];
+			struct qcom_jpeg_buff *frame = &dq->buff[dq->buff_id];
+			size_t out_size = jpeg_rd_bits(jenc, JPEG_V420_REG_ENC_OUT_SIZE,
+						       JPEG_V420_STATUS_OUT_SIZE_BYTES_MSK);
+
+			dev_dbg(jenc->dev, "complete idx:%d addr=%pad size=%zu\n",
+				dq->buff_id, &frame->plns[0].dma, out_size);
+
+			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
+					    out_size + ctx->hdr_cache.size);
+		}
+
+		jpeg_stop(jenc);
+	}
+
+	irq_mask = JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK;
+	if (jpeg_bits_get(irq_mask, irq_status)) {
+		struct jenc_context *ctx;
+
+		spin_lock_irqsave(&jenc->hw_lock, flags);
+		ctx = jenc->actx;
+		jenc->actx = NULL;
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+		dev_err(jenc->dev, "encoder hardware failure=0x%x\n",
+			jpeg_bits_get(irq_mask, irq_status));
+		if (ctx)
+			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_ERROR, 0);
+
+		jpeg_stop(jenc);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t op_jpeg_irq_top(int irq, void *data)
+{
+	struct qcom_jenc_dev *jenc = data;
+	unsigned long flags;
+	u32 irq_status;
+	u32 irq_mask;
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+
+	irq_status = jpeg_io_read(jenc, JPEG_V420_REG_INT_STATUS);
+	jpeg_wo_bits(jenc, JPEG_V420_REG_INT_CLR, JPEG_V420_IRQ_STATUS_ALL_BITS, irq_status);
+
+	irq_mask = JPEG_V420_IRQ_STATUS_RESET_ACK_MSK;
+	if (jpeg_bits_get(irq_mask, irq_status)) {
+		complete(&jenc->reset_complete);
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	irq_mask = JPEG_V420_IRQ_STATUS_STOP_ACK_MSK;
+	if (jpeg_bits_get(irq_mask, irq_status)) {
+		complete(&jenc->stop_complete);
+		dev_dbg(jenc->dev, "hardware stop acknowledged\n");
+		spin_unlock_irqrestore(&jenc->hw_lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	WRITE_ONCE(jenc->pending_irq_status, irq_status);
+
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static void op_jpeg_get_hw_caps(struct qcom_jenc_dev *jenc, u32 *caps)
+{
+	u32 hw_caps;
+
+	hw_caps = jpeg_io_read(jenc, JPEG_V420_REG_HW_CAPABILITY);
+	dev_dbg(jenc->dev, "CAPS: encode=%d decode=%d upscale=%d downscale=%d\n",
+		jpeg_bits_get(JPEG_V420_HW_CAP_ENCODE_MSK, hw_caps),
+		jpeg_bits_get(JPEG_V420_HW_CAP_DECODE_MSK, hw_caps),
+		jpeg_bits_get(JPEG_V420_HW_CAP_UPSCALE_MSK, hw_caps),
+		jpeg_bits_get(JPEG_V420_HW_CAP_DOWNSCALE_MSK, hw_caps));
+
+	*caps = hw_caps;
+}
+
+static struct qcom_jenc_queue *op_jpeg_get_buff_queue(struct jenc_context *ectx,
+						      enum qcom_enc_qid id)
+{
+	return &ectx->bufq[id];
+}
+
+static int op_jpeg_queue_setup(struct jenc_context *ectx, enum qcom_enc_qid id)
+{
+	int rc;
+
+	if (id == JENC_SRC_QUEUE) {
+		struct qcom_jenc_queue *q = &ectx->bufq[id];
+
+		rc = qcom_jenc_header_init(&ectx->hdr_cache, q->vf.pixelformat);
+		if (rc) {
+			dev_err(ectx->dev, "JFIF header init failed\n");
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static int op_jpeg_src_fmt_update(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc)
+{
+	bool old_is_mono = (old_fourcc == V4L2_PIX_FMT_GREY);
+	bool new_is_mono = (new_fourcc == V4L2_PIX_FMT_GREY);
+	int rc;
+
+	/* header layout changes only for mono <-> color source format switch */
+	if (old_is_mono == new_is_mono)
+		return 0;
+
+	rc = qcom_jenc_header_init(&ectx->hdr_cache, new_fourcc);
+	if (rc) {
+		dev_err(ectx->dev, "JFIF header reinit failed\n");
+		return rc;
+	}
+
+	/* force DQT upload after source profile switch */
+	mutex_lock(&ectx->quality_mutex);
+	ectx->quality_programmed = 0;
+	mutex_unlock(&ectx->quality_mutex);
+
+	return 0;
+}
+
+static int op_jpeg_buffer_prepare(struct jenc_context *ectx, struct vb2_buffer *vb2)
+{
+	int rc;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb2->type)) {
+		rc = jpeg_store_fe_next(ectx, vb2);
+		if (rc)
+			dev_err(ectx->dev, "cannot set up fetch engine address\n");
+	} else {
+		rc = jpeg_store_we_next(ectx, vb2);
+		if (rc)
+			dev_err(ectx->dev, "cannot set up write engine address\n");
+	}
+
+	return rc;
+}
+
+static int op_jpeg_process_exec(struct qcom_jenc_dev *jenc, struct jenc_context *ectx,
+				struct vb2_buffer *vb)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	jenc->actx = ectx;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+		rc = jpeg_setup_fe(ectx, sq);
+		if (rc)
+			goto err_clear_ctx;
+
+		rc = jpeg_apply_fe_addr(ectx, sq, vb);
+		if (rc)
+			goto err_clear_ctx;
+	} else {
+		rc = jpeg_setup_we(ectx, dq);
+		if (rc)
+			goto err_clear_ctx;
+
+		rc = jpeg_apply_we_addr(ectx, dq, vb);
+		if (rc)
+			goto err_clear_ctx;
+	}
+
+	/* Both src and dst buffers queued for this frame — trigger encode. */
+	if (sq->sequence == dq->sequence) {
+		rc = jpeg_setup_scale(ectx);
+		if (rc)
+			goto err_clear_ctx;
+
+		rc = jpeg_setup_encode(ectx);
+		if (rc)
+			goto err_clear_ctx;
+
+		jpeg_exec(jenc);
+	}
+
+	return 0;
+
+err_clear_ctx:
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	if (jenc->actx == ectx)
+		jenc->actx = NULL;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	return rc;
+}
+
+static int op_jpeg_prepare(struct qcom_jenc_dev *jenc)
+{
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_ENCODER_RESET_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK, 1);
+	jpeg_rw_bits(jenc, JPEG_V420_REG_RESET_CMD, JPEG_V420_RST_CMD_CORE_RESET_MSK, 1);
+
+	return 0;
+}
+
+static unsigned long jpeg_calc_optimal_clk(struct qcom_jenc_dev *jenc,
+					   u32 width, u32 height, u32 fps)
+{
+	const struct qcom_dev_resources *res = jenc->res;
+	unsigned long ref_pixel_rate;
+	unsigned long optimal_clk;
+	unsigned long pixel_rate;
+
+	if (!width || !height || !fps)
+		return jenc->max_freq;
+
+	ref_pixel_rate = res->ref_throughput_mpps * 1000000UL;
+	pixel_rate = (unsigned long)width * height * fps;
+
+	optimal_clk = DIV_ROUND_UP_ULL(pixel_rate * res->ref_clk_hz, ref_pixel_rate);
+
+	return min_t(unsigned long, jenc->max_freq, optimal_clk);
+}
+
+static unsigned long jpeg_get_optimal_frequency(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	u32 fps;
+
+	/*
+	 * If adaptive performance scaling is not requested always run at
+	 * highest clock level for deterministic latency.
+	 */
+	if (!v4l2_ctrl_g_ctrl(ectx->perf_level_auto_ctl))
+		return jenc->max_freq;
+
+	fps = (u32)v4l2_ctrl_g_ctrl(ectx->fps_target_ctl);
+	fps = clamp(fps, (u32)QCOM_JPEG_FPS_MIN, (u32)QCOM_JPEG_FPS_MAX);
+
+	return jpeg_calc_optimal_clk(jenc, sq->vf.width, sq->vf.height, fps);
+}
+
+static int op_jpeg_acquire(struct jenc_context *ectx, struct vb2_queue *q)
+{
+	struct qcom_jenc_queue *sq = &ectx->bufq[JENC_SRC_QUEUE];
+	struct qcom_jenc_queue *dq = &ectx->bufq[JENC_DST_QUEUE];
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	int rc;
+
+	/* reset per-context stream state for each (re)acquire */
+	sq->sequence = 0;
+	sq->buff_id = -1;
+	dq->sequence = 0;
+	dq->buff_id = -1;
+	/*
+	 * Recreate JPEG header lazily per destination buffer to tolerate
+	 * different valid V4L2 call orders (e.g. STREAMON before first QBUF).
+	 */
+	ectx->hdr_cache.size = 0;
+	/* force DQT upload on first frame after (re)acquire */
+	mutex_lock(&ectx->quality_mutex);
+	ectx->quality_programmed = 0;
+	mutex_unlock(&ectx->quality_mutex);
+
+	if (atomic_inc_return(&jenc->ref_count) == 1) {
+		jenc->opt_freq = jpeg_get_optimal_frequency(ectx);
+
+		dev_dbg(jenc->dev, "freq=%lu src=%ux%u\n", jenc->opt_freq,
+			sq->vf.width, sq->vf.height);
+
+		rc = pm_runtime_resume_and_get(jenc->dev);
+		if (rc < 0) {
+			dev_err(jenc->dev, "PM runtime get failed\n");
+			atomic_dec(&jenc->ref_count);
+			return rc;
+		}
+
+		enable_irq(jenc->irq);
+
+		rc = jpeg_init(jenc);
+		if (rc) {
+			dev_err(jenc->dev, "hardware init failed\n");
+			disable_irq(jenc->irq);
+			atomic_dec(&jenc->ref_count);
+			pm_runtime_put_sync(jenc->dev);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static int op_jpeg_release(struct jenc_context *ectx, struct vb2_queue *q)
+{
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	int rc = 0;
+	int pm_rc;
+	int ref;
+
+	ref = atomic_dec_if_positive(&jenc->ref_count);
+	if (ref < 0) {
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+
+	if (!ref) {
+		rc = jpeg_deinit(jenc);
+		if (rc)
+			dev_err(jenc->dev, "hardware exit failed\n");
+
+		disable_irq(jenc->irq);
+
+		pm_rc = pm_runtime_put_sync(jenc->dev);
+		if (pm_rc < 0) {
+			dev_err(jenc->dev, "PM runtime put failed\n");
+			if (!rc)
+				rc = pm_rc;
+		}
+
+		dev_dbg(jenc->dev, "JPEG HW encoder released\n");
+	}
+
+	return rc;
+}
+
+const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops = {
+	.hw_get_cap	= op_jpeg_get_hw_caps,
+	.hw_acquire	= op_jpeg_acquire,
+	.hw_release	= op_jpeg_release,
+	.hw_prepare	= op_jpeg_prepare,
+	.get_queue	= op_jpeg_get_buff_queue,
+	.queue_setup	= op_jpeg_queue_setup,
+	.src_fmt_update	= op_jpeg_src_fmt_update,
+	.buf_prepare	= op_jpeg_buffer_prepare,
+	.process_exec	= op_jpeg_process_exec,
+	.hw_irq_top	= op_jpeg_irq_top,
+	.hw_irq_bot	= op_jpeg_irq_bot
+};
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
new file mode 100644
index 000000000000..5a64e33a28b0
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_OPS_H
+#define QCOM_JENC_OPS_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+#include <media/videobuf2-core.h>
+
+#include "qcom_jenc_dev.h"
+
+/*
+ * JENC encoder hardware operations.
+ */
+struct qcom_jpeg_hw_ops {
+	void (*hw_get_cap)
+		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
+
+	int (*hw_acquire)
+		(struct jenc_context *ectx, struct vb2_queue *queue);
+
+	int (*hw_release)
+		(struct jenc_context *ectx, struct vb2_queue *queue);
+
+	int (*hw_prepare)
+		(struct qcom_jenc_dev *jenc);
+
+	struct qcom_jenc_queue * (*get_queue)
+		(struct jenc_context *ectx, enum qcom_enc_qid id);
+
+	int (*queue_setup)
+		(struct jenc_context *ectx, enum qcom_enc_qid id);
+
+	int (*src_fmt_update)
+		(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc);
+
+	int (*buf_prepare)
+		(struct jenc_context *ectx, struct vb2_buffer *vb2);
+
+	int (*process_exec)
+		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_buffer *vb2);
+
+	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
+	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);
+};
+
+extern const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops;
+
+#endif /* QCOM_JENC_OPS_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
new file mode 100644
index 000000000000..f9ab7c86792f
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "qcom_jenc_ops.h"
+#include "qcom_jenc_res.h"
+
+#include "qcom_jenc_v420_hw_info.h"
+
+const struct qcom_dev_resources qcom_t165_t480_jpeg_drvdata = {
+	.hw_ops			= &qcom_jpeg_default_ops,
+	.ref_clk_hz		= 600000000UL,
+	.ref_throughput_mpps	= 110UL,
+};
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
new file mode 100644
index 000000000000..91c6e789cffa
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_RES_H
+#define QCOM_JENC_RES_H
+
+#include "qcom_jenc_defs.h"
+
+struct qcom_dev_resources {
+	const struct qcom_jpeg_hw_ops	*hw_ops;
+	unsigned long			ref_clk_hz;
+	unsigned long			ref_throughput_mpps;
+};
+
+extern const struct qcom_dev_resources qcom_t165_t480_jpeg_drvdata;
+
+#endif	/* QCOM_JENC_RES_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
new file mode 100644
index 000000000000..ebf69128cc2b
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
@@ -0,0 +1,410 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_V420_HW_INFO_H
+#define QCOM_JENC_V420_HW_INFO_H
+
+#include "qcom_jenc_defs.h"
+
+#define JPEG_V420_HW_VER_STEP_POS 0
+#define JPEG_V420_HW_VER_STEP_MSK \
+	(0xffffu << JPEG_V420_HW_VER_STEP_POS)
+
+#define JPEG_V420_HW_VER_MINOR_POS 16
+#define JPEG_V420_HW_VER_MINOR_MSK \
+	(0x0fffu << JPEG_V420_HW_VER_MINOR_POS)
+
+#define JPEG_V420_HW_VER_MAJOR_POS 28
+#define JPEG_V420_HW_VER_MAJOR_MSK \
+	(0xfu << JPEG_V420_HW_VER_MAJOR_POS)
+
+#define JPEG_V420_HW_CAP_ENCODE_MSK BIT_U32(0)
+#define JPEG_V420_HW_CAP_DECODE_MSK BIT_U32(1)
+
+#define JPEG_V420_HW_CAP_UPSCALE_POS 4
+#define JPEG_V420_HW_CAP_UPSCALE_MSK \
+	(0x7u << JPEG_V420_HW_CAP_UPSCALE_POS)
+
+#define JPEG_V420_HW_CAP_DOWNSCALE_POS 8
+#define JPEG_V420_HW_CAP_DOWNSCALE_MSK \
+	(0x7u << JPEG_V420_HW_CAP_DOWNSCALE_POS)
+
+#define JPEG_V420_RST_CMD_FE_RESET_MSK			BIT_U32(0)
+#define JPEG_V420_RST_CMD_WE_RESET_MSK			BIT_U32(1)
+#define JPEG_V420_RST_CMD_ENCODER_RESET_MSK		BIT_U32(4)
+#define JPEG_V420_RST_CMD_DECODER_RESET_MSK		BIT_U32(5)
+#define JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT_U32(6)
+#define JPEG_V420_RST_CMD_SCALE_RESET_MSK		BIT_U32(7)
+#define JPEG_V420_RST_CMD_REGISTER_RESET_MSK		BIT_U32(13)
+#define JPEG_V420_RST_CMD_MISR_RESET_MSK		BIT_U32(16)
+#define JPEG_V420_RST_CMD_CORE_RESET_MSK		BIT_U32(17)
+#define JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET_MSK	BIT_U32(29)
+#define JPEG_V420_RST_CMD_RESET_BYPASS_MSK		BIT_U32(31)
+
+#define JPEG_V420_CORE_CFG_FE_ENABLE_MSK	BIT_U32(0)
+#define JPEG_V420_CORE_CFG_WE_ENABLE_MSK	BIT_U32(1)
+#define JPEG_V420_CORE_CFG_ENC_ENABLE_MSK	BIT_U32(4)
+#define JPEG_V420_CORE_CFG_SCALE_ENABLE_MSK	BIT_U32(7)
+#define JPEG_V420_CORE_CFG_TESTBUS_ENABLE_MSK	BIT_U32(19)
+#define JPEG_V420_CORE_CFG_MODE_MSK		BIT_U32(24)
+#define JPEG_V420_CORE_CFG_CGC_DISABLE_MSK	BIT_U32(31)
+
+#define JPEG_V420_CMD_HW_START_MSK		BIT_U32(0)
+#define JPEG_V420_CMD_HW_STOP_MSK		BIT_U32(1)
+#define JPEG_V420_CMD_CLR_RD_PLN0_QUEUE_MSK	BIT_U32(4)
+#define JPEG_V420_CMD_CLR_RD_PLN1_QUEUE_MSK	BIT_U32(5)
+#define JPEG_V420_CMD_CLR_RD_PLN2_QUEUE_MSK	BIT_U32(6)
+#define JPEG_V420_CMD_CLR_WR_PLN0_QUEUE_MSK	BIT_U32(8)
+#define JPEG_V420_CMD_CLR_WR_PLN1_QUEUE_MSK	BIT_U32(9)
+#define JPEG_V420_CMD_CLR_WR_PLN2_QUEUE_MSK	BIT_U32(10)
+#define JPEG_V420_CMD_APPLY_SWC_RD_PARAMS_MSK	BIT_U32(11)
+
+#define JPEG_V420_CORE_STATE_STATUS_ENCODE_STATE_MSK	BIT_U32(0)
+#define JPEG_V420_CORE_STATE_STATUS_SCALE_STATE_MSK	BIT_U32(2)
+#define JPEG_V420_CORE_STATE_STATUS_REALTIME_STATE_MSK	BIT_U32(4)
+#define JPEG_V420_CORE_STATE_STATUS_BUS_STATE_MSK	BIT_U32(8)
+#define JPEG_V420_CORE_STATE_STATUS_CGC_STATE_MSK	BIT_U32(9)
+
+#define JPEG_V420_FE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V420_FE_CFG_BYTE_ORDERING_MSK \
+	(0xfu << JPEG_V420_FE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V420_FE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V420_FE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xfu << JPEG_V420_FE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V420_FE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V420_FE_CFG_MEMORY_FORMAT_MSK \
+	(0x3u << JPEG_V420_FE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V420_FE_CFG_CBCR_ORDER_MSK		BIT_U32(12)
+#define JPEG_V420_FE_CFG_BOTTOM_VPAD_EN_MSK	BIT_U32(13)
+#define JPEG_V420_FE_CFG_PLN0_EN_MSK		BIT_U32(16)
+#define JPEG_V420_FE_CFG_PLN1_EN_MSK		BIT_U32(17)
+#define JPEG_V420_FE_CFG_PLN2_EN_MSK		BIT_U32(18)
+#define JPEG_V420_FE_CFG_SIXTEEN_MCU_EN_MSK	BIT_U32(21)
+#define JPEG_V420_FE_CFG_MCUS_PER_BLOCK_MSK	BIT_U32(22)
+#define JPEG_V420_FE_CFG_MAL_BOUNDARY_MSK	BIT_U32(24)
+#define JPEG_V420_FE_CFG_MAL_EN_MSK		BIT_U32(27)
+
+#define JPEG_V420_PLN_RD_OFFS_OFFSET_POS 0
+#define JPEG_V420_PLN_RD_OFFS_OFFSET_MSK \
+	(0x1fffffffu << JPEG_V420_PLN_RD_OFFS_OFFSET_POS)
+
+#define JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_MSK \
+	(0xffffu << JPEG_V420_PLN_RD_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_MSK \
+	(0xffffu << JPEG_V420_PLN_RD_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V420_PLN_RD_STRIDE_STRIDE_POS 0
+#define JPEG_V420_PLN_RD_STRIDE_STRIDE_MSK \
+	(0xffffu << JPEG_V420_PLN_RD_STRIDE_STRIDE_POS)
+
+#define JPEG_V420_PLN_RD_HINIT_FRACTIONAL_POS 0
+#define JPEG_V420_PLN_RD_HINIT_FRACTIONAL_MSK \
+	(0x1fffffu << JPEG_V420_PLN_RD_HINIT_FRACTIONAL_POS)
+
+#define JPEG_V420_PLN_RD_VINIT_FRACTIONAL_POS 0
+#define JPEG_V420_PLN_RD_VINIT_FRACTIONAL_MSK \
+	(0x1fffffu << JPEG_V420_PLN_RD_VINIT_FRACTIONAL_POS)
+
+#define JPEG_V420_WE_CFG_BYTE_ORDERING_POS 0
+#define JPEG_V420_WE_CFG_BYTE_ORDERING_MSK \
+	(0xfu << JPEG_V420_WE_CFG_BYTE_ORDERING_POS)
+
+#define JPEG_V420_WE_CFG_BURST_LENGTH_MAX_POS 4
+#define JPEG_V420_WE_CFG_BURST_LENGTH_MAX_MSK \
+	(0xfu << JPEG_V420_WE_CFG_BURST_LENGTH_MAX_POS)
+
+#define JPEG_V420_WE_CFG_MEMORY_FORMAT_POS 8
+#define JPEG_V420_WE_CFG_MEMORY_FORMAT_MSK \
+	(0x3u << JPEG_V420_WE_CFG_MEMORY_FORMAT_POS)
+
+#define JPEG_V420_WE_CFG_CBCR_ORDER_MSK		BIT_U32(12)
+#define JPEG_V420_WE_CFG_PLN0_EN_MSK		BIT_U32(16)
+#define JPEG_V420_WE_CFG_PLN1_EN_MSK		BIT_U32(17)
+#define JPEG_V420_WE_CFG_PLN2_EN_MSK		BIT_U32(18)
+#define JPEG_V420_WE_CFG_MAL_BOUNDARY_MSK	BIT_U32(24)
+#define JPEG_V420_WE_CFG_MAL_EN_MSK		BIT_U32(27)
+#define JPEG_V420_WE_CFG_POP_BUFF_ON_EOS_MSK	BIT_U32(28)
+
+#define JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_POS 0
+#define JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_MSK \
+	(0xffffu << JPEG_V420_PLN_WR_BUFF_SIZE_WIDTH_POS)
+
+#define JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_POS 16
+#define JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_MSK \
+	(0xffffu << JPEG_V420_PLN_WR_BUFF_SIZE_HEIGHT_POS)
+
+#define JPEG_V420_PLN_WR_STRIDE_STRIDE_POS 0
+#define JPEG_V420_PLN_WR_STRIDE_STRIDE_MSK \
+	(0xffffu << JPEG_V420_PLN_WR_STRIDE_STRIDE_POS)
+
+#define JPEG_V420_PLN_WR_HINIT_INTEGER_POS 0
+#define JPEG_V420_PLN_WR_HINIT_INTEGER_MSK \
+	(0xffffu << JPEG_V420_PLN_WR_HINIT_INTEGER_POS)
+
+#define JPEG_V420_PLN_WR_VINIT_INTEGER_POS 0
+#define JPEG_V420_PLN_WR_VINIT_INTEGER_MSK \
+	(0xffffu << JPEG_V420_PLN_WR_VINIT_INTEGER_POS)
+
+#define JPEG_V420_PLN_WR_HSTEP_INTEGER_POS 0
+#define JPEG_V420_PLN_WR_HSTEP_INTEGER_MSK \
+	(0x1ffffu << JPEG_V420_PLN_WR_HSTEP_INTEGER_POS)
+
+#define JPEG_V420_PLN_WR_VSTEP_INTEGER_POS 0
+#define JPEG_V420_PLN_WR_VSTEP_INTEGER_MSK \
+	(0x1ffffu << JPEG_V420_PLN_WR_VSTEP_INTEGER_POS)
+
+#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS 0
+#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_MSK \
+	(0xffffu << JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_COL_POS)
+
+#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS 16
+#define JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_MSK \
+	(0xffffu << JPEG_V420_PLN_WR_BLK_CFG_BLOCKS_PER_ROW_POS)
+
+#define JPEG_V420_ENC_CFG_IMAGE_FORMAT_POS 0
+#define JPEG_V420_ENC_CFG_IMAGE_FORMAT_MSK \
+	(0x7u << JPEG_V420_ENC_CFG_IMAGE_FORMAT_POS)
+
+#define JPEG_V420_ENC_CFG_APPLY_EOI_MSK		BIT_U32(7)
+#define JPEG_V420_ENC_CFG_HUFFMAN_SEL_MSK	BIT_U32(8)
+#define JPEG_V420_ENC_CFG_FSC_ENABLE_MSK	BIT_U32(11)
+#define JPEG_V420_ENC_CFG_OUTPUT_DISABLE_MSK	BIT_U32(15)
+#define JPEG_V420_ENC_CFG_RST_MARKER_PERIOD_MSK	BIT_U32(16)
+
+#define JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_POS 0u
+#define JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_MSK \
+	(0x1fffu << JPEG_V420_ENC_IMG_SIZE_ENCODE_WIDTH_POS)
+
+#define JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_POS 16u
+#define JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_MSK \
+	(0x1fffu << JPEG_V420_ENC_IMG_SIZE_ENCODE_HEIGHT_POS)
+
+#define JPEG_V420_STATUS_OUT_SIZE_BYTES_POS 0
+#define JPEG_V420_STATUS_OUT_SIZE_BYTES_MSK \
+	(0x1fffffffu << JPEG_V420_STATUS_OUT_SIZE_BYTES_POS)
+
+#define JPEG_V420_SCALE_CFG_HSCALE_ENABLE_MSK		BIT_U32(4)
+#define JPEG_V420_SCALE_CFG_VSCALE_ENABLE_MSK		BIT_U32(5)
+#define JPEG_V420_SCALE_CFG_UPSAMPLE_EN_MSK		BIT_U32(6)
+#define JPEG_V420_SCALE_CFG_SUBSAMPLE_EN_MSK		BIT_U32(7)
+#define JPEG_V420_SCALE_CFG_HSCALE_ALGO_MSK		BIT_U32(8)
+#define JPEG_V420_SCALE_CFG_VSCALE_ALGO_MSK		BIT_U32(9)
+
+#define JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_POS  12u
+#define JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V420_SCALE_CFG_H_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_POS  16u
+#define JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_MSK \
+	(0x3u << JPEG_V420_SCALE_CFG_V_SCALE_FIR_ALGO_POS)
+
+#define JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_POS 0
+#define JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_MSK \
+	(0xffu << JPEG_V420_SCALE_OUT_CFG_BLOCK_WIDTH_POS)
+
+#define JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_POS 16
+#define JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_MSK \
+	(0xfu << JPEG_V420_SCALE_OUT_CFG_BLOCK_HEIGHT_POS)
+
+#define JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_POS 0
+#define JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_MSK \
+	(0x1fffffu << JPEG_V420_SCALE_PLN_HSTEP_FRACTIONAL_POS)
+
+#define JPEG_V420_SCALE_PLN_HSTEP_INTEGER_POS 21
+#define JPEG_V420_SCALE_PLN_HSTEP_INTEGER_MSK \
+	(0x3fu << JPEG_V420_SCALE_PLN_HSTEP_INTEGER_POS)
+
+#define JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_POS 0
+#define JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_MSK \
+	(0x1fffffu << JPEG_V420_SCALE_PLN_VSTEP_FRACTIONAL_POS)
+
+#define JPEG_V420_SCALE_PLN_VSTEP_INTEGER_POS 21
+#define JPEG_V420_SCALE_PLN_VSTEP_INTEGER_MSK \
+	(0x3fu << JPEG_V420_SCALE_PLN_VSTEP_INTEGER_POS)
+
+#define JPEG_V420_DMI_CFG_MEM_SEL_POS 0
+#define JPEG_V420_DMI_CFG_MEM_SEL_MSK \
+	(0x7u << JPEG_V420_DMI_CFG_MEM_SEL_POS)
+
+#define JPEG_V420_DMI_CFG_AUTO_INC_EN_MSK	BIT_U32(4)
+
+/* DMI_CFG value to select quantization table memory and enable auto-increment */
+#define JPEG_DMI_ENABLE_UPLOAD			(JPEG_V420_DMI_CFG_AUTO_INC_EN_MSK | 0x1u)
+
+#define JPEG_V420_DMI_ADDR_ADDR_POS 0
+#define JPEG_V420_DMI_ADDR_ADDR_MSK \
+	(0x3ffu << JPEG_V420_DMI_ADDR_ADDR_POS)
+
+#define JPEG_V420_TESTBUS_CFG_BUS_SEL_POS 0
+#define JPEG_V420_TESTBUS_CFG_BUS_SEL_MSK \
+	(0x3fu << JPEG_V420_TESTBUS_CFG_BUS_SEL_POS)
+
+#define JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_POS 0
+#define JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_MSK \
+	(0x1fffu << JPEG_V420_FE_VBPAD_CFG_BLOCK_ROW_POS)
+
+#define JPEG_V420_PLN_RD_HINIT_INT_INTEGER_POS 0
+#define JPEG_V420_PLN_RD_HINIT_INT_INTEGER_MSK \
+	(0x1ffffu << JPEG_V420_PLN_RD_HINIT_INT_INTEGER_POS)
+
+#define JPEG_V420_PLN_RD_VINIT_INT_INTEGER_POS 0
+#define JPEG_V420_PLN_RD_VINIT_INT_INTEGER_MSK \
+	(0x1ffffu << JPEG_V420_PLN_RD_VINIT_INT_INTEGER_POS)
+
+#define JPEG_V420_IRQ_STATUS_SESSION_DONE_MSK		BIT_U32(0)
+#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	BIT_U32(4)
+#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	BIT_U32(5)
+#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK	BIT_U32(6)
+#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	BIT_U32(7)
+#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	BIT_U32(8)
+#define JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK	BIT_U32(9)
+#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	BIT_U32(10)
+#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	BIT_U32(11)
+#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK	BIT_U32(12)
+#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	BIT_U32(13)
+#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	BIT_U32(14)
+#define JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK	BIT_U32(15)
+#define JPEG_V420_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	BIT_U32(19)
+#define JPEG_V420_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	BIT_U32(20)
+#define JPEG_V420_IRQ_STATUS_DCD_COEFF_ERROR_MSK	BIT_U32(21)
+#define JPEG_V420_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	BIT_U32(22)
+#define JPEG_V420_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	BIT_U32(23)
+#define JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_MSK	BIT_U32(24)
+#define JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	BIT_U32(25)
+#define JPEG_V420_IRQ_STATUS_DCD_MISSING_RSM_MSK	BIT_U32(26)
+#define JPEG_V420_IRQ_STATUS_STOP_ACK_MSK		BIT_U32(27)
+#define JPEG_V420_IRQ_STATUS_RESET_ACK_MSK		BIT_U32(28)
+
+#define	JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_DONE_MSK \
+	(JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_DONE_MSK	| \
+	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_DONE_MSK	| \
+	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_DONE_MSK)
+
+#define	JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_DONE_MSK \
+	(JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	| \
+	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_DONE_MSK	| \
+	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_DONE_MSK)
+
+#define	JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK \
+	(JPEG_V420_IRQ_STATUS_RD_BUF_PLN0_REQ_ATTN_MSK	| \
+	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN1_REQ_ATTN_MSK	| \
+	 JPEG_V420_IRQ_STATUS_RD_BUF_PLN2_REQ_ATTN_MSK)
+
+#define	JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK \
+	(JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_REQ_ATTN_MSK	| \
+	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN1_REQ_ATTN_MSK	| \
+	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN2_REQ_ATTN_MSK)
+
+#define	JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK \
+	(JPEG_V420_IRQ_STATUS_DCD_UNESCAPED_FF_MSK	| \
+	 JPEG_V420_IRQ_STATUS_DCD_HUFFMAN_ERROR_MSK	| \
+	 JPEG_V420_IRQ_STATUS_DCD_COEFF_ERROR_MSK	| \
+	 JPEG_V420_IRQ_STATUS_DCD_MISSING_BITSTUFF_MSK	| \
+	 JPEG_V420_IRQ_STATUS_DCD_SCAN_UNDERFLOW_MSK	| \
+	 JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_MSK	| \
+	 JPEG_V420_IRQ_STATUS_DCD_INVALID_RSM_SEQ_MSK	| \
+	 JPEG_V420_IRQ_STATUS_DCD_MISSING_RSM_MSK)
+
+#define JPEG_V420_IRQ_STATUS_ALL_BITS \
+	(JPEG_V420_IRQ_STATUS_SESSION_DONE_MSK		| \
+	 JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_DONE_MSK	| \
+	 JPEG_V420_IRQ_STATUS_WR_BUF_PLN0_DONE_MSK	| \
+	 JPEG_V420_IRQ_STATUS_RD_BUF_PLNS_REQ_ATTN_MSK	| \
+	 JPEG_V420_IRQ_STATUS_WR_BUF_PLNS_REQ_ATTN_MSK	| \
+	 JPEG_V420_IRQ_STATUS_SESION_ERROR_MSK		| \
+	 JPEG_V420_IRQ_STATUS_STOP_ACK_MSK		| \
+	 JPEG_V420_IRQ_STATUS_RESET_ACK_MSK)
+
+/* Register offsets for JPEG v4.2.0 hardware */
+#define JPEG_V420_REG_HW_VERSION	0x000
+#define JPEG_V420_REG_HW_CAPABILITY	0x004
+#define JPEG_V420_REG_RESET_CMD		0x008
+#define JPEG_V420_REG_CORE_CFG		0x00c
+#define JPEG_V420_REG_HW_CMD		0x010
+#define JPEG_V420_REG_ENC_CORE_STATE	0x014
+#define JPEG_V420_REG_INT_MASK		0x018
+#define JPEG_V420_REG_INT_CLR		0x01c
+#define JPEG_V420_REG_INT_STATUS	0x020
+#define JPEG_V420_REG_FE_CFG		0x024
+
+/* FE (fetch engine) plane registers */
+#define JPEG_V420_REG_FE_PNTR_0		0x038
+#define JPEG_V420_REG_FE_PNTR_1		0x044
+#define JPEG_V420_REG_FE_PNTR_2		0x050
+#define JPEG_V420_REG_FE_OFFS_0		0x03c
+#define JPEG_V420_REG_FE_OFFS_1		0x048
+#define JPEG_V420_REG_FE_OFFS_2		0x054
+#define JPEG_V420_REG_FE_PNTR_CNT	0x05c
+#define JPEG_V420_REG_FE_BSIZE_0	0x060
+#define JPEG_V420_REG_FE_BSIZE_1	0x068
+#define JPEG_V420_REG_FE_BSIZE_2	0x070
+#define JPEG_V420_REG_FE_STRIDE_0	0x064
+#define JPEG_V420_REG_FE_STRIDE_1	0x06c
+#define JPEG_V420_REG_FE_STRIDE_2	0x08c
+#define JPEG_V420_REG_FE_HINIT_0	0x074
+#define JPEG_V420_REG_FE_HINIT_1	0x078
+#define JPEG_V420_REG_FE_HINIT_2	0x07c
+#define JPEG_V420_REG_FE_VINIT_0	0x080
+#define JPEG_V420_REG_FE_VINIT_1	0x084
+#define JPEG_V420_REG_FE_VINIT_2	0x088
+#define JPEG_V420_REG_FE_VBPAD_CFG	0x2e8
+
+/* WE (write engine) plane registers */
+#define JPEG_V420_REG_WE_CFG		0x0c0
+#define JPEG_V420_REG_WE_PNTR_CNT	0x0e4
+#define JPEG_V420_REG_WE_PNTR_0		0x0cc
+#define JPEG_V420_REG_WE_PNTR_1		0x0d0
+#define JPEG_V420_REG_WE_PNTR_2		0x0d4
+#define JPEG_V420_REG_WE_BSIZE_0	0x0e8
+#define JPEG_V420_REG_WE_BSIZE_1	0x0ec
+#define JPEG_V420_REG_WE_BSIZE_2	0x0f0
+#define JPEG_V420_REG_WE_STRIDE_0	0x0f4
+#define JPEG_V420_REG_WE_STRIDE_1	0x0f8
+#define JPEG_V420_REG_WE_STRIDE_2	0x0fc
+#define JPEG_V420_REG_WE_HINIT_0	0x100
+#define JPEG_V420_REG_WE_HINIT_1	0x104
+#define JPEG_V420_REG_WE_HINIT_2	0x108
+#define JPEG_V420_REG_WE_VINIT_0	0x10c
+#define JPEG_V420_REG_WE_VINIT_1	0x110
+#define JPEG_V420_REG_WE_VINIT_2	0x114
+#define JPEG_V420_REG_WE_HSTEP_0	0x118
+#define JPEG_V420_REG_WE_HSTEP_1	0x11c
+#define JPEG_V420_REG_WE_HSTEP_2	0x120
+#define JPEG_V420_REG_WE_VSTEP_0	0x124
+#define JPEG_V420_REG_WE_VSTEP_1	0x128
+#define JPEG_V420_REG_WE_VSTEP_2	0x12c
+#define JPEG_V420_REG_WE_BLOCKS_0	0x130
+#define JPEG_V420_REG_WE_BLOCKS_1	0x134
+#define JPEG_V420_REG_WE_BLOCKS_2	0x138
+
+/* Encoder registers */
+#define JPEG_V420_REG_ENC_CFG		0x13c
+#define JPEG_V420_REG_ENC_IMG_SIZE	0x140
+#define JPEG_V420_REG_ENC_OUT_SIZE	0x180
+
+/* Scaler registers */
+#define JPEG_V420_REG_SCALE_CFG		0x26c
+#define JPEG_V420_REG_SCALE_OUT_CFG_0	0x270
+#define JPEG_V420_REG_SCALE_OUT_CFG_1	0x274
+#define JPEG_V420_REG_SCALE_OUT_CFG_2	0x278
+#define JPEG_V420_REG_SCALE_HSTEP_0	0x27c
+#define JPEG_V420_REG_SCALE_HSTEP_1	0x280
+#define JPEG_V420_REG_SCALE_HSTEP_2	0x284
+#define JPEG_V420_REG_SCALE_VSTEP_0	0x28c
+#define JPEG_V420_REG_SCALE_VSTEP_1	0x290
+#define JPEG_V420_REG_SCALE_VSTEP_2	0x294
+
+/* DMI registers */
+#define JPEG_V420_REG_DMI_CFG		0x298
+#define JPEG_V420_REG_DMI_ADDR		0x29c
+#define JPEG_V420_REG_DMI_DATA		0x2a0
+
+#endif /* QCOM_JENC_V420_HW_INFO_H */
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
new file mode 100644
index 000000000000..aca96b454ea2
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
@@ -0,0 +1,1154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "qcom_jenc_defs.h"
+#include "qcom_jenc_dev.h"
+#include "qcom_jenc_ops.h"
+#include "qcom_jenc_v4l2.h"
+
+static const struct v4l2_frmsizeenum jpeg_def_frmsize = {
+	.stepwise = {
+		.min_width	= QCOM_JPEG_HW_MIN_WIDTH,
+		.max_width	= QCOM_JPEG_HW_MAX_WIDTH,
+		.step_width	= QCOM_JPEG_HW_DEF_HSTEP,
+		.min_height	= QCOM_JPEG_HW_MIN_HEIGHT,
+		.max_height	= QCOM_JPEG_HW_MAX_HEIGHT,
+		.step_height	= QCOM_JPEG_HW_DEF_VSTEP,
+	},
+	.type = V4L2_FRMSIZE_TYPE_STEPWISE
+};
+
+static const struct jenc_enc_format jpeg_src_formats[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_NV12M,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_NV21M,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_GREY,
+		.type	= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
+#define JPEG_SRC_FMT_COUNT ARRAY_SIZE(jpeg_src_formats)
+
+static const struct jenc_enc_format jpeg_dst_formats[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_JPEG,
+		.type	= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	}
+};
+
+#define JPEG_DST_FMT_COUNT ARRAY_SIZE(jpeg_dst_formats)
+
+static inline struct jenc_context *jpeg_file2ctx(struct file *file)
+{
+	return container_of(file_to_v4l2_fh(file), struct jenc_context, fh);
+}
+
+static struct qcom_jenc_queue *jpeg_get_bufq(struct jenc_context *ectx, enum qcom_enc_qid id)
+{
+	return &ectx->bufq[id];
+}
+
+static bool jpeg_v4l2_queues_busy(struct jenc_context *ctx)
+{
+	struct vb2_queue *out_q;
+	struct vb2_queue *cap_q;
+
+	out_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	cap_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	return vb2_is_busy(out_q) || vb2_is_busy(cap_q);
+}
+
+static bool jpeg_is_invalid_src(struct jenc_context *ectx, u32 type)
+{
+	bool is_invalid = (type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	if (is_invalid)
+		dev_dbg(ectx->dev, "invalid src type or format\n");
+
+	return is_invalid;
+}
+
+static bool jpeg_is_invalid_dst(struct jenc_context *ectx, u32 type)
+{
+	bool is_invalid = (type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	if (is_invalid)
+		dev_dbg(ectx->dev, "invalid dst type or format\n");
+
+	return is_invalid;
+}
+
+static const struct jenc_enc_format *jpeg_find_pix_format(enum qcom_enc_qid id, u32 fourcc)
+{
+	const struct jenc_enc_format *efmt;
+	unsigned int i, count;
+
+	if (id == JENC_SRC_QUEUE) {
+		count = JPEG_SRC_FMT_COUNT;
+		efmt = &jpeg_src_formats[0];
+	} else {
+		count = JPEG_DST_FMT_COUNT;
+		efmt = &jpeg_dst_formats[0];
+	}
+
+	for (i = 0; i < count; i++) {
+		if (efmt[i].fourcc == fourcc)
+			return &efmt[i];
+	}
+
+	return NULL;
+}
+
+static const struct jenc_enc_format *jpeg_get_format(struct jenc_context *ectx,
+						     enum qcom_enc_qid qid, u32 pixelformat)
+{
+	const struct jenc_enc_format *efmt = jpeg_find_pix_format(qid, pixelformat);
+
+	if (!efmt)
+		efmt = (qid == JENC_SRC_QUEUE) ? &jpeg_src_formats[0] : &jpeg_dst_formats[0];
+
+	return efmt;
+}
+
+static int jpeg_update_src_planes(const struct jenc_enc_format *ef, struct v4l2_format *v4f)
+{
+	const struct v4l2_format_info *info = v4l2_format_info(ef->fourcc);
+	struct v4l2_pix_format_mplane *f = &v4f->fmt.pix_mp;
+	int rc;
+
+	if (!info)
+		return -EINVAL;
+
+	f->pixelformat = ef->fourcc;
+
+	f->field	= V4L2_FIELD_NONE;
+	f->colorspace	= V4L2_COLORSPACE_SRGB;
+	f->xfer_func	= V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
+	f->ycbcr_enc	= V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
+	f->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc == V4L2_YCBCR_ENC_601,
+					      f->colorspace, f->ycbcr_enc);
+
+	v4l2_apply_frmsize_constraints(&f->width, &f->height, &jpeg_def_frmsize.stepwise);
+
+	rc = v4l2_fill_pixfmt_mp(f, ef->fourcc, f->width, f->height);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static void jpeg_update_dst_plane(const struct jenc_enc_format *ef, struct v4l2_format *v4f)
+{
+	struct v4l2_pix_format_mplane *f = &v4f->fmt.pix_mp;
+	u32 nbx, nby;
+	u64 size;
+
+	f->pixelformat  = ef->fourcc;
+	f->field	= V4L2_FIELD_NONE;
+	f->colorspace	= V4L2_COLORSPACE_SRGB;
+	f->xfer_func	= V4L2_MAP_XFER_FUNC_DEFAULT(f->colorspace);
+	f->ycbcr_enc	= V4L2_MAP_YCBCR_ENC_DEFAULT(f->colorspace);
+	f->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(f->ycbcr_enc == V4L2_YCBCR_ENC_601,
+					      f->colorspace, f->ycbcr_enc);
+
+	v4l2_apply_frmsize_constraints(&f->width, &f->height, &jpeg_def_frmsize.stepwise);
+
+	/*
+	 * JPEG is a variable-size format. The output size cannot be derived
+	 * from bits per point or line stride.
+	 *
+	 * Provide a conservative upper bound based on worst-case entropy
+	 * coding of 8x8 DCT blocks:
+	 *
+	 * - Each 8x8 block has 64 coefficients (1 DC + 63 AC).
+	 * - In worst-case (high-entropy input, low quantization), all
+	 *   coefficients may be non-zero.
+	 * - Huffman coding then emits (code + magnitude bits) per coefficient,
+	 *   which can approach ~2 bytes per coefficient in the worst case.
+	 *
+	 * => Worst-case is 64 coefficients * 2 bytes = 128 bytes per 8x8 block
+	 * => approximately 2 bytes per point
+	 *
+	 * This bound implicitly covers byte stuffing (0xFF escaping) and is
+	 * conservative with respect to subsampled formats (e.g. 4:2:0).
+	 *
+	 * Additional margin is added for headers and alignment.
+	 *
+	 * Note: This is a conservative upper bound, not an exact size.
+	 */
+
+	nbx = DIV_ROUND_UP(f->width,  8);
+	nby = DIV_ROUND_UP(f->height, 8);
+
+	size = nbx * nby * 128;
+	size += JPEG_HEADER_MAX; /* JPEG header written by CPU before HW DMA */
+	size += SZ_4K;           /* safety margin and alignment */
+
+	f->plane_fmt[0].bytesperline = 0;
+	f->plane_fmt[0].sizeimage    = ALIGN(size, SZ_4K);
+}
+
+static int jpeg_enum_fmt_src(struct v4l2_fmtdesc *f)
+{
+	if (f->index >= JPEG_SRC_FMT_COUNT)
+		return -EINVAL;
+
+	f->pixelformat = jpeg_src_formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int jpeg_enum_fmt_dst(struct v4l2_fmtdesc *f)
+{
+	if (f->index >= JPEG_DST_FMT_COUNT)
+		return -EINVAL;
+
+	f->pixelformat = jpeg_dst_formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int jpeg_v4l2_try_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pm = &f->fmt.pix_mp;
+	const struct jenc_enc_format *ef;
+	int rc;
+
+	/* The function always returns valid driver format */
+	ef = jpeg_get_format(ectx, TYPE2QID(f->type), pm->pixelformat);
+
+	dev_dbg(ectx->dev, "type=%d %p4cc\n",
+		TYPE2QID(f->type), &ef->fourcc);
+
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		f->fmt.pix_mp.num_planes = 1;
+
+		jpeg_update_dst_plane(ef, f);
+
+		dev_dbg(ectx->dev, "\tImage: %dx%d Size:%9d\n", f->fmt.pix_mp.width,
+			f->fmt.pix_mp.height, f->fmt.pix_mp.plane_fmt[0].sizeimage);
+	} else {
+		const struct v4l2_format_info *info = v4l2_format_info(ef->fourcc);
+		u8 pln = 0;
+
+		if (!info)
+			return -EINVAL;
+
+		f->fmt.pix_mp.num_planes = info->comp_planes;
+
+		rc = jpeg_update_src_planes(ef, f);
+		if (rc)
+			return rc;
+
+		for (pln = 0; pln < f->fmt.pix_mp.num_planes; pln++)
+			dev_dbg(ectx->dev, "\tImage: %dx%d BPL:%5d Size:%9d\n",
+				pm->width, pm->height, pm->plane_fmt[pln].bytesperline,
+				pm->plane_fmt[pln].sizeimage);
+	}
+
+	return 0;
+}
+
+static int jpeg_v4l2_set_defaults(struct jenc_context *ectx)
+{
+	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+	struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+	struct v4l2_format f = {0};
+	int rc;
+
+	f.type			 = jpeg_src_formats->type;
+	f.fmt.pix_mp.pixelformat = jpeg_src_formats->fourcc;
+	f.fmt.pix_mp.width	 = QCOM_JPEG_HW_DEF_WIDTH;
+	f.fmt.pix_mp.height	 = QCOM_JPEG_HW_DEF_HEIGHT;
+
+	rc = jpeg_v4l2_try_format(ectx, &f);
+	if (rc)
+		return rc;
+
+	sq->vf = f.fmt.pix_mp;
+
+	f.type			 = jpeg_dst_formats->type;
+	f.fmt.pix_mp.pixelformat = jpeg_dst_formats->fourcc;
+	f.fmt.pix_mp.width	 = QCOM_JPEG_HW_DEF_WIDTH;
+	f.fmt.pix_mp.height	 = QCOM_JPEG_HW_DEF_HEIGHT;
+
+	rc = jpeg_v4l2_try_format(ectx, &f);
+	if (rc)
+		return rc;
+
+	dq->vf = f.fmt.pix_mp;
+
+	return 0;
+}
+
+static int jpeg_v4l2_set_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	const struct qcom_jpeg_hw_ops *hw = ectx->jenc->res->hw_ops;
+	struct qcom_jenc_queue *q = jpeg_get_bufq(ectx, TYPE2QID(f->type));
+	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+	struct v4l2_pix_format_mplane *pm = &f->fmt.pix_mp;
+	u32 old_src_fourcc = sq->vf.pixelformat;
+	int rc;
+
+	if (jpeg_v4l2_queues_busy(ectx))
+		return -EBUSY;
+
+	if (!v4l2_m2m_get_vq(ectx->fh.m2m_ctx, f->type)) {
+		dev_err(ectx->dev, "cannot get video queue\n");
+		return -EINVAL;
+	}
+
+	rc = jpeg_v4l2_try_format(ectx, f);
+	if (rc)
+		return rc;
+
+	/*
+	 * Because scaling is not supported, source and destination image
+	 * sizes must be equal.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		/* Adjust source size to match capture size */
+		if (pm->width != sq->vf.width || pm->height != sq->vf.height) {
+			struct v4l2_format nf = {0};
+
+			nf.type			  = jpeg_src_formats->type;
+			nf.fmt.pix_mp.pixelformat = sq->vf.pixelformat;
+			nf.fmt.pix_mp.width	  = pm->width;
+			nf.fmt.pix_mp.height	  = pm->height;
+
+			rc = jpeg_v4l2_try_format(ectx, &nf);
+			if (rc)
+				return rc;
+
+			sq->vf = nf.fmt.pix_mp;
+		}
+
+	} else {
+		struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+		struct v4l2_format nf = {0};
+
+		/* Adjust destination size to match source size */
+		if (pm->width != dq->vf.width || pm->height != dq->vf.height) {
+			nf.type			  = jpeg_dst_formats->type;
+			nf.fmt.pix_mp.pixelformat = dq->vf.pixelformat;
+			nf.fmt.pix_mp.width	  = pm->width;
+			nf.fmt.pix_mp.height	  = pm->height;
+
+			rc = jpeg_v4l2_try_format(ectx, &nf);
+			if (rc)
+				return rc;
+
+			dq->vf = nf.fmt.pix_mp;
+
+			/*
+			 * The horizontal alignment of the destination is larger, and the
+			 * result after adjustment may still differ. In this case, the
+			 * requested image size should also be modified.
+			 */
+			if (pm->width != nf.fmt.pix_mp.width ||
+			    pm->height != nf.fmt.pix_mp.height) {
+				pm->width  = nf.fmt.pix_mp.width;
+				pm->height = nf.fmt.pix_mp.height;
+			}
+		}
+	}
+
+	q->vf = *pm;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type) && hw->src_fmt_update) {
+		rc = hw->src_fmt_update(ectx, old_src_fourcc, q->vf.pixelformat);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static void jpeg_v4l2_get_format(struct jenc_context *ectx, struct v4l2_format *f)
+{
+	struct qcom_jenc_queue *q = jpeg_get_bufq(ectx, TYPE2QID(f->type));
+
+	f->fmt.pix_mp = q->vf;
+}
+
+static void jpeg_v4l2_work_stop(struct jenc_context *ctx, enum vb2_buffer_state buff_state);
+
+static void jpeg_finish_work(struct work_struct *work)
+{
+	struct jenc_context *ctx = container_of(work, struct jenc_context, finish_work);
+
+	v4l2_m2m_job_finish(ctx->jenc->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static void jpeg_stop_work(struct work_struct *work)
+{
+	struct jenc_context *ctx = container_of(work, struct jenc_context, stop_work);
+	struct qcom_jenc_dev *jenc = ctx->jenc;
+
+	mutex_lock(&jenc->dev_mutex);
+	jpeg_v4l2_work_stop(ctx, VB2_BUF_STATE_ERROR);
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static void jpeg_v4l2_work_done(struct jenc_context *ctx, size_t out_size)
+{
+	struct vb2_v4l2_buffer *vb;
+
+	vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	if (vb)
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+
+	vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	if (vb) {
+		vb2_set_plane_payload(&vb->vb2_buf, 0, out_size);
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+	}
+
+	schedule_work(&ctx->finish_work);
+}
+
+static void jpeg_v4l2_work_stop(struct jenc_context *ctx, enum vb2_buffer_state buff_state)
+{
+	bool was_stopping = ctx->is_stopping;
+	struct vb2_v4l2_buffer *vb;
+
+	ctx->is_stopping = false;
+
+	/* Drain CAPTURE queue; signal EOS on last buffer if V4L2_ENC_CMD_STOP. */
+	while ((vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx))) {
+		if (was_stopping && !v4l2_m2m_last_dst_buf(ctx->fh.m2m_ctx)) {
+			vb2_set_plane_payload(&vb->vb2_buf, 0, 0);
+			v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vb);
+		} else {
+			v4l2_m2m_buf_done(vb, buff_state);
+		}
+	}
+
+	while ((vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
+		v4l2_m2m_buf_done(vb, buff_state);
+
+	/* Always call job_finish to let m2m schedule the next job. */
+	schedule_work(&ctx->finish_work);
+}
+
+static void jpeg_v4l2_process_cb(void *priv, enum vb2_buffer_state ev, size_t out_size)
+{
+	struct jenc_context *ctx = priv;
+	struct qcom_jenc_dev *jenc = ctx->jenc;
+
+	/* threaded IRQ path */
+	mutex_lock(&jenc->dev_mutex);
+
+	if (ev == VB2_BUF_STATE_DONE && out_size)
+		jpeg_v4l2_work_done(ctx, out_size);
+	else
+		jpeg_v4l2_work_stop(ctx, ev);
+
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static int jpeg_v4l2_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct jenc_context *ectx = container_of(ctrl->handler, struct jenc_context, ctrl_hdl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
+		mutex_lock(&ectx->quality_mutex);
+		ectx->quality_requested = ctrl->val;
+		mutex_unlock(&ectx->quality_mutex);
+		break;
+	case V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO:
+		/* value is read via v4l2_ctrl_g_ctrl() in jpeg_select_perf_level() */
+		break;
+	case V4L2_CID_QCOM_JPEG_FPS_TARGET:
+		/* value is read via v4l2_ctrl_g_ctrl() in jpeg_select_perf_level() */
+		break;
+	default:
+		dev_err(ectx->dev, "invalid control id=%#x\n", ctrl->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops qcom_jpeg_v4l2_ctrl_ops = {
+	.s_ctrl = jpeg_v4l2_s_ctrl,
+};
+
+static const struct v4l2_ctrl_config qcom_jpeg_perf_level_auto_cfg = {
+	.ops	= &qcom_jpeg_v4l2_ctrl_ops,
+	.id	= V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO,
+	.name	= "perf_level_auto",
+	.type	= V4L2_CTRL_TYPE_BOOLEAN,
+	.min	= 0,
+	.max	= 1,
+	.step	= 1,
+	.def	= 0,
+};
+
+static const struct v4l2_ctrl_config qcom_jpeg_fps_target_cfg = {
+	.ops	= &qcom_jpeg_v4l2_ctrl_ops,
+	.id	= V4L2_CID_QCOM_JPEG_FPS_TARGET,
+	.name	= "fps_target",
+	.type	= V4L2_CTRL_TYPE_INTEGER,
+	.min	= QCOM_JPEG_FPS_MIN,
+	.max	= QCOM_JPEG_FPS_MAX,
+	.step	= QCOM_JPEG_FPS_UNT,
+	.def	= QCOM_JPEG_FPS_DEF,
+};
+
+static int bop_jpeg_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				    unsigned int *plns_per_buff, unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vq);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	struct qcom_jenc_queue *q;
+	int pln;
+
+	q = hw->get_queue(ectx, TYPE2QID(vq->type));
+	if (!q || !q->vf.num_planes)
+		return -EINVAL;
+
+	if (*plns_per_buff) {
+		if (*plns_per_buff != q->vf.num_planes)
+			return -EINVAL;
+
+		for (pln = 0; pln < q->vf.num_planes; ++pln) {
+			if (sizes[pln] < q->vf.plane_fmt[pln].sizeimage)
+				return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	*plns_per_buff = q->vf.num_planes;
+	for (pln = 0; pln < q->vf.num_planes; ++pln) {
+		sizes[pln] = q->vf.plane_fmt[pln].sizeimage;
+		dev_dbg(ectx->dev, "queue=%d size[%d]=%d\n", TYPE2QID(vq->type),
+			pln, sizes[pln]);
+	}
+
+	return hw->queue_setup(ectx, TYPE2QID(vq->type));
+}
+
+static int bop_jpeg_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (vbuf->field == V4L2_FIELD_ANY)
+		vbuf->field = V4L2_FIELD_NONE;
+
+	if (vbuf->field != V4L2_FIELD_NONE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int bop_jpeg_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vb->vb2_queue);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	struct qcom_jenc_queue *q = &ectx->bufq[TYPE2QID(vb->type)];
+	int pln;
+	int rc;
+
+	if (vb->num_planes != q->vf.num_planes)
+		return -EINVAL;
+
+	for (pln = 0; pln < q->vf.num_planes; pln++) {
+		if (q->vf.plane_fmt[pln].sizeimage == 0)
+			return -EINVAL;
+
+		if (vb2_plane_size(vb, pln) < q->vf.plane_fmt[pln].sizeimage)
+			return -EINVAL;
+	}
+
+	rc = hw->buf_prepare(ectx, vb);
+	if (rc) {
+		dev_err_ratelimited(ectx->dev, "buffer prepare failed\n");
+		return rc;
+	}
+
+	return 0;
+}
+
+static void bop_jpeg_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_m2m_buf_queue(ectx->fh.m2m_ctx, vbuf);
+}
+
+static int bop_jpeg_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(q);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	struct qcom_jenc_queue *sq = jpeg_get_bufq(ectx, JENC_SRC_QUEUE);
+	struct qcom_jenc_queue *dq = jpeg_get_bufq(ectx, JENC_DST_QUEUE);
+	u32 hw_caps;
+	u8 pln;
+	int rc;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		dev_dbg(ectx->dev, "%p4cc %dx%d\n",
+			&sq->vf.pixelformat, sq->vf.width, sq->vf.height);
+
+		for (pln = 0; pln < sq->vf.num_planes; pln++) {
+			dev_dbg(ectx->dev, "\tpln=%d %dx%d bpl:%d size:%d\n", pln,
+				sq->vf.width, sq->vf.height,
+				sq->vf.plane_fmt[pln].bytesperline,
+				sq->vf.plane_fmt[pln].sizeimage);
+		}
+	} else {
+		dev_dbg(ectx->dev, "%p4cc %dx%d\n",
+			&dq->vf.pixelformat,
+			dq->vf.width, dq->vf.height);
+	}
+
+	mutex_lock(&jenc->dev_mutex);
+
+	/*
+	 * Header cache is initialized lazily on CAPTURE QBUF, so valid V4L2
+	 * orders like STREAMON before first QBUF still get a proper JPEG header.
+	 */
+	if (!ectx->hw_acquired) {
+		rc = hw->hw_acquire(ectx, q);
+		if (!rc) {
+			ectx->hw_acquired = true;
+			hw->hw_get_cap(jenc, &hw_caps);
+			dev_dbg(ectx->dev, "hw_caps=0x%x\n", hw_caps);
+		}
+	} else {
+		rc = 0;
+	}
+
+	mutex_unlock(&jenc->dev_mutex);
+
+	return rc;
+}
+
+static void bop_jpeg_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct jenc_context *ectx = vb2_get_drv_priv(q);
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	bool do_release;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
+
+	do_release = ectx->hw_acquired;
+	ectx->hw_acquired = false;
+
+	mutex_unlock(&jenc->dev_mutex);
+
+	/*
+	 * hw_release() calls jpeg_deinit() which issues HW_STOP and waits for
+	 * the STOP_ACK interrupt completion.  It must be called outside
+	 * dev_mutex to avoid a deadlock: the threaded IRQ handler acquires
+	 * dev_mutex before signalling the completion.
+	 */
+	if (do_release)
+		hw->hw_release(ectx, q);
+}
+
+static const struct vb2_ops qcom_jpeg_v4l2_vb2_ops = {
+	.queue_setup		= bop_jpeg_vb2_queue_setup,
+	.buf_out_validate	= bop_jpeg_vb2_buf_out_validate,
+	.buf_prepare		= bop_jpeg_vb2_buf_prepare,
+	.buf_queue		= bop_jpeg_vb2_buf_queue,
+	.start_streaming	= bop_jpeg_vb2_start_streaming,
+	.stop_streaming		= bop_jpeg_vb2_stop_streaming,
+};
+
+static void mop_jpeg_m2m_job_abort(void *priv)
+{
+	struct jenc_context *ectx = priv;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
+
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static void mop_jpeg_m2m_job_run(void *priv)
+{
+	struct jenc_context *ectx = priv;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	const struct qcom_jpeg_hw_ops *hw = jenc->res->hw_ops;
+	struct vb2_v4l2_buffer *src_vb, *dst_vb;
+	struct qcom_jenc_queue *sq, *dq;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	src_vb = v4l2_m2m_next_src_buf(ectx->fh.m2m_ctx);
+	dst_vb = v4l2_m2m_next_dst_buf(ectx->fh.m2m_ctx);
+
+	if (!src_vb || !dst_vb)
+		goto err_stop;
+
+	if (hw->hw_prepare(jenc))
+		goto err_stop;
+
+	sq = hw->get_queue(ectx, TYPE2QID(src_vb->vb2_buf.type));
+	src_vb->sequence = sq->sequence++;
+	if (hw->process_exec(jenc, ectx, &src_vb->vb2_buf))
+		goto err_stop;
+
+	dq = hw->get_queue(ectx, TYPE2QID(dst_vb->vb2_buf.type));
+	dst_vb->sequence = dq->sequence++;
+	if (hw->process_exec(jenc, ectx, &dst_vb->vb2_buf))
+		goto err_stop;
+
+	v4l2_m2m_buf_copy_metadata(src_vb, dst_vb);
+
+	mutex_unlock(&jenc->dev_mutex);
+	return;
+
+err_stop:
+	jpeg_v4l2_work_stop(ectx, VB2_BUF_STATE_ERROR);
+	mutex_unlock(&jenc->dev_mutex);
+}
+
+static const struct v4l2_m2m_ops qcom_jpeg_v4l2_m2m_ops = {
+	.device_run	= mop_jpeg_m2m_job_run,
+	.job_abort	= mop_jpeg_m2m_job_abort,
+};
+
+static int iop_jpeg_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, QCOM_JPEG_ENC_NAME, sizeof(cap->driver));
+	strscpy(cap->card, QCOM_JPEG_ENC_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", QCOM_JPEG_ENC_NAME);
+
+	return 0;
+}
+
+static int iop_jpeg_enum_fmt_vid_dst(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_enum_fmt_dst(f);
+}
+
+static int iop_jpeg_enum_framesizes(struct file *file, void *priv, struct v4l2_frmsizeenum *fsize)
+{
+	const struct jenc_enc_format *efmt;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	efmt = jpeg_find_pix_format(JENC_SRC_QUEUE, fsize->pixel_format);
+	if (efmt) {
+		fsize->type	= jpeg_def_frmsize.type;
+		fsize->stepwise	= jpeg_def_frmsize.stepwise;
+		return 0;
+	}
+
+	efmt = jpeg_find_pix_format(JENC_DST_QUEUE, fsize->pixel_format);
+	if (efmt) {
+		fsize->type	= jpeg_def_frmsize.type;
+		fsize->stepwise	= jpeg_def_frmsize.stepwise;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int iop_jpeg_enum_fmt_vid_src(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_enum_fmt_src(f);
+}
+
+static int iop_jpeg_get_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	jpeg_v4l2_get_format(ectx, f);
+
+	return 0;
+}
+
+static int iop_jpeg_try_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_try_format(ectx, f);
+}
+
+static int iop_jpeg_set_fmt_vid_dst(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_dst(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_set_format(ectx, f);
+}
+
+static int iop_jpeg_get_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	jpeg_v4l2_get_format(ectx, f);
+
+	return 0;
+}
+
+static int iop_jpeg_try_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_try_format(ectx, f);
+}
+
+static int iop_jpeg_set_fmt_vid_src(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+
+	if (jpeg_is_invalid_src(ectx, f->type))
+		return -EINVAL;
+
+	return jpeg_v4l2_set_format(ectx, f);
+}
+
+static int iop_jpeg_encoder_command(struct file *file, void *priv, struct v4l2_encoder_cmd *ec)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+	struct vb2_queue *vq;
+	int rc;
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP) {
+		vq = v4l2_m2m_get_src_vq(ectx->fh.m2m_ctx);
+		if (!vb2_is_streaming(vq))
+			return 0;
+
+		vq = v4l2_m2m_get_dst_vq(ectx->fh.m2m_ctx);
+		if (!vb2_is_streaming(vq))
+			return 0;
+
+		rc = v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
+		if (rc)
+			return rc;
+
+		ectx->is_stopping = true;
+		schedule_work(&ectx->stop_work);
+
+		return 0;
+	}
+
+	return v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
+}
+
+static const struct v4l2_ioctl_ops qcom_jpeg_v4l2_ioctl_ops = {
+	.vidioc_querycap		= iop_jpeg_querycap,
+	.vidioc_enum_fmt_vid_cap	= iop_jpeg_enum_fmt_vid_dst,
+	.vidioc_enum_fmt_vid_out	= iop_jpeg_enum_fmt_vid_src,
+	.vidioc_enum_framesizes		= iop_jpeg_enum_framesizes,
+
+	.vidioc_g_fmt_vid_cap_mplane	= iop_jpeg_get_fmt_vid_dst,
+	.vidioc_try_fmt_vid_cap_mplane	= iop_jpeg_try_fmt_vid_dst,
+	.vidioc_s_fmt_vid_cap_mplane	= iop_jpeg_set_fmt_vid_dst,
+	.vidioc_g_fmt_vid_out_mplane	= iop_jpeg_get_fmt_vid_src,
+	.vidioc_try_fmt_vid_out_mplane	= iop_jpeg_try_fmt_vid_src,
+	.vidioc_s_fmt_vid_out_mplane	= iop_jpeg_set_fmt_vid_src,
+
+	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
+	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
+	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+
+	.vidioc_encoder_cmd		= iop_jpeg_encoder_command,
+	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
+};
+
+static int jpeg_v4l2_init_queue(void *priv, struct vb2_queue *sq, struct vb2_queue *dq)
+{
+	struct jenc_context *ectx = priv;
+	int rc;
+
+	sq->drv_priv		= ectx;
+	sq->dev			= ectx->dev;
+	sq->type		= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	sq->io_modes		= VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	sq->buf_struct_size	= sizeof(struct v4l2_m2m_buffer);
+	sq->ops			= &qcom_jpeg_v4l2_vb2_ops;
+	sq->mem_ops		= &vb2_dma_sg_memops;
+	sq->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	sq->lock		= &ectx->ctx_lock;
+	sq->min_queued_buffers	= 1;
+
+	rc = vb2_queue_init(sq);
+	if (rc)
+		return rc;
+
+	dq->drv_priv		= ectx;
+	dq->dev			= ectx->dev;
+	dq->type		= V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dq->io_modes		= VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	dq->buf_struct_size	= sizeof(struct v4l2_m2m_buffer);
+	dq->ops			= &qcom_jpeg_v4l2_vb2_ops;
+	dq->mem_ops		= &vb2_dma_sg_memops;
+	dq->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dq->lock		= &ectx->ctx_lock;
+	dq->min_queued_buffers	= 1;
+
+	rc = vb2_queue_init(dq);
+	if (rc) {
+		vb2_queue_release(sq);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int fop_jpeg_file_open(struct file *file)
+{
+	struct qcom_jenc_dev *jenc = video_drvdata(file);
+	struct video_device *vdev = video_devdata(file);
+	struct jenc_context *ectx;
+	int rc;
+
+	ectx = kzalloc_obj(*ectx, GFP_KERNEL);
+	if (!ectx)
+		return -ENOMEM;
+
+	ectx->dev  = jenc->dev;
+	ectx->jenc = jenc;
+
+	/* default quality if userspace does not set the control explicitly */
+	ectx->quality_requested = QCOM_JPEG_QUALITY_DEF;
+	ectx->quality_programmed = 0;
+
+	mutex_init(&ectx->ctx_lock);
+	mutex_init(&ectx->quality_mutex);
+
+	INIT_WORK(&ectx->finish_work, jpeg_finish_work);
+	INIT_WORK(&ectx->stop_work, jpeg_stop_work);
+
+	rc = jpeg_v4l2_set_defaults(ectx);
+	if (rc)
+		goto err_unlock_free;
+
+	v4l2_fh_init(&ectx->fh, vdev);
+	v4l2_fh_add(&ectx->fh, file);
+
+	v4l2_ctrl_handler_init(&ectx->ctrl_hdl, 3);
+	ectx->quality_ctl = v4l2_ctrl_new_std(&ectx->ctrl_hdl,
+					      &qcom_jpeg_v4l2_ctrl_ops,
+					      V4L2_CID_JPEG_COMPRESSION_QUALITY,
+					      QCOM_JPEG_QUALITY_MIN,
+					      QCOM_JPEG_QUALITY_MAX,
+					      QCOM_JPEG_QUALITY_UNT,
+					      QCOM_JPEG_QUALITY_DEF);
+	ectx->perf_level_auto_ctl =
+		v4l2_ctrl_new_custom(&ectx->ctrl_hdl,
+				     &qcom_jpeg_perf_level_auto_cfg, NULL);
+	ectx->fps_target_ctl =
+		v4l2_ctrl_new_custom(&ectx->ctrl_hdl,
+				     &qcom_jpeg_fps_target_cfg, NULL);
+	if (ectx->ctrl_hdl.error) {
+		rc = ectx->ctrl_hdl.error;
+		goto err_fh_exit;
+	}
+
+	ectx->fh.ctrl_handler = &ectx->ctrl_hdl;
+
+	rc = v4l2_ctrl_handler_setup(&ectx->ctrl_hdl);
+	if (rc)
+		goto err_ctrl_handler_free;
+
+	v4l2_m2m_get(jenc->m2m_dev);
+	ectx->fh.m2m_ctx = v4l2_m2m_ctx_init(jenc->m2m_dev, ectx, &jpeg_v4l2_init_queue);
+	if (IS_ERR(ectx->fh.m2m_ctx)) {
+		rc = PTR_ERR(ectx->fh.m2m_ctx);
+		v4l2_m2m_put(jenc->m2m_dev);
+		goto err_ctrl_handler_free;
+	}
+
+	return 0;
+
+err_ctrl_handler_free:
+	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
+err_fh_exit:
+	v4l2_fh_del(&ectx->fh, file);
+	v4l2_fh_exit(&ectx->fh);
+err_unlock_free:
+	mutex_destroy(&ectx->quality_mutex);
+	mutex_destroy(&ectx->ctx_lock);
+	kfree(ectx);
+
+	return rc;
+}
+
+static int fop_jpeg_file_release(struct file *file)
+{
+	struct jenc_context *ectx = jpeg_file2ctx(file);
+	struct v4l2_m2m_dev *m2m_dev = ectx->fh.m2m_ctx->m2m_dev;
+	struct qcom_jenc_dev *jenc = ectx->jenc;
+	unsigned long flags;
+
+	/*
+	 * Ensure the threaded IRQ handler cannot dereference this context
+	 * after it is freed.  Clear jenc->actx under hw_lock before
+	 * cancelling work and releasing the m2m context.
+	 */
+	spin_lock_irqsave(&jenc->hw_lock, flags);
+	if (jenc->actx == ectx)
+		jenc->actx = NULL;
+	spin_unlock_irqrestore(&jenc->hw_lock, flags);
+
+	cancel_work_sync(&ectx->stop_work);
+	cancel_work_sync(&ectx->finish_work);
+
+	v4l2_m2m_ctx_release(ectx->fh.m2m_ctx);
+	v4l2_m2m_put(m2m_dev);
+	v4l2_ctrl_handler_free(&ectx->ctrl_hdl);
+	v4l2_fh_del(&ectx->fh, file);
+	v4l2_fh_exit(&ectx->fh);
+	mutex_destroy(&ectx->quality_mutex);
+	mutex_destroy(&ectx->ctx_lock);
+	kfree(ectx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations qcom_jpeg_v4l2_file_ops = {
+	.owner		= THIS_MODULE,
+	.open		= fop_jpeg_file_open,
+	.release	= fop_jpeg_file_release,
+	.poll		= v4l2_m2m_fop_poll,
+	.mmap		= v4l2_m2m_fop_mmap,
+	.unlocked_ioctl = video_ioctl2,
+};
+
+/* Release callback: free jenc after last fd is closed. */
+static void jenc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
+{
+	struct qcom_jenc_dev *jenc = container_of(v4l2_dev, struct qcom_jenc_dev, v4l2_dev);
+
+	v4l2_device_unregister(&jenc->v4l2_dev);
+	v4l2_m2m_put(jenc->m2m_dev);
+	kfree(jenc);
+}
+
+int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc)
+{
+	int rc;
+
+	mutex_lock(&jenc->dev_mutex);
+
+	jenc->enc_hw_irq_cb = jpeg_v4l2_process_cb;
+
+	jenc->m2m_dev = v4l2_m2m_init(&qcom_jpeg_v4l2_m2m_ops);
+	if (IS_ERR(jenc->m2m_dev)) {
+		dev_err(jenc->dev, "failed to init mem2mem device\n");
+		rc = PTR_ERR(jenc->m2m_dev);
+		goto err_mutex_unlock;
+	}
+
+	jenc->vdev = video_device_alloc();
+	if (!jenc->vdev) {
+		rc = -ENOMEM;
+		goto err_m2m_release;
+	}
+
+	snprintf(jenc->vdev->name, sizeof(jenc->vdev->name), "%s", QCOM_JPEG_ENC_NAME);
+	jenc->vdev->fops	= &qcom_jpeg_v4l2_file_ops;
+	jenc->vdev->ioctl_ops	= &qcom_jpeg_v4l2_ioctl_ops;
+	jenc->vdev->minor	= -1;
+	jenc->vdev->release	= video_device_release;
+	jenc->vdev->lock	= &jenc->dev_mutex;
+	jenc->vdev->v4l2_dev	= &jenc->v4l2_dev;
+	jenc->vdev->vfl_dir	= VFL_DIR_M2M;
+	jenc->vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
+
+	rc = video_register_device(jenc->vdev, VFL_TYPE_VIDEO, -1);
+	if (rc) {
+		dev_err(jenc->dev, "failed to register video device\n");
+		goto err_video_device_release;
+	}
+
+	video_set_drvdata(jenc->vdev, jenc);
+
+	jenc->v4l2_dev.release = jenc_v4l2_dev_release;
+
+	mutex_unlock(&jenc->dev_mutex);
+
+	dev_dbg(jenc->dev, "device registered as /dev/video%d\n", jenc->vdev->num);
+
+	return 0;
+
+err_video_device_release:
+	video_device_release(jenc->vdev);
+err_m2m_release:
+	v4l2_m2m_release(jenc->m2m_dev);
+err_mutex_unlock:
+	mutex_unlock(&jenc->dev_mutex);
+
+	return rc;
+}
+
diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
new file mode 100644
index 000000000000..781b26dbf664
--- /dev/null
+++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_JENC_V4L2_H
+#define QCOM_JENC_V4L2_H
+
+#include <linux/types.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+
+struct qcom_jenc_dev;
+
+int qcom_jpeg_v4l2_register(struct qcom_jenc_dev *jenc);
+
+#endif /* QCOM_JENC_V4L2_H */
diff --git a/include/media/jpeg.h b/include/media/jpeg.h
index a01e142e99a7..926943a0d412 100644
--- a/include/media/jpeg.h
+++ b/include/media/jpeg.h
@@ -17,4 +17,37 @@
 #define JPEG_MARKER_APP0	0xe0
 #define JPEG_MARKER_COM		0xfe
 
+/* JPEG marker prefix byte */
+#define JPEG_MARKER_PREFIX		0xff
+
+/* JPEG baseline sample precision (bits per sample) */
+#define JPEG_SAMPLE_PRECISION_BITS	8
+
+/* Number of components: greyscale (1) and colour YCbCr (3) */
+#define JPEG_COMP_MONO			1
+#define JPEG_COMP_COLOR			3
+
+/* Chroma subsampling factors encoded in SOF0 sampling byte */
+#define JPEG_SAMPLING_H1V1		0x11
+#define JPEG_SAMPLING_H2V2		0x22
+
+/* Quantization table destination identifiers */
+#define JPEG_QTABLE_LUMA		0
+#define JPEG_QTABLE_CHROMA		1
+
+/* Huffman table class/destination identifiers for DC and AC tables */
+#define JPEG_DC_HT_INDEX_LUMA		0x00
+#define JPEG_DC_HT_INDEX_CHROMA		0x01
+#define JPEG_AC_HT_INDEX_LUMA		0x10
+#define JPEG_AC_HT_INDEX_CHROMA		0x11
+
+/* SOS spectral selection and approximation fields (baseline JPEG) */
+#define JPEG_SPECTRAL_START		0x00
+#define JPEG_SPECTRAL_END		0x3f
+#define JPEG_APPROX_HIGH_LOW		0x00
+
+/* SOS table selector bytes (luma: DC=0/AC=0, chroma: DC=1/AC=1) */
+#define JPEG_TABLE_SEL_LUMA		0x00
+#define JPEG_TABLE_SEL_CHROMA		0x11
+
 #endif /* _MEDIA_JPEG_H_ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781..6408d3da29d4 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,27 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/* Qualcomm JPEG encoder controls */
+#define V4L2_CID_USER_QCOM_JENC_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
+/*
+ * V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO - enable adaptive performance scaling.
+ *
+ * When set to 1 the driver selects the core clock OPP level based on the
+ * encoded frame resolution and fps target. When set to 0 (default) the
+ * driver always runs at NOMINAL (highest) OPP level.
+ */
+#define V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO	(V4L2_CID_USER_QCOM_JENC_BASE + 0)
+
+/*
+ * V4L2_CID_QCOM_JPEG_FPS_TARGET - target encode rate in frames per second.
+ *
+ * Used together with V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO to select the lowest
+ * OPP level whose throughput is sufficient for the requested frame rate.
+ * Has no effect when perf_level_auto is 0. Range: 1-240, default: 30.
+ */
+#define V4L2_CID_QCOM_JPEG_FPS_TARGET		(V4L2_CID_USER_QCOM_JENC_BASE + 1)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.34.1


